#include "character.h"
#include "mud.h"

void do_enter( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      for ( pexit = ch->in_room->FirstExit; pexit; pexit = pexit->next )
	{
	  if ( IsBitSet( pexit->Flags, EX_xENTER ) )
	    {
	      MoveCharacter( ch, pexit, 0 );
	      return;
	    }
	}

      SendToCharacter( "You cannot find an entrance here.\r\n", ch );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xENTER ) )
    {
      MoveCharacter( ch, pexit, 0 );
      return;
    }

  do_board(ch,argument);
}
