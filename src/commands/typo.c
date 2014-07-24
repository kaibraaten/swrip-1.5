#include "mud.h"

void do_typo( Character *ch, char *argument )
{
  append_file( ch, TYPO_FILE, argument );
  send_to_char( "Ok. Thanks.\r\n", ch );
}
