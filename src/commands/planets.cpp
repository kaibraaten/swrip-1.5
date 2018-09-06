#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "planet.hpp"
#include "area.hpp"

static bool ShowEntry( const Planet *planet, const Character *ch );

void do_planets( Character *ch, std::string argument )
{
  for(const Planet *planet : Planets->Entities())
    {
      ShowEntry(planet, ch);
    }

  if (Planets->Count() == 0)
    {
      SetCharacterColor( AT_BLOOD, ch);
      ch->Echo("There are no planets currently formed.\r\n");
    }
  else
    {
      ch->Echo("&g--------------------------------------------------------------------------------&w\r\n" );
    }
}

static bool ShowEntry( const Planet *planet, const Character *ch )
{
  ch->Echo("&g--------------------------------------------------------------------------------&w\r\n" );
  ch->Echo("&wPlanet: &G%-15s   &wGoverned By: &G%s %s\r\n",
           planet->Name.c_str(),
           planet->GovernedBy ? planet->GovernedBy->Name.c_str() : "",
           IsBitSet(planet->Flags, PLANET_NOCAPTURE ) ? "(permanent)" : "" );
  ch->Echo("&WValue: &O%-10ld&W/&O%-10d   ",
           GetTaxes(planet) , planet->BaseValue);
  ch->Echo("&WPopulation: &O%-5d   &W Pop Support: &R%.1f\r\n",
           planet->Population , planet->PopularSupport );

  if ( IsImmortal(ch) )
    {
      ch->Echo("&WAreas: &G");

      for(const Area *area : planet->Areas())
	{
          ch->Echo("%s, ", area->Filename.c_str() );
	}

      ch->Echo("\r\n" );
    }

  return true;
}

