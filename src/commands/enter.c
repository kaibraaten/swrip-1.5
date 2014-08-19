#include "character.h"
#include "mud.h"

void do_enter( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( argument[0] == '\0' )
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
	{
	  if ( IsBitSet( pexit->exit_info, EX_xENTER ) )
	    {
	      MoveCharacter( ch, pexit, 0 );
	      return;
	    }
	}

      SendToCharacter( "You cannot find an entrance here.\r\n", ch );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->exit_info, EX_xENTER ) )
    {
      MoveCharacter( ch, pexit, 0 );
      return;
    }

  do_board(ch,argument);
}
