#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_remove_invis( int sn, int level, CHAR_DATA *ch, void *vo )
{
  OBJ_DATA *obj;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( spell_target_name[0] == '\0' )
    {
      send_to_char( "What should the spell be cast upon?\r\n", ch );
      return rSPELL_FAILED;
    }

  obj = get_obj_carry( ch, spell_target_name );

  if ( obj )
    {
      if ( !IS_OBJ_STAT(obj, ITEM_INVIS) )
        return rSPELL_FAILED;

      REMOVE_BIT(obj->extra_flags, ITEM_INVIS);
      act( AT_MAGIC, "$p becomes visible again.", ch, obj, NULL, TO_CHAR );

      send_to_char( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    {
      CHAR_DATA *victim;

      victim = get_char_room(ch, spell_target_name);

      if (victim)
        {
          if(!can_see(ch, victim))
            {
              ch_printf(ch, "You don't see %s!\r\n", spell_target_name);
	      return rSPELL_FAILED;
            }

          if ( victim->race == RACE_DEFEL )
            return rSPELL_FAILED;

          if(!is_affected_by(victim, AFF_INVISIBLE))
            {
              send_to_char("They are not invisible!\r\n", ch);
              return rSPELL_FAILED;
            }

          if( is_safe(ch, victim) )
            {
              failed_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }

          if ( IS_SET( victim->immune, RIS_MAGIC ) )
            {
              immune_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
          if( !is_npc(victim) )
            {
              if( chance(ch, 50) && get_level( ch, FORCE_ABILITY ) < victim->top_level )
                {
                  failed_casting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }

            }
          else
            {
              if( chance(ch, 50) && get_level( ch, FORCE_ABILITY ) + 15 < victim->top_level )
                {
                  failed_casting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }
            }

          affect_strip ( victim, gsn_invis                        );
          affect_strip ( victim, gsn_mass_invis                   );
          REMOVE_BIT   ( victim->affected_by, AFF_INVISIBLE       );
          send_to_char( "Ok.\r\n", ch );
	  return rNONE;
        }

      ch_printf(ch, "You can't find %s!\r\n", spell_target_name);
      return rSPELL_FAILED;
    }
}
