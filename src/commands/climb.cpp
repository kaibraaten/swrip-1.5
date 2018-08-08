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
	      MoveCharacter( ch, pexit );
	      return;
	    }
	}
      
      ch->Echo( "You cannot climb here.\r\n" );
      return;
    }

  pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xCLIMB ) )
    {
      MoveCharacter( ch, pexit );
      return;
    }

  ch->Echo( "You cannot climb there.\r\n" );
}

