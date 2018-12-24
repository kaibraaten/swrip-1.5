#include "protoobject.hpp"

struct ProtoObject::Impl
{
  std::list<std::shared_ptr<ExtraDescription>> ExtraDescriptions;
  std::list<Affect*> Affects;
};

ProtoObject::ProtoObject(vnum_t vnum)
  : Vnum(vnum),
    pImpl(std::make_unique<Impl>())
{
  Value.fill(0);
}

ProtoObject::~ProtoObject()
{

}

void ProtoObject::Add(std::shared_ptr<ExtraDescription> extraDescription)
{
  pImpl->ExtraDescriptions.push_back(extraDescription);
}

void ProtoObject::Remove(std::shared_ptr<ExtraDescription> extraDescription)
{
  pImpl->ExtraDescriptions.remove(extraDescription);
}

const std::list<std::shared_ptr<ExtraDescription>> &ProtoObject::ExtraDescriptions() const
{
  return pImpl->ExtraDescriptions;
}

const std::list<Affect*> &ProtoObject::Affects() const
{
  return pImpl->Affects;
}

void ProtoObject::Add(Affect *affect)
{
  pImpl->Affects.push_back(affect);
}

void ProtoObject::Remove(Affect *affect)
{
  pImpl->Affects.remove(affect);
}
