#include "mud.h"
#include "clan.h"

static void ShowSubClanToCharacter( void *element, void *userData );
static void ShowMainClanToCharacter( void *element, void *userData );
static void ShowAutonomousGroupToCharacter( void *element, void*userData );

void do_clans( CHAR_DATA *ch, char *argument )
{
  if ( List_Count( ClanList ) == 0 )
    {
      set_char_color( AT_BLOOD, ch);
      send_to_char( "There are no organizations currently formed.\r\n", ch );
      set_char_color( AT_WHITE, ch );
      return;
    }

  List_ForEach( ClanList, ShowMainClanToCharacter, ch );

  ch_printf( ch, "--------------------------------------------------------------------------------\r\n");
  ch_printf( ch, "&z&WAutonomous Groups        Leader\r\n");

  List_ForEach( ClanList, ShowAutonomousGroupToCharacter, ch );

  set_char_color( AT_WHITE, ch );
}

static void ShowMainClanToCharacter( void *element, void *userData )
{
  Clan *clan = (Clan*) element;
  CHAR_DATA *ch = (CHAR_DATA*) userData;
  int pCount = 0;
  int support = 0;
  long revenue = 0;
  PLANET_DATA *planet = NULL;

  if ( clan->clan_type == CLAN_CRIME
       || clan->clan_type == CLAN_GUILD
       || clan->clan_type == CLAN_SUBCLAN )
    return;

  for ( planet = first_planet ; planet ; planet = planet->next )
    {
      if ( clan == planet->governed_by )
	{
	  support += planet->pop_support;
	  pCount++;
	  revenue += get_taxes(planet);
	}
    }

  if ( pCount > 1 )
    {
      support /= pCount;
    }

  ch_printf( ch, "--------------------------------------------------------------------------------\r\n");
  ch_printf( ch, "&z&WOrganization: &Y%-20s    ", clan->name);
  ch_printf( ch, "&WPlanets: &O%-4d &z&WAvg Pop Support: ",pCount);

  if (support <50)
    {
      ch_printf( ch, "&R");
    }
  else
    {
      ch_printf( ch, "&O");
    }

  ch_printf( ch,"%-3d&W\r\nRevenue: &O%-29ld",support,revenue);
  ch_printf(ch,"&z&WLeader : ");

  if( clan->leadership.leader[0] != 0 )
    {
      ch_printf(ch,"&O%-20s",clan->leadership.leader);
    }
  else
    {
      ch_printf(ch,"&RNONE.             ");
    }

  ch_printf(ch, "&W\r\n");

  if ( List_Count( clan->SubClans ) > 0 )
    {
      ch_printf( ch, "  &z&wSubclans             Leader\r\n");
      List_ForEach( clan->SubClans, ShowSubClanToCharacter, ch );
    }
}

static void ShowAutonomousGroupToCharacter( void *element, void *userData )
{
  Clan *clan = (Clan*) element;
  CHAR_DATA *ch = (CHAR_DATA*) userData;

  if ( clan->clan_type != CLAN_CRIME && clan->clan_type != CLAN_GUILD )
    return;

  ch_printf( ch, "&Y%-24s &O%-10s\r\n",
	     clan->name, clan->leadership.leader );
}

static void ShowSubClanToCharacter( void *element, void *userData )
{
  Clan *subclan = (Clan*) element;
  CHAR_DATA *ch = (CHAR_DATA*) userData;

  ch_printf( ch, "  &O%-20s %-10s\r\n",
	     subclan->name, subclan->leadership.leader );
}
