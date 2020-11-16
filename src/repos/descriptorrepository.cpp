#include "descriptorrepository.hpp"

class InMemoryDescriptorRepository : public DescriptorRepository
{

};

std::shared_ptr<DescriptorRepository> NewDescriptorRepository()
{
    return std::make_shared<InMemoryDescriptorRepository>();
}
