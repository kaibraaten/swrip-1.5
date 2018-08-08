#include "mud.hpp"
#include "character.hpp"

void do_trust( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  Character *victim;
  int level;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1) || IsNullOrEmpty( arg2 ) || !IsNumber( arg2 ) )
    {
      ch->Echo("Syntax: trust <char> <level>.\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo("That player is not here.\r\n");
      return;
    }

  if ( ( level = atoi( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      ch->Echo("Level must be 0 (reset) or 1 to 60.\r\n");
      return;
    }

  if ( level > GetTrustLevel( ch ) )
    {
      ch->Echo("Limited to your own trust.\r\n");
      return;
    }

  if ( ch->TopLevel < LEVEL_IMPLEMENTOR && GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo("You can't do that.\r\n");
      return;
    }

  victim->Trust = level;
  ch->Echo("Ok.\r\n");
}

