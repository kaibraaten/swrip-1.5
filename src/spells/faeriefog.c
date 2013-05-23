#include "character.h"
#include "mud.h"

ch_ret spell_faerie_fog( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *ich;

  act( AT_MAGIC, "$n conjures a cloud of purple smoke.", ch, NULL, NULL, TO_ROOM );
  act( AT_MAGIC, "You conjure a cloud of purple smoke.", ch, NULL, NULL, TO_CHAR );

  for ( ich = ch->in_room->first_person; ich; ich = ich->next_in_room )
    {
      if ( !is_npc(ich) && IS_SET(ich->act, PLR_WIZINVIS) )
        continue;

      if ( ich == ch || saves_spell_staff( level, ich ) )
        continue;

      affect_strip ( ich, gsn_invis                     );
      affect_strip ( ich, gsn_mass_invis                );
      affect_strip ( ich, gsn_sneak                     );
      if ( ich->race != RACE_DEFEL )
        REMOVE_BIT   ( ich->affected_by, AFF_HIDE       );
      REMOVE_BIT   ( ich->affected_by, AFF_INVISIBLE    );
      if ( !permsneak(ich) )
        REMOVE_BIT   ( ich->affected_by, AFF_SNEAK      );
      act( AT_MAGIC, "$n is revealed!", ich, NULL, NULL, TO_ROOM );
      act( AT_MAGIC, "You are revealed!", ich, NULL, NULL, TO_CHAR );
    }
  return rNONE;
}
