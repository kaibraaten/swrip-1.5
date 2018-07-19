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
#define _DEFAULT_SOURCE
#define _BSD_SOURCE
#endif

#include <cstring>
#include <cctype>
#include <ctime>
#include <cstdarg>
#include "mud.hpp"
#include "character.hpp"
#include "editor.hpp"
#include "help.hpp"
#include "ban.hpp"
#include "pcdata.hpp"

/*
 * Socket and TCP/IP stuff.
 */
#include <arpa/telnet.h>

static const char go_ahead_str[] = { (const char)IAC, (const char)GA, '\0' };

#define MAX_NEST        100

bool bootup = false;

/*
 * Global variables.
 */
Descriptor    *FirstDescriptor = NULL; /* First descriptor */
Descriptor    *LastDescriptor = NULL;  /* Last descriptor              */
Descriptor    *d_next = NULL;          /* Next descriptor in loop      */
int            num_descriptors = 0;
bool           mud_down = false;       /* Shutdown                     */
bool           wizlock = false;     /* Game is wizlocked            */
time_t         boot_time = 0;
HourMinSec   set_boot_time_struct;
HourMinSec  *set_boot_time = NULL;
struct tm     *new_boot_time = NULL;
struct tm      new_boot_struct;
char           str_boot_time[MAX_INPUT_LENGTH];
char           lastplayercmd[MAX_INPUT_LENGTH*2];
time_t         current_time = 0;       /* Time of this pulse           */
socket_t       control = 0;            /* Controlling descriptor       */
socket_t       newdesc = 0;            /* New descriptor               */
fd_set         in_set;             /* Set of desc's for reading    */
fd_set         out_set;            /* Set of desc's for writing    */
fd_set         exc_set;            /* Set of desc's with errors    */
int            maxdesc = 0;

/*
 * Other local functions (OS-independent).
 */
static bool FlushBuffer( Descriptor *d, bool fPrompt );
static void ReadFromBuffer( Descriptor *d );
static void StopIdling( Character *ch );
static void DisplayPrompt( Descriptor *d );
static int MakeColorSequence( const char *col, char *buf, Descriptor *d );
static void SetPagerInput( Descriptor *d, char *argument );
static bool PagerOutput( Descriptor *d );
static void GameLoop( void );
static void NewDescriptor( socket_t new_desc );
static bool ReadFromDescriptor( Descriptor *d );
static void ExecuteOnExit( void );
static void CaughtAlarm( int dummy );
static bool CheckBadSocket( socket_t desc );
static void AcceptNewSocket( socket_t ctrl );
static char *ActString(const char *format, Character *to, Character *ch,
                       const void *arg1, const void *arg2);
static char *DefaultPrompt( const Character *ch );
static int GetColorIndex(char clr);

static void ExecuteOnExit( void )
{
  /*FreeMemory( SysData.mccp_buf );*/

#ifdef SWRIP_USE_DLSYM
#ifdef _WIN32
  FreeLibrary(SysData.DlHandle);
#else
  dlclose( SysData.DlHandle );
#endif
#endif

  OsCleanup();
}

int main( int argc, char **argv )
{
  struct timeval now_time;
  bool fCopyOver = false;
#ifdef SWRIP_USE_IMC
  socket_t imcsocket = INVALID_SOCKET;
#endif

  memset( &SysData, 0, sizeof( SysData ) );
  /*
   * Memory debugging if needed.
   */
#if defined(MALLOC_DEBUG)
  malloc_debug( 2 );
#endif

  SysData.NoNameResolving  = true;
  SysData.NewPlayersMustWaitForAuth = true;

  OsSetup();
  /*AllocateMemory( SysData.mccp_buf, unsigned char, COMPRESS_BUF_SIZE );*/

  atexit( ExecuteOnExit );
#ifdef SWRIP_USE_DLSYM
#ifdef _WIN32
  SysData.DlHandle = LoadLibraryA("swr.exe");

  if( !SysData.DlHandle )
    {
      fprintf( stdout, "Failed opening dl handle to self: %s\n", GetLastError() );
      exit( 1 );
    }
#else
  SysData.DlHandle = dlopen( NULL, RTLD_LAZY );

  if( !SysData.DlHandle )
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

  boot_time = time(0);
  strcpy( str_boot_time, ctime( &current_time ) );

  /*
   * Init boot time.
   */
  set_boot_time = &set_boot_time_struct;
  set_boot_time->Manual = 0;

  new_boot_time = UpdateTime(localtime(&current_time));

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
  new_boot_time = UpdateTime(new_boot_time);
  new_boot_struct = *new_boot_time;
  new_boot_time = &new_boot_struct;

  /* Set reboot time string for do_time */
  GenerateRebootString();

  /*
   * Get the port number.
   */
  SysData.Port = 4000;

  if ( argc > 1 )
    {
      if ( !IsNumber( argv[1] ) )
        {
          fprintf( stderr, "Usage: %s [port #]\n", argv[0] );
          exit( 1 );
        }
      else if ( ( SysData.Port = atoi( argv[1] ) ) <= 1024 )
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
  LogPrintf(log_buf);
#ifdef SWRIP_USE_IMC
  LogPrintf( "Starting IMC2" );
  ImcStartup( false, imcsocket, fCopyOver );
#endif
  LogPrintf("Booting Database");
  BootDatabase(fCopyOver);
  LogPrintf("Initializing socket");

  if( !fCopyOver )
    {
      control  = InitializeSocket( SysData.Port   );
    }

  sprintf( log_buf, "SWRiP 1.5 ready on port %d.", SysData.Port );
  LogPrintf( log_buf );
  bootup = false;
  GameLoop();
  closesocket( control );
#ifdef SWRIP_USE_IMC
  ImcShutdown( false );
#endif
  /*
   * That's all, folks.
   */
  LogPrintf( "Normal termination of game." );
  exit( 0 );
  return 0;
}

socket_t InitializeSocket( short port )
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
static void CaughtAlarm( int dummy )
{
  char buf[MAX_STRING_LENGTH];
  Bug( "ALARM CLOCK!" );
  strcpy( buf, "Alas, the hideous mandalorian entity known only as 'Lag' rises once more!\r\n" );
  EchoToAll( AT_IMMORT, buf, ECHOTAR_ALL );

  if ( newdesc )
    {
      FD_CLR( newdesc, &in_set );
      FD_CLR( newdesc, &out_set );
      LogPrintf( "clearing newdesc" );
    }

  GameLoop();
  closesocket( control );

  LogPrintf( "Normal termination of game." );
  exit( 0 );
}

static bool CheckBadSocket( socket_t desc )
{
  if ( FD_ISSET( desc, &exc_set ) )
    {
      FD_CLR( desc, &in_set );
      FD_CLR( desc, &out_set );
      LogPrintf( "Bad FD caught and disposed." );
      return true;
    }

  return false;
}

static void AcceptNewSocket( socket_t ctrl )
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

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      maxdesc = umax( maxdesc, d->Socket );
      FD_SET( d->Socket, &in_set  );
      FD_SET( d->Socket, &out_set );
      FD_SET( d->Socket, &exc_set );

      if ( d == LastDescriptor )
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
      perror( "AcceptNewSocket: select: poll" );
      exit( 1 );
    }

  if ( FD_ISSET( ctrl, &exc_set ) )
    {
      Bug( "Exception raise on controlling descriptor %d", ctrl );
      FD_CLR( ctrl, &in_set );
      FD_CLR( ctrl, &out_set );
    }
  else if ( FD_ISSET( ctrl, &in_set ) )
    {
      newdesc = ctrl;
      NewDescriptor( newdesc );
    }
}

static void GameLoop( void )
{
  struct timeval last_time;
  char cmdline[MAX_INPUT_LENGTH];
  Descriptor *d = NULL;

#ifndef AMIGA
  signal( SIGPIPE, SIG_IGN );
  signal( SIGALRM, CaughtAlarm );
#endif

  gettimeofday( &last_time, NULL );
  current_time = (time_t) last_time.tv_sec;

  /* Main loop */
  while ( !mud_down )
    {
      AcceptNewSocket( control  );

      /*
       * Kick out descriptors with raised exceptions
       * or have been idle, then check for input.
       */
      for ( d = FirstDescriptor; d; d = d_next )
        {
          if ( d == d->Next )
            {
              Bug( "descriptor_loop: loop found & fixed" );
              d->Next = NULL;
            }
          d_next = d->Next;

          d->Idle++;    /* make it so a descriptor can idle out */
          if ( FD_ISSET( d->Socket, &exc_set ) )
            {
              FD_CLR( d->Socket, &in_set  );
              FD_CLR( d->Socket, &out_set );
              if ( d->Character
                   && ( d->ConnectionState == CON_PLAYING
                        ||   d->ConnectionState == CON_EDITING ) )
                SaveCharacter( d->Character );
              d->OutTop = 0;
              CloseDescriptor( d, true );
              continue;
            }
          else
            if (( d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : false) &&
                ( d->Idle > 7200 ) && !IsBitSet(d->Character->Flags, PLR_AFK))                /* 30 minutes  */
              {
                if( (d->Character && d->Character->InRoom) ? d->Character->TopLevel <= LEVEL_IMMORTAL : false)
                  {
                    WriteToDescriptor( d->Socket,
                                         "Idle 30 Minutes. Activating AFK Flag\r\n", 0 );
                    SetBit(d->Character->Flags, PLR_AFK);
                    Act(AT_GREY,"$n is now afk due to idle time.", d->Character, NULL, NULL, TO_ROOM);
                    continue;
                  }
              }
            else
              if (( d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : true) &&
                  ( (!d->Character && d->Idle > 360)              /* 2 mins */
                    ||   ( d->ConnectionState != CON_PLAYING && d->Idle > 1200) /* 5 mins */
                    ||     d->Idle > 28800 ))                             /* 2 hrs  */
                {
                  if( d->Character ? d->Character->TopLevel <= LEVEL_IMMORTAL : true)
                    {
                      WriteToDescriptor( d->Socket,
                                           "Idle timeout... disconnecting.\r\n", 0 );
                      d->OutTop = 0;
                      CloseDescriptor( d, true );
                      continue;
                    }
                }
              else
                {
                  d->fCommand   = false;

                  if ( FD_ISSET( d->Socket, &in_set ) )
                    {
                      d->Idle = 0;

                      if ( d->Character )
                        d->Character->IdleTimer = 0;
                      if ( !ReadFromDescriptor( d ) )
                        {
                          FD_CLR( d->Socket, &out_set );
                          if ( d->Character
                               && ( d->ConnectionState == CON_PLAYING
                                    ||   d->ConnectionState == CON_EDITING ) )
                            SaveCharacter( d->Character );
                          d->OutTop     = 0;
                          CloseDescriptor( d, false );
                          continue;
                        }
                    }

                  if ( d->Character && d->Character->Wait > 0 )
                    {
                      --d->Character->Wait;
                      continue;
                    }

                  ReadFromBuffer( d );

                  if ( !IsNullOrEmpty( d->InComm ) )
                    {
                      d->fCommand       = true;
                      StopIdling( d->Character );

                      strcpy( cmdline, d->InComm );
                      d->InComm[0] = '\0';

                      if ( d->Character )
                        SetCurrentGlobalCharacter( d->Character );

                      if ( d->Pager.PagePoint )
                        SetPagerInput(d, cmdline);
                      else
                        switch( d->ConnectionState )
                          {
                          default:
                            Nanny( d, cmdline );
                            break;

                          case CON_PLAYING:
                            d->Character->CmdRecurse = 0;
                            Interpret( d->Character, cmdline );
                            break;

                          case CON_EDITING:
                            EditBuffer( d->Character, cmdline );
                            break;
                          }
                    }
                }
          if ( d == LastDescriptor )
            break;
        }

      /*
       * Autonomous game motion.
       */
      UpdateHandler();

#ifdef SWRIP_USE_IMC
      ImcLoop();
#endif

      /*
       * Output.
       */
      for ( d = FirstDescriptor; d; d = d_next )
        {
          d_next = d->Next;

          if ( ( d->fCommand || d->OutTop > 0 )
               &&   FD_ISSET(d->Socket, &out_set) )
            {
              if ( d->Pager.PagePoint )
                {
                  if ( !PagerOutput(d) )
                    {
                      if ( d->Character
                           && ( d->ConnectionState == CON_PLAYING
                                ||   d->ConnectionState == CON_EDITING ) )
                        SaveCharacter( d->Character );
                      d->OutTop = 0;
                      CloseDescriptor(d, false);
                    }
                }
              else if ( !FlushBuffer( d, true ) )
                {
                  if ( d->Character
                       && ( d->ConnectionState == CON_PLAYING
                            ||   d->ConnectionState == CON_EDITING ) )
                    SaveCharacter( d->Character );
                  d->OutTop     = 0;
                  CloseDescriptor( d, false );
                }
            }
          if ( d == LastDescriptor )
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
}

void InitializeDescriptor(Descriptor *dnew, socket_t desc)
{
  dnew->Socket    = desc;
  dnew->ConnectionState     = CON_GET_NAME;
  dnew->OutSize       = 2000;
  dnew->PreviousColor     = 0x07;

  AllocateMemory( dnew->OutBuffer, char, dnew->OutSize );
}

static void NewDescriptor( socket_t new_desc )
{
  char buf[MAX_STRING_LENGTH] = { '\0' };
  Descriptor *dnew = nullptr;
  struct hostent  *from = nullptr;
  struct sockaddr_in sock;
  socket_t desc = 0;
  socklen_t size = 0;

  SetAlarm( 20 );
  size = sizeof(sock);

  if ( CheckBadSocket( new_desc ) )
    {
      SetAlarm( 0 );
      return;
    }

  SetAlarm( 20 );

  if ( ( desc = accept( new_desc, (struct sockaddr *) &sock, &size) ) == INVALID_SOCKET )
    {
      perror( "New_descriptor: accept");
      SetAlarm( 0 );
      return;
    }

  if ( CheckBadSocket( new_desc ) )
    {
      SetAlarm( 0 );
      return;
    }
#if !defined(FNDELAY)
#define FNDELAY O_NDELAY
#endif

  SetAlarm( 20 );

  if(SetNonBlockingSocket(desc) == SOCKET_ERROR)
    {
      perror( "New_descriptor: fcntl: FNDELAY" );
      SetAlarm( 0 );
      return;
    }

  if ( CheckBadSocket( new_desc ) )
    {
      return;
    }

  AllocateMemory( dnew, Descriptor, 1 );
  InitializeDescriptor(dnew, desc);
  dnew->Remote.Port = ntohs( sock.sin_port );

#if defined(AMIGA) || defined(__MORPHOS__)
  strcpy( buf, Inet_NtoA( *( ( unsigned long * ) &sock.sin_addr ) ) );
#else
  strcpy( buf, inet_ntoa( sock.sin_addr ) );
#endif
  sprintf( log_buf, "Sock.sinaddr:  %s, port %hd.",
           buf, dnew->Remote.Port );
  LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );

  dnew->Remote.HostIP = CopyString( buf );

  if ( !SysData.NoNameResolving )
    {
      from = gethostbyaddr( (char *) &sock.sin_addr,
			    sizeof(sock.sin_addr), AF_INET );
    }
  else
    {
      from = NULL;
    }

  dnew->Remote.Hostname = CopyString( (char *)( from ? from->h_name : buf) );

  auto pban = BanRepos->Find([dnew](const auto &b)
                             {
                               return (StringPrefix(b->Site, dnew->Remote.Hostname) == 0
                                       || StringSuffix(b->Site , dnew->Remote.Hostname) == 0)
                               &&  b->Level >= LEVEL_IMPLEMENTOR;
                             });

  if(pban != nullptr)
    {
      WriteToDescriptor( desc, "Your site has been banned from this Mud.\r\n", 0 );
      FreeDescriptor( dnew );
      SetAlarm( 0 );
      return;
    }
  
  /*
   * Init descriptor data.
   */

  if ( !LastDescriptor && FirstDescriptor )
    {
      Descriptor *d;

      Bug( "New_descriptor: last_desc is NULL, but first_desc is not! ...fixing" );

      for ( d = FirstDescriptor; d; d = d->Next )
        if ( !d->Next )
          LastDescriptor = d;
    }

  LINK( dnew, FirstDescriptor, LastDescriptor, Next, Previous );

  /*
   * Send the greeting.
   */
  {
    if ( HelpGreeting[0] == '.' )
      WriteToBuffer( dnew, HelpGreeting+1, 0 );
    else
      WriteToBuffer( dnew, HelpGreeting  , 0 );
  }

  if ( ++num_descriptors > SysData.MaxPlayersThisBoot )
    {
      SysData.MaxPlayersThisBoot = num_descriptors;
    }

  if ( SysData.MaxPlayersThisBoot > SysData.MaxPlayersEver )
    {
      if ( SysData.TimeOfMaxPlayersEver )
        FreeMemory(SysData.TimeOfMaxPlayersEver);
      sprintf(buf, "%24.24s", ctime(&current_time));
      SysData.TimeOfMaxPlayersEver = CopyString(buf);
      SysData.MaxPlayersEver = SysData.MaxPlayersThisBoot;
      sprintf( log_buf, "Broke all-time maximum player record: %d", SysData.MaxPlayersEver );
      LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
      ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );
      SaveSystemData( SysData );
    }
  SetAlarm(0);
  return;
}

void FreeDescriptor( Descriptor *d )
{
  closesocket( d->Socket );
  FreeMemory( d->Remote.Hostname );
  FreeMemory( d->OutBuffer );

  if ( d->Pager.PageBuffer )
    FreeMemory( d->Pager.PageBuffer );

  FreeMemory( d );
  --num_descriptors;
}

void CloseDescriptor( Descriptor *dclose, bool force )
{
  Character *ch;
  Descriptor *d;
  bool DoNotUnlink = false;

  /* flush outbuf */
  if ( !force && dclose->OutTop > 0 )
    FlushBuffer( dclose, false );

  /* say bye to whoever's snooping this descriptor */
  if ( dclose->SnoopBy )
    WriteToBuffer( dclose->SnoopBy,
                     "Your victim has left the game.\r\n", 0 );

  /* stop snooping everyone else */
  for ( d = FirstDescriptor; d; d = d->Next )
    if ( d->SnoopBy == dclose )
      d->SnoopBy = NULL;

  /* Check for switched people who go link-dead. -- Altrag */
  if ( dclose->Original )
    {
      if ( ( ch = dclose->Character ) != NULL )
        do_return(ch, "");
      else
        {
          Bug( "Close_socket: dclose->Original without character %s",
               (dclose->Original->Name ? dclose->Original->Name : "unknown") );
          dclose->Character = dclose->Original;
          dclose->Original = NULL;
        }
    }

  ch = dclose->Character;

  /* sanity check :( */
  if ( !dclose->Previous && dclose != FirstDescriptor )
    {
      Descriptor *dp, *dn;
      Bug( "Close_socket: %s desc:%p != first_desc:%p and desc->prev = NULL!",
           ch ? ch->Name : d->Remote.Hostname, dclose, FirstDescriptor );
      dp = NULL;
      for ( d = FirstDescriptor; d; d = dn )
        {
          dn = d->Next;
          if ( d == dclose )
            {
              Bug( "Close_socket: %s desc:%p found, prev should be:%p, fixing.",
                   ch ? ch->Name : d->Remote.Hostname, dclose, dp );
              dclose->Previous = dp;
              break;
            }
          dp = d;
        }
      if ( !dclose->Previous )
        {
          Bug( "Close_socket: %s desc:%p could not be found!.",
               ch ? ch->Name : dclose->Remote.Hostname, dclose );
          DoNotUnlink = true;
        }
    }
  if ( !dclose->Next && dclose != LastDescriptor )
    {
      Descriptor *dp, *dn;
      Bug( "Close_socket: %s desc:%p != last_desc:%p and desc->Next = NULL!",
           ch ? ch->Name : d->Remote.Hostname, dclose, LastDescriptor );
      dn = NULL;
      for ( d = LastDescriptor; d; d = dp )
        {
          dp = d->Previous;
          if ( d == dclose )
            {
              Bug( "Close_socket: %s desc:%p found, next should be:%p, fixing.",
                   ch ? ch->Name : d->Remote.Hostname, dclose, dn );
              dclose->Next = dn;
              break;
            }
          dn = d;
        }
      if ( !dclose->Next )
        {
          Bug( "Close_socket: %s desc:%p could not be found!.",
               ch ? ch->Name : dclose->Remote.Hostname, dclose );
          DoNotUnlink = true;
        }
    }

  if ( dclose->Character )
    {
      sprintf( log_buf, "Closing link to %s.", ch->Name );
      LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );

      if ( dclose->ConnectionState == CON_PLAYING
           ||   dclose->ConnectionState == CON_EDITING )
        {
          Act( AT_ACTION, "$n has lost $s link.", ch, NULL, NULL, TO_ROOM );
          ch->Desc = NULL;
        }
      else
        {
          /* clear descriptor pointer to get rid of bug message in log */
          dclose->Character->Desc = NULL;
          FreeCharacter( dclose->Character );
        }
    }


  if ( !DoNotUnlink )
    {
      /* make sure loop doesn't get messed up */
      if ( d_next == dclose )
        d_next = d_next->Next;
      UNLINK( dclose, FirstDescriptor, LastDescriptor, Next, Previous );
    }

  if ( dclose->Socket == maxdesc )
    --maxdesc;

  FreeDescriptor( dclose );
  return;
}

static bool ReadFromDescriptor( Descriptor *d )
{
  size_t iStart;

  if ( !IsNullOrEmpty( d->InComm ) )
    return true;

  iStart = strlen(d->InBuffer);

  if ( iStart >= sizeof(d->InBuffer) - 10 )
    {
      sprintf( log_buf, "%s input overflow!", d->Remote.Hostname );
      LogPrintf( log_buf );
      WriteToDescriptor( d->Socket,
                           "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
      return false;
    }

  for ( ; ; )
    {
#if defined(AMIGA) || defined(__MORPHOS__)
      ssize_t nRead = recv( d->Socket, ( UBYTE * ) d->InBuffer + iStart,
                            sizeof( d->InBuffer ) - 10 - iStart, 0 );
#else
      ssize_t nRead = recv( d->Socket, d->InBuffer + iStart,
                            sizeof( d->InBuffer ) - 10 - iStart, 0 );
#endif

      if ( nRead == 0 )
        {
          LogStringPlus( "EOF encountered on read.", LOG_COMM, SysData.LevelOfLogChannel );
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
              LogStringPlus( strerror( GETERROR ), LOG_COMM, SysData.LevelOfLogChannel );
              return false;
            }
        }

      iStart += nRead;

      if ( d->InBuffer[iStart-1] == '\n' || d->InBuffer[iStart-1] == '\r' )
	{
	  break;
	}
    }

  d->InBuffer[iStart] = '\0';
  return true;
}

/*
 * Transfer one line from input buffer to input line.
 */
static void ReadFromBuffer( Descriptor *d )
{
  int i, j, k;

  /*
   * Hold horses if pending command already.
   */
  if ( !IsNullOrEmpty( d->InComm ) )
    return;

  /*
   * Look for at least one new line.
   */
  for ( i = 0; d->InBuffer[i] != '\n' && d->InBuffer[i] != '\r' && i<MAX_INBUF_SIZE;
        i++ )
    {
      if ( d->InBuffer[i] == '\0' )
        return;
    }

  /*
   * Canonical input processing.
   */
  for ( i = 0, k = 0; d->InBuffer[i] != '\n' && d->InBuffer[i] != '\r'; i++ )
    {
      if ( k >= 254 )
        {
          WriteToDescriptor( d->Socket, "Line too long.\r\n", 0 );

          d->InBuffer[i]   = '\n';
          d->InBuffer[i+1] = '\0';
          break;
        }

      if ( d->InBuffer[i] == '\b' && k > 0 )
        --k;
      else if ( isascii(d->InBuffer[i]) && isprint(d->InBuffer[i]) )
        d->InComm[k++] = d->InBuffer[i];
    }

  /*
   * Finish off the line.
   */
  if ( k == 0 )
    d->InComm[k++] = ' ';

  d->InComm[k] = '\0';

  /*
   * Deal with bozos with #repeat 1000 ...
   */
  if ( k > 1 || d->InComm[0] == '!' )
    {
      if ( d->InComm[0] != '!' && StrCmp( d->InComm, d->InLast ) )
        {
          d->Repeat = 0;
        }
      else
        {
          if ( ++d->Repeat >= 100 )
            {
              WriteToDescriptor( d->Socket,
                                   "\r\n*** PUT A LID ON IT!!! ***\r\n", 0 );
            }
        }
    }

  /*
   * Do '!' substitution.
   */
  if ( d->InComm[0] == '!' )
    strcpy( d->InComm, d->InLast );
  else
    strcpy( d->InLast, d->InComm );

  /*
   * Shift the input buffer.
   */
  while ( d->InBuffer[i] == '\n' || d->InBuffer[i] == '\r' )
    i++;

  for ( j = 0; ( d->InBuffer[j] = d->InBuffer[i+j] ) != '\0'; j++ )
    ;
}

/*
 * Low level output function.
 */
static bool FlushBuffer( Descriptor *d, bool fPrompt )
{
  char buf[MAX_INPUT_LENGTH];
  Character *ch;

  ch = d->Original ? d->Original : d->Character;

  if( ch && ch->Fighting && ch->Fighting->Who )
    ShowCharacterCondition( ch, ch->Fighting->Who );

  /*
   * If buffer has more than 4K inside, spit out .5K at a time   -Thoric
   */
  if ( !mud_down && d->OutTop > 4096 )
    {
      memcpy( buf, d->OutBuffer, 512 );
      memmove( d->OutBuffer, d->OutBuffer + 512, d->OutTop - 512 );
      d->OutTop -= 512;
      if ( d->SnoopBy )
        {
          char snoopbuf[MAX_INPUT_LENGTH];

          buf[512] = '\0';
          if ( d->Character && d->Character->Name )
            {
              if (d->Original && d->Original->Name)
                sprintf( snoopbuf, "%s (%s)", d->Character->Name, d->Original->Name );
              else
                sprintf( snoopbuf, "%s", d->Character->Name);
              WriteToBuffer( d->SnoopBy, snoopbuf, 0);
            }
          WriteToBuffer( d->SnoopBy, "% ", 2 );
          WriteToBuffer( d->SnoopBy, buf, 0 );
        }
      if ( !WriteToDescriptor( d->Socket, buf, 512 ) )
        {
          d->OutTop = 0;
          return false;
        }
      return true;
    }


  /*
   * Bust a prompt.
   */
  if ( fPrompt && !mud_down && d->ConnectionState == CON_PLAYING )
    {
      ch = d->Original ? d->Original : d->Character;
      if ( IsBitSet(ch->Flags, PLR_BLANK) )
        WriteToBuffer( d, "\r\n", 2 );

      if ( IsBitSet(ch->Flags, PLR_PROMPT) )
        DisplayPrompt(d);

      if ( IsBitSet(ch->Flags, PLR_TELNET_GA) )
        WriteToBuffer( d, go_ahead_str, 0 );
    }

  /*
   * Short-circuit if nothing to write.
   */
  if ( d->OutTop == 0 )
    return true;

  /*
   * Snoop-o-rama.
   */
  if ( d->SnoopBy )
    {
      /* without check, 'force mortal quit' while snooped caused crash, -h */
      if ( d->Character && d->Character->Name )
        {
          /* Show original snooped names. -- Altrag */
          if ( d->Original && d->Original->Name )
            sprintf( buf, "%s (%s)", d->Character->Name, d->Original->Name );
          else
            sprintf( buf, "%s", d->Character->Name);
          WriteToBuffer( d->SnoopBy, buf, 0);
        }
      WriteToBuffer( d->SnoopBy, "% ", 2 );
      WriteToBuffer( d->SnoopBy, d->OutBuffer, d->OutTop );
    }

  /*
   * OS-dependent output.
   */
  if ( !WriteToDescriptor( d->Socket, d->OutBuffer, d->OutTop ) )
    {
      d->OutTop = 0;
      return false;
    }
  else
    {
      d->OutTop = 0;
      return true;
    }
}



/*
 * Append onto an output buffer.
 */
void WriteToBuffer( Descriptor *d, const char *txt, size_t length )
{
  if ( !d )
    {
      Bug( "Write_to_buffer: NULL descriptor" );
      return;
    }

  /*
   * Normally a bug... but can happen if loadup is used.
   */
  if ( !d->OutBuffer )
    return;

  /*
   * Find length in case caller didn't.
   */
  if ( length <= 0 )
    length = strlen(txt);

  /*
   * Initial \r\n if needed.
   */
  if ( d->OutTop == 0 && !d->fCommand )
    {
      d->OutBuffer[0]      = '\n';
      d->OutBuffer[1]      = '\r';
      d->OutTop = 2;
    }

  /*
   * Expand the buffer as needed.
   */
  while ( d->OutTop + length >= d->OutSize )
    {
      if (d->OutSize > SHRT_MAX)
        {
          /* empty buffer */
          d->OutTop = 0;
          CloseDescriptor(d, true);
          Bug("Buffer overflow. Closing (%s).", d->Character ? d->Character->Name : "???" );
          return;
        }
      d->OutSize *= 2;
      ReAllocateMemory( d->OutBuffer, char, d->OutSize );
    }

  /*
   * Copy.
   */
  strncpy( d->OutBuffer + d->OutTop, txt, length );
  d->OutTop += length;
  d->OutBuffer[d->OutTop] = '\0';
}


/*
 * Lowest level output function.
 * Write a block of text to the file descriptor.
 * If this gives errors on very long blocks (like 'ofind all'),
 *   try lowering the max block size.
 */
bool WriteToDescriptor( socket_t desc, char *txt, int length )
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
      if( ( nWrite = send( desc, (char*) txt + iStart, nBlock, 0 ) ) == SOCKET_ERROR )
#else
	if( ( nWrite = send( desc, txt + iStart, nBlock, 0 ) ) == SOCKET_ERROR)
#endif
        {
          char logbuf[MAX_STRING_LENGTH];
          sprintf(logbuf, "Write_to_descriptor: error on socket %d: %s",
		  desc, strerror( GETERROR ) );
          LogPrintf(logbuf);
          perror( "Write_to_descriptor" );
          return false;
        }
    }

  return true;
}

/*
 * Look for link-dead player to reconnect.
 */
bool CheckReconnect( Descriptor *d, const char *name, bool fConn )
{
  Character *ch;

  for ( ch = FirstCharacter; ch; ch = ch->Next )
    {
      if ( !IsNpc(ch)
           && ( !fConn || !ch->Desc )
           &&    ch->Name
           &&   !StrCmp( name, ch->Name ) )
        {
          if ( fConn && ch->Switched )
            {
              WriteToBuffer( d, "Already playing.\r\nName: ", 0 );
              d->ConnectionState = CON_GET_NAME;
              if ( d->Character )
                {
                  /* clear descriptor pointer to get rid of bug message in log */
                  d->Character->Desc = NULL;
                  FreeCharacter( d->Character );
                  d->Character = NULL;
                }
              return BERR;
            }
          if ( fConn == false )
            {
              FreeMemory( d->Character->PCData->Password );
              d->Character->PCData->Password = CopyString( ch->PCData->Password );
            }
          else
            {
              /* clear descriptor pointer to get rid of bug message in log */
              d->Character->Desc = NULL;
              FreeCharacter( d->Character );
              d->Character = ch;
              ch->Desc   = d;
              ch->IdleTimer  = 0;
              SendToCharacter( "Reconnecting.\r\n", ch );
              Act( AT_ACTION, "$n has reconnected.", ch, NULL, NULL, TO_ROOM );
              sprintf( log_buf, "%s@%s reconnected.", ch->Name, d->Remote.Hostname );
              LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );
              d->ConnectionState = CON_PLAYING;
            }
          return true;
        }
    }

  return false;
}

/*
 * Check if already playing.
 */

bool CheckMultiplaying( Descriptor *d, const char *name )
{
  Descriptor *dold;

  for ( dold = FirstDescriptor; dold; dold = dold->Next )
    {
      if ( dold != d
           && (  dold->Character || dold->Original )
           &&   StrCmp( name, dold->Original
                         ? dold->Original->Name : dold->Character->Name )
           && !StrCmp(dold->Remote.Hostname , d->Remote.Hostname ) )
        {
          if ( d->Character->TopLevel >= LEVEL_CREATOR
               || ( dold->Original ? dold->Original : dold->Character )->TopLevel >= LEVEL_CREATOR )
	    {
	      return false;
	    }

          WriteToBuffer( d, "Sorry multi-playing is not allowed ... have you other character quit first.\r\n", 0 );
          sprintf( log_buf, "%s attempting to multiplay with %s.", dold->Original ? dold->Original->Name : dold->Character->Name , d->Character->Name );
          LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
          d->Character = NULL;
          FreeCharacter( d->Character );
          return true;
        }
    }

  return false;

}

unsigned char CheckPlaying( Descriptor *d, const char *name, bool kick )
{
  Character *ch;
  Descriptor *dold;
  int   cstate;

  for ( dold = FirstDescriptor; dold; dold = dold->Next )
    {
      if ( dold != d
           && (  dold->Character || dold->Original )
           &&   !StrCmp( name, dold->Original
                          ? dold->Original->Name : dold->Character->Name ) )
        {
          cstate = dold->ConnectionState;
          ch = dold->Original ? dold->Original : dold->Character;
          if ( !ch->Name
               || ( cstate != CON_PLAYING && cstate != CON_EDITING ) )
            {
              WriteToBuffer( d, "Already connected - try again.\r\n", 0 );
              sprintf( log_buf, "%s already connected.", ch->Name );
              LogStringPlus( log_buf, LOG_COMM, SysData.LevelOfLogChannel );
              return BERR;
            }
          if ( !kick )
            return true;
          WriteToBuffer( d, "Already playing... Kicking off old connection.\r\n", 0 );
          WriteToBuffer( dold, "Kicking off old connection... bye!\r\n", 0 );
          CloseDescriptor( dold, false );
          /* clear descriptor pointer to get rid of bug message in log */
          d->Character->Desc = NULL;
          FreeCharacter( d->Character );
          d->Character = ch;
          ch->Desc       = d;
          ch->IdleTimer      = 0;
          if ( ch->Switched )
            do_return( ch->Switched, "" );
          ch->Switched = NULL;
          SendToCharacter( "Reconnecting.\r\n", ch );
          Act( AT_ACTION, "$n has reconnected, kicking off old link.",
               ch, NULL, NULL, TO_ROOM );
          sprintf( log_buf, "%s@%s reconnected, kicking off old link.",
                   ch->Name, d->Remote.Hostname );
          LogStringPlus( log_buf, LOG_COMM, umax( SysData.LevelOfLogChannel, ch->TopLevel ) );

          d->ConnectionState = cstate;
          return true;
        }
    }

  return false;
}

static void StopIdling( Character *ch )
{
  if ( !ch
       || !ch->Desc
       || ch->Desc->ConnectionState != CON_PLAYING
       || !ch->WasInRoom
       || ch->InRoom != GetRoom( ROOM_VNUM_LIMBO ) )
    return;

  ch->IdleTimer = 0;
  CharacterFromRoom( ch );
  CharacterToRoom( ch, ch->WasInRoom );
  ch->WasInRoom = NULL;
  Act( AT_ACTION, "$n has returned from the void.", ch, NULL, NULL, TO_ROOM );
}

void SendToCharacter( const char *txt, const Character *ch )
{
  Descriptor *d;
  const char *colstr;
  const char *prevstr = txt;
  char colbuf[20];
  int ln;

  if ( !ch )
    {
      Bug( "Send_to_char: NULL *ch" );
      return;
    }
  if ( !txt || !ch->Desc )
    return;
  d = ch->Desc;

  while ( d && ((colstr = strpbrk(prevstr, "&^")) != NULL ))
    {
      if (colstr > prevstr)
        WriteToBuffer(d, prevstr, (colstr-prevstr));
      ln = MakeColorSequence(colstr, colbuf, d);
      if ( ln < 0 )
        {
          prevstr = colstr+1;
          break;
        }
      else if ( ln > 0 )
        WriteToBuffer(d, colbuf, ln);
      prevstr = colstr+2;
    }
  if ( *prevstr )
    WriteToBuffer(d, prevstr, 0);
  return;
}

void WriteToPager( Descriptor *d, const char *txt, size_t length )
{
  if ( length <= 0 )
    length = strlen(txt);

  if ( length == 0 )
    return;

  if ( !d->Pager.PageBuffer )
    {
      d->Pager.PageSize = MAX_STRING_LENGTH;
      AllocateMemory( d->Pager.PageBuffer, char, d->Pager.PageSize );
    }

  if ( !d->Pager.PagePoint )
    {
      d->Pager.PagePoint = d->Pager.PageBuffer;
      d->Pager.PageTop = 0;
      d->Pager.PageCommand = '\0';
    }

  if ( d->Pager.PageTop == 0 && !d->fCommand )
    {
      d->Pager.PageBuffer[0] = '\n';
      d->Pager.PageBuffer[1] = '\r';
      d->Pager.PageTop = 2;
    }

  while ( d->Pager.PageTop + length >= d->Pager.PageSize )
    {
      if ( d->Pager.PageSize > SHRT_MAX )
        {
          Bug( "Pager overflow. Ignoring.\r\n" );
          d->Pager.PageTop = 0;
          d->Pager.PagePoint = NULL;
          FreeMemory(d->Pager.PageBuffer);
          d->Pager.PageSize = MAX_STRING_LENGTH;
          return;
        }

      d->Pager.PageSize *= 2;
      ReAllocateMemory(d->Pager.PageBuffer, char, d->Pager.PageSize);
    }

  strncpy(d->Pager.PageBuffer + d->Pager.PageTop, txt, length);
  d->Pager.PageTop += length;
  d->Pager.PageBuffer[d->Pager.PageTop] = '\0';
}

void SendToPager( const char *txt, const Character *ch )
{
  Descriptor *d;
  const char *colstr;
  const char *prevstr = txt;
  char colbuf[20];

  if ( !ch )
    {
      Bug( "Send_to_pager_color: NULL *ch" );
      return;
    }

  if ( !txt || !ch->Desc )
    return;

  d = ch->Desc;
  ch = d->Original ? d->Original : d->Character;

  if ( IsNpc(ch) || !IsBitSet(ch->PCData->Flags, PCFLAG_PAGERON) )
    {
      SendToCharacter(txt, d->Character);
      return;
    }

  while ( (colstr = strpbrk(prevstr, "&^")) != NULL )
    {
      int ln = 0;

      if ( colstr > prevstr )
        WriteToPager(d, prevstr, (colstr-prevstr));

      ln = MakeColorSequence(colstr, colbuf, d);

      if ( ln < 0 )
        {
          prevstr = colstr+1;
          break;
        }
      else if ( ln > 0 )
	{
	  WriteToPager(d, colbuf, ln);
	}

      prevstr = colstr+2;
    }

  if ( *prevstr )
    {
      WriteToPager(d, prevstr, 0);
    }
}


void SetCharacterColor( short AType, const Character *ch )
{
  char buf[16];
  const Character *och;

  if ( !ch || !ch->Desc )
    return;

  och = (ch->Desc->Original ? ch->Desc->Original : ch);

  if ( !IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI) )
    {
      if ( AType == 7 )
	{
	  strcpy( buf, "\033[m" );
	}
      else
	{
	  sprintf(buf, "\033[0;%d;%s%dm", (AType & 8) == 8,
		  (AType > 15 ? "5;" : ""), (AType & 7)+30);
	}

      WriteToBuffer( ch->Desc, buf, strlen(buf) );
    }
}

void SetPagerColor( short AType, const Character *ch )
{
  char buf[16];
  const Character *och;

  if ( !ch || !ch->Desc )
    return;

  och = (ch->Desc->Original ? ch->Desc->Original : ch);

  if ( !IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI) )
    {
      if ( AType == 7 )
        strcpy( buf, "\033[m" );
      else
        sprintf(buf, "\033[0;%d;%s%dm", (AType & 8) == 8,
                (AType > 15 ? "5;" : ""), (AType & 7)+30);
      SendToPager( buf, ch );
      ch->Desc->Pager.PageColor = AType;
    }
  return;
}


/* source: EOD, by John Booth <???> */
void Echo(const Character *ch, const char *fmt, ...)
{
  char buf[MAX_STRING_LENGTH*2];        /* better safe than sorry */
  va_list args;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);

  SendToCharacter(buf, ch);
}

void PagerPrintf(const Character *ch, const char *fmt, ...)
{
  char buf[MAX_STRING_LENGTH*2];
  va_list args;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  va_end(args);

  SendToPager(buf, ch);
}

/*
 * The primary output interface for formatted output.
 */
/* Major overhaul. -- Alty */
#define NAME(ch)        (IsNpc(ch) ? ch->ShortDescr : ch->Name)

static char *ActString(const char *format, Character *to, Character *ch,
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
  Object *obj1 = (Object  *) arg1;
  Object *obj2 = (Object  *) arg2;

  while ( !IsNullOrEmpty( str ) )
    {
      if ( *str != '$' )
        {
          *point++ = *str++;
          continue;
        }
      ++str;
      if ( !arg2 && *str >= 'A' && *str <= 'Z' )
        {
          Bug( "%s: missing arg2 for code %c:", __FUNCTION__, *str );
          Bug( format );
          i = " <@@@> ";
        }
      else
        {
          switch ( *str )
            {
            default:  Bug( "%s: bad code %c.", __FUNCTION__, *str );
              i = " <@@@> ";                                            break;
            case 't': i = (char *) arg1;                                        break;
            case 'T': i = (char *) arg2;                                        break;
            case 'n': i = (to ? PERS( ch, to) : NAME( ch));                     break;
            case 'N': i = (to ? PERS(vch, to) : NAME(vch));                     break;
            case 'e': if (ch->Sex > 2 || ch->Sex < 0)
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name,
                      ch->Sex);
                  i = "it";
                }
              else
                i = he_she [urange(SEX_NEUTRAL,  ch->Sex, SEX_FEMALE)];
              break;
            case 'E': if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL )
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name,
                      vch->Sex);
                  i = "it";
                }
              else
                i = he_she [urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
              break;
            case 'm': if (ch->Sex > SEX_FEMALE || ch->Sex < SEX_NEUTRAL)
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name,
                      ch->Sex);
                  i = "it";
                }
              else
                i = him_her[urange(SEX_NEUTRAL,  ch->Sex, SEX_FEMALE)];
              break;
            case 'M': if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL)
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name,
                      vch->Sex);
                  i = "it";
                }
              else
                i = him_her[urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
              break;
            case 's': if (ch->Sex > SEX_FEMALE || ch->Sex < SEX_NEUTRAL)
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, ch->Name,
                      ch->Sex);
                  i = "its";
                }
              else
                i = his_her[urange(SEX_NEUTRAL,  ch->Sex, SEX_FEMALE)];
              break;
            case 'S': if (vch->Sex > SEX_FEMALE || vch->Sex < SEX_NEUTRAL)
                {
                  Bug("%s: player %s has sex set at %d!", __FUNCTION__, vch->Name,
                      vch->Sex);
                  i = "its";
                }
              else
                i = his_her[urange(SEX_NEUTRAL, vch->Sex, SEX_FEMALE)];
              break;
            case 'q': i = (to == ch) ? "" : "s";                                break;
            case 'Q': i = (to == ch) ? "your" :
              his_her[urange(SEX_NEUTRAL,  ch->Sex, SEX_FEMALE)];                  break;
            case 'p': i = (!to || CanSeeObject(to, obj1)
                           ? GetObjectShortDescription(obj1) : "something");                    break;
            case 'P': i = (!to || CanSeeObject(to, obj2)
                           ? GetObjectShortDescription(obj2) : "something");                    break;
            case 'd':
              if ( IsNullOrEmpty( (const char*) arg2 ) )
		{
		  i = "door";
		}
              else
                {
                  OneArgument((char *) arg2, fname);
                  i = fname;
                }
              break;
            }
        }

      ++str;

      while ( (*point = *i) != '\0' )
	{
	  ++point, ++i;
	}
    }

  strcpy(point, "\r\n");
  buf[0] = CharToUppercase(buf[0]);
  return buf;
}
#undef NAME

void Act( short AType, const char *format, Character *ch, const void *arg1, const void *arg2, int type )
{
  char *txt;
  Character *to;
  Character *vch = (Character *)arg2;

  /*
   * Discard null and zero-length messages.
   */
  if ( IsNullOrEmpty( format ) )
    return;

  if ( !ch )
    {
      Bug( "Act: null ch. (%s)", format );
      return;
    }

  if ( !ch->InRoom )
    to = NULL;
  else if ( type == TO_CHAR )
    to = ch;
  else
    to = ch->InRoom->FirstPerson;

  /*
   * ACT_SECRETIVE handling
   */
  if ( IsNpc(ch) && IsBitSet(ch->Flags, ACT_SECRETIVE) && type != TO_CHAR )
    return;

  if ( type == TO_VICT )
    {
      if ( !vch )
        {
          Bug( "Act: null vch with TO_VICT." );
          Bug( "%s (%s)", ch->Name, format );
          return;
        }
      if ( !vch->InRoom )
        {
          Bug( "Act: vch in NULL room!" );
          Bug( "%s -> %s (%s)", ch->Name, vch->Name, format );
          return;
        }
      to = vch;
      /*        to = vch->InRoom->first_person;*/
    }

  if ( MOBtrigger && type != TO_CHAR && type != TO_VICT && to )
    {
      Object *to_obj;

      txt = ActString(format, NULL, ch, arg1, arg2);

      if ( IsBitSet(to->InRoom->mprog.progtypes, ACT_PROG) )
        RoomProgActTrigger(txt, to->InRoom, ch, (Object *)arg1, (void *)arg2);

      for ( to_obj = to->InRoom->FirstContent; to_obj;
            to_obj = to_obj->NextContent )
        if ( IsBitSet(to_obj->Prototype->mprog.progtypes, ACT_PROG) )
          ObjProgActTrigger(txt, to_obj, ch, (Object *)arg1, (void *)arg2);
    }

  /* Anyone feel like telling me the point of looping through the whole
     room when we're only sending to one char anyways..? -- Alty */
  for ( ; to; to = (type == TO_CHAR || type == TO_VICT)
          ? NULL : to->NextInRoom )
    {
      if (((!to || !to->Desc)
           && (  IsNpc(to) && !IsBitSet(to->Prototype->mprog.progtypes, ACT_PROG) ))
          ||   !IsAwake(to) )
        continue;


      if(!CanSeeCharacter(to, ch) && type != TO_VICT )
        continue;

      if ( type == TO_CHAR && to != ch )
        continue;
      if ( type == TO_VICT && ( to != vch || to == ch ) )
        continue;
      if ( type == TO_ROOM && to == ch )
        continue;
      if ( type == TO_NOTVICT && (to == ch || to == vch) )
        continue;

      if(!CanSeeCharacter(to, ch) && type != TO_VICT )
        continue;

      txt = ActString(format, to, ch, arg1, arg2);

      if (to && to->Desc)
        {
          SetCharacterColor(AType, to);
          SendToCharacter( txt, to );
        }
      if (MOBtrigger)
        {
          /* Note: use original string, not string with ANSI. -- Alty */
          MobProgActTrigger( txt, to, ch, (Object *)arg1, (void *)arg2 );
        }
    }
  MOBtrigger = true;
  return;
}

static char *DefaultPrompt( const Character *ch )
{
  static char buf[MAX_STRING_LENGTH];
  strcpy( buf,"" );

  if (IsJedi(ch) || IsImmortal( ch ) )
    strcat(buf, "&pForce:&P%m/&p%M  &pAlign:&P%a\r\n");

  strcat(buf, "&BHealth:&C%h&B/%H  &BMovement:&C%v&B/%V");
  strcat(buf, "&C >&w");
  return buf;
}

static int GetColorIndex(char clr)
{
  static const char colors[] = "xrgObpcwzRGYBPCW";
  int r;

  for ( r = 0; r < 16; r++ )
    if ( clr == colors[r] )
      return r;
  return -1;
}

static void DisplayPrompt( Descriptor *d )
{
  Character *ch = d->Character;
  Character *och = (d->Original ? d->Original : d->Character);
  bool ansi = (!IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI));
  const char *prompt;
  char buf[MAX_STRING_LENGTH];
  char *pbuf = buf;
  int the_stat;

  if ( !ch )
    {
      Bug( "%s: NULL ch", __FUNCTION__ );
      return;
    }

  if ( !IsNpc(ch) && ch->SubState != SUB_NONE && !IsNullOrEmpty( ch->PCData->SubPrompt ) )
    prompt = ch->PCData->SubPrompt;
  else if ( IsNpc(ch) || IsNullOrEmpty( ch->PCData->Prompt ) )
    prompt = DefaultPrompt(ch);
  else
    prompt = ch->PCData->Prompt;

  if ( ansi )
    {
      strcpy(pbuf, "\033[m");
      d->PreviousColor = 0x07;
      pbuf += 3;
    }

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
          Bug( "Display_prompt: bad command char '%c'.", *(prompt-1) );
          break;

        case '&':
        case '^':
          the_stat = MakeColorSequence(&prompt[-1], pbuf, d);
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
              if ( ch->TopLevel >= 10 )
                the_stat = ch->Alignment;
              else if ( IsGood(ch) )
                strcpy(pbuf, "good");
              else if ( IsEvil(ch) )
                strcpy(pbuf, "evil");
              else
                strcpy(pbuf, "neutral");
              break;

            case 'h':
              the_stat = ch->Hit;
              break;

            case 'H':
              the_stat = ch->MaxHit;
              break;

            case 'm':
              if ( IsImmortal(ch) || IsJedi( ch ) )
                the_stat = ch->Mana;
              else
                the_stat = 0;
              break;

            case 'M':
              if ( IsImmortal(ch) || IsJedi( ch ) )
                the_stat = ch->MaxMana;
              else
                the_stat = 0;
              break;

            case 'p':
              if ( ch->Position == POS_RESTING )
                strcpy(pbuf, "resting");
              else if ( ch->Position == POS_SLEEPING )
                strcpy(pbuf, "sleeping");
              else if ( ch->Position == POS_SITTING )
                strcpy(pbuf, "sitting");
              break;

            case 'u':
              the_stat = num_descriptors;
              break;

            case 'U':
              the_stat = SysData.MaxPlayersThisBoot;
              break;

            case 'v':
              the_stat = ch->Move;
              break;

            case 'V':
              the_stat = ch->MaxMove;
              break;

            case 'g':
              the_stat = ch->Gold;
              break;

            case 'r':
              if ( IsImmortal(och) )
                the_stat = ch->InRoom->Vnum;
              break;

            case 'R':
              if ( IsBitSet(och->Flags, PLR_ROOMVNUM) )
                sprintf(pbuf, "<#%ld> ", ch->InRoom->Vnum);
              break;

            case 'i':
              if ( (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_WIZINVIS)) ||
                   (IsNpc(ch) && IsBitSet(ch->Flags, ACT_MOBINVIS)) )
                sprintf(pbuf, "(Invis %d) ", (IsNpc(ch) ? ch->MobInvis : ch->PCData->WizInvis));
              else if ( IsAffectedBy(ch, AFF_INVISIBLE) )
		sprintf(pbuf, "(Invis) " );
              break;

            case 'I':
              the_stat = (IsNpc(ch) ? (IsBitSet(ch->Flags, ACT_MOBINVIS) ? ch->MobInvis : 0)
                      : (IsBitSet(ch->Flags, PLR_WIZINVIS) ? ch->PCData->WizInvis : 0));
              break;
            }

          if ( (unsigned int)the_stat != 0x80000000 )
            sprintf(pbuf, "%d", the_stat);

          pbuf += strlen(pbuf);
          break;
        }
    }
  *pbuf = '\0';
  WriteToBuffer(d, buf, (pbuf-buf));
  return;
}

static int MakeColorSequence(const char *col, char *buf, Descriptor *d)
{
  int ln = 0;
  const char *ctype = col;
  unsigned char cl = 0;
  Character *och = d->Original ? d->Original : d->Character;
  bool ansi = !IsNpc(och) && IsBitSet(och->Flags, PLR_ANSI);

  col++;

  if (IsNullOrEmpty(col))
    {
      ln = -1;
    }
  else if ( *ctype != '&' && *ctype != '^' )
    {
      Bug("%s: command '%c' not '&' or '^'.", __FUNCTION__, *ctype);
      ln = -1;
    }
  else if ( *col == *ctype )
    {
      buf[0] = *col;
      buf[1] = '\0';
      ln = 1;
    }
  else if ( !ansi )
    {
      ln = 0;
    }
  else
    {
      cl = d->PreviousColor;

      switch(*ctype)
        {
        default:
          Bug( "%s: bad command char '%c'.", __FUNCTION__, *ctype );
          ln = -1;
          break;

        case '&':
          if ( *col == '-' )
            {
              buf[0] = '~';
              buf[1] = '\0';
              ln = 1;
              /*break;*/
            }

          break;

        case '^':
          {
            int newcol = GetColorIndex(*col);

            if ( newcol < 0 )
              {
                ln = 0;
                break;
              }
            else if ( *ctype == '&' )
              {
                cl = (cl & 0xF0) | newcol;
              }
            else
              {
                cl = (cl & 0x0F) | (newcol << 4);
              }
          }

          if ( cl == d->PreviousColor )
            {
              ln = 0;
              break;
            }

          strcpy(buf, "\033[");

          if ( (cl & 0x88) != (d->PreviousColor & 0x88) )
            {
              strcat(buf, "m\033[");

              if ( (cl & 0x08) )
                {
                  strcat(buf, "1;");
                }

              if ( (cl & 0x80) )
                {
                  strcat(buf, "5;");
                }

              d->PreviousColor = 0x07 | (cl & 0x88);
              ln = strlen(buf);
            }
          else
            {
              ln = 2;
            }

          if ( (cl & 0x07) != (d->PreviousColor & 0x07) )
            {
              sprintf(buf+ln, "3%d;", cl & 0x07);
              ln += 3;
            }

          if ( (cl & 0x70) != (d->PreviousColor & 0x70) )
            {
              sprintf(buf+ln, "4%d;", (cl & 0x70) >> 4);
              ln += 3;
            }

          if ( buf[ln-1] == ';' )
            {
              buf[ln-1] = 'm';
            }
          else
            {
              buf[ln++] = 'm';
              buf[ln] = '\0';
            }

          d->PreviousColor = cl;
        }
    }

  if ( ln <= 0 )
    {
      *buf = '\0';
    }

  return ln;
}

static void SetPagerInput( Descriptor *d, char *argument )
{
  while ( isspace(*argument) )
    argument++;

  d->Pager.PageCommand = *argument;
}

static bool PagerOutput( Descriptor *d )
{
  register char *last;
  Character *ch;
  int pclines;
  register int lines;
  bool ret;

  if ( !d || !d->Pager.PagePoint || d->Pager.PageCommand == -1 )
    return true;

  ch = d->Original ? d->Original : d->Character;
  pclines = umax(ch->PCData->PagerLength, 5) - 1;

  switch(CharToLowercase(d->Pager.PageCommand))
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
      d->Pager.PageTop = 0;
      d->Pager.PagePoint = NULL;
      FlushBuffer(d, true);
      FreeMemory(d->Pager.PageBuffer);
      d->Pager.PageSize = MAX_STRING_LENGTH;
      return true;
    }

  while ( lines < 0 && d->Pager.PagePoint >= d->Pager.PageBuffer )
    if ( *(--d->Pager.PagePoint) == '\n' )
      ++lines;

  if ( *d->Pager.PagePoint == '\n' && *(++d->Pager.PagePoint) == '\r' )
    ++d->Pager.PagePoint;

  if ( d->Pager.PagePoint < d->Pager.PageBuffer )
    d->Pager.PagePoint = d->Pager.PageBuffer;

  for ( lines = 0, last = d->Pager.PagePoint; lines < pclines; ++last )
    {
      if ( !*last )
	break;
      else if ( *last == '\n' )
	++lines;
    }

  if ( *last == '\r' )
    ++last;

  if ( last != d->Pager.PagePoint )
    {
      if ( !WriteToDescriptor(d->Socket, d->Pager.PagePoint,
                                (last-d->Pager.PagePoint)) )
        return false;

      d->Pager.PagePoint = last;
    }

  while ( isspace(*last) )
    ++last;

  if ( !*last )
    {
      d->Pager.PageTop = 0;
      d->Pager.PagePoint = NULL;
      FlushBuffer(d, true);
      FreeMemory(d->Pager.PageBuffer);
      d->Pager.PageSize = MAX_STRING_LENGTH;
      return true;
    }

  d->Pager.PageCommand = -1;

  if ( IsBitSet( ch->Flags, PLR_ANSI ) )
    if ( WriteToDescriptor(d->Socket, "\033[1;36m", 7) == false )
      return false;

  if ( (ret=WriteToDescriptor(d->Socket,
                                "(C)ontinue, (R)efresh, (B)ack, (Q)uit: [C] ", 0)) == false )
    return false;

  if ( IsBitSet( ch->Flags, PLR_ANSI ) )
    {
      char buf[32];

      if ( d->Pager.PageColor == 7 )
        strcpy( buf, "\033[m" );
      else
        sprintf(buf, "\033[0;%d;%s%dm", (d->Pager.PageColor & 8) == 8,
                (d->Pager.PageColor > 15 ? "5;" : ""), (d->Pager.PageColor & 7)+30);

      ret = WriteToDescriptor( d->Socket, buf, 0 );
    }

  return ret;
}
