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
             clan->Name,
             clan->filename);
  Echo( ch, "Description: %s\r\nLeader: %s\r\n",
             clan->description,
             clan->leadership.leader );
  Echo( ch, "Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
             clan->leadership.number1,
             clan->leadership.number2,
             clan->pkills,
             clan->pdeaths );
  Echo( ch, "MKills: %6d    MDeaths: %6d\r\n",
             clan->mkills,
             clan->mdeaths );
  Echo( ch, "Type: %d\r\n",
             clan->clan_type );
  Echo( ch, "Members: %3d\r\n",
             clan->members );
  Echo( ch, "Board: %5d   Jail: %5d\r\n",
             clan->board, clan->jail);
  Echo( ch, "Guard1: %5d  Guard2: %5d\r\n",
             clan->guard1,
             clan->guard2 );
  Echo( ch, "Patrol1: %5d  Patrol2: %5d\r\n",
             clan->patrol1,
             clan->patrol2 );
  Echo( ch, "Trooper1: %5d  Trooper2: %5d\r\n",
             clan->trooper1,
             clan->trooper2 );
  Echo( ch, "Funds: %ld\r\n",
             clan->funds );
  Echo( ch, "Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
             clan->enlistroom1, clan->enlistroom2 );
}

static const char *GetClan_type(const Clan *const clan)
{
  return clan->clan_type == CLAN_CRIME ? "Crime Family" :
    clan->clan_type == CLAN_GUILD ? "Guild" : "Organization";
}
