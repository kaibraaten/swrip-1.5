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
#include "character.h"

Alias *FindAlias( const Character *ch, const char *original_argument )
{
  Alias *pal;
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];

  if (!ch || !ch->pcdata)
    return(NULL);

  strcpy(argument, original_argument);
  OneArgument(argument, alias_name);

  for (pal=ch->pcdata->first_alias;pal;pal=pal->next)
    if ( !StringPrefix(alias_name, pal->name) )
      return(pal);

  return(NULL);
}

void FreeAliases( Character *ch )
{
  Alias *pal, *next_pal;

  if (!ch || !ch->pcdata)
    return;

  for (pal=ch->pcdata->first_alias;pal;pal=next_pal)
    {
      next_pal=pal->next;
      if (pal->name)
        FreeMemory(pal->name);
      if (pal->cmd)
        FreeMemory(pal->cmd);
      FreeMemory( pal );
    }
}

bool CheckAlias( Character *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Alias *alias;
  bool nullarg = true;

  if ( argument && *argument!='\0' )
    nullarg = false;

  if ( (alias=FindAlias(ch,command)) == NULL )
    return false;

  if (!alias->cmd || !*alias->cmd)
    return false;

  sprintf(arg, "%s", alias->cmd);

  if (ch->cmd_recurse==-1 || ++ch->cmd_recurse>50)
    {
      if (ch->cmd_recurse!=-1)
        {
          SendToCharacter("Unable to further process command, recurses too much.\r\n", ch);
          ch->cmd_recurse=-1;
        }
      return false;
    }

  if (argument && *argument!='\0' && !nullarg)
    {
      strcat(arg, " ");
      strcat(arg, argument);
    }

  interpret(ch, arg);
  return true;
}
