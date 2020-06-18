#include <utility/algorithms.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

/* lets the mobile transfer people.  the all argument transfers
   everyone in the current room to the specified location */

void do_mptransfer(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Room> location;
    std::shared_ptr<Character> victim;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty())
    {
        ProgBug("Mptransfer - Bad syntax", ch);
        return;
    }

    /* Put in the variable nextinroom to make this work right. -Narn */
    if(!StrCmp(arg1, "all"))
    {
        auto charactersToTransfer = Filter(ch->InRoom->Characters(),
                                           [ch](auto candidate)
                                           {
                                               return candidate != ch
                                                   && IsAuthed(candidate)
                                                   && CanSeeCharacter(ch, candidate);
                                           });

        for(auto transferee : charactersToTransfer)
        {
            sprintf(buf, "%s %s", transferee->Name.c_str(), arg2.c_str());
            do_mptransfer(ch, buf);
        }

        return;
    }

    /*
     * Thanks to Grodyn for the optional location parameter.
     */
    if(arg2.empty())
    {
        location = ch->InRoom;
    }
    else
    {
        if((location = FindLocation(ch, arg2)) == NULL)
        {
            ProgBug("Mptransfer - No such location", ch);
            return;
        }

        if(IsRoomPrivate(ch, location))
        {
            ProgBug("Mptransfer - Private room", ch);
            return;
        }
    }

    if((victim = GetCharacterAnywhere(ch, arg1)) == NULL)
    {
        ProgBug("Mptransfer - No such person", ch);
        return;
    }

    if(!victim->InRoom)
    {
        ProgBug("Mptransfer - Victim in Limbo", ch);
        return;
    }

    if(!IsAuthed(victim) && location->Area != victim->InRoom->Area)
    {
        ProgBug("Mptransfer - transferring unauthorized player", ch);
        return;
    }


    /* If victim not in area's level range, do not transfer */
    if(!InHardRange(victim, location->Area)
       && location->Flags.test(Flag::Room::Prototype))
        return;

    if(victim->Fighting)
        StopFighting(victim, true);

    CharacterFromRoom(victim);
    CharacterToRoom(victim, location);
}
