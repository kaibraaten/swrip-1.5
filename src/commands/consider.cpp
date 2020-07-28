#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"
#include "systemdata.hpp"

void do_consider(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;
    std::string msg;
    int diff = 0;

    if(arg.empty())
    {
        ch->Echo("Consider killing whom?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("They're not here.\r\n");
        return;
    }

    int charLevel = 0;
    int victimLevel = 0;

    if(SysData.TopLevelFromAbility)
    {
        charLevel = GetAbilityLevel(ch, AbilityClass::Combat);
        victimLevel = GetAbilityLevel(victim, AbilityClass::Combat);
    }
    else
    {
        charLevel = ch->TopLevel();
        victimLevel = victim->TopLevel();
    }
    
    diff = (victimLevel - charLevel) * 10;
    diff += (int)(victim->HitPoints.Max - ch->HitPoints.Max) / 10;

    if(diff <= -200)
        msg = "$N looks like a feather!";
    else if(diff <= -150)
        msg = "Hey! Where'd $N go?";
    else if(diff <= -100)
        msg = "Easy as picking off womp rats at beggers canyon!";
    else if(diff <= -50)
        msg = "$N is a wimp.";
    else if(diff <= 0)
        msg = "$N looks weaker than you.";
    else if(diff <= 50)
        msg = "$N looks about as strong as you.";
    else if(diff <= 100)
        msg = "It would take a bit of luck...";
    else if(diff <= 150)
        msg = "It would take a lot of luck, and a really big blaster!";
    else if(diff <= 200)
        msg = "Why don't you just attack a Star Destroyer with a vibroblade?";
    else
        msg = "$N is built like an AT-AT!";

    Act(AT_CONSIDER, msg, ch, NULL, victim, ActTarget::Char);
}

