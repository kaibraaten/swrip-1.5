#include <string.h>
#include "mud.h"
#include "character.h"

static void remove_area_names (char *inp, char *out);
static void extract_area_names (char *inp, char *out);

void do_bestowarea( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim;
  int  arg_len;

  argument = one_argument( argument, arg );

  if ( get_trust (ch) < LEVEL_SUB_IMPLEM )
    {
      send_to_char( "Sorry...\r\n", ch );
      return;
    }

  if ( !*arg )
    {
      send_to_char(
                   "Syntax:\r\n"
                   "bestowarea <victim> <filename>.are\r\n"
                   "bestowarea <victim> none             removes bestowed areas\r\n"
                   "bestowarea <victim> list             lists bestowed areas\r\n"
                   "bestowarea <victim>                  lists bestowed areas\r\n", ch);
      return;
    }

  if ( !(victim = get_char_world( ch, arg )) )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( is_npc( victim ) )
    {
      send_to_char( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( get_trust(victim) < LEVEL_IMMORTAL )
    {
      send_to_char( "They aren't an immortal.\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = str_dup("");

  if ( !*argument || !str_cmp (argument, "list") )
    {
      extract_area_names (victim->pcdata->bestowments, buf);
      ch_printf( ch, "Bestowed areas: %s\r\n", buf);
      return;
    }

  if ( !str_cmp (argument, "none") )
    {
      remove_area_names (victim->pcdata->bestowments, buf);
      DISPOSE( victim->pcdata->bestowments );
      victim->pcdata->bestowments = str_dup( buf );
      send_to_char( "Done.\r\n", ch);
      return;
    }

  arg_len = strlen(argument);
  if ( arg_len < 5
       || argument[arg_len-4] != '.' || argument[arg_len-3] != 'a'
       || argument[arg_len-2] != 'r' || argument[arg_len-1] != 'e' )
    {
      send_to_char( "You can only bestow an area name\r\n", ch );
      send_to_char( "E.G. bestow joe sam.are\r\n", ch );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  DISPOSE( victim->pcdata->bestowments );
  victim->pcdata->bestowments = str_dup( buf );
  ch_printf( victim, "%s has bestowed on you the area: %s\r\n",
             ch->name, argument );
  send_to_char( "Done.\r\n", ch );
}

/*
 * Extract area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "joe.are susan.are"
 * - Gorog
 */
static void extract_area_names (char *inp, char *out)
{
  char buf[MAX_INPUT_LENGTH], *pbuf=buf;
  int  len;

  *out='\0';

  while (inp && *inp)
    {
      inp = one_argument(inp, buf);

      if ( (len=strlen(buf)) >= 5 && !str_cmp(".are", pbuf+len-4) )
        {
          if (*out)
	    strcat (out, " ");

          strcat (out, buf);
        }
    }
}

/*
 * Remove area names from "input" string and place result in "output" string
 * e.g. "aset joe.are sedit susan.are cset" --> "aset sedit cset"
 * - Gorog
 */
static void remove_area_names (char *inp, char *out)
{
  char buf[MAX_INPUT_LENGTH], *pbuf=buf;
  int  len;

  *out='\0';

  while (inp && *inp)
    {
      inp = one_argument(inp, buf);

      if ( (len=strlen(buf)) < 5 || str_cmp(".are", pbuf+len-4) )
        {
          if (*out)
	    strcat (out, " ");

          strcat (out, buf);
        }
    }
}
