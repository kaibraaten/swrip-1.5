#include "mud.h"

void do_fixchar( CHAR_DATA *ch, char *argument )
{
  char name[MAX_STRING_LENGTH];
  CHAR_DATA *victim;

  one_argument( argument, name );
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

  fix_char( victim );
  send_to_char( "Done.\r\n", ch );
}
