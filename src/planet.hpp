#ifndef _SWRIP_PLANET_HPP_
#define _SWRIP_PLANET_HPP_

#include <memory>
#include <string>
#include <list>
#include <bitset>
#include "constants.hpp"

namespace Flag::Planet {
enum : size_t
{
    NoCapture
};
}

class Area;
class Clan;

class Planet
{
public:
    Planet();
    virtual ~Planet();

    const std::list<std::shared_ptr<Area>> &Areas() const;
    void Add(std::shared_ptr<Area> area);
    void Remove(std::shared_ptr<Area> area);

    std::shared_ptr<class Spaceobject> Spaceobject;
    std::string Name;
    long BaseValue = 0;
    std::shared_ptr<Clan> GovernedBy;
    int Population = 0;
    std::bitset<Flag::MAX> Flags;
    double PopularSupport = 0.0;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

long GetTaxes(std::shared_ptr<Planet> planet);

#endif
