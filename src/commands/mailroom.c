#include <string.h>
#include "mud.h"
#include "character.h"

void do_mailroom(Character *ch, char *argument)
{
  Board *board;
  char arg[MAX_STRING_LENGTH];
  char arg_passed[MAX_STRING_LENGTH];

  strcpy(arg_passed, argument);

  switch( ch->substate )
    {
    case SUB_WRITING_NOTE:
      OperateOnNote(ch, arg_passed, true);
      break;

    default:

      argument = OneArgument(argument, arg);
      SmashTilde( argument );

      if (!StrCmp(arg, "write") || !StrCmp(arg, "to")
          ||  !StrCmp(arg, "subject") || !StrCmp(arg, "show"))
        {
          OperateOnNote(ch, arg_passed, true);
          return;
        }

      board = FindBoardHere( ch );

      if ( !board )
        {
          SendToCharacter( "There is no mail facility here.\r\n", ch );
          return;
        }

      if (board->type != BOARD_MAIL)
        {
          SendToCharacter("You can only use mail commands in a post office.\r\n", ch);
          return;
        }
      else
        {
          OperateOnNote(ch, arg_passed, true);
          return;
        }
    }
}
