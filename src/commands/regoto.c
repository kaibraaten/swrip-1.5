#include "mud.h"
#include "character.h"

void do_regoto( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  sprintf(buf, "%ld", ch->regoto);
  do_goto(ch, buf);
}
