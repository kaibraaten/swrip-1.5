#include "mud.hpp"
#include "character.hpp"

/* lets the mobile do a command at another location. Very useful */

void do_mpat(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::shared_ptr<Room> location;
    std::shared_ptr<Room> original;

    if(IsAffectedBy(ch, Flag::Affect::Charm))
        return;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(arg.empty() || argument.empty())
    {
        ProgBug("Mpat - Bad argument", ch);
        return;
    }

    if((location = FindLocation(ch, arg)) == NULL)
    {
        ProgBug("Mpat - No such location", ch);
        return;
    }

    original = ch->InRoom;
    CharacterFromRoom(ch);
    CharacterToRoom(ch, location);
    Interpret(ch, argument);

    /*
     * See if 'ch' still exists before continuing!
     * Handles 'at XXXX quit' case.
     */
    for(auto wch = FirstCharacter; wch; wch = wch->Next)
    {
        if(wch == ch)
        {
            CharacterFromRoom(ch);
            CharacterToRoom(ch, original);
            break;
        }
    }
}
