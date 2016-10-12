#include "character.h"
#include "mud.h"

void do_leave( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      for ( pexit = ch->InRoom->FirstExit; pexit; pexit = pexit->next )
	{
	  if ( IsBitSet( pexit->Flags, EX_xLEAVE ) )
	    {
	      MoveCharacter( ch, pexit, 0 );
	      return;
	    }
	}

      do_leaveship( ch , "" );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xLEAVE ) )
    {
      MoveCharacter( ch, pexit, 0 );
      return;
    }

  do_leaveship( ch, "" );
}
