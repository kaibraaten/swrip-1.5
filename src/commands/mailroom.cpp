#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"

void do_mailroom(Character *ch, std::string argument)
{
  Board *board = nullptr;
  std::string arg;
  std::string arg_passed = argument;

  switch( ch->SubState )
    {
    case SUB_WRITING_NOTE:
      OperateOnNote(ch, arg_passed, true);
      break;

    default:
      argument = OneArgument(argument, arg);
      SmashTilde( argument );

      if (!StrCmp(arg, "write")
          || !StrCmp(arg, "to")
          || !StrCmp(arg, "subject")
          || !StrCmp(arg, "show"))
        {
          OperateOnNote(ch, arg_passed, true);
          return;
        }

      board = FindBoardHere( ch );

      if ( !board )
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
}
