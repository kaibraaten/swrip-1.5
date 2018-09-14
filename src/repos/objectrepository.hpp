#ifndef _SWRIP_OBJECTREPOSITORY_HPP_
#define _SWRIP_OBJECTREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class ObjectRepository : public Ceris::Repository<Object*>
{
public:

protected:
  ObjectRepository() = default;
};

extern ObjectRepository *Objects;

ObjectRepository *NewObjectRepository();

#endif
