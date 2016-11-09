#include "character.hpp"
#include "mud.h"

void do_toplevel( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  int level;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) || IsNullOrEmpty( arg2 ) || !IsNumber( arg2 ) )
    {
      SendToCharacter( "Syntax: toplevel <char> <level>.\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "That player is not here.\r\n", ch);
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      SendToCharacter( "Level must be 0 (reset) or 1 to 60.\r\n", ch );
      return;
    }

  if ( level > ch->TopLevel )
    {
      SendToCharacter( "Limited to your own top level.\r\n", ch );
      return;
    }

  if ( ch->TopLevel < LEVEL_IMPLEMENTOR && victim->TopLevel >= ch->TopLevel )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return;
    }

  victim->TopLevel = level;
  SendToCharacter( "Ok.\r\n", ch );
}
