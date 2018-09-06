#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_demote( Character *ch , std::string argument )
{
  if ( IsNpc( ch ) )
    return;

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  if ( StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader ) )
    {
      ch->Echo( "Only your leader can do that!\r\n" );
      return;
    }

  if ( argument.empty() )
    {
      ch->Echo( "Demote who?\r\n" );
      return;
    }

  if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number1 )  )
    {
      ch->Echo( "Player demoted!" );
      ch->PCData->ClanInfo.Clan->Leadership.Number1.erase();
    }
  else if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number2 )  )
    {
      ch->Echo( "Player Demoted!" );
      ch->PCData->ClanInfo.Clan->Leadership.Number2.erase();
    }
  else
    {
      ch->Echo( "They seem to have been demoted already.\r\n" );
      return;
    }

  Clans->Save( ch->PCData->ClanInfo.Clan );
}
