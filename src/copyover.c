/***************************************************************************
 *           	Star Wars: Storm of Vengeance Alpha 0.1			   *
 *==========================================================================*
 * Sw-Storm Alpha 0.1 Code Changes by Iczer/K.lopes w/ help from Maelfius   *
 * Additional Code within go to their respective owners.			   *
 *==========================================================================*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 *==========================================================================*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *==========================================================================*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 *==========================================================================*
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 *==========================================================================*
 *                       Warmboot/Copyover Module			   *
 ****************************************************************************/
/* Origional Copyover Code by Erwin S. Andreasen http://www.andreasen.org/ */

#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _BSD_SOURCE
#endif

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "mud.h"
#include "character.h"

#ifdef _WIN32
#include <process.h>
#endif

/*
 * OS-dependent local functions.
 */
socket_t init_socket( short port );
void new_descriptor( socket_t new_desc );
bool read_from_descriptor( DESCRIPTOR_DATA * d );
void init_descriptor( DESCRIPTOR_DATA * dnew, socket_t desc );
void free_desc( DESCRIPTOR_DATA * d );

/*  Warm reboot stuff, gotta make sure to thank Erwin for this :) */
extern socket_t control;		/* Controlling descriptor       */

void do_copyover( Character * ch, char *argument )
{
  DESCRIPTOR_DATA *d, *d_next;
  char buf[100];
  FILE *fp = fopen( COPYOVER_FILE, "w" );

#if defined(AMIGA) || defined(__MORPHOS__)
  long error_code = 0;
  static long sockID = 0;
  socket_t coded_control = 0;
#else
  char buf2[100];
#endif
  char buf3[100];
  char filename[256];

  /*
    SHUTTLE_DATA * tshuttle;
  */

  if( !fp )
  {
    char logbuf[MAX_STRING_LENGTH];
    send_to_char( "Copyover file not writeable, aborted.\r\n", ch );
    sprintf( "Could not write to copyover file: %s", COPYOVER_FILE );
    log_string(logbuf);
    /*log_printf( "Could not write to copyover file: %s", COPYOVER_FILE );*/
    perror( "do_copyover:fopen" );
    return;
  }

#ifdef AMIGA
  coded_control = ReleaseCopyOfSocket( control, UNIQUE_ID );
#elif defined(__MORPHOS__)
  coded_control = ReleaseCopyOfSocket( control, ++sockID );
#endif

  sprintf( buf, "%s", "\r\nA Blinding Flash of light starts heading towards you, before you can think it engulfs you!\r\n" );

  /*
  for ( tshuttle = first_shuttle; tshuttle; tshuttle = tshuttle->next )
    save_shuttle(tshuttle);
  */

  /* For each playing descriptor, save its state */
  for( d = first_descriptor; d; d = d_next )
  {
    Character *och = d->original ? d->original : d->character;
    d_next = d->next;		/* We delete from the list , so need to save this */

    if( !d->character || d->connection_state != CON_PLAYING )	/* drop those logging on */
    {
      write_to_descriptor( d->descriptor, "\r\nSorry, we are rebooting."
			   " Come back in a few minutes.\r\n", 0 );
      close_socket( d, FALSE );	/* throw'em out */
    }
    else
    {
#if defined(AMIGA) || defined(__MORPHOS__)
      socket_t cur_desc = INVALID_SOCKET;

#ifdef __MORPHOS__
      ++sockID;
#else
      sockID = UNIQUE_ID;
#endif
      cur_desc = ReleaseCopyOfSocket( d->descriptor, sockID );

      if( cur_desc == SOCKET_ERROR )
      {
	fprintf( stdout, "ReleaseCopyOfSocket() failed.\n" );
	fclose( fp );
	exit( 1 );
      }
#else
      socket_t cur_desc = d->descriptor;
#endif

      fprintf( fp, "%d %d %s %s\n", cur_desc, 0, /*d->mccp ? 1 : 0,*/
	       och->name, d->remote.hostname );
      save_char_obj( och );
      write_to_descriptor( d->descriptor, buf, 0 );
    }
  }

  fprintf( fp, "-1\n" );
  fclose( fp );

#ifdef SWRIP_USE_IMC
  imc_hotboot();
  sprintf( buf3, "%d", imc_getsocket( this_imcmud ) );
#else
  sprintf( buf3, "%d", -1 );
#endif

#if defined(AMIGA) || defined(__MORPHOS__)
  sprintf( buf, "run >NIL: %s %d copyover %d %s",
	   sysdata.exe_filename, sysdata.port, coded_control, buf3 );

  error_code = System( (CONST_STRPTR) buf, NULL );

  if( error_code == -1 )
  {
    bug( "Copyover failure, executable could not be run." );
    fprintf( stdout, "Failed to run %s\n", sysdata.exe_filename );
    ch_printf( ch, "Copyover FAILED!\r\n" );
  }
  else
  {
    exit( 0 );
  }

#else
  /* exec - descriptors are inherited */
  sprintf( buf, "%d", sysdata.port );
  sprintf( buf2, "%d", control );

#ifdef _WIN32
  sprintf(filename, "\"%s\"", sysdata.exe_filename);
#else
  sprintf(filename, "%s", "../bin/swrip");
#define _execl execl
#endif
  _execl( filename, filename,
	 buf, "copyover", buf2, buf3, NULL );

  /* Failed - sucessful exec will not return */
  perror( "do_copyover: execl" );
  send_to_char( "Copyover FAILED!\r\n", ch );
  ch_printf(ch, "%s\r\n", strerror(errno));
#endif
}

/* Recover from a copyover - load players */
void copyover_recover( void )
{
  DESCRIPTOR_DATA *d = NULL;
  FILE *fp = NULL;
  char name[100];
  char host[MAX_STRING_LENGTH];
  socket_t desc = 0;
  bool fOld = FALSE;
  int use_mccp = 0;

  log_string( "Copyover recovery initiated" );

  fp = fopen( COPYOVER_FILE, "r" );

  if( !fp )
  {
    perror( "copyover_recover:fopen" );
    log_string( "Copyover file not found. Exitting.\r\n" );
    exit( 1 );
  }

  remove( COPYOVER_FILE );	/* In case something crashes
				   - doesn't prevent reading */
  for( ;; )
  {
    fscanf( fp, "%d %d %s %s\n", &desc, &use_mccp, name, host );

    if( desc == -1 || feof( fp ) )
      break;

#if defined(AMIGA) || defined(__MORPHOS__)
    desc = ObtainSocket( desc, PF_INET, SOCK_STREAM, IPPROTO_TCP );

    if( desc == INVALID_SOCKET )
    {
      bug( "ObtainSocket returned error." );
      continue;
    }
#endif

    CREATE( d, DESCRIPTOR_DATA, 1 );
    init_descriptor( d, desc ); /* set up various stuff */
    d->remote.hostname = STRALLOC( host );

    /* Write something, and check if it goes error-free */
    if( !write_to_descriptor( d->descriptor, "\r\nThe surge of Light passes leaving you unscathed and your world reshaped anew\r\n", 0 ) )
    {
      /*closesocket( desc );*/
      bug("copyover_recover: couldn't write to socket %d", desc);
      free_desc(d);
      continue;
    }

    LINK( d, first_descriptor, last_descriptor, next, prev );
    d->connection_state = CON_COPYOVER_RECOVER; /* negative so close_socket will cut them off */

    /* Now, find the pfile */
    fOld = load_char_obj( d, name, FALSE );

    if( !fOld )		/* Player file not found?! */
    {
      write_to_descriptor( d->descriptor,
			   "\r\nSomehow, your character was lost in the copyover sorry.\r\n",
			   0 );
      close_socket( d, FALSE );
    }
    else			/* ok! */
    {
      char argument[MAX_INPUT_LENGTH];
      snprintf( argument, MAX_INPUT_LENGTH, "%s", "auto noprog" );
      write_to_descriptor( d->descriptor, "\r\nCopyover recovery complete.\r\n", 0 );

      /* Just In Case,  Someone said this isn't necassary, but _why_
	 do we want to dump someone in limbo? */
      if( !d->character->in_room )
	d->character->in_room = get_room_index( ROOM_VNUM_SCHOOL );

      /* Insert in the char_list */
      LINK( d->character, first_char, last_char, next, prev );

      char_to_room( d->character, d->character->in_room );
      do_look( d->character, argument );
      /*load_home( d->character );*/
      act( AT_ACTION, "$n materializes!", d->character, NULL, NULL,
	  TO_ROOM );
      d->connection_state = CON_PLAYING;
    }
  }

  fclose( fp );
}
