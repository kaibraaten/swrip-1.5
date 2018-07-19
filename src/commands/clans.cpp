#include "mud.hpp"
#include "clan.hpp"
#include "planet.hpp"

void do_clans( Character *ch, char *argument )
{
  int count = 0;

  for(const Clan *clan : Clans->Entities())
    {
      int pCount = 0;
      int support = 0;
      long revenue = 0;
      const Planet *planet = nullptr;

      if ( clan->Type == CLAN_GUILD )
        {
          continue;
        }

      for ( planet = FirstPlanet ; planet ; planet = planet->Next )
        {
          if ( clan == planet->GovernedBy )
            {
              support += planet->PopularSupport;
              pCount++;
              revenue += GetTaxes(planet);
            }
        }

      if ( pCount > 1 )
        {
          support /= pCount;
        }

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
      Echo(ch, "&W\r\n");

      if (clan->Subclans.size() > 0)
        {
          Echo( ch, "  &z&wGuilds               Leader\r\n");

          for(const Clan *guild : clan->Subclans)
            {
              Echo( ch, "  &O%-20s %-10s\r\n",
		    guild->Name, guild->Leadership.Leader );
            }
        }

      count++;
    }

  Echo( ch, "--------------------------------------------------------------------------------\r\n");

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no organizations currently formed.\r\n", ch );
    }

  SetCharacterColor( AT_WHITE, ch );
}
