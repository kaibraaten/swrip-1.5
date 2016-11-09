#include "character.hpp"
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

  clan = ch->PCData->ClanInfo.Clan;

  if( StrCmp(ch->Name, clan->Leadership.Leader )
      && StrCmp(ch->Name, clan->Leadership.Number1 )
      && StrCmp(ch->Name, clan->Leadership.Number2 )
      && (!ch->PCData->Bestowments
	  || !IsName("roster", ch->PCData->Bestowments)) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  ShowClanMembers( ch, clan->Name, argument );
}
