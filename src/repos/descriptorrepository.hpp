#ifndef _SWRIP_DESCRIPTORREPOSITORY_HPP_
#define _SWRIP_DESCRIPTORREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class DescriptorRepository : public Ceris::Repository<Descriptor*>
{
public:

protected:
  DescriptorRepository() { }
};

extern DescriptorRepository *Descriptors;

DescriptorRepository *NewDescriptorRepository();

#endif
