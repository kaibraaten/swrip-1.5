#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_leave(std::shared_ptr<Character> ch, std::string argument)
{
    if (argument.empty())
    {
        for (std::shared_ptr<Exit> ex : ch->InRoom->Exits())
        {
            if (ex->Flags.test(Flag::Exit::CanLeave))
            {
                MoveCharacter(ch, ex);
                return;
            }
        }

        do_leaveship(ch, "");
        return;
    }

    std::shared_ptr<Exit> pexit = FindDoor(ch, argument, true);

    if (pexit && pexit->Flags.test(Flag::Exit::CanLeave))
    {
        MoveCharacter(ch, pexit);
        return;
    }

    do_leaveship(ch, "");
}
