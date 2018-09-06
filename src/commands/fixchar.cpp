#include "character.hpp"
#include "mud.hpp"

void do_fixchar( Character *ch, std::string argument )
{
  std::string name;
  Character *victim = nullptr;

  OneArgument( argument, name );

  if ( name.empty() )
    {
      ch->Echo( "Usage: fixchar <playername>\r\n" );
      return;
    }

  victim = GetCharacterInRoom( ch, name );

  if ( !victim )
    {
      ch->Echo( "They're not here.\r\n" );
      return;
    }

  FixCharacterStats( victim );
  ch->Echo( "Done.\r\n" );
}
