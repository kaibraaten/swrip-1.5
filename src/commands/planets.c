#include "character.h"
#include "mud.h"
#include "clan.h"
#include "planet.h"

static bool ShowEntry( const Planet *planet, const Character *ch );

void do_planets( Character *ch, char *argument )
{
  ForEach( Planet, FirstPlanet, Next, ShowEntry, ch );

  if ( !FirstPlanet )
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
	       planet->Name ,
	       planet->GovernedBy ? planet->GovernedBy->Name : "",
	       IsBitSet(planet->Flags, PLANET_NOCAPTURE ) ? "(permanent)" : "" );
  PagerPrintf( ch, "&WValue: &O%-10ld&W/&O%-10d   ",
	       GetTaxes(planet) , planet->BaseValue);
  PagerPrintf( ch, "&WPopulation: &O%-5d   &W Pop Support: &R%.1f\r\n",
	       planet->Population , planet->PopularSupport );

  if ( IsImmortal(ch) )
    {
      const Area *area = NULL;

      PagerPrintf( ch, "&WAreas: &G");

      for ( area = planet->FirstArea ; area ; area = area->NextOnPlanet )
	{
	  PagerPrintf( ch , "%s,  ", area->Filename );
	}

      PagerPrintf( ch, "\r\n" );
    }

  return true;
}
