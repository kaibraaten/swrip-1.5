#include "mud.hpp"
#include "character.hpp"

void do_at(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Room> location;

    argument = OneArgument(argument, arg);

    if (arg.empty() || argument.empty())
    {
        ch->Echo("At where what?\r\n");
        return;
    }

    if ((location = FindLocation(ch, arg)) == NULL)
    {
        ch->Echo("No such location.\r\n");
        return;
    }

    if (GetTrustLevel(ch) < LEVEL_GREATER)
    {
        if (IsRoomPrivate(ch, location))
        {
            ch->Echo("That room is private right now.\r\n");
            return;
        }
    }

    if (IsRoomPrivate(ch, location))
    {
        ch->Echo("Overriding private flag!\r\n");
    }

    std::shared_ptr<Room> original = ch->InRoom;
    CharacterFromRoom(ch);
    CharacterToRoom(ch, location);
    Interpret(ch, argument);

    /*
     * See if 'ch' still exists before continuing!
     * Handles 'at XXXX quit' case.
     */
    for (auto wch = FirstCharacter; wch; wch = wch->Next)
    {
        if (wch == ch)
        {
            CharacterFromRoom(ch);
            CharacterToRoom(ch, original);
            break;
        }
    }
}

