#ifndef _SWRIP_SPACEOBJECT_HPP_
#define _SWRIP_SPACEOBJECT_HPP_

#include <memory>
#include <array>
#include <string>
#include "constants.hpp"

constexpr size_t MAX_LANDINGSITE = 3;

class LandingSite
{
public:
    std::string LocationName;
    vnum_t Dock = INVALID_VNUM;
    bool IsSecret = false;
};

class Spaceobject
{
public:
    std::shared_ptr<class Planet> Planet;
    std::string Name;
    SpaceobjectType Type = 0;
    std::shared_ptr<Vector3> Position;
    std::shared_ptr<Vector3> Heading;
    int Speed = 0;
    int Gravity = 0;
    bool IsSimulator = false;

    std::array<LandingSite, MAX_LANDINGSITE> LandingSites;
};

std::shared_ptr<Spaceobject> GetSpaceobject(const std::string &name);
std::shared_ptr<Spaceobject> GetSpaceobjectFromDockVnum(vnum_t vnum);
void SpaceobjectUpdate();
const LandingSite *GetLandingSiteFromVnum(std::shared_ptr<Spaceobject> spaceobj, vnum_t vnum);
const LandingSite *GetLandingSiteFromLocationName(std::shared_ptr<Spaceobject> spaceobj,
    const std::string &name);

#endif
