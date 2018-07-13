/****************************************************************************
 *           	Star Wars: Storm of Vengeance Alpha 0.1                     *
 *==========================================================================*
 * Sw-Storm Alpha 0.1 Code Changes by Iczer/K.lopes w/ help from Maelfius   *
 * Additional Code within go to their respective owners.                    *
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
 *                       Warmboot/Copyover Module                           *
 ****************************************************************************/

/* Origional Copyover Code by Erwin S. Andreasen http://www.andreasen.org/ */

#ifdef __STRICT_ANSI__
/* To include the prototype for snprintf() */
#define _DEFAULT_SOURCE
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

/*  Warm reboot stuff, gotta make sure to thank Erwin for this :) */
extern socket_t control;		/* Controlling descriptor       */

void do_copyover( Character * ch, char *argument )
{
  Descriptor *d, *d_next;
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
    Shuttle * tshuttle;
  */

  if( !fp )
  {
    SendToCharacter( "Copyover file not writeable, aborted.\r\n", ch );
    LogPrintf( "Could not write to copyover file: %s", COPYOVER_FILE );
    perror( "do_copyover:fopen" );
    return;
  }

#ifdef AMIGA
  coded_control = ReleaseCopyOfSocket( control, UNIQUE_ID );
#elif defined(__MORPHOS__)
  coded_control = ReleaseCopyOfSocket( control, ++sockID );
#endif

  sprintf( buf, "%s", "\r\nA Blinding Flash of light starts heading towards you, before you can think it engulfs you!\r\n" );

  /* For each playing descriptor, save its state */
  for( d = FirstDescriptor; d; d = d_next )
  {
    Character *och = d->Original ? d->Original : d->Character;
    d_next = d->Next;		/* We delete from the list , so need to save this */

    if( !d->Character || d->ConnectionState != CON_PLAYING )	/* drop those logging on */
    {
      WriteToDescriptor( d->Socket, "\r\nSorry, we are rebooting."
			 " Come back in a few minutes.\r\n", 0 );
      CloseDescriptor( d, false );	/* throw'em out */
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
      cur_desc = ReleaseCopyOfSocket( d->Socket, sockID );

      if( cur_desc == SOCKET_ERROR )
      {
	fprintf( stdout, "ReleaseCopyOfSocket() failed.\n" );
	fclose( fp );
	exit( 1 );
      }
#else
      socket_t cur_desc = d->Socket;
#endif

      fprintf( fp, "%d %d %s %s %s\n", cur_desc, 0, /*d->mccp ? 1 : 0,*/
	       och->Name, d->Remote.HostIP, d->Remote.Hostname );
      SaveCharacter( och );
      WriteToDescriptor( d->Socket, buf, 0 );
    }
  }

  fprintf( fp, "-1\n" );
  fclose( fp );

#ifdef SWRIP_USE_IMC
  ImcCopyover();
  sprintf( buf3, "%d", ImcGetSocket( this_imcmud ) );
#else
  sprintf( buf3, "%d", -1 );
#endif

#if defined(AMIGA) || defined(__MORPHOS__)
  sprintf( buf, "run >NIL: %s %d copyover %d %s",
	   "swrip", SysData.Port, coded_control, buf3 );

  error_code = System( (CONST_STRPTR) buf, NULL );

  if( error_code == -1 )
  {
    Bug( "Copyover failure, executable could not be run." );
    fprintf( stdout, "Failed to run %s\n", "swrip" );
    Echo( ch, "Copyover FAILED!\r\n" );
  }
  else
  {
    exit( 0 );
  }

#else
  /* exec - descriptors are inherited */
  sprintf( buf, "%d", SysData.Port );
  sprintf( buf2, "%d", control );

#ifdef _WIN32
  sprintf(filename, "\"%s\"", SysData.exe_filename);
#else
  sprintf(filename, "%s", "./swrip");
#define _execl execl
#endif
  _execl( filename, filename,
	 buf, "copyover", buf2, buf3, NULL );

  /* Failed - sucessful exec will not return */
  perror( "do_copyover: execl" );
  SendToCharacter( "Copyover FAILED!\r\n", ch );
  Echo(ch, "%s\r\n", strerror(errno));
#endif
}

/* Recover from a copyover - load players */
void RecoverFromCopyover( void )
{
  Descriptor *d = NULL;
  FILE *fp = NULL;
  char name[100];
  char host[MAX_STRING_LENGTH];
  char ip[MAX_STRING_LENGTH];
  socket_t desc = 0;
  bool fOld = false;
  int use_mccp = 0;

  LogPrintf( "Copyover recovery initiated" );

  fp = fopen( COPYOVER_FILE, "r" );

  if( !fp )
  {
    perror( "RecoverFromCopyover:fopen" );
    LogPrintf( "Copyover file not found. Exitting.\r\n" );
    exit( 1 );
  }

  remove( COPYOVER_FILE );	/* In case something crashes
				   - doesn't prevent reading */
  for( ;; )
  {
    fscanf( fp, "%d %d %s %s %s\n", &desc, &use_mccp, name, ip, host );

    if( desc == -1 || feof( fp ) )
      {
	break;
      }

#if defined(AMIGA) || defined(__MORPHOS__)
    desc = ObtainSocket( desc, PF_INET, SOCK_STREAM, IPPROTO_TCP );

    if( desc == INVALID_SOCKET )
    {
      Bug( "ObtainSocket returned error." );
      continue;
    }
#endif

    AllocateMemory( d, Descriptor, 1 );
    InitializeDescriptor( d, desc ); /* set up various stuff */
    d->Remote.Hostname = CopyString( host );
    d->Remote.HostIP = CopyString( ip );

    /* Write something, and check if it goes error-free */
    if( !WriteToDescriptor( d->Socket, "\r\nThe surge of Light passes leaving you unscathed and your world reshaped anew\r\n", 0 ) )
    {
      Bug("RecoverFromCopyover: couldn't write to socket %d", desc);
      FreeDescriptor(d);
      continue;
    }

    LINK( d, FirstDescriptor, LastDescriptor, Next, Previous );
    d->ConnectionState = CON_COPYOVER_RECOVER; /* negative so CloseDescriptor will cut them off */

    /* Now, find the pfile */
    fOld = LoadCharacter( d, name, false );

    if( !fOld )		/* Player file not found?! */
    {
      WriteToDescriptor( d->Socket,
			 "\r\nSomehow, your character was lost in the copyover sorry.\r\n",
			 0 );
      CloseDescriptor( d, false );
    }
    else			/* ok! */
    {
      char argument[MAX_INPUT_LENGTH];
      sprintf( argument, "%s", "auto noprog" );
      WriteToDescriptor( d->Socket, "\r\nCopyover recovery complete.\r\n", 0 );

      /* Just In Case,  Someone said this isn't necassary, but _why_
	 do we want to dump someone in limbo? */
      if( !d->Character->InRoom )
	d->Character->InRoom = GetRoom( ROOM_VNUM_SCHOOL );

      /* Insert in the char_list */
      LINK( d->Character, FirstCharacter, LastCharacter, Next, Previous );

      CharacterToRoom( d->Character, d->Character->InRoom );
      do_look( d->Character, argument );

      Act( AT_ACTION, "$n materializes!", d->Character, NULL, NULL,
	  TO_ROOM );
      d->ConnectionState = CON_PLAYING;

      if ( ++num_descriptors > SysData.MaxPlayersEver )
	{
	  SysData.MaxPlayersEver = num_descriptors;
	}
    }
  }

  fclose( fp );
}
