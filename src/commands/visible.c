#include "character.h"
#include "mud.h"

void do_visible( Character *ch, char *argument )
{
  affect_strip ( ch, gsn_invis                  );
  affect_strip ( ch, gsn_mass_invis                     );
  affect_strip ( ch, gsn_sneak                  );

  if (ch->race != RACE_DEFEL) /* Defel has perm hide */
    RemoveBit   ( ch->affected_by, AFF_HIDE            );

  RemoveBit   ( ch->affected_by, AFF_INVISIBLE );

  if ( !permsneak(ch) ) /* Noghri has perm sneak */
    RemoveBit   ( ch->affected_by, AFF_SNEAK           );

  send_to_char( "Ok.\r\n", ch );
}
