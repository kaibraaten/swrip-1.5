#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include "types.hpp"

struct Planet
{
  Planet *Next;
  Planet *Previous;
  struct Spaceobject *Spaceobject;
  Area *FirstArea;
  Area *LastArea;
  char *Name;
  long BaseValue;
  Clan *GovernedBy;
  int Population;
  int Flags;
  float PopularSupport;
};

extern Planet *FirstPlanet;
extern Planet *LastPlanet;

Planet *GetPlanet( const char *name );
void LoadPlanets( void );
void SavePlanet( const Planet *planet );
bool NewSavePlanet( const Planet *planet, int );
long GetTaxes( const Planet *planet );
const char *GetPlanetFilename( const Planet *planet );

#endif
