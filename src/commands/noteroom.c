#include <string.h>
#include "mud.h"
#include "character.h"

void do_noteroom( Character *ch, char *argument )
{
  Board *board;
  char arg[MAX_STRING_LENGTH];
  char arg_passed[MAX_STRING_LENGTH];

  strcpy(arg_passed, argument);

  switch( ch->substate )
    {
    case SUB_WRITING_NOTE:
      operate_on_note(ch, arg_passed, false);
      break;

    default:

      argument = OneArgument(argument, arg);
      SmashTilde( argument );

      if (!StrCmp(arg, "write") || !StrCmp(arg, "to")
          || !StrCmp(arg, "subject") || !StrCmp(arg, "show"))
        {
          operate_on_note(ch, arg_passed, false);
          return;
        }

      board = find_board( ch );

      if ( !board )
        {
          send_to_char( "There is no bulletin board here to look at.\r\n", ch );
          return;
        }

      if (board->type != BOARD_NOTE)
        {
          send_to_char("You can only use note commands on a message terminal.\r\n", ch);
          return;
        }
      else
        {
          operate_on_note(ch, arg_passed, false);
          return;
        }
    }
}
