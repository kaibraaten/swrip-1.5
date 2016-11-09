/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * -----------------------------------------------------------|   (0...0)   *
 * SMAUG 1.4 (C) 1994, 1995, 1996, 1998  by Derek Snider      |    ).:.(    *
 * -----------------------------------------------------------|    {o o}    *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,      |   / ' ' \   *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh, Nivek,      |~'~.VxvxV.~'~*
 * Tricops and Fireblade                                      |             *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 * ------------------------------------------------------------------------ *
 *                        Alias module                                      *
 ****************************************************************************/

/******************************************************
            Desolation of the Dragon MUD II
      (C) 1997, 1998  Jesse DeFer and Heath Leach
 http://dotd.mudservices.com  dotd@dotd.mudservices.com
 ******************************************************/

#include <string.h>
#include "mud.h"
#include "character.hpp"

Alias *FindAlias( const Character *ch, const char *original_argument )
{
  Alias *pal;
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];

  if (!ch || !ch->PCData)
    return(NULL);

  strcpy(argument, original_argument);
  OneArgument(argument, alias_name);

  for (pal=ch->PCData->FirstAlias; pal; pal = pal->Next)
    if ( !StringPrefix(alias_name, pal->Name) )
      return(pal);

  return NULL;
}

Alias *AllocateAlias( const char *name, const char *command )
{
  Alias *alias = NULL;
  AllocateMemory( alias, Alias, 1 );
  alias->Name = CopyString( name );
  alias->Command = CopyString( command );

  return alias;
}

void FreeAlias( Alias *alias )
{
  if( alias->Name )
    {
      FreeMemory( alias->Name );
    }

  if( alias->Command )
    {
      FreeMemory( alias->Command );
    }

  FreeMemory( alias );
}

void FreeAliases( Character *ch )
{
  Alias *pal, *next_pal;

  if (!ch || !ch->PCData)
    return;

  for( pal = ch->PCData->FirstAlias ; pal ; pal = next_pal )
    {
      next_pal = pal->Next;
      FreeAlias( pal );
    }
}

bool CheckAlias( Character *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Alias *alias;
  bool nullarg = true;

  if ( !IsNullOrEmpty( argument ) )
    nullarg = false;

  if ( (alias=FindAlias(ch,command)) == NULL )
    return false;

  if ( IsNullOrEmpty( alias->Command ) )
    return false;

  sprintf(arg, "%s", alias->Command);

  if (ch->CmdRecurse == -1 || ++ch->CmdRecurse > 50)
    {
      if (ch->CmdRecurse != -1)
        {
          SendToCharacter("Unable to further process command, recurses too much.\r\n", ch);
          ch->CmdRecurse = -1;
        }

      return false;
    }

  if ( !IsNullOrEmpty( argument ) && !nullarg)
    {
      strcat(arg, " ");
      strcat(arg, argument);
    }

  Interpret(ch, arg);
  return true;
}

void AddAlias( Character *ch, Alias *alias )
{
  LINK(alias, ch->PCData->FirstAlias, ch->PCData->LastAlias, Next, Previous);

}

void UnlinkAlias( Character *ch, Alias *alias )
{
  UNLINK(alias, ch->PCData->FirstAlias, ch->PCData->LastAlias, Next, Previous);
}
