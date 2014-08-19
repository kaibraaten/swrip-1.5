#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_remove_invis( int sn, int level, Character *ch, void *vo )
{
  Object *obj;
  Skill *skill = get_skilltype(sn);

  if ( spell_target_name[0] == '\0' )
    {
      SendToCharacter( "What should the spell be cast upon?\r\n", ch );
      return rSPELL_FAILED;
    }

  obj = GetCarriedObject( ch, spell_target_name );

  if ( obj )
    {
      if ( !IS_OBJ_STAT(obj, ITEM_INVIS) )
        return rSPELL_FAILED;

      RemoveBit(obj->extra_flags, ITEM_INVIS);
      Act( AT_MAGIC, "$p becomes visible again.", ch, obj, NULL, TO_CHAR );

      SendToCharacter( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    {
      Character *victim;

      victim = get_char_room(ch, spell_target_name);

      if (victim)
        {
          if(!CanSeeCharacter(ch, victim))
            {
              ChPrintf(ch, "You don't see %s!\r\n", spell_target_name);
	      return rSPELL_FAILED;
            }

          if ( victim->race == RACE_DEFEL )
            return rSPELL_FAILED;

          if(!IsAffectedBy(victim, AFF_INVISIBLE))
            {
              SendToCharacter("They are not invisible!\r\n", ch);
              return rSPELL_FAILED;
            }

          if( is_safe(ch, victim) )
            {
              failed_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }

          if ( IsBitSet( victim->immune, RIS_MAGIC ) )
            {
              immune_casting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
          if( !IsNpc(victim) )
            {
              if( chance(ch, 50) && GetAbilityLevel( ch, FORCE_ABILITY ) < victim->top_level )
                {
                  failed_casting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }

            }
          else
            {
              if( chance(ch, 50) && GetAbilityLevel( ch, FORCE_ABILITY ) + 15 < victim->top_level )
                {
                  failed_casting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }
            }

          affect_strip ( victim, gsn_invis                        );
          affect_strip ( victim, gsn_mass_invis                   );
          RemoveBit   ( victim->affected_by, AFF_INVISIBLE       );
          SendToCharacter( "Ok.\r\n", ch );
	  return rNONE;
        }

      ChPrintf(ch, "You can't find %s!\r\n", spell_target_name);
      return rSPELL_FAILED;
    }
}
