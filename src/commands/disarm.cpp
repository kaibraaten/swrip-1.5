#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_disarm(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    std::shared_ptr<Object> obj;
    int percent = 0;

    if(IsNpc(ch) && IsAffectedBy(ch, Flag::Affect::Charm))
    {
        ch->Echo("You can't concentrate enough for that.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && GetSkillLevel(ch, gsn_disarm) <= 0)
    {
        ch->Echo("You don't know how to disarm opponents.\r\n");
        return;
    }

    if(GetEquipmentOnCharacter(ch, WEAR_WIELD) == NULL)
    {
        ch->Echo("You must wield a weapon to disarm.\r\n");
        return;
    }

    if((victim = WhoFighting(ch)) == nullptr)
    {
        ch->Echo("You aren't fighting anyone.\r\n");
        return;
    }

    if((obj = GetEquipmentOnCharacter(victim, WEAR_WIELD)) == NULL)
    {
        ch->Echo("Your opponent is not wielding a weapon.\r\n");
        return;
    }

    SetWaitState(ch, SkillTable[gsn_disarm]->Beats);
    percent = GetRandomPercent()
        + GetAbilityLevel(victim, AbilityClass::Combat)
        - GetAbilityLevel(ch, AbilityClass::Combat)
        - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 15);

    if(!CanSeeObject(ch, obj))
        percent += 10;

    if(IsNpc(ch) || percent < GetSkillLevel(ch, gsn_disarm) * 2 / 3)
    {
        Disarm(ch, victim);
    }
    else
    {
        ch->Echo("You failed.\r\n");
        LearnFromFailure(ch, gsn_disarm);
    }
}
