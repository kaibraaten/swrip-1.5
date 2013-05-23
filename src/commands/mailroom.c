#include <string.h>
#include "mud.h"
#include "character.h"

void do_mailroom(CHAR_DATA *ch, char *argument)
{
  BOARD_DATA *board;
  char arg[MAX_STRING_LENGTH];
  char arg_passed[MAX_STRING_LENGTH];

  strcpy(arg_passed, argument);

  switch( ch->substate )
    {
    case SUB_WRITING_NOTE:
      operate_on_note(ch, arg_passed, TRUE);
      break;

    default:

      argument = one_argument(argument, arg);
      smash_tilde( argument );

      if (!str_cmp(arg, "write") || !str_cmp(arg, "to")
          ||  !str_cmp(arg, "subject") || !str_cmp(arg, "show"))
        {
          operate_on_note(ch, arg_passed, TRUE);
          return;
        }

      board = find_board( ch );

      if ( !board )
        {
          send_to_char( "There is no mail facility here.\r\n", ch );
          return;
        }

      if (board->type != BOARD_MAIL)
        {
          send_to_char("You can only use mail commands in a post office.\r\n", ch);
          return;
        }
      else
        {
          operate_on_note(ch, arg_passed, TRUE);
          return;
        }
    }
}
