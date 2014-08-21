#include "mud.h"

void do_clans( Character *ch, char *argument )
{
  Clan *clan = NULL;
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
	    revenue += GetTaxes(planet);
          }

      if ( pCount > 1 )
        support /= pCount;

      Echo( ch, "--------------------------------------------------------------------------------\r\n");
      Echo( ch, "&z&WOrganization: &Y%-20s    ", clan->name);
      Echo( ch, "&WPlanets: &O%-4d &z&WAvg Pop Support: ",pCount);

      if (support <50)
        {
          Echo( ch, "&R");
        }
      else
        {
          Echo( ch, "&O");
        }

      Echo( ch,"%-3d&W\r\nRevenue: &O%-29ld",support,revenue);
      Echo(ch,"&z&WLeader : ");

      if( clan->leadership.leader[0] != 0 )
        {
          Echo(ch,"&O%-20s",clan->leadership.leader);
        }
      else
        {
          Echo(ch,"&RNONE.             ");
        }

      Echo(ch, "&W\r\n");

      if ( clan->first_subclan )
        {
          Clan *subclan;
          Echo( ch, "  &z&wSubclans             Leader\r\n");

          for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
            {
              Echo( ch, "  &O%-20s %-10s\r\n",
                         subclan->name, subclan->leadership.leader );
            }
        }
      count++;
    }
  Echo( ch, "--------------------------------------------------------------------------------\r\n");
  Echo( ch, "&z&WAutonomous Groups        Leader\r\n");

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( clan->clan_type != CLAN_CRIME && clan->clan_type != CLAN_GUILD )
        continue;

      Echo( ch, "&Y%-24s &O%-10s\r\n",
                 clan->name, clan->leadership.leader );
      count++;
    }

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no organizations currently formed.\r\n", ch );
    }

  SetCharacterColor( AT_WHITE, ch );
}
