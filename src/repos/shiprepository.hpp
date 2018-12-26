#ifndef _SWRIP_SHIPREPOSITORY_HPP_
#define _SWRIP_SHIPREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class ShipRepository : public Ceris::Repository<std::shared_ptr<Ship>>
{
public:
  virtual void Save(std::shared_ptr<Ship> entity) const = 0;
  virtual void Save() const = 0;
  virtual void Load() = 0;
};

extern std::shared_ptr<ShipRepository> Ships;
std::shared_ptr<ShipRepository> NewShipRepository();
std::string GetShipFilename( std::shared_ptr<Ship> ship );

#endif
