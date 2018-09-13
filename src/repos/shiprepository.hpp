#ifndef _SWRIP_SHIPREPOSITORY_HPP_
#define _SWRIP_SHIPREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class ShipRepository : public Ceris::Repository<Ship*>
{
public:
  virtual void Save(const Ship *entity) const = 0;
  virtual void Save() const = 0;
  virtual void Load() = 0;
};

extern ShipRepository *Ships;
ShipRepository *NewShipRepository();
std::string GetShipFilename( const Ship *ship );

#endif
