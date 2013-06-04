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

struct alias_type
{
  char *Name;
  char *Value;
};

ALIAS_DATA *FindAlias( const CHAR_DATA *ch, const char *original_argument )
{
  ALIAS_DATA *alias = NULL;
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];
  CerisListIterator *iter = NULL;

  if (!ch || !ch->pcdata)
    return NULL;

  strcpy(argument, original_argument);
  one_argument(argument, alias_name);

  iter = CreateListIterator( ch->pcdata->Aliases, ForwardsIterator );

  for ( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
    {
      ALIAS_DATA *current = (ALIAS_DATA*) ListIterator_GetData( iter );

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
  ALIAS_DATA *alias = (ALIAS_DATA*) element;

  DestroyAlias( alias );
}

void FreeAliases( CHAR_DATA *ch )
{
  if (!ch || !ch->pcdata || !ch->pcdata->Aliases)
    return;

  List_ForEach( ch->pcdata->Aliases, FreeAlias, NULL );
  DestroyList( ch->pcdata->Aliases );
  ch->pcdata->Aliases = NULL;
}

bool CheckAlias( CHAR_DATA *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ALIAS_DATA *alias;
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

const char *GetAliasName( const ALIAS_DATA *alias )
{
  return alias->Name;
}

const char *GetAliasValue( const ALIAS_DATA *alias )
{
  return alias->Value;
}

void SetAliasValue( ALIAS_DATA *alias, const char *value )
{
  STRFREE( alias->Value );
  alias->Value = STRALLOC( value );
}

ALIAS_DATA *CreateAlias( const char *name, const char *value )
{
  ALIAS_DATA *alias = NULL;

  CREATE( alias, ALIAS_DATA, 1 );
  alias->Name = STRALLOC( name );
  alias->Value = STRALLOC( value );

  return alias;
}

void DestroyAlias( ALIAS_DATA *alias )
{
  STRFREE( alias->Name );
  STRFREE( alias->Value );
  DISPOSE( alias );
}
