#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"

void do_visible( Character *ch, char *argument )
{
  StripAffect( ch, gsn_invis );
  StripAffect( ch, gsn_mass_invis );
  StripAffect( ch, gsn_sneak );

  if (ch->Race != RACE_DEFEL) /* Defel has perm hide */
    RemoveBit( ch->AffectedBy, AFF_HIDE );

  RemoveBit( ch->AffectedBy, AFF_INVISIBLE );

  if ( !HasPermanentSneak(ch) ) /* Noghri has perm sneak */
    RemoveBit( ch->AffectedBy, AFF_SNEAK );

  SendToCharacter( "Ok.\r\n", ch );
}
