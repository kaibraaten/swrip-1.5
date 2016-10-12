#include "character.h"
#include "mud.h"

void do_pager( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    return;

  argument = OneArgument(argument, arg);

  if ( !*arg )
    {
      if ( IsBitSet(ch->PCData->Flags, PCFLAG_PAGERON) )
        do_config(ch, "-pager");
      else
        do_config(ch, "+pager");
      return;
    }

  if ( !IsNumber(arg) )
    {
      SendToCharacter( "Set page pausing to how many lines?\r\n", ch );
      return;
    }

  ch->PCData->pagerlen = atoi(arg);

  if ( ch->PCData->pagerlen < 5 )
    ch->PCData->pagerlen = 5;

  Echo( ch, "Page pausing set to %d lines.\r\n", ch->PCData->pagerlen );
}
