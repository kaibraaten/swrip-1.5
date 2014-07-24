#include <string.h>
#include "mud.h"
#include "character.h"

void do_disguise( Character *ch, char *argument )
{
  int the_chance;
  short gsn;

  if ( is_npc(ch) )
    return;

  if ( IS_SET( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
      send_to_char( "You try but the Force resists you.\r\n", ch );
      return;
    }

  if(ch->pcdata->learned[gsn_disguise] <= 0)
    gsn = gsn_cloak;
  else
    gsn = gsn_disguise;

  if ( argument[0] == '\0' )
    {
      send_to_char( "Change your title to what?\r\n", ch );
      return;
    }

  the_chance = (int) (ch->pcdata->learned[gsn]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char( "You try to disguise yourself but fail.\r\n", ch );
      return;
    }

  if ( strlen(argument) > 50 )
    argument[50] = '\0';

  smash_tilde( argument );
  set_title( ch, argument );
  learn_from_success( ch, gsn );
  send_to_char( "Ok.\r\n", ch );
}
