#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_climb(std::shared_ptr<Character> ch, std::string argument)
{
    if (argument.empty())
    {
        for (std::shared_ptr<Exit> ex : ch->InRoom->Exits())
        {
            if (ex->Flags.test(Flag::Exit::CanClimb))
            {
                MoveCharacter(ch, ex);
                return;
            }
        }

        ch->Echo("You cannot climb here.\r\n");
        return;
    }

    std::shared_ptr<Exit> pexit = FindDoor(ch, argument, true);

    if (pexit && pexit->Flags.test(Flag::Exit::CanClimb))
    {
        MoveCharacter(ch, pexit);
        return;
    }

    ch->Echo("You cannot climb there.\r\n");
}
