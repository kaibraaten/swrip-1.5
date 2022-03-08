#ifndef _SWRIP_PROTOMOB_HPP_
#define _SWRIP_PROTOMOB_HPP_

#include <memory>
#include <bitset>
#include <vector>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"
#include "stats.hpp"

class ProtoMobile
{
public:
    ProtoMobile() = delete;
    explicit ProtoMobile(vnum_t vnum);
    ProtoMobile(const ProtoMobile &rhv);
    
    virtual ~ProtoMobile();
    std::string Tag() const;
    void Tag(const std::string &tag);

    std::vector<std::function<bool(std::shared_ptr<Character>)>> SpecFuns = { nullptr, nullptr };
    std::shared_ptr<class Shop> Shop;
    std::shared_ptr<class RepairShop> RepairShop;
    std::string Name;
    std::string ShortDescr;
    std::string LongDescr;
    std::string Description;
    vnum_t Vnum = INVALID_VNUM;
    class Plugin *Plugin = nullptr;
    int Count = 0;
    int Killed = 0;
    SexType Sex = 0;
    int Level = 0;
    std::bitset<Flag::MAX> Flags;
    std::bitset<Flag::MAX> AffectedBy;
    int Alignment = 0;
    int ArmorClass = 0;
    int HitNoDice = 0;
    int HitSizeDice = 0;
    int HitPlus = 0;
    int DamNoDice = 0;
    int DamSizeDice = 0;
    int DamPlus = 0;
    int NumberOfAttacks = 0;
    int Gold = 0;
    int exp = 0;
    std::bitset<Flag::MAX> Resistant;
    std::bitset<Flag::MAX> Immune;
    std::bitset<Flag::MAX> Susceptible;
    std::bitset<Flag::MAX> AttackFlags;
    std::bitset<Flag::MAX> DefenseFlags;
    int Speaks = LANG_COMMON;
    int Speaking = LANG_COMMON;
    PositionType Position = 0;
    PositionType DefaultPosition = 0;
    int Height = 0;
    int Weight = 0;
    int Race = 0;
    int HitRoll = 0;
    int DamRoll = 0;
    std::bitset<Flag::MAX> VipFlags;

    MProg mprog;

    class Stats Stats;
    SaveVs Saving;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

std::shared_ptr<ProtoMobile> GetMobFromTag(const std::string &tag);

#endif
