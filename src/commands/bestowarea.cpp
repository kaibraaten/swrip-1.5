#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

static void remove_area_names (char *inp, char *out);
static void extract_area_names (char *inp, char *out);

void do_bestowarea( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];
  Character *victim = nullptr;
  int arg_len = 0;

  argument = OneArgument( argument, arg );

  if ( GetTrustLevel (ch) < LEVEL_SUB_IMPLEM )
    {
      ch->Echo( "Sorry...\r\n" );
      return;
    }

  if ( !*arg )
    {
      ch->Echo( "Syntax:\r\n"
                "bestowarea <victim> <filename>.are\r\n"
                "bestowarea <victim> none             removes bestowed areas\r\n"
                "bestowarea <victim> list             lists bestowed areas\r\n"
                "bestowarea <victim>                  lists bestowed areas\r\n" );
      return;
    }

  if ( !(victim = GetCharacterAnywhere( ch, arg )) )
    {
      ch->Echo( "They aren't here.\r\n" );
      return;
    }

  if ( IsNpc( victim ) )
    {
      ch->Echo( "You can't give special abilities to a mob!\r\n" );
      return;
    }

  if ( GetTrustLevel(victim) < LEVEL_IMMORTAL )
    {
      ch->Echo( "They aren't an immortal.\r\n" );
      return;
    }

  if (!victim->PCData->Bestowments)
    victim->PCData->Bestowments = CopyString("");

  if ( !*argument || !StrCmp (argument, "list") )
    {
      extract_area_names (victim->PCData->Bestowments, buf);
      ch->Echo( "Bestowed areas: %s\r\n", buf);
      return;
    }

  if ( !StrCmp (argument, "none") )
    {
      remove_area_names (victim->PCData->Bestowments, buf);
      FreeMemory( victim->PCData->Bestowments );
      victim->PCData->Bestowments = CopyString( buf );
      ch->Echo( "Done.\r\n" );
      return;
    }

  arg_len = strlen(argument);

  if ( arg_len < 5
       || argument[arg_len-4] != '.' || argument[arg_len-3] != 'a'
       || argument[arg_len-2] != 'r' || argument[arg_len-1] != 'e' )
    {
      ch->Echo( "You can only bestow an area name\r\n" );
      ch->Echo( "E.G. bestow joe sam.are\r\n" );
      return;
    }

  sprintf( buf, "%s %s", victim->PCData->Bestowments, argument );
  FreeMemory( victim->PCData->Bestowments );
  victim->PCData->Bestowments = CopyString( buf );
  victim->Echo( "%s has bestowed on you the area: %s\r\n",
                ch->Name, argument );
  ch->Echo( "Done.\r\n" );
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

