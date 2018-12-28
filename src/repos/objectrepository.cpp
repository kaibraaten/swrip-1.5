#include "objectrepository.hpp"

ObjectRepository *Objects = nullptr;

class InMemoryObjectRepository : public ObjectRepository
{

};

ObjectRepository *NewObjectRepository()
{
  return new InMemoryObjectRepository();
}
