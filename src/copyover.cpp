/****************************************************************************
 *              Star Wars: Storm of Vengeance Alpha 0.1                     *
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

#include <cctype>
#include <cstdio>
#include <cstring>
#include "descriptor.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "repos/playerrepository.hpp"
#include "systemdata.hpp"
#include "repos/descriptorrepository.hpp"

#ifdef _WIN32
#include <process.h>
#endif

/*  Warm reboot stuff, gotta make sure to thank Erwin for this :) */
extern socket_t control;                /* Controlling descriptor       */

void do_copyover( Character * ch, std::string argument )
{
  char buf[100];
  FILE *fp = fopen( COPYOVER_FILE, "w" );
  char buf2[100];
  char buf3[100];
  char filename[256];

  if( !fp )
    {
      ch->Echo( "Copyover file not writeable, aborted.\r\n" );
      Log->Bug( "Could not write to copyover file: %s", COPYOVER_FILE );
      perror( "do_copyover:fopen" );
      return;
    }

  sprintf( buf, "%s", "\r\nA Blinding Flash of light starts heading towards you, before you can think it engulfs you!\r\n" );

  /* For each playing descriptor, save its state */
  std::list<Descriptor*> descriptors(Descriptors->Entities());

  for(Descriptor *d : descriptors)
    {
      Character *och = d->Original ? d->Original : d->Character;

      if( !d->Character || d->ConnectionState != CON_PLAYING )  /* drop those logging on */
        {
          WriteToDescriptor( d->Socket, "\r\nSorry, we are rebooting."
                             " Come back in a few minutes.\r\n", 0 );
          CloseDescriptor( d, false );  /* throw'em out */
        }
      else
        {
          socket_t cur_desc = d->Socket;

          fprintf( fp, "%d %d %s %s %s\n", cur_desc, 0,
                   och->Name.c_str(), d->Remote.HostIP.c_str(), d->Remote.Hostname.c_str() );
          PlayerCharacters->Save( och );
          WriteToDescriptor( d->Socket, buf, 0 );
        }
    }

  fprintf( fp, "-1\n" );
  fclose( fp );

  ImcCopyover();
  sprintf( buf3, "%d", ImcGetSocket( this_imcmud ) );

  /* exec - descriptors are inherited */
  sprintf( buf, "%d", SysData.Port );
  sprintf( buf2, "%d", control );

#ifdef _WIN32
  sprintf(filename, "\"%s\"", "swrip");
#else
  sprintf(filename, "%s", "./swrip");
#define _execl execl

  _execl( filename, filename,
          buf, "copyover", buf2, buf3, NULL );

  /* Failed - sucessful exec will not return */
  perror( "do_copyover: execl" );
  ch->Echo( "Copyover FAILED!\r\n" );
  ch->Echo( "%s\r\n", strerror(errno));
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

  Log->Info( "Copyover recovery initiated" );

  fp = fopen( COPYOVER_FILE, "r" );

  if( !fp )
    {
      perror( "RecoverFromCopyover:fopen" );
      Log->Bug( "Copyover file not found. Exitting.\r\n" );
      exit( 1 );
    }

  remove( COPYOVER_FILE );      /* In case something crashes
                                   - doesn't prevent reading */
  for( ;; )
    {
      fscanf( fp, "%d %d %s %s %s\n", &desc, &use_mccp, name, ip, host );

      if( desc == -1 || feof( fp ) )
        {
          break;
        }

      d = new Descriptor(desc);
      d->Remote.Hostname = host;
      d->Remote.HostIP = ip;

      /* Write something, and check if it goes error-free */
      if( !WriteToDescriptor( d->Socket, "\r\nThe surge of Light passes leaving you unscathed and your world reshaped anew\r\n", 0 ) )
        {
          Log->Bug("RecoverFromCopyover: couldn't write to socket %d", desc);
          FreeDescriptor(d);
          continue;
        }

      Descriptors->Add(d);
      d->ConnectionState = CON_COPYOVER_RECOVER; /* negative so CloseDescriptor will cut them off */

      /* Now, find the pfile */
      fOld = PlayerCharacters->Load( d, name, false );

      if( !fOld )               /* Player file not found?! */
        {
          WriteToDescriptor( d->Socket,
                             "\r\nSomehow, your character was lost in the copyover sorry.\r\n",
                             0 );
          CloseDescriptor( d, false );
        }
      else                      /* ok! */
        {
          WriteToDescriptor( d->Socket, "\r\nCopyover recovery complete.\r\n", 0 );

          /* Just In Case,  Someone said this isn't necassary, but _why_
             do we want to dump someone in limbo? */
          if( !d->Character->InRoom )
            d->Character->InRoom = GetRoom( ROOM_VNUM_SCHOOL );

          /* Insert in the char_list */
          AddCharacter(d->Character);

          CharacterToRoom( d->Character, d->Character->InRoom );
          do_look( d->Character, "auto noprog" );

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
