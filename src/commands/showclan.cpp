#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"

static const char *GetClanType(const std::shared_ptr<Clan> &clan);

void do_showclan( Character *ch, std::string argument )
{
  std::shared_ptr<Clan> clan;

  if ( IsNpc( ch ) )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  if ( argument.empty() )
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
           clan->Name.c_str(), ConvertToLuaFilename( clan->Name ).c_str() );
  ch->Echo("Founded: %s\r\n", FormatDate( &clan->FoundationDate ).c_str() );
  ch->Echo("Description: %s\r\nLeader: %s\r\n",
           clan->Description.c_str(),
           clan->Leadership.Leader.c_str() );
  ch->Echo("Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
           clan->Leadership.Number1.c_str(),
           clan->Leadership.Number2.c_str(),
           clan->PlayerKills,
           clan->PlayerDeaths );
  ch->Echo("MKills: %6d    MDeaths: %6d\r\n", clan->MobKills, clan->MobDeaths );
  ch->Echo("Type: %d\r\n", clan->Type );
  ch->Echo("Members: %3lu\r\n", clan->Members().size());
  ch->Echo("Board: %5ld   Jail: %5ld\r\n", clan->Board, clan->Jail);
  ch->Echo("Funds: %ld\r\n", clan->Funds );
  ch->Echo("Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
           clan->EnlistRoom1, clan->EnlistRoom2 );
}

static const char *GetClanType(const std::shared_ptr<Clan> &clan)
{
  return clan->Type == CLAN_GUILD ? "Guild" : "Organization";
}
