#include "mud.h"

void do_test( CHAR_DATA *ch, char *argument )
{
  const char *keyword = "\"ACUTE SENSE\"";

  ch_printf( ch, "Original: %s\r\n", keyword );

  if( keyword[0] == '\'' || keyword[0] == '\"' )
    ++keyword;

  ch_printf( ch, "Skipped: %s\r\n", keyword );
}
