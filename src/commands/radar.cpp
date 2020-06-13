#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "missile.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"

struct ShowShipData
{
    const Character *ch;
    std::shared_ptr<Ship> ship;
};

static bool ShowShipIfInRadarRange(std::shared_ptr<Ship> target, void *userData);

void do_radar(Character *ch, std::string argument)
{
    int the_chance = 0;
    std::shared_ptr<Ship> ship;
    ShowShipData showShipData;

    if((ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL)
    {
        ch->Echo("&RYou must be in the cockpit or turret of a ship to do that!\r\n");
        return;
    }

    if(ship->Class > SHIP_PLATFORM)
    {
        ch->Echo("&RThis isn't a spacecraft!\r\n");
        return;
    }

    if(ship->State == SHIP_LANDED)
    {
        if(ship->Docked == NULL)
        {
            ch->Echo("&RWait until after you launch!\r\n");
            return;
        }
    }

    if(IsShipInHyperspace(ship))
    {
        ch->Echo("&RYou can only do that in realspace!\r\n");
        return;
    }

    if(ship->Spaceobject == NULL)
    {
        ch->Echo("&RYou can't do that unless the ship is flying in realspace!\r\n");
        return;
    }

    the_chance = IsNpc(ch) ? ch->TopLevel
        : (int)(ch->PCData->Learned[gsn_navigation]);

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou fail to work the controls properly.\r\n");
        LearnFromFailure(ch, gsn_navigation);
        return;
    }

    Act(AT_PLAIN, "$n checks the radar.", ch, NULL, argument.c_str(), TO_ROOM);
    SetCharacterColor(AT_RED, ch);

    for(auto spaceobj : Spaceobjects)
    {
        if(IsSpaceobjectInRange(ship, spaceobj)
           && spaceobj->Type == SPACE_SUN
           && !spaceobj->Name.empty())
            ch->Echo("%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n",
                     spaceobj->Name.c_str(),
                     spaceobj->Position->x,
                     spaceobj->Position->y,
                     spaceobj->Position->z,
                     "",
                     (spaceobj->Position->x - ship->Position->x),
                     (spaceobj->Position->y - ship->Position->y),
                     (spaceobj->Position->z - ship->Position->z));
    }

    SetCharacterColor(AT_LBLUE, ch);

    for(auto spaceobj : Spaceobjects)
    {
        if(IsSpaceobjectInRange(ship, spaceobj)
           && spaceobj->Type == SPACE_PLANET
           && !spaceobj->Name.empty())
            ch->Echo("%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n",
                     spaceobj->Name.c_str(),
                     spaceobj->Position->x,
                     spaceobj->Position->y,
                     spaceobj->Position->z,
                     "",
                     (spaceobj->Position->x - ship->Position->x),
                     (spaceobj->Position->y - ship->Position->y),
                     (spaceobj->Position->z - ship->Position->z));
    }

    ch->Echo("\r\n");
    SetCharacterColor(AT_WHITE, ch);

    for(auto spaceobj : Spaceobjects)
    {
        if(IsSpaceobjectInRange(ship, spaceobj)
           && spaceobj->Type > SPACE_PLANET
           && !spaceobj->Name.empty())
            ch->Echo("%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n",
                     spaceobj->Name.c_str(),
                     spaceobj->Position->x,
                     spaceobj->Position->y,
                     spaceobj->Position->z, "",
                     (spaceobj->Position->x - ship->Position->x),
                     (spaceobj->Position->y - ship->Position->y),
                     (spaceobj->Position->z - ship->Position->z));
    }

    ch->Echo("\r\n");

    showShipData.ch = ch;
    showShipData.ship = ship;
    ForEachShip(ShowShipIfInRadarRange, &showShipData);
    ch->Echo("\r\n");

    for(auto missile : Missiles)
    {
        if(GetMissileDistanceToShip(missile, ship) < 50 * (ship->Instruments.Sensor + 10) * 2)
        {
            ch->Echo("%s    %.0f %.0f %.0f\r\n",
                     missile->Type == CONCUSSION_MISSILE ? "A Concusion missile" :
                     (missile->Type == PROTON_TORPEDO ? "A Torpedo" :
                      (missile->Type == HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb")),
                     (missile->Position->x - ship->Position->x),
                     (missile->Position->y - ship->Position->y),
                     (missile->Position->z - ship->Position->z));
        }
    }

    ch->Echo("\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n",
             ship->Position->x, ship->Position->y, ship->Position->z);

    LearnFromSuccess(ch, gsn_navigation);
}

static bool ShowShipIfInRadarRange(std::shared_ptr<Ship> target, void *userData)
{
    struct ShowShipData *data = (struct ShowShipData *)userData;
    std::shared_ptr<Ship> ship = data->ship;
    const Character *ch = data->ch;

    if(target != ship && target->Spaceobject)
    {
        if(GetShipDistanceToShip(ship, target) < 100 * (ship->Instruments.Sensor + 10) * ((target->Class == SHIP_DEBRIS ? 2 : target->Class) + 1))
            ch->Echo("%s    %.0f %.0f %.0f\r\n",
                     target->Name.c_str(),
                     (target->Position->x - ship->Position->x),
                     (target->Position->y - ship->Position->y),
                     (target->Position->z - ship->Position->z));
        else if(GetShipDistanceToShip(ship, target) < 100 * (ship->Instruments.Sensor + 10) * ((target->Class == SHIP_DEBRIS ? 2 : target->Class) + 3))
        {
            if(target->Class == FIGHTER_SHIP)
                ch->Echo("A small metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            else if(target->Class == MIDSIZE_SHIP)
                ch->Echo("A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            else if(target->Class == SHIP_DEBRIS)
                ch->Echo("scattered metallic reflections    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            else if(target->Class >= CAPITAL_SHIP)
                ch->Echo("A huge metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
        }
    }

    return true;
}
