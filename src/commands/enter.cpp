#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_enter(Character *ch, std::string argument)
{
    if (argument.empty())
    {
        for (std::shared_ptr<Exit> ex : ch->InRoom->Exits())
        {
            if (ex->Flags.test(Flag::Exit::CanEnter))
            {
                MoveCharacter(ch, ex);
                return;
            }
        }

        ch->Echo("You cannot find an entrance here.\r\n");
        return;
    }

    std::shared_ptr<Exit> pexit = FindDoor(ch, argument, true);

    if (pexit && pexit->Flags.test(Flag::Exit::CanEnter))
    {
        MoveCharacter(ch, pexit);
        return;
    }

    do_board(ch, argument);
}
