#include "mud.hpp"
#include "character.hpp"

void do_trust( std::shared_ptr<Character> ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  Character *victim = nullptr;
  int level = 0;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1.empty() || arg2.empty() || !IsNumber( arg2 ) )
    {
      ch->Echo("Syntax: trust <char> <level>\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo("That player is not here.\r\n");
      return;
    }

  if ( ( level = ToLong( arg2 ) ) < 0 || level > MAX_LEVEL )
    {
      ch->Echo("Level must be 0 (reset) or 1 to %d.\r\n", MAX_LEVEL);
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
