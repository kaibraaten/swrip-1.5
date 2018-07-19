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
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( StrCmp( ch->Name, ch->PCData->ClanInfo.Clan->Leadership.Leader  )  )
    {
      SendToCharacter( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Demote who?\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number1 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number1 );
      ch->PCData->ClanInfo.Clan->Leadership.Number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->PCData->ClanInfo.Clan->Leadership.Number2 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->PCData->ClanInfo.Clan->Leadership.Number2 );
      ch->PCData->ClanInfo.Clan->Leadership.Number2 = CopyString( "" );
    }
  else
    {
      SendToCharacter( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  Clans->Save( ch->PCData->ClanInfo.Clan );
}
