#include "character.hpp"
#include "mud.h"
#include "skill.h"

extern char *spell_target_name;

ch_ret spell_remove_invis( int sn, int level, Character *ch, void *vo )
{
  Object *obj;
  Skill *skill = GetSkill(sn);

  if ( IsNullOrEmpty( spell_target_name ) )
    {
      SendToCharacter( "What should the spell be cast upon?\r\n", ch );
      return rSPELL_FAILED;
    }

  obj = GetCarriedObject( ch, spell_target_name );

  if ( obj )
    {
      if ( !IS_OBJ_STAT(obj, ITEM_INVIS) )
        return rSPELL_FAILED;

      RemoveBit(obj->Flags, ITEM_INVIS);
      Act( AT_MAGIC, "$p becomes visible again.", ch, obj, NULL, TO_CHAR );

      SendToCharacter( "Ok.\r\n", ch );
      return rNONE;
    }
  else
    {
      Character *victim;

      victim = GetCharacterInRoom(ch, spell_target_name);

      if (victim)
        {
          if(!CanSeeCharacter(ch, victim))
            {
              Echo(ch, "You don't see %s!\r\n", spell_target_name);
	      return rSPELL_FAILED;
            }

          if ( victim->Race == RACE_DEFEL )
            return rSPELL_FAILED;

          if(!IsAffectedBy(victim, AFF_INVISIBLE))
            {
              SendToCharacter("They are not invisible!\r\n", ch);
              return rSPELL_FAILED;
            }

          if( IsSafe(ch, victim) )
            {
              FailedCasting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }

          if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
            {
              ImmuneCasting( skill, ch, victim, NULL );
              return rSPELL_FAILED;
            }
          if( !IsNpc(victim) )
            {
              if( Chance(ch, 50) && GetAbilityLevel( ch, FORCE_ABILITY ) < victim->TopLevel )
                {
                  FailedCasting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }

            }
          else
            {
              if( Chance(ch, 50) && GetAbilityLevel( ch, FORCE_ABILITY ) + 15 < victim->TopLevel )
                {
                  FailedCasting( skill, ch, victim, NULL );
                  return rSPELL_FAILED;
                }
            }

          StripAffect ( victim, gsn_invis                        );
          StripAffect ( victim, gsn_mass_invis                   );
          RemoveBit   ( victim->AffectedBy, AFF_INVISIBLE       );
          SendToCharacter( "Ok.\r\n", ch );
	  return rNONE;
        }

      Echo(ch, "You can't find %s!\r\n", spell_target_name);
      return rSPELL_FAILED;
    }
}
