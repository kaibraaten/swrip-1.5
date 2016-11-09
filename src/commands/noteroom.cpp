#include <string.h>
#include "mud.hpp"
#include "character.hpp"
#include "board.hpp"

void do_noteroom( Character *ch, char *argument )
{
  Board *board;
  char arg[MAX_STRING_LENGTH];
  char arg_passed[MAX_STRING_LENGTH];

  strcpy(arg_passed, argument);

  switch( ch->SubState )
    {
    case SUB_WRITING_NOTE:
      OperateOnNote(ch, arg_passed, false);
      break;

    default:

      argument = OneArgument(argument, arg);
      SmashTilde( argument );

      if (!StrCmp(arg, "write") || !StrCmp(arg, "to")
          || !StrCmp(arg, "subject") || !StrCmp(arg, "show"))
        {
          OperateOnNote(ch, arg_passed, false);
          return;
        }

      board = FindBoardHere( ch );

      if ( !board )
        {
          SendToCharacter( "There is no bulletin board here to look at.\r\n", ch );
          return;
        }

      if (board->Type != BOARD_NOTE)
        {
          SendToCharacter("You can only use note commands on a message terminal.\r\n", ch);
          return;
        }
      else
        {
          OperateOnNote(ch, arg_passed, false);
          return;
        }
    }
}
