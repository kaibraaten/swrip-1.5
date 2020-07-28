#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_immortalize(std::shared_ptr<Character> ch, std::string arg)
{
    std::shared_ptr<Character> victim;

    if(arg.empty())
    {
        ch->Echo("Syntax: immortalize <char>\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg)) == NULL)
    {
        ch->Echo("That player is not here.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if(victim->TopLevel() != LEVEL_AVATAR)
    {
        ch->Echo("This player is not worthy of immortality yet.\r\n");
        return;
    }

    ch->Echo("Immortalizing a player...\r\n");
    SetCharacterColor(AT_IMMORT, victim);
    Act(AT_IMMORT, "$n begins to chant softly... then raises $s arms to the sky...",
        ch, NULL, NULL, ActTarget::Room);
    SetCharacterColor(AT_WHITE, victim);
    victim->Echo("You suddenly feel very strange...\r\n\r\n");
    SetCharacterColor(AT_LBLUE, victim);

    do_help(victim, "M_GODLVL1_");
    SetCharacterColor(AT_WHITE, victim);
    victim->Echo("You awake... all your possessions are gone.\r\n");

    while(!victim->Objects().empty())
    {
        ExtractObject(victim->Objects().front());
    }

    victim->TopLevel(LEVEL_IMMORTAL);
    victim->Trust = 0;
}


