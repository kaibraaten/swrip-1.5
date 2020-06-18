#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"

void do_noteroom( std::shared_ptr<Character> ch, std::string argument )
{
    std::string arg;
    std::string arg_passed = argument;

    argument = OneArgument(argument, arg);
    SmashTilde( argument );

    if (StrCmp(arg, "write") == 0
        || StrCmp(arg, "to") == 0
        || StrCmp(arg, "subject") == 0
        || StrCmp(arg, "show") == 0)
    {
        OperateOnNote(ch, arg_passed, false);
        return;
    }

    auto board = FindBoardHere( ch );

    if (board == nullptr)
    {
        ch->Echo("There is no bulletin board here to look at.\r\n");
        return;
    }

    if (board->Type != BOARD_NOTE)
    {
        ch->Echo("You can only use note commands on a message terminal.\r\n");
        return;
    }
    else
    {
        OperateOnNote(ch, arg_passed, false);
        return;
    }
}
