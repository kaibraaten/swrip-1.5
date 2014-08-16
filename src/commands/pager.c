#include "character.h"
#include "mud.h"

void do_pager( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) )
    return;

  argument = one_argument(argument, arg);

  if ( !*arg )
    {
      if ( IS_SET(ch->pcdata->flags, PCFLAG_PAGERON) )
        do_config(ch, "-pager");
      else
        do_config(ch, "+pager");
      return;
    }

  if ( !is_number(arg) )
    {
      send_to_char( "Set page pausing to how many lines?\r\n", ch );
      return;
    }

  ch->pcdata->pagerlen = atoi(arg);

  if ( ch->pcdata->pagerlen < 5 )
    ch->pcdata->pagerlen = 5;

  ch_printf( ch, "Page pausing set to %d lines.\r\n", ch->pcdata->pagerlen );
}
