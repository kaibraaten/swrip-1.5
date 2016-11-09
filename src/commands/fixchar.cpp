#include "character.hpp"
#include "mud.hpp"

void do_fixchar( Character *ch, std::string argument )
{
  char name[MAX_STRING_LENGTH];
  Character *victim;

  OneArgument( argument, name );

  if ( IsNullOrEmpty( name ) )
    {
      SendToCharacter( "Usage: fixchar <playername>\r\n", ch );
      return;
    }

  victim = GetCharacterInRoom( ch, name );

  if ( !victim )
    {
      SendToCharacter( "They're not here.\r\n", ch );
      return;
    }

  FixCharacterStats( victim );
  SendToCharacter( "Done.\r\n", ch );
}
