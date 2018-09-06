#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_leave( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      for ( Exit *ex : ch->InRoom->Exits() )
	{
	  if ( IsBitSet( ex->Flags, EX_xLEAVE ) )
	    {
	      MoveCharacter( ch, ex );
	      return;
	    }
	}

      do_leaveship( ch , "" );
      return;
    }

  Exit *pexit = FindDoor( ch, argument, true );
  
  if ( pexit && IsBitSet( pexit->Flags, EX_xLEAVE ) )
    {
      MoveCharacter( ch, pexit );
      return;
    }

  do_leaveship( ch, "" );
}
