#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"

/* lets the mobile goto any location it wishes that is not private */

void do_mpgoto(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    OneArgument(argument, arg);

    if(arg.empty())
    {
        ProgBug("Mpgoto - No argument", ch);
        return;
    }

    std::shared_ptr<Room> location;

    if(arg[0] == '#')
    {
        location = GetRoomFromTag(arg.substr(1));
    }
    else
    {
        location = FindLocation(ch, arg);
    }
    
    if(location == nullptr)
    {
        ProgBug("Mpgoto - No such location", ch);
        return;
    }

    if(IsFighting(ch))
        StopFighting(ch, true);

    CharacterFromRoom(ch);
    CharacterToRoom(ch, location);
}
