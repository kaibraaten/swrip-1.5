#ifndef _SWRIP_DESCRIPTORREPOSITORY_HPP_
#define _SWRIP_DESCRIPTORREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class DescriptorRepository : public Ceris::Repository<std::shared_ptr<Descriptor>>
{
public:

protected:
  DescriptorRepository() { }
};

extern DescriptorRepository *Descriptors;

DescriptorRepository *NewDescriptorRepository();

#endif
