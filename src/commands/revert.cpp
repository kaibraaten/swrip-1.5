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

    if(ch->Desc->Char)
    {
        auto mob = ch->Desc->Char;
        CharacterToRoom(ch->Desc->Original, ch->Desc->Char->InRoom);
        ch->Desc->Char = ch->Desc->Original;
        ch->Desc->Original = NULL;
        ch->Desc->Char->Desc = ch->Desc;
        ch->Desc->Char->Switched = NULL;
        ch->Desc = NULL;
        ExtractCharacter(mob, true);
        return;
    }

    ch->Desc->Char = ch->Desc->Original;
    ch->Desc->Original = NULL;
    ch->Desc->Char->Desc = ch->Desc;
    ch->Desc->Char->Switched = NULL;
    ch->Desc = NULL;
}
