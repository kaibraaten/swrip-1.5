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

  argument = OneArgument( argument, arg );

  if ( GetTrustLevel (ch) < LEVEL_SUB_IMPLEM )
    {
      SendToCharacter( "Sorry...\r\n", ch );
      return;
    }

  if ( !*arg )
    {
      SendToCharacter(
                   "Syntax:\r\n"
                   "bestowarea <victim> <filename>.are\r\n"
                   "bestowarea <victim> none             removes bestowed areas\r\n"
                   "bestowarea <victim> list             lists bestowed areas\r\n"
                   "bestowarea <victim>                  lists bestowed areas\r\n", ch);
      return;
    }

  if ( !(victim = get_char_world( ch, arg )) )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) )
    {
      SendToCharacter( "You can't give special abilities to a mob!\r\n", ch );
      return;
    }

  if ( GetTrustLevel(victim) < LEVEL_IMMORTAL )
    {
      SendToCharacter( "They aren't an immortal.\r\n", ch );
      return;
    }

  if (!victim->pcdata->bestowments)
    victim->pcdata->bestowments = CopyString("");

  if ( !*argument || !StrCmp (argument, "list") )
    {
      extract_area_names (victim->pcdata->bestowments, buf);
      ChPrintf( ch, "Bestowed areas: %s\r\n", buf);
      return;
    }

  if ( !StrCmp (argument, "none") )
    {
      remove_area_names (victim->pcdata->bestowments, buf);
      FreeMemory( victim->pcdata->bestowments );
      victim->pcdata->bestowments = CopyString( buf );
      SendToCharacter( "Done.\r\n", ch);
      return;
    }

  arg_len = strlen(argument);
  if ( arg_len < 5
       || argument[arg_len-4] != '.' || argument[arg_len-3] != 'a'
       || argument[arg_len-2] != 'r' || argument[arg_len-1] != 'e' )
    {
      SendToCharacter( "You can only bestow an area name\r\n", ch );
      SendToCharacter( "E.G. bestow joe sam.are\r\n", ch );
      return;
    }

  sprintf( buf, "%s %s", victim->pcdata->bestowments, argument );
  FreeMemory( victim->pcdata->bestowments );
  victim->pcdata->bestowments = CopyString( buf );
  ChPrintf( victim, "%s has bestowed on you the area: %s\r\n",
             ch->name, argument );
  SendToCharacter( "Done.\r\n", ch );
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
      inp = OneArgument(inp, buf);

      if ( (len=strlen(buf)) >= 5 && !StrCmp(".are", pbuf+len-4) )
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
      inp = OneArgument(inp, buf);

      if ( (len=strlen(buf)) < 5 || StrCmp(".are", pbuf+len-4) )
        {
          if (*out)
	    strcat (out, " ");

          strcat (out, buf);
        }
    }
}
