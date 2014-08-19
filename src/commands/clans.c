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

      ChPrintf( ch, "--------------------------------------------------------------------------------\r\n");
      ChPrintf( ch, "&z&WOrganization: &Y%-20s    ", clan->name);
      ChPrintf( ch, "&WPlanets: &O%-4d &z&WAvg Pop Support: ",pCount);

      if (support <50)
        {
          ChPrintf( ch, "&R");
        }
      else
        {
          ChPrintf( ch, "&O");
        }

      ChPrintf( ch,"%-3d&W\r\nRevenue: &O%-29ld",support,revenue);
      ChPrintf(ch,"&z&WLeader : ");

      if( clan->leadership.leader[0] != 0 )
        {
          ChPrintf(ch,"&O%-20s",clan->leadership.leader);
        }
      else
        {
          ChPrintf(ch,"&RNONE.             ");
        }

      ChPrintf(ch, "&W\r\n");

      if ( clan->first_subclan )
        {
          Clan *subclan;
          ChPrintf( ch, "  &z&wSubclans             Leader\r\n");

          for ( subclan = clan->first_subclan ; subclan ; subclan = subclan->next_subclan )
            {
              ChPrintf( ch, "  &O%-20s %-10s\r\n",
                         subclan->name, subclan->leadership.leader );
            }
        }
      count++;
    }
  ChPrintf( ch, "--------------------------------------------------------------------------------\r\n");
  ChPrintf( ch, "&z&WAutonomous Groups        Leader\r\n");

  for ( clan = first_clan; clan; clan = clan->next )
    {
      if ( clan->clan_type != CLAN_CRIME && clan->clan_type != CLAN_GUILD )
        continue;

      ChPrintf( ch, "&Y%-24s &O%-10s\r\n",
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
