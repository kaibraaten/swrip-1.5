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

#include <algorithm>
#include <cstring>
#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

Alias *FindAlias( const Character *ch, const char *original_argument )
{
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];

  if (!ch || !ch->PCData)
    {
      return nullptr;
    }

  strcpy(argument, original_argument);
  OneArgument(argument, alias_name);

  for(Alias *alias : ch->PCData->Aliases)
    {
      if(StringPrefix(alias_name, alias->Name) == 0)
        {
          return alias;
        }
    }

  return nullptr;
}

Alias *AllocateAlias( const char *name, const char *command )
{
  Alias *alias = new Alias();
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

  delete alias;
}

void FreeAliases( Character *ch )
{
  assert(ch != nullptr);
  
  if (IsNpc(ch))
    {
      return;
    }

  for(Alias *alias : ch->PCData->Aliases)
    {
      FreeAlias(alias);
    }

  ch->PCData->Aliases.clear();
}

bool CheckAlias( Character *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  bool nullarg = true;

  if ( !IsNullOrEmpty( argument ) )
    {
      nullarg = false;
    }

  const Alias *alias = FindAlias(ch, command);

  if(alias == nullptr)
    {
      return false;
    }

  if ( IsNullOrEmpty( alias->Command ) )
    {
      return false;
    }

  sprintf(arg, "%s", alias->Command);

  if (ch->CmdRecurse == -1 || ++ch->CmdRecurse > 50)
    {
      if (ch->CmdRecurse != -1)
        {
          ch->Echo("Unable to further process command, recurses too much.\r\n");
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
  if(IsNpc(ch))
    {
      return;
    }
  
  std::list<Alias*>::const_iterator i = find_if(ch->PCData->Aliases.begin(),
                                                ch->PCData->Aliases.end(),
                                                [alias](auto a)
                                                {
                                                  return StrCmp(alias->Name, a->Name) == 0;
                                                });

  if(i == ch->PCData->Aliases.end())
    {
      ch->PCData->Aliases.push_back(alias);
    }
}

void UnlinkAlias( Character *ch, Alias *alias )
{
  if(IsNpc(ch))
    {
      return;
    }
  
  ch->PCData->Aliases.remove(alias);
}

