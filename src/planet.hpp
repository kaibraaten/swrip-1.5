#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include <string>
#include <list>
#include <utility/repository.hpp>
#include "types.hpp"

class Planet
{
public:
  Planet();
  virtual ~Planet();

  const std::list<Area*> &Areas() const;
  void Add(Area *area);
  void Remove(Area *area);
  
  struct Spaceobject *Spaceobject = nullptr;
  std::string Name;
  long BaseValue = 0;
  Clan *GovernedBy = nullptr;
  int Population = 0;
  int Flags = 0;
  float PopularSupport = 0.0;

private:
  struct Impl;
  Impl *pImpl;
};

long GetTaxes( const Planet *planet );
std::string GetPlanetFilename( const Planet *planet );

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
