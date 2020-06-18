#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_title( std::shared_ptr<Character> ch, std::string argument )
{
  if ( IsNpc(ch) )
    return;

  if ( ch->PCData->Flags.test( Flag::PCData::NoTitle ) )
    {
      ch->Echo("You try but the Force resists you.\r\n");
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo("Change your title to what?\r\n");
      return;
    }

  if ((GetTrustLevel(ch) <= LEVEL_IMMORTAL) && (!NiftyIsName(ch->Name, argument)))
    {
      ch->Echo("You must include your name somewhere in your title!");
      return;
    }

  if ( argument.size() > 40 )
    {
      ch->Echo("40 characters is maximum allowed for titles now.\r\n");
      return;
    }

  SmashTilde( argument );
  SetCharacterTitle( ch, argument );
  ch->Echo("Ok.\r\n");
}
