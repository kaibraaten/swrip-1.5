#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

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
      ch->Echo("Set page pausing to how many lines?\r\n");
      return;
    }

  ch->PCData->PagerLength = atoi(arg);

  if ( ch->PCData->PagerLength < 5 )
    ch->PCData->PagerLength = 5;

  ch->Echo("Page pausing set to %d lines.\r\n", ch->PCData->PagerLength );
}

