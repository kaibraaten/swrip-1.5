#include "objectrepository.hpp"

DllExport ObjectRepository *Objects = nullptr;

class InMemoryObjectRepository : public ObjectRepository
{

};

ObjectRepository *NewObjectRepository()
{
  return new InMemoryObjectRepository();
}
