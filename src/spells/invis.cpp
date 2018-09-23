#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"

extern std::string spell_target_name;

ch_ret spell_invis( int sn, int level, Character *ch, void *vo )
{
  Character *victim = nullptr;
  Skill *skill = GetSkill(sn);

  /* Modifications on 1/2/96 to work on player/object - Scryn */

  if ( spell_target_name.empty() )
    victim = ch;
  else
    victim = GetCharacterInRoom(ch, spell_target_name);

  if( victim )
    {
      Affect af;

      if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
        {
          ImmuneCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      if ( IsAffectedBy(victim, AFF_INVISIBLE) )
        {
          FailedCasting( skill, ch, victim, NULL );
          return rSPELL_FAILED;
        }

      Act( AT_MAGIC, "A momentary lapse in attention, and $n fades out of sight.", victim, NULL, NULL, TO_ROOM );
      af.Type      = sn;
      af.Duration  = ((level / 4) + 12) * DUR_CONV;
      af.Location  = APPLY_NONE;
      af.Modifier  = 0;
      af.AffectedBy = AFF_INVISIBLE;
      AffectToCharacter( victim, &af );
      Act( AT_MAGIC, "You fade out of existence.", victim, NULL, NULL, TO_CHAR );
      return rNONE;
    }
  else
    {
      Object *obj;

      obj = GetCarriedObject( ch, spell_target_name );

      if (obj)
        {
          if ( IsBitSet( obj->Flags, ITEM_INVIS )
               || Chance(ch, 40 + level / 10))
            {
              FailedCasting( skill, ch, NULL, NULL );
              return rSPELL_FAILED;
            }

          SetBit( obj->Flags, ITEM_INVIS );
          Act( AT_MAGIC, "$p fades out of existence.", ch, obj, NULL, TO_CHAR );
          return rNONE;
        }
    }

  ch->Echo("You can't find %s!\r\n", spell_target_name.c_str());
  return rSPELL_FAILED;
}

