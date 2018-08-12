#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"

void do_enter( Character *ch, char *argument )
{
  if ( IsNullOrEmpty( argument ) )
    {
      for(Exit *ex : ch->InRoom->Exits())
	{
	  if ( IsBitSet( ex->Flags, EX_xENTER ) )
	    {
	      MoveCharacter( ch, ex );
	      return;
	    }
	}

      ch->Echo( "You cannot find an entrance here.\r\n" );
      return;
    }

  Exit *pexit = FindDoor( ch, argument, true );

  if ( pexit && IsBitSet( pexit->Flags, EX_xENTER ) )
    {
      MoveCharacter( ch, pexit );
      return;
    }

  do_board(ch,argument);
}

