#ifndef _SWRIP_PLANETREPOSITORY_HPP_
#define _SWRIP_PLANETREPOSITORY_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

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
std::string GetPlanetFilename( const Planet *planet );

#endif
