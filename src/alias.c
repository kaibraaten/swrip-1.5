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
#include "mud.h"
#include "character.h"

ALIAS_DATA *find_alias( const CHAR_DATA *ch, const char *original_argument )
{
  ALIAS_DATA *pal;
  char alias_name[MAX_INPUT_LENGTH];
  char argument[MAX_INPUT_LENGTH];

  if (!ch || !ch->pcdata)
    return(NULL);

  strcpy(argument, original_argument);
  one_argument(argument, alias_name);

  for (pal=ch->pcdata->first_alias;pal;pal=pal->next)
    if ( !str_prefix(alias_name, pal->name) )
      return(pal);

  return(NULL);
}

void free_aliases( CHAR_DATA *ch )
{
  ALIAS_DATA *pal, *next_pal;

  if (!ch || !ch->pcdata)
    return;

  for (pal=ch->pcdata->first_alias;pal;pal=next_pal)
    {
      next_pal=pal->next;
      if (pal->name)
        DISPOSE(pal->name);
      if (pal->cmd)
        DISPOSE(pal->cmd);
      DISPOSE( pal );
    }
}

bool check_alias( CHAR_DATA *ch, char *command, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ALIAS_DATA *alias;
  bool nullarg = TRUE;

  if ( argument && *argument!='\0' )
    nullarg = FALSE;

  if ( (alias=find_alias(ch,command)) == NULL )
    return FALSE;

  if (!alias->cmd || !*alias->cmd)
    return FALSE;

  sprintf(arg, "%s", alias->cmd);

  if (ch->cmd_recurse==-1 || ++ch->cmd_recurse>50)
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
