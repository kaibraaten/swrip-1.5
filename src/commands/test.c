#include <string.h>
#include "mud.h"

void do_test( Character *ch, char *argument )
{
  if( strlen( argument ) == 0 )
    {
      ch_printf( ch, "Yo, I need an argument, dig?" );
      return;
    }

  ch_printf( ch, "skill_lookup(\"%s\") == %d\r\n", argument, skill_lookup(argument) );
}
