#include "character.h"
#include "mud.h"

static bool ShowEntry( const Planet *planet, const Character *ch );

void do_planets( Character *ch, char *argument )
{
  ForEach( Planet, first_planet, next, ShowEntry, ch );

  if ( !first_planet )
    {
      SetCharacterColor( AT_BLOOD, ch);
      SendToCharacter( "There are no planets currently formed.\r\n", ch );
    }
  else
    {
      PagerPrintf( ch, "&g--------------------------------------------------------------------------------&w\r\n" );
    }
}

static bool ShowEntry( const Planet *planet, const Character *ch )
{
  PagerPrintf( ch, "&g--------------------------------------------------------------------------------&w\r\n" );
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
      const Area *area = NULL;

      PagerPrintf( ch, "&WAreas: &G");

      for ( area = planet->first_area ; area ; area = area->next_on_planet )
	{
	  PagerPrintf( ch , "%s,  ", area->filename );
	}

      PagerPrintf( ch, "\r\n" );
    }

  return true;
}
