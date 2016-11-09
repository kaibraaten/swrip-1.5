#include "mud.hpp"

void do_idea( Character *ch, char *argument )
{
  AppendFile( ch, IDEA_FILE, argument );
  SendToCharacter( "Ok.  Thanks.\r\n", ch );
}
