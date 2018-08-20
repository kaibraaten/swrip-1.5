#include "protoobject.hpp"

struct ProtoObject::Impl
{
  std::list<ExtraDescription*> ExtraDescriptions;
};

ProtoObject::ProtoObject(vnum_t vnum)
  : Vnum(vnum),
    pImpl(new Impl())
{

}

ProtoObject::~ProtoObject()
{

}

void ProtoObject::Add(ExtraDescription *extraDescription)
{
  pImpl->ExtraDescriptions.push_back(extraDescription);
}

void ProtoObject::Remove(ExtraDescription *extraDescription)
{
  pImpl->ExtraDescriptions.remove(extraDescription);
}

const std::list<ExtraDescription*> &ProtoObject::ExtraDescriptions() const
{
  return pImpl->ExtraDescriptions;
}
