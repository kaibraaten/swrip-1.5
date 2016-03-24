#include "character.h"
#include "mud.h"
#include "skill.h"

void do_visible( Character *ch, char *argument )
{
  StripAffect ( ch, gsn_invis                  );
  StripAffect ( ch, gsn_mass_invis                     );
  StripAffect ( ch, gsn_sneak                  );

  if (ch->race != RACE_DEFEL) /* Defel has perm hide */
    RemoveBit   ( ch->affected_by, AFF_HIDE            );

  RemoveBit   ( ch->affected_by, AFF_INVISIBLE );

  if ( !HasPermanentSneak(ch) ) /* Noghri has perm sneak */
    RemoveBit   ( ch->affected_by, AFF_SNEAK           );

  SendToCharacter( "Ok.\r\n", ch );
}
