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
  using Ceris::Repository<Planet*>::Find;

  virtual void Load() override;
  virtual void Save() const override;

  virtual void Save(const Planet *planet) const;
  Planet *Find(const std::string &name) const;
};

extern PlanetRepository *Planets;
PlanetRepository *NewPlanetRepository();

#endif
