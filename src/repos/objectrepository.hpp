#ifndef _SWRIP_OBJECTREPOSITORY_HPP_
#define _SWRIP_OBJECTREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class ObjectRepository : public Ceris::Repository<std::shared_ptr<Object>>
{
public:

protected:
  ObjectRepository() = default;
};

inline std::shared_ptr<ObjectRepository> Objects;

std::shared_ptr<ObjectRepository> NewObjectRepository();

#endif
