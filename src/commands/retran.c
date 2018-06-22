#include "mud.h"
#include "character.h"

void do_retran( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("Retransfer whom?\r\n", ch );
      return;
    }

  if ( !(victim = GetCharacterAnywhere(ch, arg)) )
    {
      SendToCharacter("They aren't here.\r\n", ch );
      return;
    }

  sprintf(buf, "'%s' %ld", victim->Name, victim->ReTran);
  do_transfer(ch, buf);
}
