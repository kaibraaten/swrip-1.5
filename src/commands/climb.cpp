#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_climb( Character *ch, char *argument )
{
  if ( IsNullOrEmpty( argument ) )
    {
      for(Exit *ex : ch->InRoom->Exits())
	{
	  if ( IsBitSet( ex->Flags, EX_xCLIMB ) )
	    {
	      MoveCharacter( ch, ex );
	      return;
	    }
	}
      
      ch->Echo( "You cannot climb here.\r\n" );
      return;
    }

  Exit *pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xCLIMB ) )
    {
      MoveCharacter( ch, pexit );
      return;
    }

  ch->Echo( "You cannot climb there.\r\n" );
}

