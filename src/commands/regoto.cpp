#include "mud.hpp"
#include "character.hpp"

void do_regoto( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  sprintf(buf, "%ld", ch->ReGoto);
  do_goto(ch, buf);
}

