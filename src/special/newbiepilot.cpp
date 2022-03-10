#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

bool spec_newbie_pilot(std::shared_ptr<Character> mob)
{
    auto newbies = Filter(mob->InRoom->Characters(),
                          [](auto victim)
                          {
                              return !IsNpc(victim)
                                  && victim->Position != POS_FIGHTING
                                  && HasDiploma(victim);
                          });

    for(auto victim : newbies)
    {
        victim->Echo("After a brief journey you arrive at Coruscant's Manari Spaceport.\r\n\r\n");

        CharacterFromRoom(victim);
        CharacterToRoom(victim, GetRoom(ROOM_START_PLAYER));

        do_look(victim, "");

        char buf[MAX_STRING_LENGTH];
        sprintf(buf, "%s steps out and the shuttle quickly returns to the academy.\r\n",
                victim->Name.c_str());
        EchoToRoom(AT_ACTION, mob->InRoom, buf);
    }

    return false;
}

