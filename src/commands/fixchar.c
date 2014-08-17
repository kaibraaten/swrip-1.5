#include "character.h"
#include "mud.h"

void do_fixchar( Character *ch, char *argument )
{
  char name[MAX_STRING_LENGTH];
  Character *victim;

  OneArgument( argument, name );
  if ( name[0] == '\0' )
    {
      send_to_char( "Usage: fixchar <playername>\r\n", ch );
      return;
    }
  victim = get_char_room( ch, name );
  if ( !victim )
    {
      send_to_char( "They're not here.\r\n", ch );
      return;
    }

  FixCharacterStats( victim );
  send_to_char( "Done.\r\n", ch );
}
