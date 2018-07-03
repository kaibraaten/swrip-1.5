#include "mud.h"
#include "clan.h"
#include "planet.h"

void do_clans( Character *ch, char *argument )
{
  int count = 0;
  const List *clans = GetEntities(ClanRepository);
  ListIterator *iterator = AllocateListIterator(clans);

  while(ListHasMoreElements(iterator))
    {
      const Clan *clan = (const Clan*) GetListData(iterator);
      int pCount = 0;
      int support = 0;
      long revenue = 0;
      const Planet *planet = NULL;

      MoveToNextListElement(iterator);

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

      if (ListSize(clan->Subclans) > 0)
        {
          ListIterator *guildIter = AllocateListIterator(clan->Subclans);

          Echo( ch, "  &z&wGuilds               Leader\r\n");

          while(ListHasMoreElements(guildIter))
            {
              Clan *guild = (Clan*) GetListData(guildIter);
              MoveToNextListElement(guildIter);
              Echo( ch, "  &O%-20s %-10s\r\n",
		    guild->Name, guild->Leadership.Leader );
            }

          FreeListIterator(guildIter);
        }

      count++;
    }

  FreeListIterator(iterator);

  Echo( ch, "--------------------------------------------------------------------------------\r\n");

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no organizations currently formed.\r\n", ch );
    }

  SetCharacterColor( AT_WHITE, ch );
}
