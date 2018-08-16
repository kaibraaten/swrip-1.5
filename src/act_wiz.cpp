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

#include <cassert>
#include <cctype>
#include <cstring>
#include <ctime>
#include "character.hpp"
#include "mud.hpp"
#include "reset.hpp"
#include "shop.hpp"
#include "area.hpp"
#include "script.hpp"
#include "room.hpp"
#include "object.hpp"

/*
 * Global variables.
 */
char reboot_time[50];
time_t new_boot_time_t;

void EchoToAll( short AT_COLOR, const std::string &argument, short tar )
{
  if ( argument.empty() )
    return;

  for ( Descriptor *d = FirstDescriptor; d; d = d->Next )
    {
      /* Added showing echoes to players who are editing, so they won't
         miss out on important info like upcoming reboots. --Narn */
      if ( d->ConnectionState == CON_PLAYING || d->ConnectionState == CON_EDITING )
        {
          /* This one is kinda useless except for switched.. */
          if ( tar == ECHOTAR_PC && IsNpc(d->Character) )
            continue;
          else if ( tar == ECHOTAR_IMM && !IsImmortal(d->Character) )
            continue;
          
          SetCharacterColor( AT_COLOR, d->Character );
          d->Character->Echo( "%s\r\n", argument.c_str() );
        }
    }
}

void EchoToRoom( short AT_COLOR, const Room *room, const std::string &argument )
{
  RealEchoToRoom( AT_COLOR, room, argument, true );
}

void EchoToRoomNoNewline( int ecolor, const Room *room, const std::string &argument )
{
  RealEchoToRoom( ecolor, room, argument, false );
}

void RealEchoToRoom( short color, const Room *room, const std::string &text, bool sendNewline )
{
  assert(room != nullptr);

  for ( const Character *vic : room->Characters())
    {
      SetCharacterColor( color, vic );
      vic->Echo( "%s", text.c_str() );

      if( sendNewline )
	{
	  vic->Echo( "\r\n" );
	}
    }
}

Room *FindLocation( const Character *ch, const std::string &arg )
{
  const Character *victim = NULL;
  const Object *obj = NULL;

  if ( IsNumber(arg) )
    return GetRoom( stoi( arg ) );

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) != NULL )
    return victim->InRoom;

  if ( ( obj = GetObjectAnywhere( ch, arg ) ) != NULL )
    return obj->InRoom;

  return NULL;
}

void GenerateRebootString()
{
  sprintf(reboot_time, "%s", asctime(new_boot_time));
}
