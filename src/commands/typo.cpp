#include "mud.hpp"

void do_typo( Character *ch, std::string argument )
{
  AppendFile( ch, TYPO_FILE, argument );
  SendToCharacter( "Ok. Thanks.\r\n", ch );
}
