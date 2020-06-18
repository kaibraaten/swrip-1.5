#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"

void do_notitle( std::shared_ptr<Character> ch, std::string arg )
{
  Character *victim = NULL;

  if ( arg.empty() )
    {
      ch->Echo("Notitle whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      ch->Echo("You failed.\r\n");
      return;
    }

  if ( victim->PCData->Flags.test( Flag::PCData::NoTitle ) )
    {
      victim->PCData->Flags.reset( Flag::PCData::NoTitle );
      victim->Echo("You can set your own title again.\r\n");
      ch->Echo("NOTITLE removed.\r\n");
    }
  else
    {
      victim->PCData->Flags.set( Flag::PCData::NoTitle );
      SetCharacterTitle( victim, victim->Name );
      victim->Echo("You can't set your own title!\r\n");
      ch->Echo("NOTITLE set.\r\n");
    }
}

