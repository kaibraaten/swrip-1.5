#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_invis( int sn, int level, CHAR_DATA *ch, void *vo )
{
  CHAR_DATA *victim;
  SKILLTYPE *skill = get_skilltype(sn);

  /* Modifications on 1/2/96 to work on player/object - Scryn */

  if (spell_target_name[0] == '\0')
    victim = ch;
  else
    victim = get_char_room(ch, spell_target_name);

  if( victim )
    {
      AFFECT_DATA af;

      if ( IS_SET( victim->immune, RIS_MAGIC ) )
        {
          immune_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( IS_AFFECTED(victim, AFF_INVISIBLE) )
        {
          failed_casting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      act( AT_MAGIC, "A momentary lapse in attention, and $n fades out of sight.", victim, NULL, NULL, TO_ROOM );
      af.type      = sn;
      af.duration  = ((level / 4) + 12) * DUR_CONV;
      af.location  = APPLY_NONE;
      af.modifier  = 0;
      af.bitvector = AFF_INVISIBLE;
      affect_to_char( victim, &af );
      act( AT_MAGIC, "You fade out of existence.", victim, NULL, NULL, TO_CHAR );
      return rNONE;
    }
  else
    {
      OBJ_DATA *obj;

      obj = get_obj_carry( ch, spell_target_name );

      if (obj)
        {
          if ( IS_OBJ_STAT(obj, ITEM_INVIS)
               ||   chance(ch, 40 + level / 10))
            {
              failed_casting( skill, ch, NULL, NULL );
              return rSPELL_FAILED;
            }

          SET_BIT( obj->extra_flags, ITEM_INVIS );
          act( AT_MAGIC, "$p fades out of existence.", ch, obj, NULL, TO_CHAR );
          return rNONE;
        }
    }
  ch_printf(ch, "You can't find %s!\r\n", spell_target_name);
  return rSPELL_FAILED;
}
