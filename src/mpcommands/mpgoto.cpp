#include "mud.hpp"
#include "character.hpp"

/* lets the mobile goto any location it wishes that is not private */

void do_mpgoto(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Room> location;

    if (IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if (!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    OneArgument(argument, arg);

    if (arg.empty())
    {
        ProgBug("Mpgoto - No argument", ch);
        return;
    }

    if ((location = FindLocation(ch, arg)) == NULL)
    {
        ProgBug("Mpgoto - No such location", ch);
        return;
    }

    if (ch->Fighting)
        StopFighting(ch, true);

    CharacterFromRoom(ch);
    CharacterToRoom(ch, location);
}
