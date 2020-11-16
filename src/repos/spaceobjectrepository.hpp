#ifndef _SWRIP_SPACEOBJECTREPOSITORY_HPP_
#define _SWRIP_SPACEOBJECTREPOSITORY_HPP_

#include <memory>
#include <string>
#include <utility/repository.hpp>
#include "types.hpp"

class SpaceobjectRepository : public Ceris::Repository<std::shared_ptr<Spaceobject>>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(std::shared_ptr<Spaceobject> spaceobject) const = 0;
};

inline std::shared_ptr<SpaceobjectRepository> Spaceobjects;
std::shared_ptr<SpaceobjectRepository> NewSpaceobjectRepository();
std::string GetSpaceobjectFilename(std::shared_ptr<Spaceobject> spaceobject);

#endif
