#ifndef _SWRIP_PLANETREPOSITORY_HPP_
#define _SWRIP_PLANETREPOSITORY_HPP_

#include <memory>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class PlanetRepository : public Ceris::Repository<std::shared_ptr<Planet>>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;

  virtual void Save(std::shared_ptr<Planet> planet) const = 0;
  virtual std::shared_ptr<Planet> FindByName(const std::string &name) const = 0;
};

extern std::shared_ptr<PlanetRepository> Planets;
std::shared_ptr<PlanetRepository> NewPlanetRepository();
std::string GetPlanetFilename( std::shared_ptr<Planet> planet );

#endif
