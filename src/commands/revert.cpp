#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"

void do_revert(std::shared_ptr<Character> ch, std::string argument)
{
    if(!IsNpc(ch) || !ch->Flags.test(Flag::Mob::Polymorphed))
    {
        ch->Echo("You are not polymorphed.\r\n");
        return;
    }

    ch->Flags.reset(Flag::Mob::Polymorphed);
    CharacterFromRoom(ch->Desc->Original);

    if(ch->Desc->Character)
    {
        auto mob = ch->Desc->Character;
        CharacterToRoom(ch->Desc->Original, ch->Desc->Character->InRoom);
        ch->Desc->Character = ch->Desc->Original;
        ch->Desc->Original = NULL;
        ch->Desc->Character->Desc = ch->Desc;
        ch->Desc->Character->Switched = NULL;
        ch->Desc = NULL;
        ExtractCharacter(mob, true);
        return;
    }

    ch->Desc->Character = ch->Desc->Original;
    ch->Desc->Original = NULL;
    ch->Desc->Character->Desc = ch->Desc;
    ch->Desc->Character->Switched = NULL;
    ch->Desc = NULL;
}
