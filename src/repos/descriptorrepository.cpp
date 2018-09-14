#include "descriptorrepository.hpp"

DescriptorRepository *Descriptors = nullptr;

class InMemoryDescriptorRepository : public DescriptorRepository
{

};

DescriptorRepository *NewDescriptorRepository()
{
  return new InMemoryDescriptorRepository();
}
