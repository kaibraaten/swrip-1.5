#ifndef _SWRIP_OBJECT_HPP_
#define _SWRIP_OBJECT_HPP_

#include <memory>
#include <array>
#include <string>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

class Object
{
public:
    Object();
    Object(std::shared_ptr<ProtoObject> protoObj, int level);
    virtual ~Object();

    const std::list<std::shared_ptr<ExtraDescription>> &ExtraDescriptions() const;
    void Add(std::shared_ptr<ExtraDescription> extraDescription);
    void Remove(std::shared_ptr<ExtraDescription> extraDescription);

    const std::list<std::shared_ptr<Affect>> &Affects() const;
    void Add(std::shared_ptr<Affect> affect);
    void Remove(std::shared_ptr<Affect> affect);

    void Add(Object *object);
    void Remove(Object *object);
    const std::list<Object*> &Objects() const;

    Object *InObject = nullptr;
    Character *CarriedBy = nullptr;
    std::shared_ptr<ProtoObject> Prototype;
    std::shared_ptr<Room> InRoom;
    std::string ArmedBy;
    std::string Name;
    std::string ShortDescr;
    std::string Description;
    std::string ActionDescription;
    ItemTypes ItemType = 0;
    std::bitset<Flag::MAX> Flags;
    int WearFlags = 0;
    int BlasterSetting = 0;
    WearLocation WearLoc = WEAR_NONE;
    int Weight = 1;
    int Cost = 0;
    int Level = 0;
    int Timer = 0;
    std::array<int, MAX_OVAL> Value;
    int Count = 1;          /* support for object grouping */
    int Serial = 0;         /* serial number               */

    MProg mprog;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
