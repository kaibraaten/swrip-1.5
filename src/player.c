/***************************************************************************
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
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *              Commands for personal player settings/statictics           *
 ****************************************************************************/

#include <ctype.h>
#include <string.h>
#include "mud.h"
#include "character.h"

const char *get_race( const CHAR_DATA *ch)
{
  if ( ch->race < MAX_NPC_RACE && ch->race >= 0)
    return ( npc_race[ch->race] );

  return "Unknown";
}

void set_title( CHAR_DATA *ch, const char *title )
{
  char buf[MAX_STRING_LENGTH];

  if ( is_npc(ch) )
    {
      bug( "Set_title: NPC.", 0 );
      return;
    }

  if ( isalpha(title[0]) || isdigit(title[0]) )
    {
      buf[0] = ' ';
      strcpy( buf+1, title );
    }
  else
    strcpy( buf, title );

  STRFREE( ch->pcdata->title );
  ch->pcdata->title = STRALLOC( buf );
}
