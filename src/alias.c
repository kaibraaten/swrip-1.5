/***************************************************************************
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
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                        Alias module                                      *
 ****************************************************************************/
/******************************************************
            Desolation of the Dragon MUD II
      (C) 1997, 1998  Jesse DeFer and Heath Leach
 http://dotd.mudservices.com  dotd@dotd.mudservices.com
******************************************************/

#include <string.h>
#include <eris/ceris.h>
#include "mud.h"
#include "character.h"

struct Alias
{
  char *Name;
  char *Value;
};

Alias *FindAlias( const Character *ch, const char *original_argument )
{
  Alias *alias = NULL;
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];
  CerisListIterator *iter = NULL;

  if (!ch || !ch->pcdata)
    return NULL;

  strcpy(argument, original_argument);
  one_argument(argument, alias_name);

  iter = CreateListIterator( GetAliases( ch ), ForwardsIterator );

  for ( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      Alias *current = (Alias*) ListIterator_GetData( iter );

      if ( !str_prefix(alias_name, current->Name) )
	{
	  alias = current;
	  break;
	}
    }

  DestroyListIterator( iter );

  return alias;
}

static void FreeAlias( void *element, void *userData )
{
  Alias *alias = (Alias*) element;

  DestroyAlias( alias );
}

void FreeAliases( Character *ch )
{
  CerisList *aliasList = GetAliases( ch );

  if (!ch || !ch->pcdata || !aliasList )
    return;

  List_ForEach( aliasList, FreeAlias, NULL );
  DestroyList( aliasList );
}

CerisList *GetAliases( const Character *ch )
{
  return ch->pcdata->Aliases;
}

bool CheckAlias( Character *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Alias *alias;
  bool nullarg = TRUE;

  if ( argument && *argument!='\0' )
    nullarg = FALSE;

  alias = FindAlias( ch, command );

  if ( alias == NULL )
    return FALSE;

  if (!*alias->Value)
    return FALSE;

  sprintf(arg, "%s", alias->Value);

  if (ch->cmd_recurse == -1 || ++ch->cmd_recurse > 50)
    {
      if (ch->cmd_recurse!=-1)
        {
          send_to_char("Unable to further process command, recurses too much.\r\n", ch);
          ch->cmd_recurse=-1;
        }

      return FALSE;
    }

  if (argument && *argument!='\0' && !nullarg)
    {
      strcat(arg, " ");
      strcat(arg, argument);
    }

  interpret(ch, arg);
  return TRUE;
}

const char *GetAliasName( const Alias *alias )
{
  return alias->Name;
}

const char *GetAliasValue( const Alias *alias )
{
  return alias->Value;
}

void SetAliasValue( Alias *alias, const char *value )
{
  STRFREE( alias->Value );
  alias->Value = STRALLOC( value );
}

Alias *CreateAlias( const char *name, const char *value )
{
  Alias *alias = NULL;

  CREATE( alias, Alias, 1 );
  alias->Name = STRALLOC( name );
  alias->Value = STRALLOC( value );

  return alias;
}

void DestroyAlias( Alias *alias )
{
  STRFREE( alias->Name );
  STRFREE( alias->Value );
  DISPOSE( alias );
}

void AddAlias( Character *ch, Alias *alias )
{
  CerisList *aliasList = GetAliases( ch );
  List_AddTail( aliasList, alias );
}

void RemoveAlias( Character *ch, Alias *alias )
{
  CerisList *aliasList = GetAliases( ch );
  List_Remove( aliasList, alias );
}

void AllocateAliasList( Character *ch )
{
  ch->pcdata->Aliases = CreateList();
}
