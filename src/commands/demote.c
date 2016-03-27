#include "character.h"
#include "mud.h"
#include "clan.h"

void do_demote( Character *ch , char *argument )
{
  if ( IsNpc( ch ) )
    return;

  if ( !IsClanned( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( StrCmp( ch->name, ch->pcdata->ClanInfo.Clan->Leadership.Leader  )  )
    {
      SendToCharacter( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Demote who?\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , ch->pcdata->ClanInfo.Clan->Leadership.Number1 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->ClanInfo.Clan->Leadership.Number1 );
      ch->pcdata->ClanInfo.Clan->Leadership.Number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->pcdata->ClanInfo.Clan->Leadership.Number2 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->ClanInfo.Clan->Leadership.Number2 );
      ch->pcdata->ClanInfo.Clan->Leadership.Number2 = CopyString( "" );
    }
  else
    {
      SendToCharacter( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  SaveClan( ch->pcdata->ClanInfo.Clan );
}
