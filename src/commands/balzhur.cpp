#include <string.h>
#include <errno.h>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_balzhur(std::shared_ptr<Character> ch, std::string arg)
{
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Who is deserving of such a fate?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL)
    {
        ch->Echo("They aren't playing.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if(GetTrustLevel(victim) >= GetTrustLevel(ch))
    {
        ch->Echo("I wouldn't even think of that if I were you...\r\n");
        return;
    }

    SetCharacterColor(AT_WHITE, ch);
    ch->Echo("You summon the demon Balzhur to wreak your wrath!\r\n");
    ch->Echo("Balzhur sneers at you evilly, then vanishes in a puff of smoke.\r\n");
    SetCharacterColor(AT_IMMORT, victim);
    victim->Echo("You hear an ungodly sound in the distance that makes your blood run cold!\r\n");
    sprintf(buf, "Balzhur screams, 'You are MINE %s!!!'", victim->Name.c_str());
    EchoToAll(AT_IMMORT, buf, ECHOTAR_ALL);
    victim->TopLevel = 1;
    victim->Trust = 0;

    for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
    {
        SetAbilityXP(victim, AbilityClass(ability), 1);
        SetAbilityLevel(victim, AbilityClass(ability), 1);
    }

    victim->HitPoints.Max = 500;
    victim->Mana.Max = 0;
    victim->Fatigue.Max = 1000;

    victim->PCData->Learned.fill(0);

    victim->HitPoints.Current = victim->HitPoints.Max;
    victim->Mana.Current = victim->Mana.Max;
    victim->Fatigue.Current = victim->Fatigue.Max;

    MakeWizlist();
    do_help(victim, "M_BALZHUR_");
    SetCharacterColor(AT_WHITE, victim);
    victim->Echo("You awake after a long period of time...\r\n");

    while(!victim->Objects().empty())
    {
        ExtractObject(victim->Objects().front());
    }
}
