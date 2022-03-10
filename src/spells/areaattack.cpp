#include <list>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

/*
 * Generic area attack                                          -Thoric
 */
ch_ret spell_area_attack(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    bool saved = false;
    bool affects = false;
    int dam = 0;
    ch_ret retcode = rNONE;

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment -= 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);

    if(caster->InRoom->Flags.test(Flag::Room::Safe))
    {
        FailedCasting(skill, caster, NULL, NULL);
        return rSPELL_FAILED;
    }

    affects = !skill->Affects.empty();

    if(!skill->Messages.Success.ToCaster.empty())
    {
        Act(AT_MAGIC, skill->Messages.Success.ToCaster, caster, NULL, NULL, ActTarget::Char);
    }

    if(!skill->Messages.Success.ToRoom.empty())
    {
        Act(AT_MAGIC, skill->Messages.Success.ToRoom, caster, NULL, NULL, ActTarget::Room);
    }

    auto charactersToAttack = caster->InRoom->Characters();

    for(auto vch : charactersToAttack)
    {
        if(!IsNpc(vch) && vch->Flags.test(Flag::Plr::WizInvis)
           && vch->PCData->WizInvis >= LEVEL_IMMORTAL)
        {
            continue;
        }

        if(vch != caster && (IsNpc(caster) ? !IsNpc(vch) : IsNpc(vch)))
        {
            saved = CheckSavingThrow(sn, level, caster, vch);

            if(saved && !SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
            {
                FailedCasting(skill, caster, vch, NULL);
                dam = 0;
            }
            else if(!skill->Dice.empty())
            {
                dam = ParseDice(caster, level, skill->Dice);
            }
            else
            {
                dam = RollDice(1, level);
            }

            if(saved && SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
            {
                dam /= 2;
            }

            if(IsAffectedBy(vch, Flag::Affect::Protect) && IsEvil(caster))
            {
                dam -= static_cast<int>(dam / 4);
            }

            retcode = InflictDamage(caster, vch, dam, sn);
        }

        if(retcode == rNONE
           && affects
           && !CharacterDiedRecently(caster)
           && !CharacterDiedRecently(vch))
        {
            retcode = spell_affectchar(sn, level, caster, vch);
        }

        if(retcode == rCHAR_DIED || CharacterDiedRecently(caster))
        {
            break;
        }
    }

    return retcode;
}

