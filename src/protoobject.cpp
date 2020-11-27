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

ProtoObject::ProtoObject(const ProtoObject &orig)
    : Name(orig.Name),
      ShortDescr(orig.ShortDescr),
      Description(orig.Description),
      ActionDescription(orig.ActionDescription),
      Level(orig.Level),
      ItemType(orig.ItemType),
      Flags(orig.Flags),
      WearFlags(orig.WearFlags),
      Weight(orig.Weight),
      Cost(orig.Cost),
      Value(orig.Value),
      Layers(orig.Layers),
      mprog(orig.mprog),
      pImpl(std::make_unique<Impl>())
{
    for(auto ced : orig.ExtraDescriptions())
    {
        auto ed = std::make_shared<ExtraDescription>(*ced);
        Add(ed);
        top_ed++;
    }

    for(auto cpaf : orig.Affects())
    {
        std::shared_ptr<Affect> paf = std::make_shared<Affect>(*cpaf);
        Add(paf);
        top_affect++;
    }
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
        if(!obj->Tag().empty() && StrCmp(obj->Tag(), tag) == 0)
        {
            return obj;
        }
    }

    return nullptr;
}
