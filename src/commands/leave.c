#include "character.h"
#include "mud.h"

void do_leave( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      for ( pexit = ch->in_room->FirstExit; pexit; pexit = pexit->next )
	{
	  if ( IsBitSet( pexit->exit_info, EX_xLEAVE ) )
	    {
	      MoveCharacter( ch, pexit, 0 );
	      return;
	    }
	}

      do_leaveship( ch , "" );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->exit_info, EX_xLEAVE ) )
    {
      MoveCharacter( ch, pexit, 0 );
      return;
    }

  do_leaveship( ch, "" );
}
