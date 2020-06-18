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
ch_ret spell_area_attack(int sn, int level, std::shared_ptr<Character> ch, const Vo &vo)
{
    std::shared_ptr<Skill> skill = GetSkill(sn);
    bool saved = false;
    bool affects = false;
    int dam = 0;
    ch_ret retcode = rNONE;

    ch->Echo("You feel the hatred grow within you!\r\n");
    ch->Alignment -= 100;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ApplySithPenalty(ch);

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        FailedCasting(skill, ch, NULL, NULL);
        return rSPELL_FAILED;
    }

    affects = !skill->Affects.empty();

    if(!skill->Messages.Success.ToCaster.empty())
    {
        Act(AT_MAGIC, skill->Messages.Success.ToCaster, ch, NULL, NULL, ActTarget::Char);
    }

    if(!skill->Messages.Success.ToRoom.empty())
    {
        Act(AT_MAGIC, skill->Messages.Success.ToRoom, ch, NULL, NULL, ActTarget::Room);
    }

    auto charactersToAttack = ch->InRoom->Characters();

    for(auto vch : charactersToAttack)
    {
        if(!IsNpc(vch) && vch->Flags.test(Flag::Plr::WizInvis)
           && vch->PCData->WizInvis >= LEVEL_IMMORTAL)
        {
            continue;
        }

        if(vch != ch && (IsNpc(ch) ? !IsNpc(vch) : IsNpc(vch)))
        {
            saved = CheckSavingThrow(sn, level, ch, vch);

            if(saved && !SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
            {
                FailedCasting(skill, ch, vch, NULL);
                dam = 0;
            }
            else if(!skill->Dice.empty())
            {
                dam = ParseDice(ch, level, skill->Dice);
            }
            else
            {
                dam = RollDice(1, level);
            }

            if(saved && SPELL_FLAG(skill, SF_SAVE_HALF_DAMAGE))
            {
                dam /= 2;
            }

            if(IsAffectedBy(vch, Flag::Affect::Protect) && IsEvil(ch))
            {
                dam -= static_cast<int>(dam / 4);
            }

            retcode = InflictDamage(ch, vch, dam, sn);
        }

        if(retcode == rNONE
           && affects
           && !CharacterDiedRecently(ch)
           && !CharacterDiedRecently(vch))
        {
            retcode = spell_affectchar(sn, level, ch, vch);
        }

        if(retcode == rCHAR_DIED || CharacterDiedRecently(ch))
        {
            break;
        }
    }

    return retcode;
}

