#include "character.h"
#include "mud.h"

void do_wimpy( Character *ch, char *argument )
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

  ch->wimpy = wimpy;
  Echo( ch, "Wimpy set to %d hit points.\r\n", wimpy );
}
