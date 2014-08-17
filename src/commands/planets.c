#include "character.h"
#include "mud.h"

void do_planets( Character *ch, char *argument )
{
  PLANET_DATA *planet;
  int count = 0;
  Area   *area;

  set_pager_color( AT_WHITE, ch );
  for ( planet = first_planet; planet; planet = planet->next )
    {
      pager_printf( ch, "&wPlanet: &G%-15s   &wGoverned By: &G%s %s\r\n",
                    planet->name ,
                    planet->governed_by ? planet->governed_by->name : "",
                    IsBitSet(planet->flags, PLANET_NOCAPTURE ) ? "(permanent)" : "" );
      pager_printf( ch, "&WValue: &O%-10ld&W/&O%-10d   ",
                    get_taxes(planet) , planet->base_value);
      pager_printf( ch, "&WPopulation: &O%-5d   &W Pop Support: &R%.1f\r\n",
                    planet->population , planet->pop_support );
      if ( IsImmortal(ch) )
        {
          pager_printf( ch, "&WAreas: &G");
          for ( area = planet->first_area ; area ; area = area->next_on_planet )
            pager_printf( ch , "%s,  ", area->filename );
          pager_printf( ch, "\r\n" );
        }

      count++;
    }

  if ( !count )
    {
      set_char_color( AT_BLOOD, ch);
      send_to_char( "There are no planets currently formed.\r\n", ch );
    }
}
