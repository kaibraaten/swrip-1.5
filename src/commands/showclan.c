#include "character.h"
#include "mud.h"

static const char *get_clan_type(const Clan *const clan);

void do_showclan( Character *ch, char *argument )
{
  Clan *clan;

  if ( IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Usage: showclan <clan>\r\n", ch );
      return;
    }

  clan = get_clan( argument );

  if ( !clan )
    {
      send_to_char( "No such clan.\r\n", ch );
      return;
    }

  ch_printf( ch, "%s       : %s\r\nFilename: %s\r\n",
             get_clan_type(clan),
             clan->name,
             clan->filename);
  ch_printf( ch, "Description: %s\r\nLeader: %s\r\n",
             clan->description,
             clan->leadership.leader );
  ch_printf( ch, "Number1: %s\r\nNumber2: %s\r\nPKills: %6d    PDeaths: %6d\r\n",
             clan->leadership.number1,
             clan->leadership.number2,
             clan->pkills,
             clan->pdeaths );
  ch_printf( ch, "MKills: %6d    MDeaths: %6d\r\n",
             clan->mkills,
             clan->mdeaths );
  ch_printf( ch, "Type: %d\r\n",
             clan->clan_type );
  ch_printf( ch, "Members: %3d\r\n",
             clan->members );
  ch_printf( ch, "Board: %5d   Jail: %5d\r\n",
             clan->board, clan->jail);
  ch_printf( ch, "Guard1: %5d  Guard2: %5d\r\n",
             clan->guard1,
             clan->guard2 );
  ch_printf( ch, "Patrol1: %5d  Patrol2: %5d\r\n",
             clan->patrol1,
             clan->patrol2 );
  ch_printf( ch, "Trooper1: %5d  Trooper2: %5d\r\n",
             clan->trooper1,
             clan->trooper2 );
  ch_printf( ch, "Funds: %ld\r\n",
             clan->funds );
  ch_printf( ch, "Enlist Room 1: %ld  Enlist Room 2: %ld\r\n",
             clan->enlistroom1, clan->enlistroom2 );
}

static const char *get_clan_type(const Clan *const clan)
{
  return clan->clan_type == CLAN_CRIME ? "Crime Family" :
    clan->clan_type == CLAN_GUILD ? "Guild" : "Organization";
}
