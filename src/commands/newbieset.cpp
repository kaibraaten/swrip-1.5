#include "character.hpp"
#include "mud.hpp"
#include "act.hpp"

void do_newbieset(std::shared_ptr<Character> ch, std::string arg1)
{
    std::shared_ptr<Character> victim;

    if(arg1.empty())
    {
        ch->Echo("Syntax: newbieset <char>\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg1)) == NULL)
    {
        ch->Echo("That player is not here.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("Not on NPC's.\r\n");
        return;
    }

    if((victim->TopLevel < 1) || (victim->TopLevel > 5))
    {
        ch->Echo("Level of victim must be 1 to 5.\r\n");
        return;
    }

    auto obj = CreateObject(GetProtoObject(OBJ_VNUM_SCHOOL_GLOWROD), 1);
    ObjectToCharacter(obj, victim);

    obj = CreateObject(GetProtoObject(OBJ_VNUM_SCHOOL_BLADE), 1);
    ObjectToCharacter(obj, victim);

    Act(AT_IMMORT, "$n has equipped you with a newbieset.", ch, nullptr, victim, ActTarget::Vict);
    ch->Echo("You have re-equipped %s.\r\n", victim->Name.c_str());
}
