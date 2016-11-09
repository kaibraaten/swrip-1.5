#include "character.hpp"
#include "mud.hpp"

void do_wimpy( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  int wimpy;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    wimpy = (int) ch->MaxHit / 5;
  else
    wimpy = atoi( arg );

  if ( wimpy < 0 )
    {
      SendToCharacter( "Your courage exceeds your wisdom.\r\n", ch );
      return;
    }

  if ( wimpy > ch->MaxHit )
    {
      SendToCharacter( "Such cowardice ill becomes you.\r\n", ch );
      return;
    }

  ch->Wimpy = wimpy;
  Echo( ch, "Wimpy set to %d hit points.\r\n", wimpy );
}
