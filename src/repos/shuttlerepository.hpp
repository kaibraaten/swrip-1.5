#ifndef _SWRIP_SHUTTLEREPOSITORY_HPP_
#define _SWRIP_SHUTTLEREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class ShuttleRepository : public Ceris::Repository<Shuttle*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Shuttle *shuttle) const = 0;
  virtual Shuttle *FindByName(const std::string &name) const = 0;
  virtual void DeleteFromStorage( Shuttle *shuttle ) = 0;
};

extern ShuttleRepository *Shuttles;
ShuttleRepository *NewShuttleRepository();
std::string GetShuttleFilename( const Shuttle *shuttle );

#endif
