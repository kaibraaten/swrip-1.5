#include <string.h>
#include <stdlib.h>

#include "mud.h"
#include "character.h"

void do_test( Character *ch, char *argument )
{
  Echo( ch, "This is not the command you're looking for.\r\n" );
}
