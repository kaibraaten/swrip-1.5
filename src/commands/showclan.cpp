#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"

static const char *GetClanType(const Clan *const clan);

void do_showclan( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: showclan <clan>\r\n");
      return;
    }

  clan = GetClan( argument );

  if ( !clan )
    {
      ch->Echo("No such clan.\r\n");
      return;
    }

  ch->Echo("%s: %s\r\nFilename: %s\r\n",
	GetClanType(clan),
	clan->Name, ConvertToLuaFilename( clan->Name ) );
  ch->Echo("Founded: %s\r\n", FormatDate( &clan->FoundationDate ) );
  ch->Echo("Description: %s\r\nLeader: %s\r\n",
	clan->Description,
	clan->Leadership.Leader );
  ch->Echo("Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
	clan->Leadership.Number1,
	clan->Leadership.Number2,
	clan->PlayerKills,
	clan->PlayerDeaths );
  ch->Echo("MKills: %6d    MDeaths: %6d\r\n", clan->MobKills, clan->MobDeaths );
  ch->Echo("Type: %d\r\n", clan->Type );
  ch->Echo("Members: %3d\r\n", CountClanMembers( clan ) );
  ch->Echo("Board: %5d   Jail: %5d\r\n", clan->Board, clan->Jail);
  ch->Echo("Funds: %ld\r\n", clan->Funds );
  ch->Echo("Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
	clan->EnlistRoom1, clan->EnlistRoom2 );
}

static const char *GetClanType(const Clan *const clan)
{
  return clan->Type == CLAN_GUILD ? "Guild" : "Organization";
}

