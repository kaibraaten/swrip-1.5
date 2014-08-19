#include "mud.h"

void do_typo( Character *ch, char *argument )
{
  AppendFile( ch, TYPO_FILE, argument );
  SendToCharacter( "Ok. Thanks.\r\n", ch );
}
