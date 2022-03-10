#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

ch_ret spell_earthquake(int sn, int level, std::shared_ptr<Character> caster, const Vo &vo)
{
    bool ch_died = false;
    ch_ret retcode = rNONE;
    std::shared_ptr<Skill> skill = GetSkill(sn);

    if (caster->InRoom->Flags.test(Flag::Room::Safe))
    {
        FailedCasting(skill, caster, NULL, NULL);
        return rSPELL_FAILED;
    }

    caster->Echo("You feel the hatred grow within you!\r\n");
    caster->Alignment = caster->Alignment - 100;
    caster->Alignment = urange(-1000, caster->Alignment, 1000);
    ApplySithPenalty(caster);


    Act(AT_MAGIC, "The earth trembles beneath your feet!", caster, NULL, NULL, ActTarget::Char);
    Act(AT_MAGIC, "$n makes the earth tremble and shiver.", caster, NULL, NULL, ActTarget::Room);

    for (std::shared_ptr<Character> vch = FirstCharacter, vch_next; vch; vch = vch_next)
    {
        vch_next = vch->Next;

        if (!vch->InRoom)
        {
            continue;
        }

        if (vch->InRoom == caster->InRoom)
        {
            if (!IsNpc(vch) && vch->Flags.test(Flag::Plr::WizInvis)
                && vch->PCData->WizInvis >= LEVEL_IMMORTAL)
            {
                continue;
            }

            if (IsAffectedBy(vch, Flag::Affect::Floating)
                || IsAffectedBy(vch, Flag::Affect::Flying))
            {
                continue;
            }

            if (caster == vch)
            {
                continue;
            }

            retcode = InflictDamage(caster, vch, level + RollDice(2, 8), sn);

            if (retcode == rCHAR_DIED || CharacterDiedRecently(caster))
            {
                ch_died = true;
                continue;
            }

            if (CharacterDiedRecently(vch))
            {
                continue;
            }
        }

        if (!ch_died && vch->InRoom->Area == caster->InRoom->Area)
        {
            SetCharacterColor(AT_MAGIC, vch);
            vch->Echo("The earth trembles and shivers.\r\n");
        }
    }

    if (ch_died)
    {
        return rCHAR_DIED;
    }
    else
    {
        return rNONE;
    }
}

