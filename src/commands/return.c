#include "character.h"
#include "mud.h"

void do_return( Character *ch, char *argument )
{
  if ( !ch->desc )
    return;

  if ( !ch->desc->original )
    {
      send_to_char( "You aren't switched.\r\n", ch );
      return;
    }

  if (IsBitSet(ch->act, ACT_POLYMORPHED))
    {
      send_to_char("Use revert to return from a polymorphed mob.\r\n", ch);
      return;
    }

  send_to_char( "You return to your original body.\r\n", ch );
  if ( IsNpc( ch ) && IsAffectedBy( ch, AFF_POSSESS ) )
    {
      affect_strip( ch, gsn_possess );
      RemoveBit( ch->affected_by, AFF_POSSESS );
    }

  ch->desc->character       = ch->desc->original;
  ch->desc->original        = NULL;
  ch->desc->character->desc = ch->desc;
  ch->desc->character->switched = NULL;
  ch->desc                  = NULL;
}
