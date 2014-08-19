#include "character.h"
#include "mud.h"

void do_fixchar( Character *ch, char *argument )
{
  char name[MAX_STRING_LENGTH];
  Character *victim;

  OneArgument( argument, name );
  if ( name[0] == '\0' )
    {
      SendToCharacter( "Usage: fixchar <playername>\r\n", ch );
      return;
    }
  victim = get_char_room( ch, name );
  if ( !victim )
    {
      SendToCharacter( "They're not here.\r\n", ch );
      return;
    }

  FixCharacterStats( victim );
  SendToCharacter( "Done.\r\n", ch );
}
