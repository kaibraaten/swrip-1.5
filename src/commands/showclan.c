#include "character.h"
#include "mud.h"
#include "clan.h"

static const char *GetClan_type(const Clan *const clan);

void do_showclan( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Usage: showclan <clan>\r\n", ch );
      return;
    }

  clan = GetClan( argument );

  if ( !clan )
    {
      SendToCharacter( "No such clan.\r\n", ch );
      return;
    }

  Echo( ch, "%s       : %s\r\nFilename: %s\r\n",
	GetClan_type(clan),
	clan->Name, ConvertToLuaFilename( clan->Name ) );
  Echo( ch, "Description: %s\r\nLeader: %s\r\n",
	clan->Description,
	clan->Leadership.Leader );
  Echo( ch, "Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
	clan->Leadership.Number1,
	clan->Leadership.Number2,
	clan->PlayerKills,
	clan->PlayerDeaths );
  Echo( ch, "MKills: %6d    MDeaths: %6d\r\n", clan->MobKills, clan->MobDeaths );
  Echo( ch, "Type: %d\r\n", clan->Type );
  Echo( ch, "Members: %3d\r\n", CountClanMembers( clan ) );
  Echo( ch, "Board: %5d   Jail: %5d\r\n", clan->Board, clan->Jail);
  Echo( ch, "Funds: %ld\r\n", clan->Funds );
  Echo( ch, "Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
	clan->EnlistRoom1, clan->EnlistRoom2 );
}

static const char *GetClan_type(const Clan *const clan)
{
  return clan->Type == CLAN_CRIME ? "Crime Family" :
    clan->Type == CLAN_GUILD ? "Guild" : "Organization";
}
