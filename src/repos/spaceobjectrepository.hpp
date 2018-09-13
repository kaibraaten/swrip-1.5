#ifndef _SWRIP_SPACEOBJECTREPOSITORY_HPP_
#define _SWRIP_SPACEOBJECTREPOSITORY_HPP_

#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class SpaceobjectRepository : public Ceris::Repository<Spaceobject*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Spaceobject *spaceobject) const = 0;
};

extern SpaceobjectRepository *Spaceobjects;
SpaceobjectRepository *NewSpaceobjectRepository();
std::string GetSpaceobjectFilename( const Spaceobject *spaceobject );

#endif
