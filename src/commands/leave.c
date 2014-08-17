#include "character.h"
#include "mud.h"

void do_leave( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( argument[0] == '\0' )
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
	{
	  if ( IsBitSet( pexit->exit_info, EX_xLEAVE ) )
	    {
	      move_char( ch, pexit, 0 );
	      return;
	    }
	}

      do_leaveship( ch , "" );
      return;
    }

  pexit = find_door( ch, argument, true );

  if ( pexit && IsBitSet( pexit->exit_info, EX_xLEAVE ) )
    {
      move_char( ch, pexit, 0 );
      return;
    }

  do_leaveship( ch, "" );
}
