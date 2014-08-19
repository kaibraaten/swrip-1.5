#include "character.h"
#include "mud.h"

void do_planets( Character *ch, char *argument )
{
  Planet *planet;
  int count = 0;
  Area   *area;

  SetPagerColor( AT_WHITE, ch );
  for ( planet = first_planet; planet; planet = planet->next )
    {
      PagerPrintf( ch, "&wPlanet: &G%-15s   &wGoverned By: &G%s %s\r\n",
                    planet->name ,
                    planet->governed_by ? planet->governed_by->name : "",
                    IsBitSet(planet->flags, PLANET_NOCAPTURE ) ? "(permanent)" : "" );
      PagerPrintf( ch, "&WValue: &O%-10ld&W/&O%-10d   ",
                    GetTaxes(planet) , planet->base_value);
      PagerPrintf( ch, "&WPopulation: &O%-5d   &W Pop Support: &R%.1f\r\n",
                    planet->population , planet->pop_support );
      if ( IsImmortal(ch) )
        {
          PagerPrintf( ch, "&WAreas: &G");
          for ( area = planet->first_area ; area ; area = area->next_on_planet )
            PagerPrintf( ch , "%s,  ", area->filename );
          PagerPrintf( ch, "\r\n" );
        }

      count++;
    }

  if ( !count )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no planets currently formed.\r\n", ch );
    }
}
