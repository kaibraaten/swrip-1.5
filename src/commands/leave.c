#include "character.h"
#include "mud.h"

void do_leave( CHAR_DATA *ch, char *argument )
{
  EXIT_DATA *pexit = NULL;

  if ( argument[0] == '\0' )
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
	{
	  if ( IS_SET( pexit->exit_info, EX_xLEAVE ) )
	    {
	      move_char( ch, pexit, 0 );
	      return;
	    }
	}

      do_leaveship( ch , "" );
      return;
    }

  pexit = find_door( ch, argument, TRUE );

  if ( pexit && IS_SET( pexit->exit_info, EX_xLEAVE ) )
    {
      move_char( ch, pexit, 0 );
      return;
    }

  do_leaveship( ch, "" );
}
