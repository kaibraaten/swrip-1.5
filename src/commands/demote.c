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

  if ( StrCmp( ch->name, ch->pcdata->ClanInfo.Clan->leadership.leader  )  )
    {
      SendToCharacter( "Only your leader can do that!\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Demote who?\r\n", ch );
      return;
    }

  if ( !StrCmp( argument , ch->pcdata->ClanInfo.Clan->leadership.number1 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->ClanInfo.Clan->leadership.number1 );
      ch->pcdata->ClanInfo.Clan->leadership.number1 = CopyString( "" );
    }
  else if ( !StrCmp( argument , ch->pcdata->ClanInfo.Clan->leadership.number2 )  )
    {
      SendToCharacter( "Player Demoted!", ch );

      FreeMemory( ch->pcdata->ClanInfo.Clan->leadership.number2 );
      ch->pcdata->ClanInfo.Clan->leadership.number2 = CopyString( "" );
    }
  else
    {
      SendToCharacter( "They seem to have been demoted already.\r\n", ch );
      return;
    }

  SaveClan( ch->pcdata->ClanInfo.Clan );
}
