#ifndef _SWRIP_MISSILE_HPP_
#define _SWRIP_MISSILE_HPP_

#include <memory>
#include <list>
#include <utility/vector3.hpp>

#include "types.hpp"

extern std::list<std::shared_ptr<Missile>> Missiles;

class Missile
{
public:
    std::shared_ptr<Ship> Target;
    std::shared_ptr<Ship> FiredFrom;
    std::string FiredBy;
    MissileType Type = 0;
    short Age = 0;
    int Speed = 0;
    std::shared_ptr<Vector3> Position = std::make_shared<Vector3>();
    std::shared_ptr<Vector3> Heading = std::make_shared<Vector3>();
};

void UpdateMissile(std::shared_ptr<Missile> missile);
void NewMissile(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target,
                const std::string &firedBy, MissileType missiletype);
void ExtractMissile(std::shared_ptr<Missile> missile);

#endif /* include guard */
