#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"

void do_mailroom(std::shared_ptr<Character> ch, std::string argument)
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
        OperateOnNote(ch, arg_passed, true);
        return;
    }

    auto board = FindBoardHere( ch );

    if (board == nullptr)
    {
        ch->Echo("There is no mail facility here.\r\n");
        return;
    }

    if (board->Type != BOARD_MAIL)
    {
        ch->Echo("You can only use mail commands in a post office.\r\n");
        return;
    }
    else
    {
        OperateOnNote(ch, arg_passed, true);
        return;
    }
}
