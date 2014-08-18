#include "mud.h"

void do_clans( Character *ch, char *argument )
{
  CLAN_DATA *clan = NULL;
  int count = 0;

  for ( clan = first_clan; clan; clan = clan->next )
    {
      int pCount = 0;
      int support = 0;
      long revenue = 0;
      Planet *planet = NULL;

      if ( clan->clan_type == CLAN_CRIME
	   || clan->clan_type == CLAN_GUILD
	   || clan->clan_type == CLAN_SUBCLAN )
        continue;

      for ( planet = first_planet ; planet ; planet = planet->next )
        if ( clan == planet->governed_by )
          {
            support += planet->pop_support;
            pCount++;
	    revenue += get_taxes(planet);
          }

      if ( pCount > 1 )
        support /= pCount;

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

      if ( clan->first_subclan )
        {
          CLAN_DATA *subclan;
          ch_printf( ch, "  &z&wSubclans             Leader\r\n");

          for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
            {
              ch_printf( ch, "  &O%-20s %-10s\r\n",
                         subclan->name, subclan->leadership.leader );
            }
        }
      count++;
    }
  ch_printf( ch, "--------------------------------------------------------------------------------\r\n");
  ch_printf( ch, "&z&WAutonomous Groups        Leader\r\n");

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( clan->clan_type != CLAN_CRIME && clan->clan_type != CLAN_GUILD )
        continue;

      ch_printf( ch, "&Y%-24s &O%-10s\r\n",
                 clan->name, clan->leadership.leader );
      count++;
    }

  if ( !count )
    {
      set_char_color( AT_BLOOD, ch);
      send_to_char( "There are no organizations currently formed.\r\n", ch );
    }

  set_char_color( AT_WHITE, ch );
}
