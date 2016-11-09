#include "character.hpp"
#include "mud.hpp"

void do_enter( Character *ch, std::string argument )
{
  Exit *pexit = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      for ( pexit = ch->InRoom->FirstExit; pexit; pexit = pexit->Next )
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
