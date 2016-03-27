#include "character.h"
#include "mud.h"
#include "clan.h"

void do_roster( Character *ch, char *argument )
{
  Clan *clan = NULL;

  if( IsNpc( ch ) || !IsClanned( ch ) )
    {
      Echo( ch, "Huh?\r\n" );
      return;
    }

  clan = ch->pcdata->ClanInfo.Clan;

  if( StrCmp(ch->name, clan->Leadership.Leader )
      && StrCmp(ch->name, clan->Leadership.Number1 )
      && StrCmp(ch->name, clan->Leadership.Number2 )
      && (!ch->pcdata->bestowments
	  || !IsName("roster", ch->pcdata->bestowments)) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  ShowClanMembers( ch, clan->Name, argument );
}
