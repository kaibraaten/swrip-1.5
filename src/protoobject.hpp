#ifndef _SWRIP_PROTOOBJECT_HPP_
#define _SWRIP_PROTOOBJECT_HPP_

#include <memory>
#include <list>
#include <array>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class ProtoObject
{
public:
    ProtoObject() = delete;
    ProtoObject(vnum_t vnum);
    ProtoObject(const ProtoObject &rhv);
    
    virtual ~ProtoObject();

    const std::list<std::shared_ptr<ExtraDescription>> &ExtraDescriptions() const;
    void Add(std::shared_ptr<ExtraDescription> extraDescription);
    void Remove(std::shared_ptr<ExtraDescription> extraDescription);

    const std::list<std::shared_ptr<Affect>> &Affects() const;
    void Add(std::shared_ptr<Affect> affect);
    void Remove(std::shared_ptr<Affect> affect);

    std::string Tag() const;
    void Tag(const std::string &tag);

    std::string Name;
    std::string ShortDescr;
    std::string Description;
    std::string ActionDescription;
    vnum_t Vnum = INVALID_VNUM;
    class Plugin *Plugin = nullptr;
    int Level = 0;
    ItemTypes ItemType = 0;
    std::bitset<Flag::MAX> Flags;
    std::bitset<Flag::MAX> WearFlags;
    int Count = 0;
    int Weight = 0;
    int Cost = 0;
    std::array<int, MAX_OVAL> Value;
    int Serial = 0;
    int Layers = 0;

    MProg mprog;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

std::shared_ptr<ProtoObject> GetObjectFromTag(const std::string &tag);

#endif
