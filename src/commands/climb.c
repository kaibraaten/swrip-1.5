#include "character.h"
#include "mud.h"

void do_climb( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( argument[0] == '\0' )
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
        if ( IS_SET( pexit->exit_info, EX_xCLIMB ) )
          {
            move_char( ch, pexit, 0 );
            return;
          }
      send_to_char( "You cannot climb here.\r\n", ch );
      return;
    }

  pexit = find_door( ch, argument, TRUE );

  if ( pexit && IS_SET( pexit->exit_info, EX_xCLIMB ) )
    {
      move_char( ch, pexit, 0 );
      return;
    }

  send_to_char( "You cannot climb there.\r\n", ch );
}
