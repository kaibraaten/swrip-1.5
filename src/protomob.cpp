#include "protomob.hpp"
#include "mud.hpp"

struct ProtoMobile::Impl
{
    std::string Tag;
};

ProtoMobile::ProtoMobile(vnum_t vnum)
  : Vnum(vnum),
    pImpl(std::make_unique<Impl>())
{

}

ProtoMobile::~ProtoMobile()
{

}

std::string ProtoMobile::Tag() const
{
    return pImpl->Tag;
}

void ProtoMobile::Tag(const std::string &tag)
{
    pImpl->Tag = tag;
}

/////////////////////////////////
// Free functions

std::shared_ptr<ProtoMobile> GetMobFromTag(const std::string &tag)
{
    for(const auto &[_, mob] : ProtoMobs)
    {
        if(!mob->Tag().empty() && StrCmp(mob->Tag(), tag) == 0)
        {
            return mob;
        }
    }

    return nullptr;
}
