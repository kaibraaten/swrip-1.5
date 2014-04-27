#include "mud.h"

void do_typo( CHAR_DATA *ch, char *argument )
{
  append_file( ch, TYPO_FILE, argument );
  send_to_char( "Ok. Thanks.\r\n", ch );
}
