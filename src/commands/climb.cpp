#include "character.hpp"
#include "mud.hpp"

void do_climb( Character *ch, char *argument )
{
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      for ( pexit = ch->InRoom->FirstExit; pexit; pexit = pexit->Next )
	{
	  if ( IsBitSet( pexit->Flags, EX_xCLIMB ) )
	    {
	      MoveCharacter( ch, pexit, 0 );
	      return;
	    }
	}
      
      SendToCharacter( "You cannot climb here.\r\n", ch );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xCLIMB ) )
    {
      MoveCharacter( ch, pexit, 0 );
      return;
    }

  SendToCharacter( "You cannot climb there.\r\n", ch );
}
