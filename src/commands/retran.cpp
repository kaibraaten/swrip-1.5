#include "mud.hpp"
#include "character.hpp"

void do_retran( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Retransfer whom?\r\n");
      return;
    }

  if ( !(victim = GetCharacterAnywhere(ch, arg)) )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  sprintf(buf, "'%s' %ld", victim->Name, victim->ReTran);
  do_transfer(ch, buf);
}

