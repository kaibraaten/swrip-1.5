#include "mud.hpp"
#include "clan.hpp"
#include "planet.hpp"
#include "character.hpp"
#include "repos/clanrepository.hpp"

void do_clans( Character *ch, std::string argument )
{
  int count = 0;

  for(const Clan *clan : Clans->Entities())
    {
      int pCount = 0;
      int support = 0;
      long revenue = 0;

      if ( clan->Type == CLAN_GUILD )
        {
          continue;
        }

      for(const Planet *planet : Planets->Entities())
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

      ch->Echo( "--------------------------------------------------------------------------------\r\n");
      ch->Echo( "&z&WOrganization: &Y%-20s    ", clan->Name.c_str());
      ch->Echo( "&WPlanets: &O%-4d &z&WAvg Pop Support: ",pCount);

      if (support < 50)
        {
          ch->Echo( "&R" );
        }
      else
        {
          ch->Echo( "&O" );
        }

      ch->Echo( "%-3d&W\r\nRevenue: &O%-29ld&W\r\n",support,revenue);

      if (clan->Subclans().size() > 0)
        {
          ch->Echo( "  &z&wGuilds               Leader\r\n");

          for(const Clan *guild : clan->Subclans())
            {
              ch->Echo( "  &O%-20s %-10s\r\n",
                        guild->Name.c_str(), guild->Leadership.Leader.c_str() );
            }
        }

      count++;
    }

  ch->Echo( "--------------------------------------------------------------------------------\r\n");

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      ch->Echo( "There are no organizations currently formed.\r\n" );
    }

  SetCharacterColor( AT_GREY, ch );
}
