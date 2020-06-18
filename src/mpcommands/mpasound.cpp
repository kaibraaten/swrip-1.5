#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound(std::shared_ptr<Character> ch, std::string argument)
{
    assert(ch != nullptr);

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(argument.empty())
    {
        ProgBug("Mpasound - No argument", ch);
        return;
    }

    auto mobflags = ch->Flags;
    ch->Flags.reset(Flag::Mob::Secretive);
    auto was_in_room = ch->InRoom;

    for(auto pexit : was_in_room->Exits())
    {
        if(pexit->ToRoom
           && pexit->ToRoom != was_in_room)
        {
            ch->InRoom = pexit->ToRoom;
            MOBtrigger = false;
            Act(AT_SAY, argument, ch, NULL, NULL, ActTarget::Room);
        }
    }

    ch->Flags = mobflags;
    ch->InRoom = was_in_room;
}

