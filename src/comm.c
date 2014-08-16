/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifdef __STRICT_ANSI__
/* To include the prototype for gethostname() */
#define _BSD_SOURCE
#endif

#include <string.h>
#include <ctype.h>
#include <time.h>
#include <stdarg.h>
#include "mud.h"
#include "character.h"
#include "editor.h"
#include "help.h"

/*
 * Socket and TCP/IP stuff.
 */
#include <arpa/telnet.h>

static const char go_ahead_str    [] = { (const char)IAC, (const char)GA, '\0' };

#define MAX_NEST        100

bool bootup = false;

/*
 * Global variables.
 */
Descriptor *   first_descriptor = NULL; /* First descriptor */
Descriptor *   last_descriptor = NULL;  /* Last descriptor              */
Descriptor *   d_next = NULL;          /* Next descriptor in loop      */
int                 num_descriptors = 0;
bool                mud_down = false;       /* Shutdown                     */
bool                wizlock = false;     /* Game is wizlocked            */
time_t              boot_time = 0;
HOUR_MIN_SEC        set_boot_time_struct;
HOUR_MIN_SEC *      set_boot_time = NULL;
struct tm *         new_boot_time = NULL;
struct tm           new_boot_struct;
char                str_boot_time[MAX_INPUT_LENGTH];
char                lastplayercmd[MAX_INPUT_LENGTH*2];
time_t              current_time = 0;       /* Time of this pulse           */
socket_t            control = 0;            /* Controlling descriptor       */
socket_t            newdesc = 0;            /* New descriptor               */
fd_set              in_set;             /* Set of desc's for reading    */
fd_set              out_set;            /* Set of desc's for writing    */
fd_set              exc_set;            /* Set of desc's with errors    */
int                 maxdesc = 0;

/*
 * OS-dependent local functions.
 */
void game_loop( void );
socket_t init_socket( short port );
void new_descriptor( socket_t new_desc );
bool read_from_descriptor( Descriptor *d );

/*
 * Other local functions (OS-independent).
 */
bool check_reconnect( Descriptor *d, char *name, bool fConn );
bool check_playing( Descriptor *d, char *name, bool kick );
bool check_multi( Descriptor *d, char *name );
int main( int argc, char **argv );
void nanny( Descriptor *d, char *argument );
bool flush_buffer( Descriptor *d, bool fPrompt );
void read_from_buffer( Descriptor *d );
void stop_idling( Character *ch );
void free_desc( Descriptor *d );
void display_prompt( Descriptor *d );
int make_color_sequence( const char *col, char *buf, Descriptor *d );
void set_pager_input( Descriptor *d, char *argument );
bool pager_output( Descriptor *d );

static void execute_on_exit( void )
{
  /*DISPOSE( sysdata.mccp_buf );*/

#ifdef SWRIP_USE_DLSYM
#ifdef _WIN32
  FreeLibrary(sysdata.dl_handle);
#else
  dlclose( sysdata.dl_handle );
#endif
#endif

  os_cleanup();
}

int main( int argc, char **argv )
{
  struct timeval now_time;
  bool fCopyOver = false;
#ifdef SWRIP_USE_IMC
  socket_t imcsocket = INVALID_SOCKET;
#endif

  /*
   * Memory debugging if needed.
   */
#if defined(MALLOC_DEBUG)
  malloc_debug( 2 );
#endif

  num_descriptors               = 0;
  first_descriptor              = NULL;
  last_descriptor               = NULL;
  sysdata.NO_NAME_RESOLVING     = true;
  sysdata.WAIT_FOR_AUTH = true;

  os_setup();
  /*CREATE( sysdata.mccp_buf, unsigned char, COMPRESS_BUF_SIZE );*/

  atexit( execute_on_exit );
#ifdef SWRIP_USE_DLSYM
#ifdef _WIN32
  sysdata.dl_handle = LoadLibraryA("swr.exe");

  if( !sysdata.dl_handle )
    {
      fprintf( stdout, "Failed opening dl handle to self: %s\n", GetLastError() );
      exit( 1 );
    }
#else
  sysdata.dl_handle = dlopen( NULL, RTLD_LAZY );

  if( !sysdata.dl_handle )
    {
      fprintf( stdout, "Failed opening dl handle to self: %s\n", dlerror() );
      exit( 1 );
    }
#endif
#endif

  /*
   * Init time.
   */
  gettimeofday( &now_time, NULL );
  current_time = (time_t) now_time.tv_sec;
  /*  gettimeofday( &boot_time, NULL);   okay, so it's kludgy, sue me :) */
  boot_time = time(0);         /*  <-- I think this is what you wanted */
  strcpy( str_boot_time, ctime( &current_time ) );

  /*
   * Init boot time.
   */
  set_boot_time = &set_boot_time_struct;
  /*  set_boot_time->hour   = 6;
      set_boot_time->min    = 0;
      set_boot_time->sec    = 0;*/
  set_boot_time->manual = 0;

  new_boot_time = update_time(localtime(&current_time));
  /* Copies *new_boot_time to new_boot_struct, and then points
     new_boot_time to new_boot_struct again. -- Alty */
  new_boot_struct = *new_boot_time;
  new_boot_time = &new_boot_struct;
  new_boot_time->tm_mday += 1;
  if(new_boot_time->tm_hour > 12)
    new_boot_time->tm_mday += 1;
  new_boot_time->tm_sec = 0;
  new_boot_time->tm_min = 0;
  new_boot_time->tm_hour = 6;

  /* Update new_boot_time (due to day increment) */
  new_boot_time = update_time(new_boot_time);
  new_boot_struct = *new_boot_time;
  new_boot_time = &new_boot_struct;

  /* Set reboot time string for do_time */
  get_reboot_string();

  /*
   * Get the port number.
   */
  sysdata.port = 4000;
  if ( argc > 1 )
    {
      if ( !is_number( argv[1] ) )
        {
          fprintf( stderr, "Usage: %s [port #]\n", argv[0] );
          exit( 1 );
        }
      else if ( ( sysdata.port = atoi( argv[1] ) ) <= 1024 )
        {
          fprintf( stderr, "Port number must be above 1024.\n" );
          exit( 1 );
        }

      if( argv[2] && argv[2][0] )
        {
          fCopyOver = true;
#if defined(AMIGA) || defined(__MORPHOS__)
          control = ObtainSocket( atoi( argv[3] ), PF_INET, SOCK_STREAM, IPPROTO_TCP );
#ifdef SWRIP_USE_IMC
          imcsocket = ObtainSocket( atoi( argv[4] ), PF_INET, SOCK_STREAM, IPPROTO_TCP );
#endif /* imc */
#else
          control = atoi( argv[3] );
#ifdef SWRIP_USE_IMC
          imcsocket = atoi( argv[4] );
#endif /* imc */
#endif
        }
      else
        {
          fCopyOver = false;
        }
    }

  /*
   * Run the game.
   */

  sprintf(log_buf,"PID: %d",getpid());
  bootup = true;
  log_string(log_buf);
#ifdef SWRIP_USE_IMC
  log_string( "Starting IMC2" );
  imc_startup( false, imcsocket, fCopyOver );
#endif
  log_string("Booting Database");
  boot_db(fCopyOver);
  log_string("Initializing socket");

  if( !fCopyOver )
    {
      control  = init_socket( sysdata.port   );
    }

  sprintf( log_buf, "Rise in Power ready on port %d.", sysdata.port );
  log_string( log_buf );
  bootup = false;
  game_loop( );
  closesocket( control  );
#ifdef SWRIP_USE_IMC
  imc_shutdown( false );
#endif
  /*
   * That's all, folks.
   */
  log_string( "Normal termination of game." );
  exit( 0 );
  return 0;
}

socket_t init_socket( short port )
{
  struct sockaddr_in sa;
#ifdef _WIN32
  const char optval = 1;
#else
  int optval = 1;
#endif
  socklen_t optlen = sizeof( optval );
  socket_t fd = 0;

  if ( ( fd = socket( PF_INET, SOCK_STREAM, IPPROTO_TCP ) ) == INVALID_SOCKET )
    {
      perror( "Init_socket: socket" );
      exit( 1 );
    }

  if ( setsockopt( fd, SOL_SOCKET, SO_REUSEADDR,
                   &optval, optlen ) == SOCKET_ERROR )
    {
      perror( "Init_socket: SO_REUSEADDR" );
      closesocket( fd );
      exit( 1 );
    }

#if defined(SO_DONTLINGER) && !defined(SYSV) && !defined(__sun__)
  {
    struct linger ld;

    ld.l_onoff  = 1;
    ld.l_linger = 1000;

    if ( setsockopt( fd, SOL_SOCKET, SO_DONTLINGER,
                     (void *) &ld, sizeof(ld) ) == SOCKET_ERROR )
      {
        perror( "Init_socket: SO_DONTLINGER" );
        closesocket( fd );
        exit( 1 );
      }
  }
#endif

  memset(&sa, '\0', sizeof(sa));
  sa.sin_family   = AF_INET; /* hp->h_addrtype; */
  sa.sin_port       = htons( port );

  if ( bind( fd, (struct sockaddr *) &sa, sizeof(sa) ) == SOCKET_ERROR )
    {
      perror( "Init_socket: bind" );
      closesocket( fd );
      exit( 1 );
    }

  if ( listen( fd, 50 ) == SOCKET_ERROR )
    {
      perror( "Init_socket: listen" );
      closesocket( fd );
      exit( 1 );
    }

  return fd;
}

/*
 * LAG alarm!                                                   -Thoric
 */
static void caught_alarm( int dummy )
{
  char buf[MAX_STRING_LENGTH];
  bug( "ALARM CLOCK!" );
  strcpy( buf, "Alas, the hideous mandalorian entity known only as 'Lag' rises once more!\r\n" );
  echo_to_all( AT_IMMORT, buf, ECHOTAR_ALL );
  if ( newdesc )
    {
      FD_CLR( newdesc, &in_set );
      FD_CLR( newdesc, &out_set );
      log_string( "clearing newdesc" );
    }
  game_loop( );
  closesocket( control );

  log_string( "Normal termination of game." );
  exit( 0 );
}

bool check_bad_desc( socket_t desc )
{
  if ( FD_ISSET( desc, &exc_set ) )
    {
      FD_CLR( desc, &in_set );
      FD_CLR( desc, &out_set );
      log_string( "Bad FD caught and disposed." );
      return true;
    }
  return false;
}


void accept_new( socket_t ctrl )
{
  static struct timeval null_time;
  Descriptor *d = NULL;
  int result = 0;

  /*
   * Poll all active descriptors.
   */
  FD_ZERO( &in_set  );
  FD_ZERO( &out_set );
  FD_ZERO( &exc_set );
  FD_SET( ctrl, &in_set );
  maxdesc = ctrl;
  newdesc = 0;

  for ( d = first_descriptor; d; d = d->next )
    {
      maxdesc = umax( maxdesc, d->descriptor );
      FD_SET( d->descriptor, &in_set  );
      FD_SET( d->descriptor, &out_set );
      FD_SET( d->descriptor, &exc_set );

      if ( d == last_descriptor )
        break;
    }

#if defined(AMIGA) || defined(__MORPHOS__)
  result =
    WaitSelect( maxdesc + 1, &in_set, &out_set, &exc_set, &null_time, 0 );
#else
  result = select( maxdesc + 1, &in_set, &out_set, &exc_set, &null_time );
#endif

  if( result == SOCKET_ERROR )
    {
      perror( "accept_new: select: poll" );
      exit( 1 );
    }

  if ( FD_ISSET( ctrl, &exc_set ) )
    {
      bug( "Exception raise on controlling descriptor %d", ctrl );
      FD_CLR( ctrl, &in_set );
      FD_CLR( ctrl, &out_set );
    }
  else if ( FD_ISSET( ctrl, &in_set ) )
    {
      newdesc = ctrl;
      new_descriptor( newdesc );
    }
}

void game_loop( )
{
  struct timeval          last_time;
  char cmdline[MAX_INPUT_LENGTH];
  Descriptor *d;
  /*  time_t    last_check = 0;  */

  signal( SIGPIPE, SIG_IGN );
  signal( SIGALRM, caught_alarm );
  /* signal( SIGSEGV, SegVio ); */
  gettimeofday( &last_time, NULL );
  current_time = (time_t) last_time.tv_sec;

  /* Main loop */
  while ( !mud_down )
    {
      accept_new( control  );

      /*
       * Kick out descriptors with raised exceptions
       * or have been idle, then check for input.
       */
      for ( d = first_descriptor; d; d = d_next )
        {
          if ( d == d->next )
            {
              bug( "descriptor_loop: loop found & fixed" );
              d->next = NULL;
            }
          d_next = d->next;

          d->idle++;    /* make it so a descriptor can idle out */
          if ( FD_ISSET( d->descriptor, &exc_set ) )
            {
              FD_CLR( d->descriptor, &in_set  );
              FD_CLR( d->descriptor, &out_set );
              if ( d->character
                   && ( d->connection_state == CON_PLAYING
                        ||   d->connection_state == CON_EDITING ) )
                save_char_obj( d->character );
              d->outtop = 0;
              close_socket( d, true );
              continue;
            }
          else
            if (( d->character ? d->character->top_level <= LEVEL_IMMORTAL : false) &&
                ( d->idle > 7200 ) && !IS_SET(d->character->act, PLR_AFK))                /* 30 minutes  */
              {
                if( (d->character && d->character->in_room) ? d->character->top_level <= LEVEL_IMMORTAL : false)
                  {
                    write_to_descriptor( d->descriptor,
                                         "Idle 30 Minutes. Activating AFK Flag\r\n", 0 );
                    SET_BIT(d->character->act, PLR_AFK);
                    act(AT_GREY,"$n is now afk due to idle time.", d->character, NULL, NULL, TO_ROOM);
                    continue;
                  }
              }
            else
              if (( d->character ? d->character->top_level <= LEVEL_IMMORTAL : true) &&
                  ( (!d->character && d->idle > 360)              /* 2 mins */
                    ||   ( d->connection_state != CON_PLAYING && d->idle > 1200) /* 5 mins */
                    ||     d->idle > 28800 ))                             /* 2 hrs  */
                {
                  if( d->character ? d->character->top_level <= LEVEL_IMMORTAL : true)
                    {
                      write_to_descriptor( d->descriptor,
                                           "Idle timeout... disconnecting.\r\n", 0 );
                      d->outtop = 0;
                      close_socket( d, true );
                      continue;
                    }
                }
              else
                {
                  d->fcommand   = false;

                  if ( FD_ISSET( d->descriptor, &in_set ) )
                    {
                      d->idle = 0;
                      if ( d->character )
                        d->character->timer = 0;
                      if ( !read_from_descriptor( d ) )
                        {
                          FD_CLR( d->descriptor, &out_set );
                          if ( d->character
                               && ( d->connection_state == CON_PLAYING
                                    ||   d->connection_state == CON_EDITING ) )
                            save_char_obj( d->character );
                          d->outtop     = 0;
                          close_socket( d, false );
                          continue;
                        }
                    }

                  if ( d->character && d->character->wait > 0 )
                    {
                      --d->character->wait;
                      continue;
                    }

                  read_from_buffer( d );
                  if ( d->incomm[0] != '\0' )
                    {
                      d->fcommand       = true;
                      stop_idling( d->character );

                      strcpy( cmdline, d->incomm );
                      d->incomm[0] = '\0';

                      if ( d->character )
                        set_cur_char( d->character );

                      if ( d->pager.pagepoint )
                        set_pager_input(d, cmdline);
                      else
                        switch( d->connection_state )
                          {
                          default:
                            nanny( d, cmdline );
                            break;
                          case CON_PLAYING:
                            d->character->cmd_recurse = 0;
                            interpret( d->character, cmdline );
                            break;
                          case CON_EDITING:
                            edit_buffer( d->character, cmdline );
                            break;
                          }
                    }
                }
          if ( d == last_descriptor )
            break;
        }

      /*
       * Autonomous game motion.
       */
      update_handler( );

#ifdef SWRIP_USE_IMC
      imc_loop();
#endif

      /*
       * Output.
       */
      for ( d = first_descriptor; d; d = d_next )
        {
          d_next = d->next;

          if ( ( d->fcommand || d->outtop > 0 )
               &&   FD_ISSET(d->descriptor, &out_set) )
            {
              if ( d->pager.pagepoint )
                {
                  if ( !pager_output(d) )
                    {
                      if ( d->character
                           && ( d->connection_state == CON_PLAYING
                                ||   d->connection_state == CON_EDITING ) )
                        save_char_obj( d->character );
                      d->outtop = 0;
                      close_socket(d, false);
                    }
                }
              else if ( !flush_buffer( d, true ) )
                {
                  if ( d->character
                       && ( d->connection_state == CON_PLAYING
                            ||   d->connection_state == CON_EDITING ) )
                    save_char_obj( d->character );
                  d->outtop     = 0;
                  close_socket( d, false );
                }
            }
          if ( d == last_descriptor )
            break;
        }

      /*
       * Synchronize to a clock.
       * Sleep( last_time + 1/PULSE_PER_SECOND - now ).
       * Careful here of signed versus unsigned arithmetic.
       */
      {
        struct timeval now_time;
        long secDelta;
        long usecDelta;

        gettimeofday( &now_time, NULL );
        usecDelta       = ((int) last_time.tv_usec) - ((int) now_time.tv_usec)
          + 1000000 / PULSE_PER_SECOND;
        secDelta        = ((int) last_time.tv_sec ) - ((int) now_time.tv_sec );
        while ( usecDelta < 0 )
          {
            usecDelta += 1000000;
            secDelta  -= 1;
          }

        while ( usecDelta >= 1000000 )
          {
            usecDelta -= 1000000;
            secDelta  += 1;
          }

        if ( secDelta > 0 || ( secDelta == 0 && usecDelta > 0 ) )
          {
            struct timeval stall_time;
	    int result = 0;
#ifdef _WIN32
	    fd_set dummy_set;
	    FD_ZERO( &dummy_set );
	    FD_SET( control, &dummy_set );
#endif
            stall_time.tv_usec = usecDelta;
            stall_time.tv_sec  = secDelta;

#if defined(AMIGA) || defined(__MORPHOS__)
	    result = WaitSelect( 0, 0, 0, 0, &stall_time, 0 );
#elif defined(_WIN32)
	    result = select( 0, NULL, NULL, &dummy_set, &stall_time );
#else
	    result = select( 0, NULL, NULL, NULL, &stall_time );
#endif
            if ( result == SOCKET_ERROR )
              {
                perror( "game_loop: select: stall" );
                exit( 1 );
              }
          }
      }

      gettimeofday( &last_time, NULL );
      current_time = (time_t) last_time.tv_sec;
    }
  return;
}

void init_descriptor(Descriptor *dnew, socket_t desc)
{
  dnew->descriptor    = desc;
  dnew->connection_state     = CON_GET_NAME;
  dnew->outsize       = 2000;
  dnew->prevcolor     = 0x07;

  CREATE( dnew->outbuf, char, dnew->outsize );
}

void new_descriptor( socket_t new_desc )
{
  char buf[MAX_STRING_LENGTH];
  Descriptor *dnew = NULL;
  Ban *pban;
  struct hostent  *from;
  struct sockaddr_in sock;
  socket_t desc = 0;
  socklen_t size = 0;

  set_alarm( 20 );
  size = sizeof(sock);

  if ( check_bad_desc( new_desc ) )
    {
      set_alarm( 0 );
      return;
    }

  set_alarm( 20 );

  if ( ( desc = accept( new_desc, (struct sockaddr *) &sock, &size) ) == INVALID_SOCKET )
    {
      perror( "New_descriptor: accept");
      /*sprintf(bugbuf, "[*****] BUG: New_descriptor: accept");
        log_string_plus( bugbuf, LOG_COMM, sysdata.log_level );*/
      set_alarm( 0 );
      return;
    }

  if ( check_bad_desc( new_desc ) )
    {
      set_alarm( 0 );
      return;
    }
#if !defined(FNDELAY)
#define FNDELAY O_NDELAY
#endif

  set_alarm( 20 );
  if ( fcntl( desc, F_SETFL, FNDELAY ) == -1 )
    {
      perror( "New_descriptor: fcntl: FNDELAY" );
      set_alarm( 0 );
      return;
    }
  if ( check_bad_desc( new_desc ) )
    return;

  CREATE( dnew, Descriptor, 1 );
  init_descriptor(dnew, desc);
  dnew->remote.port = ntohs( sock.sin_port );

#if defined(AMIGA) || defined(__MORPHOS__)
  strcpy( buf, Inet_NtoA( *( ( unsigned long * ) &sock.sin_addr ) ) );
#else
  strcpy( buf, inet_ntoa( sock.sin_addr ) );
#endif
  sprintf( log_buf, "Sock.sinaddr:  %s, port %hd.",
           buf, dnew->remote.port );
  log_string_plus( log_buf, LOG_COMM, sysdata.log_level );

  dnew->remote.hostip = STRALLOC( buf );

  if ( !sysdata.NO_NAME_RESOLVING )
    {
      from = gethostbyaddr( (char *) &sock.sin_addr,
			    sizeof(sock.sin_addr), AF_INET );
    }
  else
    {
      from = NULL;
    }

  dnew->remote.hostname = STRALLOC( (char *)( from ? from->h_name : buf) );

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if (
          (
           !str_prefix( pban->name, dnew->remote.hostname )
           || !str_suffix ( pban->name , dnew->remote.hostname )
           )
          &&  pban->level >= LEVEL_IMPLEMENTOR
          )
        {
          write_to_descriptor( desc,
                               "Your site has been banned from this Mud.\r\n", 0 );
          free_desc( dnew );
          set_alarm( 0 );
          return;
        }
    }

  /*
   * Init descriptor data.
   */

  if ( !last_descriptor && first_descriptor )
    {
      Descriptor *d;

      bug( "New_descriptor: last_desc is NULL, but first_desc is not! ...fixing" );
      for ( d = first_descriptor; d; d = d->next )
        if ( !d->next )
          last_descriptor = d;
    }

  LINK( dnew, first_descriptor, last_descriptor, next, prev );

  /*
   * Send the greeting.
   */
  {
    if ( help_greeting[0] == '.' )
      write_to_buffer( dnew, help_greeting+1, 0 );
    else
      write_to_buffer( dnew, help_greeting  , 0 );
  }

  if ( ++num_descriptors > sysdata.maxplayers )
    sysdata.maxplayers = num_descriptors;
  if ( sysdata.maxplayers > sysdata.alltimemax )
    {
      if ( sysdata.time_of_max )
        DISPOSE(sysdata.time_of_max);
      sprintf(buf, "%24.24s", ctime(&current_time));
      sysdata.time_of_max = str_dup(buf);
      sysdata.alltimemax = sysdata.maxplayers;
      sprintf( log_buf, "Broke all-time maximum player record: %d", sysdata.alltimemax );
      log_string_plus( log_buf, LOG_COMM, sysdata.log_level );
      to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
      save_sysdata( sysdata );
    }
  set_alarm(0);
  return;
}

void free_desc( Descriptor *d )
{
  closesocket( d->descriptor );
  STRFREE( d->remote.hostname );
  DISPOSE( d->outbuf );

  if ( d->pager.pagebuf )
    DISPOSE( d->pager.pagebuf );

  DISPOSE( d );
  --num_descriptors;
}

void close_socket( Descriptor *dclose, bool force )
{
  Character *ch;
  Descriptor *d;
  bool DoNotUnlink = false;

  /* flush outbuf */
  if ( !force && dclose->outtop > 0 )
    flush_buffer( dclose, false );

  /* say bye to whoever's snooping this descriptor */
  if ( dclose->snoop_by )
    write_to_buffer( dclose->snoop_by,
                     "Your victim has left the game.\r\n", 0 );

  /* stop snooping everyone else */
  for ( d = first_descriptor; d; d = d->next )
    if ( d->snoop_by == dclose )
      d->snoop_by = NULL;

  /* Check for switched people who go link-dead. -- Altrag */
  if ( dclose->original )
    {
      if ( ( ch = dclose->character ) != NULL )
        do_return(ch, "");
      else
        {
          bug( "Close_socket: dclose->original without character %s",
               (dclose->original->name ? dclose->original->name : "unknown") );
          dclose->character = dclose->original;
          dclose->original = NULL;
        }
    }

  ch = dclose->character;

  /* sanity check :( */
  if ( !dclose->prev && dclose != first_descriptor )
    {
      Descriptor *dp, *dn;
      bug( "Close_socket: %s desc:%p != first_desc:%p and desc->prev = NULL!",
           ch ? ch->name : d->remote.hostname, dclose, first_descriptor );
      dp = NULL;
      for ( d = first_descriptor; d; d = dn )
        {
          dn = d->next;
          if ( d == dclose )
            {
              bug( "Close_socket: %s desc:%p found, prev should be:%p, fixing.",
                   ch ? ch->name : d->remote.hostname, dclose, dp );
              dclose->prev = dp;
              break;
            }
          dp = d;
        }
      if ( !dclose->prev )
        {
          bug( "Close_socket: %s desc:%p could not be found!.",
               ch ? ch->name : dclose->remote.hostname, dclose );
          DoNotUnlink = true;
        }
    }
  if ( !dclose->next && dclose != last_descriptor )
    {
      Descriptor *dp, *dn;
      bug( "Close_socket: %s desc:%p != last_desc:%p and desc->next = NULL!",
           ch ? ch->name : d->remote.hostname, dclose, last_descriptor );
      dn = NULL;
      for ( d = last_descriptor; d; d = dp )
        {
          dp = d->prev;
          if ( d == dclose )
            {
              bug( "Close_socket: %s desc:%p found, next should be:%p, fixing.",
                   ch ? ch->name : d->remote.hostname, dclose, dn );
              dclose->next = dn;
              break;
            }
          dn = d;
        }
      if ( !dclose->next )
        {
          bug( "Close_socket: %s desc:%p could not be found!.",
               ch ? ch->name : dclose->remote.hostname, dclose );
          DoNotUnlink = true;
        }
    }

  if ( dclose->character )
    {
      sprintf( log_buf, "Closing link to %s.", ch->name );
      log_string_plus( log_buf, LOG_COMM, umax( sysdata.log_level, ch->top_level ) );
      /*
        if ( ch->top_level < LEVEL_CREATOR )
        to_channel( log_buf, CHANNEL_MONITOR, "Monitor", ch->top_level );
      */
      if ( dclose->connection_state == CON_PLAYING
           ||   dclose->connection_state == CON_EDITING )
        {
          act( AT_ACTION, "$n has lost $s link.", ch, NULL, NULL, TO_ROOM );
          ch->desc = NULL;
        }
      else
        {
          /* clear descriptor pointer to get rid of bug message in log */
          dclose->character->desc = NULL;
          free_char( dclose->character );
        }
    }


  if ( !DoNotUnlink )
    {
      /* make sure loop doesn't get messed up */
      if ( d_next == dclose )
        d_next = d_next->next;
      UNLINK( dclose, first_descriptor, last_descriptor, next, prev );
    }

  if ( dclose->descriptor == maxdesc )
    --maxdesc;

  free_desc( dclose );
  return;
}

bool read_from_descriptor( Descriptor *d )
{
  size_t iStart;

  if ( d->incomm[0] != '\0' )
    return true;

  iStart = strlen(d->inbuf);

  if ( iStart >= sizeof(d->inbuf) - 10 )
    {
      sprintf( log_buf, "%s input overflow!", d->remote.hostname );
      log_string( log_buf );
      write_to_descriptor( d->descriptor,
                           "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
      return false;
    }

  for ( ; ; )
    {
#if defined(AMIGA) || defined(__MORPHOS__)
      ssize_t nRead = recv( d->descriptor, ( UBYTE * ) d->inbuf + iStart,
                            sizeof( d->inbuf ) - 10 - iStart, 0 );
#else
      ssize_t nRead = recv( d->descriptor, d->inbuf + iStart,
                            sizeof( d->inbuf ) - 10 - iStart, 0 );
#endif

      if ( nRead == 0 )
        {
          log_string_plus( "EOF encountered on read.", LOG_COMM, sysdata.log_level );
          return false;
        }

      if( nRead == SOCKET_ERROR )
        {
          if( GETERROR == EWOULDBLOCK || GETERROR == EAGAIN )
            {
              break;
            }
          else
            {
              log_string_plus( strerror( GETERROR ), LOG_COMM, sysdata.log_level );
              return false;
            }
        }

      iStart += nRead;

      if ( d->inbuf[iStart-1] == '\n' || d->inbuf[iStart-1] == '\r' )
	{
	  break;
	}
    }

  d->inbuf[iStart] = '\0';
  return true;
}

/*
 * Transfer one line from input buffer to input line.
 */
void read_from_buffer( Descriptor *d )
{
  int i, j, k;

  /*
   * Hold horses if pending command already.
   */
  if ( d->incomm[0] != '\0' )
    return;

  /*
   * Look for at least one new line.
   */
  for ( i = 0; d->inbuf[i] != '\n' && d->inbuf[i] != '\r' && i<MAX_INBUF_SIZE;
        i++ )
    {
      if ( d->inbuf[i] == '\0' )
        return;
    }

  /*
   * Canonical input processing.
   */
  for ( i = 0, k = 0; d->inbuf[i] != '\n' && d->inbuf[i] != '\r'; i++ )
    {
      if ( k >= 254 )
        {
          write_to_descriptor( d->descriptor, "Line too long.\r\n", 0 );

          /* skip the rest of the line */
          /*
            for ( ; d->inbuf[i] != '\0' || i>= MAX_INBUF_SIZE ; i++ )
            {
            if ( d->inbuf[i] == '\n' || d->inbuf[i] == '\r' )
            break;
            }
          */
          d->inbuf[i]   = '\n';
          d->inbuf[i+1] = '\0';
          break;
        }

      if ( d->inbuf[i] == '\b' && k > 0 )
        --k;
      else if ( isascii(d->inbuf[i]) && isprint(d->inbuf[i]) )
        d->incomm[k++] = d->inbuf[i];
    }

  /*
   * Finish off the line.
   */
  if ( k == 0 )
    d->incomm[k++] = ' ';
  d->incomm[k] = '\0';

  /*
   * Deal with bozos with #repeat 1000 ...
   */
  if ( k > 1 || d->incomm[0] == '!' )
    {
      if ( d->incomm[0] != '!' && str_cmp( d->incomm, d->inlast ) )
        {
          d->repeat = 0;
        }
      else
        {
          if ( ++d->repeat >= 100 )
            {
              write_to_descriptor( d->descriptor,
                                   "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
            }
        }
    }

  /*
   * Do '!' substitution.
   */
  if ( d->incomm[0] == '!' )
    strcpy( d->incomm, d->inlast );
  else
    strcpy( d->inlast, d->incomm );

  /*
   * Shift the input buffer.
   */
  while ( d->inbuf[i] == '\n' || d->inbuf[i] == '\r' )
    i++;
  for ( j = 0; ( d->inbuf[j] = d->inbuf[i+j] ) != '\0'; j++ )
    ;
  return;
}



/*
 * Low level output function.
 */
bool flush_buffer( Descriptor *d, bool fPrompt )
{
  char buf[MAX_INPUT_LENGTH];
  Character *ch;

  ch = d->original ? d->original : d->character;

  if( ch && ch->fighting && ch->fighting->who )
    show_condition( ch, ch->fighting->who );

  /*
   * If buffer has more than 4K inside, spit out .5K at a time   -Thoric
   */
  if ( !mud_down && d->outtop > 4096 )
    {
      memcpy( buf, d->outbuf, 512 );
      memmove( d->outbuf, d->outbuf + 512, d->outtop - 512 );
      d->outtop -= 512;
      if ( d->snoop_by )
        {
          char snoopbuf[MAX_INPUT_LENGTH];

          buf[512] = '\0';
          if ( d->character && d->character->name )
            {
              if (d->original && d->original->name)
                sprintf( snoopbuf, "%s (%s)", d->character->name, d->original->name );
              else
                sprintf( snoopbuf, "%s", d->character->name);
              write_to_buffer( d->snoop_by, snoopbuf, 0);
            }
          write_to_buffer( d->snoop_by, "% ", 2 );
          write_to_buffer( d->snoop_by, buf, 0 );
        }
      if ( !write_to_descriptor( d->descriptor, buf, 512 ) )
        {
          d->outtop = 0;
          return false;
        }
      return true;
    }


  /*
   * Bust a prompt.
   */
  if ( fPrompt && !mud_down && d->connection_state == CON_PLAYING )
    {
      ch = d->original ? d->original : d->character;
      if ( IS_SET(ch->act, PLR_BLANK) )
        write_to_buffer( d, "\r\n", 2 );

      if ( IS_SET(ch->act, PLR_PROMPT) )
        display_prompt(d);
      if ( IS_SET(ch->act, PLR_TELNET_GA) )
        write_to_buffer( d, go_ahead_str, 0 );
    }

  /*
   * Short-circuit if nothing to write.
   */
  if ( d->outtop == 0 )
    return true;

  /*
   * Snoop-o-rama.
   */
  if ( d->snoop_by )
    {
      /* without check, 'force mortal quit' while snooped caused crash, -h */
      if ( d->character && d->character->name )
        {
          /* Show original snooped names. -- Altrag */
          if ( d->original && d->original->name )
            sprintf( buf, "%s (%s)", d->character->name, d->original->name );
          else
            sprintf( buf, "%s", d->character->name);
          write_to_buffer( d->snoop_by, buf, 0);
        }
      write_to_buffer( d->snoop_by, "% ", 2 );
      write_to_buffer( d->snoop_by, d->outbuf, d->outtop );
    }

  /*
   * OS-dependent output.
   */
  if ( !write_to_descriptor( d->descriptor, d->outbuf, d->outtop ) )
    {
      d->outtop = 0;
      return false;
    }
  else
    {
      d->outtop = 0;
      return true;
    }
}



/*
 * Append onto an output buffer.
 */
void write_to_buffer( Descriptor *d, const char *txt, size_t length )
{
  if ( !d )
    {
      bug( "Write_to_buffer: NULL descriptor" );
      return;
    }

  /*
   * Normally a bug... but can happen if loadup is used.
   */
  if ( !d->outbuf )
    return;

  /*
   * Find length in case caller didn't.
   */
  if ( length <= 0 )
    length = strlen(txt);

  /* Uncomment if debugging or something
     if ( length != strlen(txt) )
     {
     bug( "Write_to_buffer: length(%d) != strlen(txt)!", length );
     length = strlen(txt);
     }
  */

  /*
   * Initial \r\n if needed.
   */
  if ( d->outtop == 0 && !d->fcommand )
    {
      d->outbuf[0]      = '\n';
      d->outbuf[1]      = '\r';
      d->outtop = 2;
    }

  /*
   * Expand the buffer as needed.
   */
  while ( d->outtop + length >= d->outsize )
    {
      if (d->outsize > 32000)
        {
          /* empty buffer */
          d->outtop = 0;
          close_socket(d, true);
          bug("Buffer overflow. Closing (%s).", d->character ? d->character->name : "???" );
          return;
        }
      d->outsize *= 2;
      RECREATE( d->outbuf, char, d->outsize );
    }

  /*
   * Copy.
   */
  strncpy( d->outbuf + d->outtop, txt, length );
  d->outtop += length;
  d->outbuf[d->outtop] = '\0';
}


/*
 * Lowest level output function.
 * Write a block of text to the file descriptor.
 * If this gives errors on very long blocks (like 'ofind all'),
 *   try lowering the max block size.
 */
bool write_to_descriptor( socket_t desc, char *txt, int length )
{
  int iStart;
  ssize_t nWrite;
  int nBlock;

  if ( length <= 0 )
    length = strlen(txt);

  for ( iStart = 0; iStart < length; iStart += nWrite )
    {
      nBlock = umin( length - iStart, 4096 );

#if defined(AMIGA) || defined(__MORPHOS__)
      if( ( nWrite = send( d->descriptor, (char*) txt + iStart, nBlock, 0 ) ) == SOCKET_ERROR )
#else
	if( ( nWrite = send( desc, txt + iStart, nBlock, 0 ) ) == SOCKET_ERROR)
#endif
        {
          char logbuf[MAX_STRING_LENGTH];
          sprintf(logbuf, "Write_to_descriptor: error on socket %d: %s",
		  desc, strerror( GETERROR ) );
          log_string(logbuf);
          perror( "Write_to_descriptor" );
          return false;
        }
    }

  return true;
}

/*
 * Parse a name for acceptability.
 */
bool check_parse_name( const char *name )
{
  const char *pc = NULL;
  bool fIll = true;
  /*
   * Reserved words.
   */
  if ( is_name( name, "all auto someone immortal self god supreme demigod dog guard cityguard cat cornholio spock hicaine hithoric death ass fuck shit piss crap quit" ) )
    return false;

  /*
   * Length restrictions.
   */
  if( strlen(name) <  MIN_NAME_LENGTH || strlen(name) > MAX_NAME_LENGTH )
    return false;

  /*
   * Alphanumerics only.
   * Lock out IllIll twits.
   */
  for ( pc = name; *pc != '\0'; pc++ )
    {
      if ( !isalpha(*pc) )
	return false;

      if ( LOWER(*pc) != 'i' && LOWER(*pc) != 'l' )
	fIll = false;
      }

    if ( fIll )
      {
	return false;
      }

  return true;
}

/*
 * Look for link-dead player to reconnect.
 */
bool check_reconnect( Descriptor *d, char *name, bool fConn )
{
  Character *ch;

  for ( ch = first_char; ch; ch = ch->next )
    {
      if ( !IsNpc(ch)
           && ( !fConn || !ch->desc )
           &&    ch->name
           &&   !str_cmp( name, ch->name ) )
        {
          if ( fConn && ch->switched )
            {
              write_to_buffer( d, "Already playing.\r\nName: ", 0 );
              d->connection_state = CON_GET_NAME;
              if ( d->character )
                {
                  /* clear descriptor pointer to get rid of bug message in log */
                  d->character->desc = NULL;
                  free_char( d->character );
                  d->character = NULL;
                }
              return BERR;
            }
          if ( fConn == false )
            {
              DISPOSE( d->character->pcdata->pwd );
              d->character->pcdata->pwd = str_dup( ch->pcdata->pwd );
            }
          else
            {
              /* clear descriptor pointer to get rid of bug message in log */
              d->character->desc = NULL;
              free_char( d->character );
              d->character = ch;
              ch->desc   = d;
              ch->timer  = 0;
              send_to_char( "Reconnecting.\r\n", ch );
              act( AT_ACTION, "$n has reconnected.", ch, NULL, NULL, TO_ROOM );
              sprintf( log_buf, "%s@%s reconnected.", ch->name, d->remote.hostname );
              log_string_plus( log_buf, LOG_COMM, umax( sysdata.log_level, ch->top_level ) );
              d->connection_state = CON_PLAYING;
            }
          return true;
        }
    }

  return false;
}



/*
 * Check if already playing.
 */

bool check_multi( Descriptor *d , char *name )
{
  Descriptor *dold;

  for ( dold = first_descriptor; dold; dold = dold->next )
    {
      if ( dold != d
           && (  dold->character || dold->original )
           &&   str_cmp( name, dold->original
                         ? dold->original->name : dold->character->name )
           && !str_cmp(dold->remote.hostname , d->remote.hostname ) )
        {
          if ( d->character->top_level >= LEVEL_CREATOR
               || ( dold->original ? dold->original : dold->character )->top_level >= LEVEL_CREATOR )
	    {
	      return false;
	    }

          write_to_buffer( d, "Sorry multi-playing is not allowed ... have you other character quit first.\r\n", 0 );
          sprintf( log_buf, "%s attempting to multiplay with %s.", dold->original ? dold->original->name : dold->character->name , d->character->name );
          log_string_plus( log_buf, LOG_COMM, sysdata.log_level );
          d->character = NULL;
          free_char( d->character );
          return true;
        }
    }

  return false;

}

bool check_playing( Descriptor *d, char *name, bool kick )
{
  Character *ch;

  Descriptor *dold;
  int   cstate;

  for ( dold = first_descriptor; dold; dold = dold->next )
    {
      if ( dold != d
           && (  dold->character || dold->original )
           &&   !str_cmp( name, dold->original
                          ? dold->original->name : dold->character->name ) )
        {
          cstate = dold->connection_state;
          ch = dold->original ? dold->original : dold->character;
          if ( !ch->name
               || ( cstate != CON_PLAYING && cstate != CON_EDITING ) )
            {
              write_to_buffer( d, "Already connected - try again.\r\n", 0 );
              sprintf( log_buf, "%s already connected.", ch->name );
              log_string_plus( log_buf, LOG_COMM, sysdata.log_level );
              return BERR;
            }
          if ( !kick )
            return true;
          write_to_buffer( d, "Already playing... Kicking off old connection.\r\n", 0 );
          write_to_buffer( dold, "Kicking off old connection... bye!\r\n", 0 );
          close_socket( dold, false );
          /* clear descriptor pointer to get rid of bug message in log */
          d->character->desc = NULL;
          free_char( d->character );
          d->character = ch;
          ch->desc       = d;
          ch->timer      = 0;
          if ( ch->switched )
            do_return( ch->switched, "" );
          ch->switched = NULL;
          send_to_char( "Reconnecting.\r\n", ch );
          act( AT_ACTION, "$n has reconnected, kicking off old link.",
               ch, NULL, NULL, TO_ROOM );
          sprintf( log_buf, "%s@%s reconnected, kicking off old link.",
                   ch->name, d->remote.hostname );
          log_string_plus( log_buf, LOG_COMM, umax( sysdata.log_level, ch->top_level ) );

          d->connection_state = cstate;
          return true;
        }
    }

  return false;
}



void stop_idling( Character *ch )
{
  if ( !ch
       ||   !ch->desc
       ||    ch->desc->connection_state != CON_PLAYING
       ||   !ch->was_in_room
       ||    ch->in_room != get_room_index( ROOM_VNUM_LIMBO ) )
    return;

  ch->timer = 0;
  char_from_room( ch );
  char_to_room( ch, ch->was_in_room );
  ch->was_in_room       = NULL;
  act( AT_ACTION, "$n has returned from the void.", ch, NULL, NULL, TO_ROOM );
  return;
}

void send_to_char( const char *txt, const Character *ch )
{
  Descriptor *d;
  const char *colstr;
  const char *prevstr = txt;
  char colbuf[20];
  int ln;

  if ( !ch )
    {
      bug( "Send_to_char: NULL *ch" );
      return;
    }
  if ( !txt || !ch->desc )
    return;
  d = ch->desc;
  /* Clear out old color stuff */
  /*  make_color_sequence(NULL, NULL, NULL);*/
  while ( d && ((colstr = strpbrk(prevstr, "&^")) != NULL ))
    {
      if (colstr > prevstr)
        write_to_buffer(d, prevstr, (colstr-prevstr));
      ln = make_color_sequence(colstr, colbuf, d);
      if ( ln < 0 )
        {
          prevstr = colstr+1;
          break;
        }
      else if ( ln > 0 )
        write_to_buffer(d, colbuf, ln);
      prevstr = colstr+2;
    }
  if ( *prevstr )
    write_to_buffer(d, prevstr, 0);
  return;
}

void write_to_pager( Descriptor *d, const char *txt, size_t length )
{
  if ( length <= 0 )
    length = strlen(txt);

  if ( length == 0 )
    return;

  if ( !d->pager.pagebuf )
    {
      d->pager.pagesize = MAX_STRING_LENGTH;
      CREATE( d->pager.pagebuf, char, d->pager.pagesize );
    }

  if ( !d->pager.pagepoint )
    {
      d->pager.pagepoint = d->pager.pagebuf;
      d->pager.pagetop = 0;
      d->pager.pagecmd = '\0';
    }

  if ( d->pager.pagetop == 0 && !d->fcommand )
    {
      d->pager.pagebuf[0] = '\n';
      d->pager.pagebuf[1] = '\r';
      d->pager.pagetop = 2;
    }

  while ( d->pager.pagetop + length >= d->pager.pagesize )
    {
      if ( d->pager.pagesize > 32000 )
        {
          bug( "Pager overflow. Ignoring.\r\n" );
          d->pager.pagetop = 0;
          d->pager.pagepoint = NULL;
          DISPOSE(d->pager.pagebuf);
          d->pager.pagesize = MAX_STRING_LENGTH;
          return;
        }

      d->pager.pagesize *= 2;
      RECREATE(d->pager.pagebuf, char, d->pager.pagesize);
    }

  strncpy(d->pager.pagebuf + d->pager.pagetop, txt, length);
  d->pager.pagetop += length;
  d->pager.pagebuf[d->pager.pagetop] = '\0';
}

void send_to_pager( const char *txt, const Character *ch )
{
  Descriptor *d;
  const char *colstr;
  const char *prevstr = txt;
  char colbuf[20];

  if ( !ch )
    {
      bug( "Send_to_pager_color: NULL *ch" );
      return;
    }

  if ( !txt || !ch->desc )
    return;

  d = ch->desc;
  ch = d->original ? d->original : d->character;

  if ( IsNpc(ch) || !IS_SET(ch->pcdata->flags, PCFLAG_PAGERON) )
    {
      send_to_char(txt, d->character);
      return;
    }

  /* Clear out old color stuff */
  /*  make_color_sequence(NULL, NULL, NULL);*/
  while ( (colstr = strpbrk(prevstr, "&^")) != NULL )
    {
      int ln = 0;

      if ( colstr > prevstr )
        write_to_pager(d, prevstr, (colstr-prevstr));

      ln = make_color_sequence(colstr, colbuf, d);

      if ( ln < 0 )
        {
          prevstr = colstr+1;
          break;
        }
      else if ( ln > 0 )
	{
	  write_to_pager(d, colbuf, ln);
	}

      prevstr = colstr+2;
    }

  if ( *prevstr )
    {
      write_to_pager(d, prevstr, 0);
    }
}


void set_char_color( short AType, Character *ch )
{
  char buf[16];
  Character *och;

  if ( !ch || !ch->desc )
    return;

  och = (ch->desc->original ? ch->desc->original : ch);
  if ( !IsNpc(och) && IS_SET(och->act, PLR_ANSI) )
    {
      if ( AType == 7 )
        strcpy( buf, "\033[m" );
      else
        sprintf(buf, "\033[0;%d;%s%dm", (AType & 8) == 8,
                (AType > 15 ? "5;" : ""), (AType & 7)+30);
      write_to_buffer( ch->desc, buf, strlen(buf) );
    }
  return;
}

void set_pager_color( short AType, Character *ch )
{
  char buf[16];
  Character *och;

  if ( !ch || !ch->desc )
    return;

  och = (ch->desc->original ? ch->desc->original : ch);
  if ( !IsNpc(och) && IS_SET(och->act, PLR_ANSI) )
    {
      if ( AType == 7 )
        strcpy( buf, "\033[m" );
      else
        sprintf(buf, "\033[0;%d;%s%dm", (AType & 8) == 8,
                (AType > 15 ? "5;" : ""), (AType & 7)+30);
      send_to_pager( buf, ch );
      ch->desc->pager.pagecolor = AType;
    }
  return;
}


/* source: EOD, by John Booth <???> */
void ch_printf(const Character *ch, const char *fmt, ...)
{
  char buf[MAX_STRING_LENGTH*2];        /* better safe than sorry */
  va_list args;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);

  send_to_char(buf, ch);
}

void pager_printf(const Character *ch, const char *fmt, ...)
{
  char buf[MAX_STRING_LENGTH*2];
  va_list args;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);

  send_to_pager(buf, ch);
}



char *obj_short( const OBJ_DATA *obj )
{
  static char buf[MAX_STRING_LENGTH];

  if ( obj->count > 1 )
    {
      sprintf( buf, "%s (%d)", obj->short_descr, obj->count );
      return buf;
    }
  return obj->short_descr;
}

/*
 * The primary output interface for formatted output.
 */
/* Major overhaul. -- Alty */
#define NAME(ch)        (IsNpc(ch) ? ch->short_descr : ch->name)
char *act_string(const char *format, Character *to, Character *ch,
                 const void *arg1, const void *arg2)
{
  static char * const he_she  [] = { "it",  "he",  "she" };
  static char * const him_her [] = { "it",  "him", "her" };
  static char * const his_her [] = { "its", "his", "her" };
  static char buf[MAX_STRING_LENGTH];
  char fname[MAX_INPUT_LENGTH];
  char *point = buf;
  const char *str = format;
  const char *i;
  Character *vch = (Character *) arg2;
  OBJ_DATA *obj1 = (OBJ_DATA  *) arg1;
  OBJ_DATA *obj2 = (OBJ_DATA  *) arg2;

  while ( *str != '\0' )
    {
      if ( *str != '$' )
        {
          *point++ = *str++;
          continue;
        }
      ++str;
      if ( !arg2 && *str >= 'A' && *str <= 'Z' )
        {
          bug( "Act: missing arg2 for code %c:", *str );
          bug( format );
          i = " <@@@> ";
        }
      else
        {
          switch ( *str )
            {
            default:  bug( "Act: bad code %c.", *str );
              i = " <@@@> ";                                            break;
            case 't': i = (char *) arg1;                                        break;
            case 'T': i = (char *) arg2;                                        break;
            case 'n': i = (to ? PERS( ch, to) : NAME( ch));                     break;
            case 'N': i = (to ? PERS(vch, to) : NAME(vch));                     break;
            case 'e': if (ch->sex > 2 || ch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", ch->name,
                      ch->sex);
                  i = "it";
                }
              else
                i = he_she [urange(0,  ch->sex, 2)];
              break;
            case 'E': if (vch->sex > 2 || vch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", vch->name,
                      vch->sex);
                  i = "it";
                }
              else
                i = he_she [urange(0, vch->sex, 2)];
              break;
            case 'm': if (ch->sex > 2 || ch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", ch->name,
                      ch->sex);
                  i = "it";
                }
              else
                i = him_her[urange(0,  ch->sex, 2)];
              break;
            case 'M': if (vch->sex > 2 || vch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", vch->name,
                      vch->sex);
                  i = "it";
                }
              else
                i = him_her[urange(0, vch->sex, 2)];
              break;
            case 's': if (ch->sex > 2 || ch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", ch->name,
                      ch->sex);
                  i = "its";
                }
              else
                i = his_her[urange(0,  ch->sex, 2)];
              break;
            case 'S': if (vch->sex > 2 || vch->sex < 0)
                {
                  bug("act_string: player %s has sex set at %d!", vch->name,
                      vch->sex);
                  i = "its";
                }
              else
                i = his_her[urange(0, vch->sex, 2)];
              break;
            case 'q': i = (to == ch) ? "" : "s";                                break;
            case 'Q': i = (to == ch) ? "your" :
              his_her[urange(0,  ch->sex, 2)];                  break;
            case 'p': i = (!to || can_see_obj(to, obj1)
                           ? obj_short(obj1) : "something");                    break;
            case 'P': i = (!to || can_see_obj(to, obj2)
                           ? obj_short(obj2) : "something");                    break;
            case 'd':
              if ( !arg2 || ((char *) arg2)[0] == '\0' )
                i = "door";
              else
                {
                  one_argument((char *) arg2, fname);
                  i = fname;
                }
              break;
            }
        }
      ++str;
      while ( (*point = *i) != '\0' )
        ++point, ++i;
    }
  strcpy(point, "\r\n");
  buf[0] = UPPER(buf[0]);
  return buf;
}
#undef NAME

void act( short AType, const char *format, Character *ch, const void *arg1, const void *arg2, int type )
{
  char *txt;
  Character *to;
  Character *vch = (Character *)arg2;

  /*
   * Discard null and zero-length messages.
   */
  if ( !format || format[0] == '\0' )
    return;

  if ( !ch )
    {
      bug( "Act: null ch. (%s)", format );
      return;
    }

  if ( !ch->in_room )
    to = NULL;
  else if ( type == TO_CHAR )
    to = ch;
  else
    to = ch->in_room->first_person;

  /*
   * ACT_SECRETIVE handling
   */
  if ( IsNpc(ch) && IS_SET(ch->act, ACT_SECRETIVE) && type != TO_CHAR )
    return;

  if ( type == TO_VICT )
    {
      if ( !vch )
        {
          bug( "Act: null vch with TO_VICT." );
          bug( "%s (%s)", ch->name, format );
          return;
        }
      if ( !vch->in_room )
        {
          bug( "Act: vch in NULL room!" );
          bug( "%s -> %s (%s)", ch->name, vch->name, format );
          return;
        }
      to = vch;
      /*        to = vch->in_room->first_person;*/
    }

  if ( MOBtrigger && type != TO_CHAR && type != TO_VICT && to )
    {
      OBJ_DATA *to_obj;

      txt = act_string(format, NULL, ch, arg1, arg2);
      if ( IS_SET(to->in_room->mprog.progtypes, ACT_PROG) )
        rprog_act_trigger(txt, to->in_room, ch, (OBJ_DATA *)arg1, (void *)arg2);
      for ( to_obj = to->in_room->first_content; to_obj;
            to_obj = to_obj->next_content )
        if ( IS_SET(to_obj->pIndexData->mprog.progtypes, ACT_PROG) )
          oprog_act_trigger(txt, to_obj, ch, (OBJ_DATA *)arg1, (void *)arg2);
    }

  /* Anyone feel like telling me the point of looping through the whole
     room when we're only sending to one char anyways..? -- Alty */
  for ( ; to; to = (type == TO_CHAR || type == TO_VICT)
          ? NULL : to->next_in_room )
    {
      if (((!to || !to->desc)
           && (  IsNpc(to) && !IS_SET(to->pIndexData->mprog.progtypes, ACT_PROG) ))
          ||   !is_awake(to) )
        continue;


      if(!can_see(to, ch) && type != TO_VICT )
        continue;

      if ( type == TO_CHAR && to != ch )
        continue;
      if ( type == TO_VICT && ( to != vch || to == ch ) )
        continue;
      if ( type == TO_ROOM && to == ch )
        continue;
      if ( type == TO_NOTVICT && (to == ch || to == vch) )
        continue;

      if(!can_see(to, ch) && type != TO_VICT )
        continue;

      txt = act_string(format, to, ch, arg1, arg2);
      if (to && to->desc)
        {
          set_char_color(AType, to);
          send_to_char( txt, to );
        }
      if (MOBtrigger)
        {
          /* Note: use original string, not string with ANSI. -- Alty */
          mprog_act_trigger( txt, to, ch, (OBJ_DATA *)arg1, (void *)arg2 );
        }
    }
  MOBtrigger = true;
  return;
}

char *default_prompt( Character *ch )
{
  static char buf[MAX_STRING_LENGTH];
  strcpy( buf,"" );

  if (is_jedi(ch) || GetTrustLevel(ch) >= LEVEL_IMMORTAL )
    strcat(buf, "&pForce:&P%m/&p%M  &pAlign:&P%a\r\n");

  strcat(buf, "&BHealth:&C%h&B/%H  &BMovement:&C%v&B/%V");
  strcat(buf, "&C >&w");
  return buf;
}

int getcolor(char clr)
{
  static const char colors[] = "xrgObpcwzRGYBPCW";
  int r;

  for ( r = 0; r < 16; r++ )
    if ( clr == colors[r] )
      return r;
  return -1;
}

void display_prompt( Descriptor *d )
{
  Character *ch = d->character;
  Character *och = (d->original ? d->original : d->character);
  bool ansi = (!IsNpc(och) && IS_SET(och->act, PLR_ANSI));
  const char *prompt;
  char buf[MAX_STRING_LENGTH];
  char *pbuf = buf;
  int the_stat;

  if ( !ch )
    {
      bug( "display_prompt: NULL ch" );
      return;
    }

  if ( !IsNpc(ch) && ch->substate != SUB_NONE && ch->pcdata->subprompt
       &&   ch->pcdata->subprompt[0] != '\0' )
    prompt = ch->pcdata->subprompt;
  else if ( IsNpc(ch) || !ch->pcdata->prompt || !*ch->pcdata->prompt )
    prompt = default_prompt(ch);
  else
    prompt = ch->pcdata->prompt;

  if ( ansi )
    {
      strcpy(pbuf, "\033[m");
      d->prevcolor = 0x07;
      pbuf += 3;
    }

  /* Clear out old color stuff */
  /*  make_color_sequence(NULL, NULL, NULL);*/
  for ( ; *prompt; prompt++ )
    {
      /*
       * '&' = foreground color/intensity bit
       * '^' = background color/blink bit
       * '%' = prompt commands
       * Note: foreground changes will revert background to 0 (black)
       */
      if ( *prompt != '&' && *prompt != '^' && *prompt != '%' )
        {
          *(pbuf++) = *prompt;
          continue;
        }

      ++prompt;

      if ( !*prompt )
        break;

      if ( *prompt == *(prompt-1) )
        {
          *(pbuf++) = *prompt;
          continue;
        }

      switch(*(prompt-1))
        {
        default:
          bug( "Display_prompt: bad command char '%c'.", *(prompt-1) );
          break;

        case '&':
        case '^':
          the_stat = make_color_sequence(&prompt[-1], pbuf, d);
          if ( the_stat < 0 )
            --prompt;
          else if ( the_stat > 0 )
            pbuf += the_stat;
          break;

        case '%':
          *pbuf = '\0';
          the_stat = 0x80000000;

          switch(*prompt)
            {
            case '%':
              *pbuf++ = '%';
              *pbuf = '\0';
              break;

            case 'a':
              if ( ch->top_level >= 10 )
                the_stat = ch->alignment;
              else if ( is_good(ch) )
                strcpy(pbuf, "good");
              else if ( is_evil(ch) )
                strcpy(pbuf, "evil");
              else
                strcpy(pbuf, "neutral");
              break;

            case 'h':
              the_stat = ch->hit;
              break;

            case 'H':
              the_stat = ch->max_hit;
              break;

            case 'm':
              if ( IsImmortal(ch) || is_jedi( ch ) )
                the_stat = ch->mana;
              else
                the_stat = 0;
              break;

            case 'M':
              if ( IsImmortal(ch) || is_jedi( ch ) )
                the_stat = ch->max_mana;
              else
                the_stat = 0;
              break;

            case 'p':
              if ( ch->position == POS_RESTING )
                strcpy(pbuf, "resting");
              else if ( ch->position == POS_SLEEPING )
                strcpy(pbuf, "sleeping");
              else if ( ch->position == POS_SITTING )
                strcpy(pbuf, "sitting");
              break;

            case 'u':
              the_stat = num_descriptors;
              break;

            case 'U':
              the_stat = sysdata.maxplayers;
              break;

            case 'v':
              the_stat = ch->move;
              break;

            case 'V':
              the_stat = ch->max_move;
              break;

            case 'g':
              the_stat = ch->gold;
              break;

            case 'r':
              if ( IsImmortal(och) )
                the_stat = ch->in_room->vnum;
              break;

            case 'R':
              if ( IS_SET(och->act, PLR_ROOMVNUM) )
                sprintf(pbuf, "<#%ld> ", ch->in_room->vnum);
              break;

            case 'i':
              if ( (!IsNpc(ch) && IS_SET(ch->act, PLR_WIZINVIS)) ||
                   (IsNpc(ch) && IS_SET(ch->act, ACT_MOBINVIS)) )
                sprintf(pbuf, "(Invis %d) ", (IsNpc(ch) ? ch->mobinvis : ch->pcdata->wizinvis));
              else if ( IsAffectedBy(ch, AFF_INVISIBLE) )
		sprintf(pbuf, "(Invis) " );
              break;

            case 'I':
              the_stat = (IsNpc(ch) ? (IS_SET(ch->act, ACT_MOBINVIS) ? ch->mobinvis : 0)
                      : (IS_SET(ch->act, PLR_WIZINVIS) ? ch->pcdata->wizinvis : 0));
              break;
            }

          if ( (unsigned int)the_stat != 0x80000000 )
            sprintf(pbuf, "%d", the_stat);

          pbuf += strlen(pbuf);
          break;
        }
    }
  *pbuf = '\0';
  write_to_buffer(d, buf, (pbuf-buf));
  return;
}

int make_color_sequence(const char *col, char *buf, Descriptor *d)
{
  int ln;
  const char *ctype = col;
  unsigned char cl;
  Character *och;
  bool ansi;

  och = (d->original ? d->original : d->character);
  ansi = (!IsNpc(och) && IS_SET(och->act, PLR_ANSI));
  col++;
  if ( !*col )
    ln = -1;
  else if ( *ctype != '&' && *ctype != '^' )
    {
      bug("Make_color_sequence: command '%c' not '&' or '^'.", *ctype);
      ln = -1;
    }
  else if ( *col == *ctype )
    {
      buf[0] = *col;
      buf[1] = '\0';
      ln = 1;
    }
  else if ( !ansi )
    ln = 0;
  else
    {
      cl = d->prevcolor;
      switch(*ctype)
        {
        default:
          bug( "Make_color_sequence: bad command char '%c'.", *ctype );
          ln = -1;
          break;
        case '&':
          if ( *col == '-' )
            {
              buf[0] = '~';
              buf[1] = '\0';
              ln = 1;
              break;
            }
        case '^':
          {
            int newcol;

            if ( (newcol = getcolor(*col)) < 0 )
              {
                ln = 0;
                break;
              }
            else if ( *ctype == '&' )
              cl = (cl & 0xF0) | newcol;
            else
              cl = (cl & 0x0F) | (newcol << 4);
          }
          if ( cl == d->prevcolor )
            {
              ln = 0;
              break;
            }
          strcpy(buf, "\033[");
          if ( (cl & 0x88) != (d->prevcolor & 0x88) )
            {
              strcat(buf, "m\033[");
              if ( (cl & 0x08) )
                strcat(buf, "1;");
              if ( (cl & 0x80) )
                strcat(buf, "5;");
              d->prevcolor = 0x07 | (cl & 0x88);
              ln = strlen(buf);
            }
          else
            ln = 2;
          if ( (cl & 0x07) != (d->prevcolor & 0x07) )
            {
              sprintf(buf+ln, "3%d;", cl & 0x07);
              ln += 3;
            }
          if ( (cl & 0x70) != (d->prevcolor & 0x70) )
            {
              sprintf(buf+ln, "4%d;", (cl & 0x70) >> 4);
              ln += 3;
            }
          if ( buf[ln-1] == ';' )
            buf[ln-1] = 'm';
          else
            {
              buf[ln++] = 'm';
              buf[ln] = '\0';
            }
          d->prevcolor = cl;
        }
    }
  if ( ln <= 0 )
    *buf = '\0';
  return ln;
}

void set_pager_input( Descriptor *d, char *argument )
{
  while ( isspace(*argument) )
    argument++;

  d->pager.pagecmd = *argument;
}

bool pager_output( Descriptor *d )
{
  register char *last;
  Character *ch;
  int pclines;
  register int lines;
  bool ret;

  if ( !d || !d->pager.pagepoint || d->pager.pagecmd == -1 )
    return true;

  ch = d->original ? d->original : d->character;
  pclines = umax(ch->pcdata->pagerlen, 5) - 1;

  switch(LOWER(d->pager.pagecmd))
    {
    default:
      lines = 0;
      break;

    case 'b':
      lines = -1-(pclines*2);
      break;

    case 'r':
      lines = -1-pclines;
      break;

    case 'q':
      d->pager.pagetop = 0;
      d->pager.pagepoint = NULL;
      flush_buffer(d, true);
      DISPOSE(d->pager.pagebuf);
      d->pager.pagesize = MAX_STRING_LENGTH;
      return true;
    }

  while ( lines < 0 && d->pager.pagepoint >= d->pager.pagebuf )
    if ( *(--d->pager.pagepoint) == '\n' )
      ++lines;

  if ( *d->pager.pagepoint == '\n' && *(++d->pager.pagepoint) == '\r' )
    ++d->pager.pagepoint;

  if ( d->pager.pagepoint < d->pager.pagebuf )
    d->pager.pagepoint = d->pager.pagebuf;

  for ( lines = 0, last = d->pager.pagepoint; lines < pclines; ++last )
    {
      if ( !*last )
	break;
      else if ( *last == '\n' )
	++lines;
    }

  if ( *last == '\r' )
    ++last;

  if ( last != d->pager.pagepoint )
    {
      if ( !write_to_descriptor(d->descriptor, d->pager.pagepoint,
                                (last-d->pager.pagepoint)) )
        return false;

      d->pager.pagepoint = last;
    }

  while ( isspace(*last) )
    ++last;

  if ( !*last )
    {
      d->pager.pagetop = 0;
      d->pager.pagepoint = NULL;
      flush_buffer(d, true);
      DISPOSE(d->pager.pagebuf);
      d->pager.pagesize = MAX_STRING_LENGTH;
      return true;
    }

  d->pager.pagecmd = -1;

  if ( IS_SET( ch->act, PLR_ANSI ) )
    if ( write_to_descriptor(d->descriptor, "\033[1;36m", 7) == false )
      return false;

  if ( (ret=write_to_descriptor(d->descriptor,
                                "(C)ontinue, (R)efresh, (B)ack, (Q)uit: [C] ", 0)) == false )
    return false;

  if ( IS_SET( ch->act, PLR_ANSI ) )
    {
      char buf[32];

      if ( d->pager.pagecolor == 7 )
        strcpy( buf, "\033[m" );
      else
        sprintf(buf, "\033[0;%d;%s%dm", (d->pager.pagecolor & 8) == 8,
                (d->pager.pagecolor > 15 ? "5;" : ""), (d->pager.pagecolor & 7)+30);

      ret = write_to_descriptor( d->descriptor, buf, 0 );
    }

  return ret;
}
