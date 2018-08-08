#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "pcdata.hpp"

void do_demote( Character *ch , char *argument )
{
  if ( IsNpc( ch ) )
    return;

  if ( !IsClanned( ch ) )
    {
      ch->Echo( "Huh?\r\n" );
      return;
    }

  if ( StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader  )  )
    {
      ch->Echo( "Only your leader can do that!\r\n" );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Demote who?\r\n" );
      return;
    }

  if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number1 )  )
    {
      ch->Echo( "Player demoted!" );

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number1 );
      ch->PCData->ClanInfo.Clan->Leadership.Number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number2 )  )
    {
      ch->Echo( "Player Demoted!" );

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number2 );
      ch->PCData->ClanInfo.Clan->Leadership.Number2 = CopyString( "" );
    }
  else
    {
      ch->Echo( "They seem to have been demoted already.\r\n" );
      return;
    }

  Clans->Save( ch->PCData->ClanInfo.Clan );
}

