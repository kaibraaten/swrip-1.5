#include "mud.hpp"

void do_sla( Character *ch, std::string argument )
{
  SendToCharacter( "If you want to SLAY, spell it out.\r\n", ch );
}
