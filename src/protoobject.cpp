#include "protoobject.hpp"
#include "mud.hpp"

struct ProtoObject::Impl
{
    std::list<std::shared_ptr<ExtraDescription>> ExtraDescriptions;
    std::list<std::shared_ptr<Affect>> Affects;
    std::string Tag;
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

const std::list<std::shared_ptr<Affect>> &ProtoObject::Affects() const
{
    return pImpl->Affects;
}

void ProtoObject::Add(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.push_back(affect);
}

void ProtoObject::Remove(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.remove(affect);
}

std::string ProtoObject::Tag() const
{
    return pImpl->Tag;
}

void ProtoObject::Tag(const std::string &tag)
{
    pImpl->Tag = tag;
}

std::shared_ptr<ProtoObject> GetObjectFromTag(const std::string &tag)
{
    for(const auto &[_, obj] : ProtoObjects)
    {
        if(StrCmp(obj->Tag(), tag) == 0)
        {
            return obj;
        }
    }

    return nullptr;
}
