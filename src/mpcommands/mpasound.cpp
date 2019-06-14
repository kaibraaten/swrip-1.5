#include <cassert>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "exit.hpp"

/* Prints the argument to all the rooms around the mobile */
void do_mpasound(Character *ch, std::string argument)
{
    int mobflags = 0;

    assert(ch != nullptr);

    if (IsAffectedBy(ch, AFF_CHARM))
        return;

    if (!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if (argument.empty())
    {
        ProgBug("Mpasound - No argument", ch);
        return;
    }

    mobflags = ch->Flags;
    RemoveBit(ch->Flags, ACT_SECRETIVE);
    auto was_in_room = ch->InRoom;

    for (auto pexit : was_in_room->Exits())
    {
        if (pexit->ToRoom
            &&   pexit->ToRoom != was_in_room)
        {
            ch->InRoom = pexit->ToRoom;
            MOBtrigger = false;
            Act(AT_SAY, argument, ch, NULL, NULL, TO_ROOM);
        }
    }

    ch->Flags = mobflags;
    ch->InRoom = was_in_room;
}

