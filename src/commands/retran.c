#include "mud.h"
#include "character.h"

void do_retran( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter("Retransfer whom?\r\n", ch );
      return;
    }

  if ( !(victim = get_char_world(ch, arg)) )
    {
      SendToCharacter("They aren't here.\r\n", ch );
      return;
    }

  sprintf(buf, "'%s' %ld", victim->name, victim->retran);
  do_transfer(ch, buf);
}
