#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "object.hpp"
#include "act.hpp"

extern std::string spell_target_name;

ch_ret spell_invis(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Character> victim;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    /* Modifications on 1/2/96 to work on player/object - Scryn */

    if(spell_target_name.empty())
        victim = ch;
    else
        victim = GetCharacterInRoom(ch, spell_target_name);

    if(victim)
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();

        if(victim->Immune.test(Flag::Ris::Magic))
        {
            ImmuneCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        if(IsAffectedBy(victim, Flag::Affect::Invisible))
        {
            FailedCasting(skill, ch, victim, NULL);
            return rSPELL_FAILED;
        }

        Act(AT_MAGIC, "A momentary lapse in attention, and $n fades out of sight.", victim, NULL, NULL, ActTarget::Room);
        af->Type = sn;
        af->Duration = ((level / 4) + 12) * DUR_CONV;
        af->Location = APPLY_NONE;
        af->Modifier = 0;
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Invisible });
        AffectToCharacter(victim, af);
        Act(AT_MAGIC, "You fade out of existence.", victim, NULL, NULL, ActTarget::Char);
        return rNONE;
    }
    else
    {
        auto obj = GetCarriedObject(ch, spell_target_name);

        if(obj)
        {
            if(obj->Flags.test(Flag::Obj::Invis)
               || Chance(ch, 40 + level / 10))
            {
                FailedCasting(skill, ch, NULL, NULL);
                return rSPELL_FAILED;
            }

            obj->Flags.set(Flag::Obj::Invis);
            Act(AT_MAGIC, "$p fades out of existence.", ch, obj, NULL, ActTarget::Char);
            return rNONE;
        }
    }

    ch->Echo("You can't find %s!\r\n", spell_target_name.c_str());
    return rSPELL_FAILED;
}

