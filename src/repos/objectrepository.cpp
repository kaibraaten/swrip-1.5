#include "objectrepository.hpp"

class InMemoryObjectRepository : public ObjectRepository
{

};

std::shared_ptr<ObjectRepository> NewObjectRepository()
{
    return std::make_shared<InMemoryObjectRepository>();
}
