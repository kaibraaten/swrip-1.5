#include "mud.hpp"

void do_bug( Character *ch, char *argument )
{
  AppendFile( ch, BUG_FILE, argument );
  SendToCharacter( "Ok. Thanks.\r\n", ch );
}
