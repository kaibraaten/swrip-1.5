#include "mud.h"
#include "clan.h"

void do_clans( Character *ch, char *argument )
{
  Clan *clan = NULL;
  int count = 0;

  for ( clan = FirstClan; clan; clan = clan->Next )
    {
      int pCount = 0;
      int support = 0;
      long revenue = 0;
      Planet *planet = NULL;

      if ( clan->Type == CLAN_CRIME
	   || clan->Type == CLAN_GUILD
	   || clan->Type == CLAN_SUBCLAN )
        continue;

      for ( planet = FirstPlanet ; planet ; planet = planet->Next )
        if ( clan == planet->GovernedBy )
          {
            support += planet->PopularSupport;
            pCount++;
	    revenue += GetTaxes(planet);
          }

      if ( pCount > 1 )
        support /= pCount;

      Echo( ch, "--------------------------------------------------------------------------------\r\n");
      Echo( ch, "&z&WOrganization: &Y%-20s    ", clan->Name);
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

      if( !IsNullOrEmpty( clan->Leadership.Leader ))
        {
          Echo(ch,"&O%-20s",clan->Leadership.Leader);
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
                         subclan->Name, subclan->Leadership.Leader );
            }
        }
      count++;
    }

  Echo( ch, "--------------------------------------------------------------------------------\r\n");
  Echo( ch, "&z&WAutonomous Groups        Leader\r\n");

  for ( clan = FirstClan; clan; clan = clan->Next )
    {
      if ( clan->Type != CLAN_CRIME && clan->Type != CLAN_GUILD )
        continue;

      Echo( ch, "&Y%-24s &O%-10s\r\n",
                 clan->Name, clan->Leadership.Leader );
      count++;
    }

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no organizations currently formed.\r\n", ch );
    }

  SetCharacterColor( AT_WHITE, ch );
}
