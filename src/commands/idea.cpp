#include "mud.hpp"

void do_idea( Character *ch, std::string argument )
{
  AppendFile( ch, IDEA_FILE, argument );
  SendToCharacter( "Ok.  Thanks.\r\n", ch );
}
