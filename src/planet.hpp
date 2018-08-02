#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

struct Planet
{
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

long GetTaxes( const Planet *planet );
const char *GetPlanetFilename( const Planet *planet );

class PlanetRepository : public Ceris::Repository<Planet*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;

  virtual void Save(const Planet *planet) const = 0;
  virtual Planet *FindByName(const std::string &name) const = 0;
};

extern PlanetRepository *Planets;
PlanetRepository *NewPlanetRepository();

#endif
