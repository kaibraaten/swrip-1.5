/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cassert>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "ship.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "character.hpp"
#include "turret.hpp"
#include "missile.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "repos/shiprepository.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"

static int baycount = 0;

static void ApproachLandingSite(std::shared_ptr<Ship> ship, const std::string &arg);
static void LandShip(std::shared_ptr<Ship> ship, const std::string &arg);
static void LaunchShip(std::shared_ptr<Ship> ship);
static void MakeDebris(std::shared_ptr<Ship> ship);
static bool CaughtInGravity(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> space);
static bool WillCollideWithSun(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> sun);
static void EvadeCollisionWithSun(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> sun);
static bool ShipHasState(std::shared_ptr<Ship> ship, ShipState state);
static void DockShip(Character *ch, std::shared_ptr<Ship> ship);

static bool WillCollideWithSun(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> sun)
{
    return GetShipDistanceToSpaceobject(ship, sun) < 10;
}

static bool ShipHasState(std::shared_ptr<Ship> ship, ShipState state)
{
    return ship->State == state;
}

Ship::Ship()
{
    for(size_t turretNum = 0; turretNum < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turretNum)
    {
        WeaponSystems.Turrets[turretNum] = AllocateTurret(Class);
    }
}

bool IsShipInHyperspace(std::shared_ptr<Ship> ship)
{
    return ShipHasState(ship, SHIP_HYPERSPACE);
}

bool IsShipDisabled(std::shared_ptr<Ship> ship)
{
    return ShipHasState(ship, SHIP_DISABLED);
}

static void EvadeCollisionWithSun(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> sun)
{
    ship->Heading->x = 10 * ship->Position->x;
    ship->Heading->y = 10 * ship->Position->y;
    ship->Heading->z = 10 * ship->Position->z;
    ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
    ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;
    EchoToRoom(AT_RED, GetRoom(ship->Rooms.Pilotseat),
               "Automatic Override: Evading to avoid collision with sun!\r\n");

    if(ship->Class == FIGHTER_SHIP
       || (ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50))
    {
        ship->State = SHIP_BUSY_3;
    }
    else if(ship->Class == MIDSIZE_SHIP
            || (ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50))
    {
        ship->State = SHIP_BUSY_2;
    }
    else
    {
        ship->State = SHIP_BUSY;
    }
}

void UpdateShipMovement()
{
    char buf[MAX_STRING_LENGTH];

    for(auto ship : Ships)
    {
        if(ship->Spaceobject == nullptr)
        {
            continue;
        }

        if(ship->State == SHIP_LANDED && ship->Spaceobject != nullptr)
        {
            ship->State = SHIP_READY;
        }

        if(ship->State != SHIP_LAND && ship->State != SHIP_LAND_2)
        {
            MoveShip(ship);
        }

        /*
         * Tractor beam handling
         */
        if(ship->TractoredBy != nullptr)
        {
            /* Tractoring ship is smaller and therefore moves towards target */
            if(ship->TractoredBy->Class <= ship->Class)
            {
                ship->TractoredBy->Thrusters.Speed.Current = ship->TractoredBy->WeaponSystems.TractorBeam.Strength / 4;
                SetShipCourseTowardsShip(ship->TractoredBy, ship);

                if(GetShipDistanceToShip(ship, ship->TractoredBy) < 10)
                {
                    CopyVector(ship->TractoredBy->Position, ship->Position);
                }
            }

            /* Target is smaller and therefore pulled to target */
            if(ship->TractoredBy->Class > ship->Class)
            {
                ship->Thrusters.Speed.Current = ship->TractoredBy->WeaponSystems.TractorBeam.Strength / 4;
                SetShipCourseTowardsShip(ship, ship->TractoredBy);

                if(GetShipDistanceToShip(ship, ship->TractoredBy) < 10)
                {
                    CopyVector(ship->Position, ship->TractoredBy->Position);
                }
            }
        }

        if(IsShipAutoflying(ship))
        {
            continue;
        }

        for(auto spaceobj : Spaceobjects)
        {
            if(spaceobj->Type == SPACE_SUN
               && WillCollideWithSun(ship, spaceobj))
            {
                EvadeCollisionWithSun(ship, spaceobj);
            }

            if(ship->Thrusters.Speed.Current > 0)
            {
                if(spaceobj->Type >= SPACE_PLANET
                   && GetShipDistanceToSpaceobject(ship, spaceobj) < 10)
                {
                    sprintf(buf, "You begin orbitting %s.", spaceobj->Name.c_str());
                    EchoToCockpit(AT_YELLOW, ship, buf);
                    sprintf(buf, "%s begins orbiting %s.",
                            ship->Name.c_str(), spaceobj->Name.c_str());
                    EchoToNearbyShips(AT_ORANGE, ship, buf);
                    ship->InOrbitOf = spaceobj;
                    ship->Thrusters.Speed.Current = 0;
                }
            }
        }
    }

    for(auto ship : Ships)
    {
        if(IsShipInHyperspace(ship))
        {
            std::shared_ptr<Vector3> tmp = std::make_shared<Vector3>();
            float dist = 0;
            float origdist = 0;

            ship->Hyperdistance -= ship->Hyperdrive.Speed;

            dist = (float)ship->Hyperdistance;
            origdist = (float)ship->OriginalHyperdistance;

            if(dist == 0)
                dist = -1;

            SetVector(tmp,
                      ship->Position->x - ship->Jump->x,
                      ship->Position->y - ship->Jump->y,
                      ship->Position->z - ship->Jump->z);
            SetVector(ship->HyperPosition,
                      ship->Position->x - (tmp->x * (dist / origdist)),
                      ship->Position->y - (tmp->y * (dist / origdist)),
                      ship->Position->z - (tmp->z * (dist / origdist)));

            ship->Count++;

            for(auto spaceobj : Spaceobjects)
            {
                if(CaughtInGravity(ship, spaceobj))
                {
                    int dmg = 0;

                    EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat),
                               "Hyperjump complete.");
                    EchoToShip(AT_YELLOW, ship,
                               "The ship slams to a halt as it comes out of hyperspace.");
                    sprintf(buf, "%s enters the starsystem at %.0f %.0f %.0f",
                            ship->Name.c_str(), ship->Position->x, ship->Position->y, ship->Position->z);
                    dmg = 15 * GetRandomNumberFromRange(1, 4);
                    ship->Defenses.Hull.Current -= dmg;
                    EchoToShip(AT_YELLOW, ship,
                               "The hull cracks from the pressure.");
                    CopyVector(ship->Position, ship->HyperPosition);
                    ShipToSpaceobject(ship, ship->CurrentJump);
                    ship->CurrentJump = NULL;
                    EchoToNearbyShips(AT_YELLOW, ship, buf);
                    ship->State = SHIP_READY;
                    ship->Home = ship->Spaceobject->Name;
                }
            }

            if(IsShipInHyperspace(ship)
               && ship->Hyperdistance <= 0
               && !ship->Tracking)
            {
                ship->Count = 0;
                ShipToSpaceobject(ship, ship->CurrentJump);

                if(ship->Spaceobject == NULL)
                {
                    EchoToCockpit(AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
                else
                {
                    EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Hyperjump complete.");
                    EchoToShip(AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                    sprintf(buf, "%s enters the starsystem at %.0f %.0f %.0f",
                            ship->Name.c_str(), ship->Position->x, ship->Position->y, ship->Position->z);
                    CopyVector(ship->HyperPosition, ship->Position);
                    ShipToSpaceobject(ship, ship->CurrentJump);
                    ship->CurrentJump = NULL;
                    EchoToNearbyShips(AT_YELLOW, ship, buf);
                    ship->State = SHIP_READY;
                    ship->Home = ship->Spaceobject->Name;
                }
            }
            else if((ship->Count >= (ship->tcount ? ship->tcount : 10))
                    && IsShipInHyperspace(ship)
                    && ship->Tracking == true)
            {
                ShipToSpaceobject(ship, ship->CurrentJump);

                if(ship->Spaceobject == NULL)
                {
                    EchoToCockpit(AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
                }
                else
                {
                    EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Hyperjump complete.");
                    EchoToShip(AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
                    sprintf(buf, "%s enters the starsystem at %.0f %.0f %.0f",
                            ship->Name.c_str(), ship->Position->x, ship->Position->y, ship->Position->z);
                    CopyVector(ship->Position, ship->HyperPosition);
                    ShipToSpaceobject(ship, ship->CurrentJump);
                    ship->CurrentJump = NULL;
                    EchoToNearbyShips(AT_YELLOW, ship, buf);
                    ship->State = SHIP_READY;
                    ship->Home = ship->Spaceobject->Name;

                    SetVector(ship->Jump,
                              ship->Position->x + ship->TrackVector->x,
                              ship->Position->y + ship->TrackVector->y,
                              ship->Position->z + ship->TrackVector->z);

                    bool found = false;

                    for(auto spaceobj : Spaceobjects)
                    {
                        if(IsSpaceobjectInRange(ship, spaceobj))
                        {
                            ship->CurrentJump = spaceobj;
                            found = true;
                            break;
                        }
                    }

                    if(!found)
                    {
                        ship->CurrentJump = ship->Spaceobject;
                    }

                    ship->Hyperdistance = GetDistanceBetweenVectors(ship->Position, ship->Jump) / 50;
                    ship->OriginalHyperdistance = ship->Hyperdistance;
                    ship->Count = 0;
                    do_radar(ship->Ch, "");
                }
            }
            else if(ship->Count >= 10 && IsShipInHyperspace(ship))
            {
                ship->Count = 0;
                sprintf(buf, "%d", ship->Hyperdistance);
                EchoToRoomNoNewline(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Remaining jump distance: ");
                EchoToRoom(AT_WHITE, GetRoom(ship->Rooms.Pilotseat), buf);
            }

            if(IsShipInHyperspace(ship))
            {
                if(ship->Count % 2
                   && ship->Hyperdistance < 10 * ship->Hyperdrive.Speed
                   && ship->Hyperdistance > 0)
                {
                    sprintf(buf, "An alarm sounds. Your hyperjump is ending: %d",
                            ship->Hyperdistance);
                    EchoToShip(AT_RED, ship, buf);
                }
            }
        }

        if(ship->Docked)
        {
            std::shared_ptr<Ship> docked = ship->Docked;
            CopyVector(ship->Position, docked->Position);
            CopyVector(ship->HyperPosition, docked->HyperPosition);
            CopyVector(ship->OriginPosition, docked->OriginPosition);
            CopyVector(ship->Jump, docked->Jump);
            CopyVector(ship->Heading, docked->Heading);

            ship->State = ship->Docked->State;
            ship->Hyperdistance = ship->Docked->Hyperdistance;
            ship->Thrusters.Speed.Current = ship->Docked->Thrusters.Speed.Current;
            ship->OriginalHyperdistance = ship->Docked->OriginalHyperdistance;
            ship->Location = ship->Docked->Location;
            ship->LandingDestination = ship->Docked->LandingDestination;
            ship->Spaceobject = ship->Docked->Spaceobject;
            ship->CurrentJump = ship->Docked->CurrentJump;
        }

        if(ship->Position->x > MAX_COORD)
            ship->Position->x = -MAX_COORD_S;

        if(ship->Position->y > MAX_COORD)
            ship->Position->y = -MAX_COORD_S;

        if(ship->Position->z > MAX_COORD)
            ship->Position->z = -MAX_COORD_S;

        if(ship->Position->x > MAX_COORD)
            ship->Position->x = MAX_COORD_S;

        if(ship->Position->y > MAX_COORD)
            ship->Position->y = MAX_COORD_S;

        if(ship->Position->z > MAX_COORD)
            ship->Position->z = MAX_COORD_S;
    }
}

static void LandShip(std::shared_ptr<Ship> ship, const std::string &arg)
{
    std::shared_ptr<Ship> target;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    vnum_t destination = INVALID_VNUM;
    Character *ch = NULL;
    const LandingSite *site = GetLandingSiteFromLocationName(ship->Spaceobject, arg);

    if(site)
    {
        destination = site->Dock;
    }

    if(target != ship && target != NULL && target->BayOpen
       && (ship->Class != MIDSIZE_SHIP || target->Class != MIDSIZE_SHIP))
    {
        destination = target->Rooms.Hangar;
    }

    if(!ShipToRoom(ship, destination))
    {
        EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Could not complete approach. Landing aborted.");
        EchoToShip(AT_YELLOW, ship, "The ship pulls back up out of its landing sequence.");

        if(!IsShipDisabled(ship))
        {
            ship->State = SHIP_READY;
        }

        return;
    }

    EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Landing sequence complete.");
    EchoToShip(AT_YELLOW, ship, "You feel a slight thud as the ship sets down on the ground.");
    sprintf(buf, "%s disappears from your scanner.", ship->Name.c_str());
    EchoToNearbyShips(AT_YELLOW, ship, buf);

    if(ship->Ch && ship->Ch->Desc)
    {
        long xp = 0;

        ch = ship->Ch;
        xp = (GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY)));
        xp = umin(GetShipValue(ship), xp);
        GainXP(ch, PILOTING_ABILITY, xp);
        ch->Echo("&WYou gain %ld points of flight experience!\r\n",
                 umin(GetShipValue(ship), xp));
        ship->Ch = NULL;
    }

    ship->Location = destination;
    ship->LastDock = ship->Location;

    if(!IsShipDisabled(ship))
    {
        ship->State = SHIP_LANDED;
    }

    ShipFromSpaceobject(ship, ship->Spaceobject);

    if(ship->WeaponSystems.TractorBeam.Tractoring)
    {
        if(ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy == ship)
        {
            ship->WeaponSystems.TractorBeam.Tractoring->TractoredBy = NULL;
        }

        ship->WeaponSystems.TractorBeam.Tractoring = NULL;
    }

    sprintf(buf, "%s lands on the platform.", ship->Name.c_str());
    EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);

    ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Current - 25 - 25 * ship->Class;

    if(!StrCmp("Public", ship->Owner)
       || !StrCmp("trainer", ship->Owner)
       || ship->Class == SHIP_TRAINER)
    {
        ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
        ship->Defenses.Shield.Current = 0;
        ship->AutoRecharge = false;
        ship->AutoTrack = false;
        ship->AutoSpeed = false;
        ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;

        ship->WeaponSystems.Tube.State = MISSILE_READY;
        ship->WeaponSystems.Laser.State = LASER_READY;

        ForEach(ship->WeaponSystems.Turrets, ResetTurret);

        ship->State = SHIP_LANDED;

        EchoToCockpit(AT_YELLOW, ship, "Repairing and refueling ship...");
    }

    Ships->Save(ship);
}

static void ApproachLandingSite(std::shared_ptr<Ship> ship, const std::string &arg)
{
    std::shared_ptr<Spaceobject> spaceobj;
    char buf[MAX_STRING_LENGTH];
    std::string landingSiteName;
    bool found = false;
    std::shared_ptr<Ship> target;

    for(auto i = cbegin(Spaceobjects);
        i != cend(Spaceobjects); ++i)
    {
        spaceobj = *i;

        if(IsSpaceobjectInRange(ship, spaceobj))
        {
            found = GetLandingSiteFromLocationName(spaceobj, arg) ? true : false;
            break;
        }
    }

    if(found)
    {
        for(size_t siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum)
        {
            if(!StringPrefix(arg, spaceobj->LandingSites[siteNum].LocationName))
            {
                landingSiteName = spaceobj->LandingSites[siteNum].LocationName;
                break;
            }
        }
    }

    target = GetShipInRange(arg, ship);

    if(target && target != ship && target->BayOpen
       && (ship->Class != MIDSIZE_SHIP || target->Class != MIDSIZE_SHIP))
    {
        landingSiteName = target->Name;
    }

    if(!found && !target)
    {
        EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "ERROR");
        return;
    }

    sprintf(buf, "Approaching %s.", landingSiteName.c_str());
    EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), buf);
    sprintf(buf, "%s begins its approach to %s.", ship->Name.c_str(), landingSiteName.c_str());
    EchoToNearbyShips(AT_YELLOW, ship, buf);
}

static void CopyPositionToDockedShips(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> docked)
{
    if(docked->LastDock == ship->Rooms.Hangar)
    {
        CopyVector(docked->Position, ship->Position);
    }
}

static void LaunchShip(std::shared_ptr<Ship> ship)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    std::shared_ptr<Spaceobject> spaceobject = GetSpaceobjectFromDockVnum(ship->Location);
    int plusminus = 0;

    ShipToSpaceobject(ship, spaceobject);

    if(!ship->Spaceobject)
    {
        EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Launch path blocked... Launch aborted.");
        EchoToShip(AT_YELLOW, ship, "The ship slowly sets back back down on the landing pad.");
        sprintf(buf, "%s slowly sets back down.", ship->Name.c_str());
        EchoToRoom(AT_YELLOW, GetRoom(ship->Location), buf);
        ship->State = SHIP_LANDED;
        return;
    }

    ExtractShip(ship);

    ship->Location = INVALID_VNUM;

    if(!IsShipDisabled(ship))
    {
        ship->State = SHIP_READY;
    }

    plusminus = GetRandomNumberFromRange(-1, 2);

    if(plusminus > 0)
    {
        ship->Heading->x = 1;
    }
    else
    {
        ship->Heading->x = -1;
    }

    plusminus = GetRandomNumberFromRange(-1, 2);

    if(plusminus > 0)
    {
        ship->Heading->y = 1;
    }
    else
    {
        ship->Heading->y = -1;
    }

    plusminus = GetRandomNumberFromRange(-1, 2);

    if(plusminus > 0)
    {
        ship->Heading->z = 1;
    }
    else
    {
        ship->Heading->z = -1;
    }

    if(ship->Spaceobject
       && GetLandingSiteFromVnum(ship->Spaceobject, ship->LastDock))
    {
        CopyVector(ship->Position, ship->Spaceobject->Position);
    }
    else
    {
        ForEach(Ships->Entities(), [ship](const auto &docked)
                {
                    CopyPositionToDockedShips(ship, docked);
                });
    }

    ship->Thrusters.Energy.Current -= (100 + 100 * ship->Class);

    ship->Position->x += (ship->Heading->x * ship->Thrusters.Speed.Current * 2);
    ship->Position->y += (ship->Heading->y * ship->Thrusters.Speed.Current * 2);
    ship->Position->z += (ship->Heading->z * ship->Thrusters.Speed.Current * 2);

    EchoToCockpit(AT_GREEN, ship, "Launch complete.");
    EchoToShip(AT_YELLOW, ship, "The ship leaves the platform far behind as it flies into space.");
    sprintf(buf, "%s enters the starsystem at %.0f %.0f %.0f",
            ship->Name.c_str(), ship->Position->x, ship->Position->y, ship->Position->z);
    EchoToNearbyShips(AT_YELLOW, ship, buf);
    sprintf(buf, "%s lifts off into space.", ship->Name.c_str());
    EchoToRoom(AT_YELLOW, GetRoom(ship->LastDock), buf);
}

static void MakeDebris(std::shared_ptr<Ship> ship)
{
    char buf[MAX_STRING_LENGTH];
    int turret_num = 0;

    if(ship->Class == SHIP_DEBRIS)
    {
        return;
    }

    std::shared_ptr<Ship> debris = std::make_shared<Ship>();
    Ships->Add(debris);

    debris->Type = SHIP_CIVILIAN;

    if(ship->Type != MOB_SHIP)
    {
        debris->Type = ship->Type;
    }

    debris->Class = SHIP_DEBRIS;
    debris->WeaponSystems.Laser.Count = ship->WeaponSystems.Laser.Count;
    debris->WeaponSystems.Tube.Missiles.Current = ship->WeaponSystems.Tube.Missiles.Current;
    debris->WeaponSystems.Tube.Rockets.Current = ship->WeaponSystems.Tube.Rockets.Current;
    debris->WeaponSystems.Tube.Torpedoes.Current = ship->WeaponSystems.Tube.Torpedoes.Current;
    debris->Defenses.Shield.Max = ship->Defenses.Shield.Max;
    debris->Defenses.Hull.Max = ship->Defenses.Hull.Max;
    debris->Thrusters.Energy.Max = ship->Thrusters.Energy.Max;
    debris->Hyperdrive.Speed = ship->Hyperdrive.Speed;
    debris->Defenses.Chaff.Current = ship->Defenses.Chaff.Current;
    debris->Thrusters.Speed.Max = ship->Thrusters.Speed.Max;
    debris->Thrusters.Speed.Current = ship->Thrusters.Speed.Current;
    debris->Thrusters.Maneuver = ship->Thrusters.Maneuver;

    debris->Defenses.Hull.Current = ship->Defenses.Hull.Max;

    for(turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num)
    {
        FreeTurret(debris->WeaponSystems.Turrets[turret_num]);
        debris->WeaponSystems.Turrets[turret_num] = CopyTurret(ship->WeaponSystems.Turrets[turret_num], debris->Class);
    }

    strcpy(buf, "Debris of a ");
    strcat(buf, ship->Name.c_str());
    debris->Name = "Debris";
    debris->PersonalName = "Debris";
    debris->Description = buf;

    ShipToSpaceobject(debris, ship->Spaceobject);
    CopyVector(debris->Position, ship->Position);
    CopyVector(debris->Heading, ship->Heading);
}

static void DockShip(Character *ch, std::shared_ptr<Ship> ship)
{
    if(ship->DockingState == SHIP_DISABLED)
    {
        EchoToShip(AT_YELLOW, ship, "Maneuver Aborted. Docking clamps damaged.");
        EchoToShip(AT_YELLOW, ship->Docked, "The ship aborted the docking manuever.");
        ship->Docking = SHIP_READY;
        ship->Docked = NULL;
        return;
    }

    if(ship->Docked->DockingState == SHIP_DISABLED)
    {
        EchoToShip(AT_YELLOW, ship->Docked, "Maneuver Aborted. Docking clamps damaged.");
        EchoToShip(AT_YELLOW, ship, "The ship aborted the docking manuever.");
        ship->Docking = SHIP_READY;
        ship->Docked = NULL;
        return;
    }

    EchoToShip(AT_YELLOW, ship, "The ship finishing its docking manuevers.");
    EchoToShip(AT_YELLOW, ship->Docked, "The ship finishes its docking manuevers.");

    ship->Docking = SHIP_DOCKED;
    ship->Thrusters.Speed.Current = 0;
    CopyVector(ship->Position, ship->Docked->Position);

    if(ch)
    {
        if(ship->Class == FIGHTER_SHIP)
        {
            LearnFromSuccess(ch, gsn_starfighters);
            LearnFromSuccess(ch, gsn_shipdocking);
        }

        if(ship->Class == MIDSIZE_SHIP)
        {
            LearnFromSuccess(ch, gsn_midships);
            LearnFromSuccess(ch, gsn_shipdocking);
        }

        if(ship->Class == CAPITAL_SHIP)
        {
            LearnFromSuccess(ch, gsn_capitalships);
            LearnFromSuccess(ch, gsn_shipdocking);
        }
    }
}

void TransferShip(std::shared_ptr<Ship> ship, vnum_t destination)
{
    vnum_t origShipyard = INVALID_VNUM;

    if(!ship)
    {
        return;
    }

    origShipyard = ship->Shipyard;

    ship->Shipyard = destination;
    ship->State = SHIP_READY;

    ExtractShip(ship);
    ShipToRoom(ship, ship->Shipyard);

    ship->Location = ship->Shipyard;
    ship->LastDock = ship->Shipyard;
    ship->State = SHIP_LANDED;
    ship->Shipyard = origShipyard;

    if(ship->Spaceobject)
    {
        ShipFromSpaceobject(ship, ship->Spaceobject);
    }

    Ships->Save(ship);
}

void TargetShip(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target)
{
    char buf[MAX_STRING_LENGTH];

    ship->WeaponSystems.Target = target;
    sprintf(buf, "You are being targetted by %s.", ship->Name.c_str());
    EchoToCockpit(AT_BLOOD, target, buf);
    sprintf(buf, "The ship targets %s.", target->Name.c_str());
    EchoToCockpit(AT_BLOOD, ship, buf);
}

bool CheckHostile(std::shared_ptr<Ship> ship)
{
    long distance = -1;
    std::shared_ptr<Ship> enemy;

    if(!IsShipAutoflying(ship) || ship->Class == SHIP_DEBRIS)
    {
        return false;
    }

    for(auto target : Ships)
    {
        if(!IsShipInCombatRange(ship, target))
            continue;

        if(!StrCmp(ship->Owner, BADGUY_CLAN))
        {
            if(!StrCmp(target->Owner, GOODGUY_CLAN))
            {
                long tempdistance = GetShipDistanceToShip(ship, target);

                if(distance == -1 || tempdistance < distance)
                {
                    distance = tempdistance;
                    enemy = target;
                }
            }
        }

        if((!StrCmp(ship->Owner, GOODGUY_CLAN)))
        {
            if(!StrCmp(target->Owner, BADGUY_CLAN))
            {
                long tempdistance = GetShipDistanceToShip(ship, target);

                if(distance == -1 || tempdistance < distance)
                {
                    distance = tempdistance;
                    enemy = target;
                }
            }
        }

        if(!StrCmp(ship->Owner, "Pirates"))
        {
            if(StrCmp(target->Owner, "Pirates"))
            {
                long tempdistance = GetShipDistanceToShip(ship, target);

                if(distance == -1 || distance > tempdistance)
                {
                    distance = tempdistance;
                    enemy = target;
                }
            }
        }
    }

    if(enemy)
    {
        TargetShip(ship, enemy);
        return true;
    }

    return false;
}

ch_ret DriveShip(Character *ch, std::shared_ptr<Ship> ship, std::shared_ptr<Exit> pexit, int fall)
{
    char buf[MAX_STRING_LENGTH];
    const char *txt = NULL;
    const char *dtxt = NULL;
    ch_ret retcode = rNONE;
    DirectionType door = DIR_INVALID;
    short the_chance = 0;
    bool drunk = false;

    if(!IsNpc(ch))
    {
        if(IsDrunk(ch) && (ch->Position != POS_SHOVE)
           && (ch->Position != POS_DRAG))
        {
            drunk = true;
        }
    }

    if(drunk && !fall)
    {
        door = (DirectionType)GetRandomDoor();
        pexit = GetExit(GetRoom(ship->Location), door);
    }

    auto in_room = GetRoom(ship->Location);
    std::shared_ptr<Room> to_room;

    if(!pexit || (to_room = pexit->ToRoom) == NULL)
    {
        if(drunk)
        {
            ch->Echo("You drive into a wall in your drunken state.\r\n");
        }
        else
        {
            ch->Echo("Alas, you cannot go that way.\r\n");
        }

        return rNONE;
    }

    door = pexit->Direction;

    if(pexit->Flags.test(Flag::Exit::Window)
       && !pexit->Flags.test(Flag::Exit::IsDoor))
    {
        ch->Echo("Alas, you cannot go that way.\r\n");
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::Portal)
       && IsNpc(ch))
    {
        Act(AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR);
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::NoMob)
       && IsNpc(ch))
    {
        Act(AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR);
        return rNONE;
    }

    if(pexit->Flags.test(Flag::Exit::Closed)
       && pexit->Flags.test(Flag::Exit::NoPassdoor))
    {
        if(!pexit->Flags.test(Flag::Exit::Secret)
           && !pexit->Flags.test(Flag::Exit::Dig))
        {
            if(drunk)
            {
                Act(AT_PLAIN, "$n drives into the $d in $s drunken state.",
                    ch, NULL, pexit->Keyword.c_str(), TO_ROOM);
                Act(AT_PLAIN, "You drive into the $d in your drunken state.",
                    ch, NULL, pexit->Keyword.c_str(), TO_CHAR);
            }
            else
            {
                Act(AT_PLAIN, "The $d is closed.", ch, NULL, pexit->Keyword.c_str(), TO_CHAR);
            }
        }
        else
        {
            if(drunk)
            {
                ch->Echo("You hit a wall in your drunken state.\r\n");
            }
            else
            {
                ch->Echo("Alas, you cannot go that way.\r\n");
            }
        }

        return rNONE;
    }

    if(IsRoomPrivate(ch, to_room))
    {
        ch->Echo("That room is private right now.\r\n");
        return rNONE;
    }

    if(!IsImmortal(ch)
       && !IsNpc(ch)
       && ch->InRoom->Area != to_room->Area)
    {
        if(ch->TopLevel < to_room->Area->LevelRanges.Hard.Low)
        {
            SetCharacterColor(AT_TELL, ch);

            switch(to_room->Area->LevelRanges.Hard.Low - ch->TopLevel)
            {
            case 1:
                ch->Echo("A voice in your mind says, 'You are nearly ready to go that way...'");
                break;

            case 2:
                ch->Echo("A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'");
                break;

            case 3:
                ch->Echo("A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n");
                break;

            default:
                ch->Echo("A voice in your mind says, 'You are not ready to go down that path.'.\r\n");
            }

            return rNONE;
        }
        else if(ch->TopLevel > to_room->Area->LevelRanges.Hard.High)
        {
            SetCharacterColor(AT_TELL, ch);
            ch->Echo("A voice in your mind says, 'There is nothing more for you down that path.'");
            return rNONE;
        }
    }

    if(!fall)
    {
        if(to_room->Flags.test(Flag::Room::Indoors)
           || to_room->Flags.test(Flag::Room::Spacecraft)
           || to_room->Sector == SECT_INSIDE)
        {
            ch->Echo("You can't drive indoors!\r\n");
            return rNONE;
        }

        if(to_room->Flags.test(Flag::Room::NoDrive))
        {
            ch->Echo("You can't take a vehicle through there!\r\n");
            return rNONE;
        }

        if(in_room->Sector == SECT_AIR
           || to_room->Sector == SECT_AIR
           || pexit->Flags.test(Flag::Exit::Fly))
        {
            if(ship->Class > CLOUD_CAR)
            {
                ch->Echo("You'd need to fly to go there.\r\n");
                return rNONE;
            }
        }

        if(in_room->Sector == SECT_WATER_NOSWIM
           || to_room->Sector == SECT_WATER_NOSWIM
           || to_room->Sector == SECT_WATER_SWIM
           || to_room->Sector == SECT_UNDERWATER
           || to_room->Sector == SECT_OCEANFLOOR)
        {
            if(ship->Class != OCEAN_SHIP)
            {
                ch->Echo("You'd need a boat to go there.\r\n");
                return rNONE;
            }
        }

        if(pexit->Flags.test(Flag::Exit::Climb))
        {
            if(ship->Class < CLOUD_CAR)
            {
                ch->Echo("You need to fly or climb to get up there.\r\n");
                return rNONE;
            }
        }
    }

    if(to_room->Tunnel > 0)
    {
        int count = to_room->Characters().size();

        if(count >= to_room->Tunnel)
        {
            ch->Echo("There is no room for you in there.\r\n");
            return rNONE;
        }
    }

    if(fall)
    {
        txt = "falls";
    }
    else if(!txt)
    {
        if(ship->Class < OCEAN_SHIP)
        {
            txt = "fly";
        }
        else if(ship->Class == OCEAN_SHIP)
        {
            txt = "float";
        }
        else if(ship->Class > OCEAN_SHIP)
        {
            txt = "drive";
        }
    }

    the_chance = IsNpc(ch) ? ch->TopLevel : ch->PCData->Learned[gsn_speeders];

    if(GetRandomPercent() > the_chance)
    {
        ch->Echo("&RYou can't figure out which switch it is.\r\n");
        LearnFromFailure(ch, gsn_speeders);
        return retcode;
    }

    sprintf(buf, "$n %ss the vehicle $T.", txt);
    Act(AT_ACTION, buf, ch, NULL, GetDirectionName(door), TO_ROOM);
    sprintf(buf, "You %s the vehicle $T.", txt);
    Act(AT_ACTION, buf, ch, NULL, GetDirectionName(door), TO_CHAR);
    sprintf(buf, "%s %ss %s.", ship->Name.c_str(), txt, GetDirectionName(door));
    EchoToRoom(AT_ACTION, GetRoom(ship->Location), buf);

    ExtractShip(ship);
    ShipToRoom(ship, to_room->Vnum);

    ship->Location = to_room->Vnum;
    ship->LastDock = ship->Location;

    if(fall)
    {
        txt = "falls";
    }
    else if(ship->Class < OCEAN_SHIP)
    {
        txt = "flies in";
    }
    else if(ship->Class == OCEAN_SHIP)
    {
        txt = "floats in";
    }
    else if(ship->Class > OCEAN_SHIP)
    {
        txt = "drives in";
    }

    switch(door)
    {
    default: dtxt = "somewhere";        break;
    case 0:  dtxt = "the south";        break;
    case 1:  dtxt = "the west"; break;
    case 2:  dtxt = "the north";        break;
    case 3:  dtxt = "the east"; break;
    case 4:  dtxt = "below";            break;
    case 5:  dtxt = "above";            break;
    case 6:  dtxt = "the south-west";   break;
    case 7:  dtxt = "the south-east";   break;
    case 8:  dtxt = "the north-west";   break;
    case 9:  dtxt = "the north-east";   break;
    }

    sprintf(buf, "%s %s from %s.", ship->Name.c_str(), txt, dtxt);
    EchoToRoom(AT_ACTION, GetRoom(ship->Location), buf);

    std::list<Character *> charactersInRoom(Reverse(ch->InRoom->Characters()));

    for(Character *rch : charactersInRoom)
    {
        auto original = rch->InRoom;
        CharacterFromRoom(rch);
        CharacterToRoom(rch, to_room);
        do_look(rch, "auto");
        CharacterFromRoom(rch);
        CharacterToRoom(rch, original);
    }

    LearnFromSuccess(ch, gsn_speeders);
    return retcode;
}

void EchoToShip(int color, std::shared_ptr<Ship> ship, const std::string &argument)
{
    for(vnum_t roomVnum = ship->Rooms.First; roomVnum <= ship->Rooms.Last; roomVnum++)
    {
        auto room = GetRoom(roomVnum);

        if(room)
        {
            EchoToRoom(color, room, argument);
        }
        else
        {
            Log->Bug("%s:%d %s(): Ship '%s (%s)' has invalid room vnum %ld",
                     __FILE__, __LINE__, __FUNCTION__,
                     ship->Name.c_str(), ship->PersonalName.c_str(), roomVnum);
        }
    }
}

bool IsShipAutoflying(std::shared_ptr<Ship> ship)
{
    if(!ship)
    {
        return false;
    }

    if(ship->Type == MOB_SHIP)
    {
        return true;
    }

    if(ship->Autopilot)
    {
        return true;
    }

    return false;
}

void RechargeShips()
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    bool closeem = false;
    int origchance = 100;

    baycount++;

    if(baycount >= 60)
    {
        closeem = true;
        baycount = 0;
    }

    for(auto ship : Ships)
    {
        if(ship->Class == SHIP_PLATFORM)
        {
            if(closeem && ship->Guard)
            {
                ship->BayOpen = false;
            }
        }

        if(ship->WeaponSystems.Laser.State > LASER_READY)
        {
            ship->Thrusters.Energy.Current -= ship->WeaponSystems.Laser.State;
            ship->WeaponSystems.Laser.State = LASER_READY;
        }

        if(ship->WeaponSystems.IonCannon.State > LASER_READY)
        {
            ship->Thrusters.Energy.Current -= 10 * ship->WeaponSystems.IonCannon.State;
            ship->WeaponSystems.IonCannon.State = LASER_READY;
        }

        for(auto turret : ship->WeaponSystems.Turrets)
        {
            ship->Thrusters.Energy.Current -= GetTurretEnergyDraw(turret);
        }

        if(ship->Docked && ship->Docked->Class == SHIP_PLATFORM)
        {
            if(ship->Thrusters.Energy.Max - ship->Thrusters.Energy.Current > 500)
            {
                ship->Thrusters.Energy.Current += 500;
            }
            else
            {
                ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
            }
        }

        if(ship->WeaponSystems.Tube.State == MISSILE_RELOAD_2)
        {
            ship->WeaponSystems.Tube.State = MISSILE_READY;

            if(ship->WeaponSystems.Tube.Missiles.Current > 0)
            {
                EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Gunseat),
                           "Missile launcher reloaded.");
            }
        }

        if(ship->WeaponSystems.Tube.State == MISSILE_RELOAD)
        {
            ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
        }

        if(ship->WeaponSystems.Tube.State == MISSILE_FIRED)
        {
            ship->WeaponSystems.Tube.State = MISSILE_RELOAD;
        }

        if(IsShipAutoflying(ship))
        {
            if(ship->Spaceobject && ship->Class != SHIP_DEBRIS)
            {
                if(ship->WeaponSystems.Target && ship->WeaponSystems.Laser.State != LASER_DAMAGED)
                {
                    int the_chance = 75;
                    std::shared_ptr<Ship> target = ship->WeaponSystems.Target;
                    int shots = 0, guns = 0;
                    int whichguns = 0;

                    if(ship->WeaponSystems.Laser.Count > 0
                       && ship->WeaponSystems.IonCannon.Count > 0
                       && ship->WeaponSystems.Laser.Count < 7
                       && ship->WeaponSystems.IonCannon.Count < 7)
                    {
                        whichguns = 2;
                        guns = ship->WeaponSystems.Laser.Count + ship->WeaponSystems.IonCannon.Count;
                    }
                    else if(ship->WeaponSystems.Target->Defenses.Shield.Current > 0
                            && ship->WeaponSystems.IonCannon.Count)
                    {
                        whichguns = 1;
                        guns = ship->WeaponSystems.IonCannon.Count;
                    }
                    else
                    {
                        guns = ship->WeaponSystems.Laser.Count;
                    }

                    for(shots = 0; shots < guns; shots++)
                    {
                        if(!IsShipInHyperspace(ship)
                           && ship->Thrusters.Energy.Current > 25
                           && IsShipInCombatRange(ship, target)
                           && GetShipDistanceToShip(target, ship) <= 1000)
                        {
                            if(ship->Class > MIDSIZE_SHIP || IsShipFacingShip(ship, target))
                            {
                                the_chance += target->Class - ship->Class;
                                the_chance += ship->Thrusters.Speed.Current - target->Thrusters.Speed.Current;
                                the_chance += ship->Thrusters.Maneuver - target->Thrusters.Maneuver;
                                the_chance -= GetShipDistanceToShip(ship, target) / (10 * (target->Class + 1));
                                the_chance -= origchance;
                                the_chance /= 2;
                                the_chance += origchance;
                                the_chance = urange(1, the_chance, 99);

                                if(GetRandomPercent() > the_chance)
                                {
                                    sprintf(buf, "%s fires at you but misses.",
                                            ship->Name.c_str());
                                    EchoToCockpit(AT_ORANGE, target, buf);
                                    sprintf(buf, "Weaponsfire from %s barely misses %s.",
                                            ship->Name.c_str(), target->Name.c_str());
                                    EchoToNearbyShips(AT_ORANGE, target, buf);
                                }
                                else
                                {
                                    if(whichguns == 0)
                                    {
                                        sprintf(buf, "Laserfire from %s hits %s.",
                                                ship->Name.c_str(), target->Name.c_str());
                                        EchoToNearbyShips(AT_ORANGE, target, buf);
                                        sprintf(buf, "You are hit by lasers from %s!",
                                                ship->Name.c_str());
                                        EchoToCockpit(AT_BLOOD, target, buf);
                                        EchoToShip(AT_RED, target, "A small explosion vibrates through the ship.");
                                        if(ship->Class == SHIP_PLATFORM)
                                        {
                                            DamageShip(target, 100, 250, NULL, ship);
                                        }
                                        else if(ship->Class == CAPITAL_SHIP
                                                && target->Class != CAPITAL_SHIP)
                                        {
                                            DamageShip(target, 50, 200, NULL, ship);
                                        }
                                        else
                                        {
                                            DamageShip(target, 5, 10, NULL, ship);
                                        }
                                    }
                                    else if(whichguns == 1)
                                    {
                                        sprintf(buf, "Blue plasma from %s engulfs %s.",
                                                ship->Name.c_str(), target->Name.c_str());
                                        EchoToNearbyShips(AT_ORANGE, target, buf);
                                        sprintf(buf, "You are engulfed by ion energy from %s!", ship->Name.c_str());
                                        EchoToCockpit(AT_BLOOD, target, buf);
                                        EchoToShip(AT_RED, target, "A small explosion vibrates through the ship.");
                                        if(ship->Class == SHIP_PLATFORM)
                                        {
                                            DamageShip(target, -250, -100, NULL, ship);
                                        }
                                        else if(ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP)
                                        {
                                            DamageShip(target, -200, -50, NULL, ship);
                                        }
                                        else
                                        {
                                            DamageShip(target, -10, -5, NULL, ship);
                                        }
                                    }
                                    else if(whichguns == 2)
                                    {
                                        if(shots < ship->WeaponSystems.Laser.Count)
                                        {
                                            sprintf(buf, "Laserfire from %s hits %s.",
                                                    ship->Name.c_str(), target->Name.c_str());
                                            EchoToNearbyShips(AT_ORANGE, target, buf);
                                            sprintf(buf, "You are hit by lasers from %s!",
                                                    ship->Name.c_str());
                                            EchoToCockpit(AT_BLOOD, target, buf);
                                            EchoToShip(AT_RED, target, "A small explosion vibrates through the ship.");
                                            if(ship->Class == SHIP_PLATFORM)
                                            {
                                                DamageShip(target, 100, 250, NULL, ship);
                                            }
                                            else if(ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP)
                                            {
                                                DamageShip(target, 50, 200, NULL, ship);
                                            }
                                            else
                                            {
                                                DamageShip(target, 5, 10, NULL, ship);
                                            }
                                        }
                                        else
                                        {
                                            sprintf(buf, "Ion energy from %s hits %s.",
                                                    ship->Name.c_str(), target->Name.c_str());
                                            EchoToNearbyShips(AT_ORANGE, target, buf);
                                            sprintf(buf, "You are hit by an ion cannon from %s!",
                                                    ship->Name.c_str());
                                            EchoToCockpit(AT_BLOOD, target, buf);
                                            EchoToShip(AT_RED, target, "A small explosion vibrates through the ship.");

                                            if(ship->Class == SHIP_PLATFORM)
                                            {
                                                DamageShip(target, -250, -100, NULL, ship);
                                            }
                                            else if(ship->Class == CAPITAL_SHIP && target->Class != CAPITAL_SHIP)
                                            {
                                                DamageShip(target, -200, -50, NULL, ship);
                                            }
                                            else
                                            {
                                                DamageShip(target, -10, -5, NULL, ship);
                                            }
                                        }
                                    }
                                }

                                ship->WeaponSystems.Laser.State++;

                                if(IsShipAutoflying(target) && !target->WeaponSystems.Target)
                                {
                                    sprintf(buf, "You are being targetted by %s.",
                                            target->Name.c_str());
                                    EchoToCockpit(AT_BLOOD, ship, buf);
                                    target->WeaponSystems.Target = ship;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

void ShipUpdate()
{
    char buf[MAX_STRING_LENGTH];
    int too_close = 0, target_too_close = 0;
    int recharge = 0;

    for(auto ship : Ships)
    {
        if(ship->Spaceobject
           && ship->Thrusters.Energy.Current > 0
           && IsShipDisabled(ship)
           && ship->Class != SHIP_PLATFORM)
        {
            ship->Thrusters.Energy.Current -= 100;
        }
        else if(ship->Thrusters.Energy.Current > 0)
        {
            ship->Thrusters.Energy.Current += (5 + ship->Class * 5);
        }
        else
        {
            ship->Thrusters.Energy.Current = 0;
        }

        if(ship->Defenses.ChaffReleased > 0)
        {
            ship->Defenses.ChaffReleased = !ship->Defenses.ChaffReleased;
        }

        /* following was originaly to fix ships that lost their pilot
           in the middle of a manuever and are stuck in a busy state
           but now used for timed manouevers such as turning */

        if(ship->State == SHIP_READY && ship->Tracking == true)
        {
            if(ship->Count == 0)
            {
                ship->Count++;
            }
            else
            {
                do_hyperspace(ship->Ch, "");
                ship->Count = 0;
            }
        }

        if(ship->State == SHIP_BUSY_3)
        {
            EchoToRoom(AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Maneuver complete.");
            ship->State = SHIP_READY;
        }

        if(ship->State == SHIP_BUSY_2)
        {
            ship->State = SHIP_BUSY_3;
        }

        if(ship->State == SHIP_BUSY)
        {
            ship->State = SHIP_BUSY_2;
        }

        if(ship->State == SHIP_LAND_2)
        {
            LandShip(ship, ship->LandingDestination);
        }

        if(ship->State == SHIP_LAND)
        {
            ApproachLandingSite(ship, ship->LandingDestination);
            ship->State = SHIP_LAND_2;
        }

        if(ship->State == SHIP_LAUNCH_2)
        {
            LaunchShip(ship);
        }

        if(ship->State == SHIP_LAUNCH)
        {
            ship->State = SHIP_LAUNCH_2;
        }

        if(ship->Docking == SHIP_DOCK_2)
        {
            DockShip(ship->Ch, ship);
        }

        if(ship->Docking == SHIP_DOCK)
        {
            ship->Docking = SHIP_DOCK_2;
        }

        ship->Defenses.Shield.Current = umax(0, ship->Defenses.Shield.Current - 1 - ship->Class);

        if(ship->AutoRecharge
           && ship->Defenses.Shield.Max > ship->Defenses.Shield.Current
           && ship->Thrusters.Energy.Current > 100)
        {
            recharge = umin(ship->Defenses.Shield.Max - ship->Defenses.Shield.Current, 10 + ship->Class * 10);
            recharge = umin(recharge, ship->Thrusters.Energy.Current / 2 - 100);
            recharge = umax(1, recharge);
            ship->Defenses.Shield.Current += recharge;
            ship->Thrusters.Energy.Current -= recharge;
        }

        if(IsShipAutoflying(ship)
           && (ship->Thrusters.Energy.Current >= ((25 + ((int)ship->Class) * 25) * (2 + ((int)ship->Class))))
           && ((ship->Defenses.Shield.Max - ship->Defenses.Shield.Current) >= (25 + ((int)ship->Class) * 25)))
        {
            recharge = 25 + ship->Class * 25;
            recharge = umin(ship->Defenses.Shield.Max - ship->Defenses.Shield.Current, recharge);
            ship->Defenses.Shield.Current += recharge;
            ship->Thrusters.Energy.Current -= (recharge * 2 + recharge * ship->Class);
        }

        if(ship->Defenses.Shield.Current > 0)
        {
            if(ship->Thrusters.Energy.Current < 200)
            {
                ship->Defenses.Shield.Current = 0;
                EchoToCockpit(AT_RED, ship, "The ships shields fizzle and die.");
                ship->AutoRecharge = false;
            }
        }

        if(ship->Spaceobject && ship->Thrusters.Speed.Current > 0)
        {
            sprintf(buf, "%d", ship->Thrusters.Speed.Current);
            EchoToRoomNoNewline(AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "Speed: ");
            EchoToRoomNoNewline(AT_LBLUE, GetRoom(ship->Rooms.Pilotseat), buf);
            sprintf(buf, "%.0f %.0f %.0f", ship->Position->x, ship->Position->y, ship->Position->z);
            EchoToRoomNoNewline(AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "  Coords: ");
            EchoToRoom(AT_LBLUE, GetRoom(ship->Rooms.Pilotseat), buf);

            if(ship->Rooms.Pilotseat != ship->Rooms.Coseat)
            {
                sprintf(buf, "%d", ship->Thrusters.Speed.Current);
                EchoToRoomNoNewline(AT_BLUE, GetRoom(ship->Rooms.Coseat), "Speed: ");
                EchoToRoomNoNewline(AT_LBLUE, GetRoom(ship->Rooms.Coseat), buf);
                sprintf(buf, "%.0f %.0f %.0f", ship->Position->x, ship->Position->y, ship->Position->z);
                EchoToRoomNoNewline(AT_BLUE, GetRoom(ship->Rooms.Coseat), "  Coords: ");
                EchoToRoom(AT_LBLUE, GetRoom(ship->Rooms.Coseat), buf);
            }
        }

        if(ship->Spaceobject != nullptr)
        {
            too_close = ship->Thrusters.Speed.Current + 50;

            for(auto spaceobj : Spaceobjects)
            {
                if(GetShipDistanceToSpaceobject(ship, spaceobj) < too_close)
                {
                    sprintf(buf, "Proximity alert: %s  %.0f %.0f %.0f",
                            spaceobj->Name.c_str(),
                            spaceobj->Position->x, spaceobj->Position->y, spaceobj->Position->z);
                    EchoToRoom(AT_RED, GetRoom(ship->Rooms.Pilotseat), buf);
                }
            }

            for(auto target : Ships)
            {
                if((target->Docked && target->Docked == ship) || (ship->Docked && ship->Docked == target))
                {
                    continue;
                }

                if(ship->Docked && target->Docked
                   && target->Docked == ship->Docked)
                {
                    continue;
                }

                target_too_close = too_close + target->Thrusters.Speed.Current;

                if(target->Spaceobject)
                {
                    if(target != ship
                       && GetShipDistanceToShip(ship, target) < target_too_close
                       && ship->Docked != target && target->Docked != ship)
                    {
                        sprintf(buf, "Proximity alert: %s  %.0f %.0f %.0f",
                                target->Name.c_str(),
                                target->Position->x - ship->Position->x,
                                target->Position->y - ship->Position->y,
                                target->Position->z - ship->Position->z);
                        EchoToRoom(AT_RED, GetRoom(ship->Rooms.Pilotseat),
                                   buf);
                    }
                }
            }

            too_close = ship->Thrusters.Speed.Current + 100;
        }

        if(ship->WeaponSystems.Target && ship->Class <= SHIP_PLATFORM)
        {
            sprintf(buf, "%s   %.0f %.0f %.0f",
                    ship->WeaponSystems.Target->Name.c_str(),
                    ship->WeaponSystems.Target->Position->x,
                    ship->WeaponSystems.Target->Position->y,
                    ship->WeaponSystems.Target->Position->z);
            EchoToRoomNoNewline(AT_BLUE, GetRoom(ship->Rooms.Gunseat), "Target: ");
            EchoToRoom(AT_LBLUE, GetRoom(ship->Rooms.Gunseat), buf);

            if(!IsShipInCombatRange(ship, ship->WeaponSystems.Target))
            {
                EchoToRoom(AT_LBLUE, GetRoom(ship->Rooms.Gunseat), "Your target seems to have left.");
                ship->WeaponSystems.Target = NULL;
            }
        }

        for(auto turret : ship->WeaponSystems.Turrets)
        {
            if(TurretHasTarget(turret) && ship->Class <= SHIP_PLATFORM)
            {
                const std::shared_ptr<Ship> turret_target = GetTurretTarget(turret);

                sprintf(buf, "%s   %.0f %.0f %.0f", turret_target->Name.c_str(),
                        turret_target->Position->x, turret_target->Position->y,
                        turret_target->Position->z);
                EchoToRoomNoNewline(AT_BLUE, GetRoom(GetTurretRoom(turret)), "Target: ");
                EchoToRoom(AT_LBLUE, GetRoom(GetTurretRoom(turret)), buf);

                if(!IsShipInCombatRange(ship, turret_target))
                {
                    ClearTurretTarget(turret);
                }
            }
        }

        if(ship->Thrusters.Energy.Current < 100 && ship->Spaceobject)
        {
            EchoToCockpit(AT_RED, ship, "Warning: Ship fuel low.");
        }

        ship->Thrusters.Energy.Current = urange(0, ship->Thrusters.Energy.Current, ship->Thrusters.Energy.Max);
    }
}

void UpdateSpaceCombat()
{
    char buf[MAX_STRING_LENGTH];
    int too_close = 0, target_too_close = 0;

    for(auto ship : Ships)
    {
        if(ship->WeaponSystems.Target && IsShipAutoflying(ship))
        {
            if(!IsShipInCombatRange(ship->WeaponSystems.Target, ship))
            {
                EchoToRoom(AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "Target left, returning to NORMAL condition.\r\n");
                ship->Thrusters.Speed.Current = 0;
                ship->WeaponSystems.Target = NULL;
            }
        }

        if(ship->AutoTrack
           && ship->Docking == SHIP_READY
           && ship->WeaponSystems.Target
           && ship->Class < SHIP_PLATFORM)
        {
            std::shared_ptr<Ship> target = ship->WeaponSystems.Target;
            too_close = ship->Thrusters.Speed.Current + 10;
            target_too_close = too_close + target->Thrusters.Speed.Current;

            if(target != ship && ship->State == SHIP_READY
               && ship->Docked == NULL && ship->State != SHIP_DOCKED
               && GetShipDistanceToShip(ship, target) < target_too_close)
            {
                SetShipCourseTowardsShip(ship, ship->WeaponSystems.Target);
                TurnShip180(ship);
                ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
                EchoToRoom(AT_RED, GetRoom(ship->Rooms.Pilotseat), "Autotrack: Evading to avoid collision!\r\n");

                if(ship->Class == FIGHTER_SHIP
                   || (ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50))
                {
                    ship->State = SHIP_BUSY_3;
                }
                else if(ship->Class == MIDSIZE_SHIP || (ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50))
                {
                    ship->State = SHIP_BUSY_2;
                }
                else
                {
                    ship->State = SHIP_BUSY;
                }
            }
            else if(!IsShipFacingShip(ship, ship->WeaponSystems.Target)
                    && ship->Docked == NULL && ship->State != SHIP_DOCKED)
            {
                SetShipCourseTowardsShip(ship, ship->WeaponSystems.Target);
                ship->Thrusters.Energy.Current -= ship->Thrusters.Speed.Current / 10;
                EchoToRoom(AT_BLUE, GetRoom(ship->Rooms.Pilotseat), "Autotracking target... setting new course.\r\n");

                if(ship->Class == FIGHTER_SHIP
                   || (ship->Class == MIDSIZE_SHIP && ship->Thrusters.Maneuver > 50))
                {
                    ship->State = SHIP_BUSY_3;
                }
                else if(ship->Class == MIDSIZE_SHIP || (ship->Class == CAPITAL_SHIP && ship->Thrusters.Maneuver > 50))
                {
                    ship->State = SHIP_BUSY_2;
                }
                else
                {
                    ship->State = SHIP_BUSY;
                }
            }
        }

        if(IsShipAutoflying(ship) && ship->Class != SHIP_DEBRIS)
        {
            if(ship->Spaceobject)
            {
                CheckHostile(ship);

                if(ship->WeaponSystems.Target)
                {
                    int the_chance = 50;
                    MissileType projectiles = INVALID_MISSILE_TYPE;
                    std::shared_ptr<Ship> target;

                    if(!ship->WeaponSystems.Target->WeaponSystems.Target
                       && IsShipAutoflying(ship->WeaponSystems.Target))
                    {
                        ship->WeaponSystems.Target->WeaponSystems.Target = ship;
                    }

                    /* auto assist ships */
                    for(auto assistingShip : Ships)
                    {
                        if(IsShipInCombatRange(ship, assistingShip))
                        {
                            if(IsShipAutoflying(assistingShip)
                               && assistingShip->Docked == NULL
                               && assistingShip->State != SHIP_DOCKED)
                            {
                                if(!StrCmp(assistingShip->Owner, ship->Owner)
                                   && assistingShip != ship)
                                {
                                    if(assistingShip->WeaponSystems.Target == NULL
                                       && ship->WeaponSystems.Target != assistingShip)
                                    {
                                        assistingShip->WeaponSystems.Target = ship->WeaponSystems.Target;
                                        sprintf(buf, "You are being targetted by %s.",
                                                assistingShip->Name.c_str());
                                        EchoToCockpit(AT_BLOOD, assistingShip->WeaponSystems.Target,
                                                      buf);
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    target = ship->WeaponSystems.Target;
                    ship->AutoTrack = true;

                    if(ship->Class != SHIP_PLATFORM && !ship->Guard
                       && ship->Docked == NULL && ship->State != SHIP_DOCKED)
                    {
                        ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;
                    }

                    if(ship->Thrusters.Energy.Current > 200)
                    {
                        ship->AutoRecharge = true;
                    }

                    if(!IsShipInHyperspace(ship)
                       && ship->Thrusters.Energy.Current > 25
                       && ship->WeaponSystems.Tube.State == MISSILE_READY
                       && IsShipInCombatRange(ship, target)
                       && GetShipDistanceToShip(target, ship) <= 1200)
                    {
                        if(ship->Class > MIDSIZE_SHIP || IsShipFacingShip(ship, target))
                        {
                            the_chance -= target->Thrusters.Maneuver / 5;
                            the_chance -= target->Thrusters.Speed.Current / 20;
                            the_chance += target->Class * target->Class * 25;
                            the_chance -= (GetShipDistanceToShip(ship, target) * 3) / 100;
                            the_chance += 30;
                            the_chance = urange(10, the_chance, 90);

                            if((target->Class == SHIP_PLATFORM
                                || (target->Class == CAPITAL_SHIP
                                    && target->Thrusters.Speed.Current < 50))
                               && ship->WeaponSystems.Tube.Rockets.Current > 0)
                            {
                                projectiles = HEAVY_ROCKET;
                            }
                            else if((target->Class == MIDSIZE_SHIP
                                     || (target->Class == CAPITAL_SHIP))
                                    && ship->WeaponSystems.Tube.Torpedoes.Current > 0)
                            {
                                projectiles = PROTON_TORPEDO;
                            }
                            else if(ship->WeaponSystems.Tube.Missiles.Current < 0
                                    && ship->WeaponSystems.Tube.Torpedoes.Current > 0)
                            {
                                projectiles = PROTON_TORPEDO;
                            }
                            else if(ship->WeaponSystems.Tube.Missiles.Current < 0
                                    && ship->WeaponSystems.Tube.Rockets.Current > 0)
                            {
                                projectiles = HEAVY_ROCKET;
                            }
                            else if(ship->WeaponSystems.Tube.Missiles.Current > 0)
                            {
                                projectiles = CONCUSSION_MISSILE;
                            }
                            else
                            {
                                projectiles = INVALID_MISSILE_TYPE;
                            }

                            if(GetRandomPercent() > the_chance
                               || projectiles == INVALID_MISSILE_TYPE)
                            {

                            }
                            else
                            {
                                NewMissile(ship, target, "", projectiles);

                                if(projectiles == CONCUSSION_MISSILE)
                                {
                                    ship->WeaponSystems.Tube.Missiles.Current--;
                                }

                                if(projectiles == PROTON_TORPEDO)
                                {
                                    ship->WeaponSystems.Tube.Torpedoes.Current--;
                                }

                                if(projectiles == HEAVY_ROCKET)
                                {
                                    ship->WeaponSystems.Tube.Rockets.Current--;
                                }

                                sprintf(buf, "Incoming projectile from %s.",
                                        ship->Name.c_str());
                                EchoToCockpit(AT_BLOOD, target, buf);
                                sprintf(buf, "%s fires a projectile towards %s.",
                                        ship->Name.c_str(), target->Name.c_str());
                                EchoToNearbyShips(AT_ORANGE, target, buf);

                                if(ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM)
                                {
                                    ship->WeaponSystems.Tube.State = MISSILE_RELOAD_2;
                                }
                                else
                                {
                                    ship->WeaponSystems.Tube.State = MISSILE_FIRED;
                                }
                            }
                        }
                    }

                    if(ship->WeaponSystems.Tube.State == MISSILE_DAMAGED)
                    {
                        ship->WeaponSystems.Tube.State = MISSILE_READY;
                    }

                    if(ship->WeaponSystems.Laser.State == LASER_DAMAGED)
                    {
                        ship->WeaponSystems.Laser.State = LASER_READY;
                    }

                    if(ship->WeaponSystems.IonCannon.State == LASER_DAMAGED)
                    {
                        ship->WeaponSystems.IonCannon.State = LASER_READY;
                    }

                    if(IsShipDisabled(ship))
                    {
                        ship->State = SHIP_READY;
                    }
                }
                else
                {
                    ship->Thrusters.Speed.Current = 0;
                }
            }
            else
            {
                if(GetRandomNumberFromRange(1, 25) == 25)
                {
                    ShipToSpaceobject(ship, GetSpaceobject(ship->Home));
                    SetVector(ship->Heading, 1, 1, 1);

                    if(ship->Spaceobject)
                    {
                        CopyVector(ship->Position, ship->Spaceobject->Position);
                    }

                    RandomizeVector(ship->Position, -5000, 5000);
                }
            }
        }

        if((ship->Class == CAPITAL_SHIP || ship->Class == SHIP_PLATFORM)
           && ship->WeaponSystems.Target == NULL)
        {
            if(ship->WeaponSystems.Tube.Missiles.Current < ship->WeaponSystems.Tube.Missiles.Max)
            {
                ship->WeaponSystems.Tube.Missiles.Current++;
            }

            if(ship->WeaponSystems.Tube.Torpedoes.Current < ship->WeaponSystems.Tube.Torpedoes.Max)
            {
                ship->WeaponSystems.Tube.Torpedoes.Current++;
            }

            if(ship->WeaponSystems.Tube.Rockets.Current < ship->WeaponSystems.Tube.Rockets.Max)
            {
                ship->WeaponSystems.Tube.Rockets.Current++;
            }

            if(ship->Defenses.Chaff.Current < ship->Defenses.Chaff.Max)
            {
                ship->Defenses.Chaff.Current++;
            }
        }

        Ships->Save(ship);
    }
}

void EchoToDockedShip(int color, std::shared_ptr<Ship> ship, const std::string &argument)
{
    for(auto dockedShip : Ships)
    {
        if(dockedShip->Docked == ship)
        {
            EchoToCockpit(color, dockedShip, argument);
        }
    }
}

void EchoToCockpit(int color, std::shared_ptr<Ship> ship, const std::string &argument)
{
    for(vnum_t room = ship->Rooms.First; room <= ship->Rooms.Last; room++)
    {
        if(room == ship->Rooms.Cockpit || room == ship->Rooms.Navseat
           || room == ship->Rooms.Pilotseat || room == ship->Rooms.Coseat
           || room == ship->Rooms.Gunseat || room == ship->Rooms.Engine
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[0])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[1])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[2])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[3])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[4])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[5])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[6])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[7])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[8])
           || room == GetTurretRoom(ship->WeaponSystems.Turrets[9]))
        {
            EchoToRoom(color, GetRoom(room), argument);
        }
    }
}

bool IsShipInCombatRange(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target)
{
    if(target && ship && target != ship)
    {
        if(target->Spaceobject && ship->Spaceobject
           && target->State != SHIP_LANDED
           && GetShipDistanceToShip(ship, target) < 100 * (ship->Instruments.Sensor + 10) * ((target->Class == SHIP_DEBRIS ? 2 : target->Class) + 3))
        {
            return true;
        }
    }

    return false;
}

bool IsMissileInRange(std::shared_ptr<Ship> ship, std::shared_ptr<Missile> missile)
{
    return missile && ship && ship->Spaceobject
        && GetMissileDistanceToShip(missile, ship) < 5000;
}

bool IsSpaceobjectInRange(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> object)
{
    return object && ship && ship->Spaceobject
        && GetShipDistanceToSpaceobject(ship, object) < 100000;
}

bool IsSpaceobjectInCaptureRange(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> object)
{
    return object && ship
        && GetShipDistanceToSpaceobject(ship, object) < 10000;
}

static bool CaughtInGravity(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> object)
{
    return object && ship
        && GetDistanceBetweenVectors(object->Position, ship->HyperPosition) < object->Gravity * 5;
}

long int GetShipValue(std::shared_ptr<Ship> ship)
{
    long int price = 0;

    if(ship->Class == FIGHTER_SHIP)
    {
        price = 5000;
    }
    else if(ship->Class == MIDSIZE_SHIP)
    {
        price = 50000;
    }
    else if(ship->Class == CAPITAL_SHIP)
    {
        price = 500000;
    }
    else
    {
        price = 2000;
    }

    if(ship->Class <= CAPITAL_SHIP)
    {
        price += ship->Thrusters.Maneuver * 100 * (1 + ship->Class);
    }

    price += ship->WeaponSystems.TractorBeam.Strength * 100;
    price += ship->Thrusters.Speed.Max * 10;
    price += ship->Instruments.AstroArray * 5;
    price += 5 * ship->Defenses.Hull.Max;
    price += 2 * ship->Thrusters.Energy.Max;

    if(ship->Thrusters.Energy.Max > 5000)
    {
        price += (ship->Thrusters.Energy.Max - 5000) * 20;
    }

    if(ship->Thrusters.Energy.Max > 10000)
    {
        price += (ship->Thrusters.Energy.Max - 10000) * 50;
    }

    if(ship->Defenses.Hull.Max > 1000)
    {
        price += (ship->Defenses.Hull.Max - 1000) * 10;
    }

    if(ship->Defenses.Hull.Max > 10000)
    {
        price += (ship->Defenses.Hull.Max - 10000) * 20;
    }

    if(ship->Defenses.Shield.Max > 200)
    {
        price += (ship->Defenses.Shield.Max - 200) * 50;
    }

    if(ship->Defenses.Shield.Max > 1000)
    {
        price += (ship->Defenses.Shield.Max - 1000) * 100;
    }

    if(ship->Thrusters.Speed.Max > 100)
    {
        price += (ship->Thrusters.Speed.Max - 100) * 500;
    }

    if(ship->WeaponSystems.Laser.Count > 5)
    {
        price += (ship->WeaponSystems.Laser.Count - 5) * 500;
    }

    if(ship->Defenses.Shield.Max)
    {
        price += 1000 + 10 * ship->Defenses.Shield.Max;
    }

    if(ship->WeaponSystems.Laser.Count)
    {
        price += 500 + 500 * ship->WeaponSystems.Laser.Count;
    }

    if(ship->WeaponSystems.Tube.Missiles.Current)
    {
        price += 250 * ship->WeaponSystems.Tube.Missiles.Current;
    }
    else if(ship->WeaponSystems.Tube.Torpedoes.Current)
    {
        price += 500 * ship->WeaponSystems.Tube.Torpedoes.Current;
    }
    else if(ship->WeaponSystems.Tube.Rockets.Current)
    {
        price += 1000 * ship->WeaponSystems.Tube.Rockets.Current;
    }

    for(auto turret : ship->WeaponSystems.Turrets)
    {
        if(IsTurretInstalled(turret))
        {
            price += 5000;
        }
    }

    if(ship->Hyperdrive.Speed)
    {
        price += 1000 + ship->Hyperdrive.Speed * 10;
    }

    if(ship->Rooms.Hangar)
    {
        price += ship->Class == MIDSIZE_SHIP ? 50000 : 100000;
    }

    price *= 1.5;

    return price;
}

long GetRentalPrice(std::shared_ptr<Ship> ship)
{
    return GetShipValue(ship) / 100;
}

void ResetShip(std::shared_ptr<Ship> ship)
{
    ship->State = SHIP_READY;
    ship->Docking = SHIP_READY;
    ship->Docked = NULL;

    if(ship->Class != SHIP_PLATFORM
       && ship->Class != CAPITAL_SHIP
       && ship->Type != MOB_SHIP)
    {
        ExtractShip(ship);
        ShipToRoom(ship, ship->Shipyard);

        ship->Location = ship->Shipyard;
        ship->LastDock = ship->Shipyard;
        ship->State = SHIP_LANDED;
    }

    if(ship->Spaceobject)
    {
        ShipFromSpaceobject(ship, ship->Spaceobject);
    }

    ship->Thrusters.Speed.Current = 0;
    ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
    ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;
    ship->Defenses.Shield.Current = 0;

    for(auto turret : ship->WeaponSystems.Turrets)
    {
        ResetTurret(turret);
    }

    ship->WeaponSystems.Laser.State = LASER_READY;
    ship->WeaponSystems.Tube.State = MISSILE_READY;

    ship->CurrentJump = NULL;
    ship->WeaponSystems.Target = NULL;

    ship->HatchOpen = false;
    ship->BayOpen = false;

    ship->AutoRecharge = false;
    ship->AutoTrack = false;
    ship->AutoSpeed = false;

#ifndef NODEATH
#ifndef NODEATHSHIP
    if(StrCmp("Trainer", ship->Owner) && StrCmp("Public", ship->Owner) && ship->Type != MOB_SHIP)
    {
        std::shared_ptr<Clan> clan;

        if(ship->Type != MOB_SHIP && (clan = GetClan(ship->Owner)) != NULL)
        {
            if(ship->Class <= SHIP_PLATFORM)
                clan->Spacecraft--;
            else
                clan->Vehicles--;
        }

        ship->Owner.erase();
        ship->Pilot.erase();
        ship->CoPilot.erase();
    }
#endif
#endif
    if(ship->Home.empty())
    {
        if(ship->Type == SHIP_REBEL
           || (ship->Type == MOB_SHIP && !StrCmp(ship->Owner, GOODGUY_CLAN)))
        {
            ship->Home = "Hoth";
        }
        else if(ship->Type == SHIP_IMPERIAL
                || (ship->Type == MOB_SHIP && !StrCmp(ship->Owner, BADGUY_CLAN)))
        {
            ship->Home = "Coruscant";
        }
        else if(ship->Type == SHIP_CIVILIAN)
        {
            ship->Home = "Tatooine";
        }
    }

    Ships->Save(ship);
}

void EchoToNearbyShips(int color, std::shared_ptr<Ship> ship, const std::string &argument,
                       std::list<std::shared_ptr<Ship>> ignore)
{
    if(!ship->Spaceobject)
    {
        return;
    }

    for(auto target : Ships)
    {
        if(!IsShipInCombatRange(ship, target))
        {
            continue;
        }

        if(target != ship && !Contains(ignore, target)
           && GetShipDistanceToShip(ship, target) < 100 * (target->Instruments.Sensor + 10) * ((ship->Class == SHIP_DEBRIS ? 2 : ship->Class) + 1))
        {
            EchoToCockpit(color, target, argument);
        }
    }
}

std::shared_ptr<Ship> GetShipInRoom(std::shared_ptr<Room> room, const std::string &name)
{
    assert(room != nullptr);

    for(auto ship : room->Ships())
    {
        if(!StrCmp(name, ship->PersonalName)
           || !StrCmp(name, ship->Name))
        {
            return ship;
        }
    }

    for(auto ship : room->Ships())
    {
        if(!ship->PersonalName.empty() && NiftyIsNamePrefix(name, ship->PersonalName))
        {
            return ship;
        }

        if(NiftyIsNamePrefix(name, ship->Name))
        {
            return ship;
        }
    }

    return nullptr;
}

/*
 * Get pointer to ship structure from ship name.
 */
std::shared_ptr<Ship> GetShipAnywhere(const std::string &name)
{
    std::shared_ptr<Ship> foundShip;

    for(auto ship : Ships)
    {
        if(!StrCmp(name, ship->PersonalName)
           || !StrCmp(name, ship->Name))
        {
            foundShip = ship;
            break;
        }

        if(!ship->PersonalName.empty() && NiftyIsNamePrefix(name, ship->PersonalName))
        {
            foundShip = ship;
            break;
        }

        if(NiftyIsNamePrefix(name, ship->Name))
        {
            foundShip = ship;
            break;
        }
    }

    return foundShip;
}

/*
 * Checks if ship is in a spaceobject and returns pointer if it is.
 */
std::shared_ptr<Ship> GetShipInRange(const std::string &name, std::shared_ptr<Ship> eShip)
{
    std::string arg;
    int number = NumberArgument(name, arg);
    int count = 0;
    std::shared_ptr<Ship> foundShip;

    if(eShip == NULL)
    {
        return NULL;
    }

    for(auto ship : Ships)
    {
        if(!IsShipInCombatRange(eShip, ship))
        {
            continue;
        }

        if(!ship->Spaceobject)
        {
            continue;
        }

        if(!StrCmp(arg, ship->PersonalName)
           || !StrCmp(arg, ship->Name))
        {
            count++;

            if(!number || count == number)
            {
                foundShip = ship;
                break;
            }
        }
    }

    if(foundShip == NULL)
    {
        count = 0;

        for(auto ship : Ships)
        {
            if(!IsShipInCombatRange(eShip, ship))
            {
                continue;
            }

            if(!ship->PersonalName.empty() && NiftyIsNamePrefix(arg, ship->PersonalName))
            {
                count++;

                if(!number || count == number)
                {
                    foundShip = ship;
                    break;
                }
            }

            if(NiftyIsNamePrefix(arg, ship->Name))
            {
                count++;

                if(!number || count == number)
                {
                    foundShip = ship;
                    break;
                }
            }
        }
    }

    return foundShip;
}

/*
 * Get pointer to ship structure from cockpit, turret, or entrance ramp vnum.
 */
std::shared_ptr<Ship> GetShipFromCockpit(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           if(vnum == ship->Rooms.Cockpit
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[0])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[1])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[2])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[3])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[4])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[5])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[6])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[7])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[8])
                              || vnum == GetTurretRoom(ship->WeaponSystems.Turrets[9])
                              || vnum == ship->Rooms.Hangar
                              || vnum == ship->Rooms.Pilotseat
                              || vnum == ship->Rooms.Coseat
                              || vnum == ship->Rooms.Navseat
                              || vnum == ship->Rooms.Gunseat
                              || vnum == ship->Rooms.Engine)
                           {
                               return true;
                           }
                           else
                           {
                               return false;
                           }
                       });
}

std::shared_ptr<Ship> GetShipFromPilotSeat(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Pilotseat;
                       });
}

std::shared_ptr<Ship> GetShipFromCoSeat(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Coseat;
                       });
}

std::shared_ptr<Ship> GetShipFromNavSeat(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Navseat;
                       });
}

std::shared_ptr<Ship> GetShipFromGunSeat(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Gunseat;
                       });
}

std::shared_ptr<Ship> GetShipFromEngine(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Engine
                               || vnum == ship->Rooms.Cockpit;
                       });
}

std::shared_ptr<Ship> GetShipFromTurret(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return Find(ship->WeaponSystems.Turrets,
                                       [vnum](const auto &turret)
                                       {
                                           return vnum == GetTurretRoom(turret);
                                       }) != nullptr;
                       });
}

std::shared_ptr<Ship> GetShipFromEntrance(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Entrance;
                       });
}

std::shared_ptr<Ship> GetShipFromHangar(vnum_t vnum)
{
    return Ships->Find([vnum](const auto &ship)
                       {
                           return vnum == ship->Rooms.Hangar;
                       });
}

void ShipToSpaceobject(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> spaceobject)
{
    if(ship != nullptr && spaceobject != nullptr)
    {
        ship->Spaceobject = spaceobject;
    }
}

void ShipFromSpaceobject(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> spaceobject)
{
    if(ship != nullptr && spaceobject != nullptr)
    {
        ship->Spaceobject = nullptr;
    }
}

bool IsShipRental(const Character *ch, std::shared_ptr<Ship> ship)
{
    if(!StrCmp("Public", ship->Owner))
    {
        return true;
    }

    if(!StrCmp("Trainer", ship->Owner))
    {
        return true;
    }

    if(ship->Class == SHIP_TRAINER)
    {
        return true;
    }

    return false;
}

bool CanDock(std::shared_ptr<Ship> ship)
{
    size_t count = 0;
    size_t ports = 0;

    if(!ship)
    {
        return false;
    }

    if(ship->Docked)
    {
        count++;
    }

    count += Count(Ships->Entities(),
                   [ship](const auto &dockedShip)
                   {
                       return dockedShip->Docked == ship;
                   });

    if(ship->DockingPorts && count >= (size_t)ship->DockingPorts)
    {
        return false;
    }

    if(ship->Class < SHIP_PLATFORM)
    {
        ports = ship->Class + 1;
    }

    if(ship->Class != SHIP_PLATFORM && count >= ports)
    {
        return false;
    }

    return true;
}

bool CheckPilot(const Character *ch, std::shared_ptr<Ship> ship)
{
    if(!StrCmp(ch->Name, ship->Owner)
       || !StrCmp(ch->Name, ship->Pilot)
       || !StrCmp(ch->Name, ship->CoPilot)
       || !StrCmp("Public", ship->Owner)
       || !StrCmp("Trainer", ship->Owner))
    {
        return true;
    }

    if(!IsNpc(ch) && ch->PCData && ch->PCData->ClanInfo.Clan)
    {
        if(!StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->Owner))
        {
            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2, ch->Name))
            {
                return true;
            }

            if(!ch->PCData->Bestowments.empty() && IsName("pilot", ch->PCData->Bestowments))
            {
                return true;
            }
        }

        if(!StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->Pilot))
        {
            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2, ch->Name))
            {
                return true;
            }

            if(!ch->PCData->Bestowments.empty() && IsName("pilot", ch->PCData->Bestowments))
            {
                return true;
            }
        }

        if(!StrCmp(ch->PCData->ClanInfo.Clan->Name, ship->CoPilot))
        {
            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Leader, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number1, ch->Name))
            {
                return true;
            }

            if(!StrCmp(ch->PCData->ClanInfo.Clan->Leadership.Number2, ch->Name))
            {
                return true;
            }

            if(!ch->PCData->Bestowments.empty()
               && IsName("pilot", ch->PCData->Bestowments))
            {
                return true;
            }
        }
    }

    return false;
}

bool ExtractShip(std::shared_ptr<Ship> ship)
{
    auto room = ship->InRoom;

    if(room != nullptr)
    {
        room->Remove(ship);
        ship->InRoom = nullptr;
    }

    return true;
}

void DamageShip(std::shared_ptr<Ship> ship, int min, int max,
                Character *ch, std::shared_ptr<Ship> assaulter)
{
    short ionFactor = 1;
    int dmg = 0;
    int shield_dmg = 0;
    long xp = 0;
    bool ions = false;

    if(min < 0 && max < 0)
    {
        ions = true;
        dmg = GetRandomNumberFromRange(max * (-1), min * (-1));
    }
    else
    {
        dmg = GetRandomNumberFromRange(min, max);
    }

    if(ions == true)
    {
        ionFactor = 2;
    }

    if(ch)
    {
        xp = (GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY))) / 25;
        xp = umin(GetShipValue(ship) / 100, xp);
        GainXP(ch, PILOTING_ABILITY, xp);
    }

    if(ship->Defenses.Shield.Current > 0)
    {
        shield_dmg = umin(ship->Defenses.Shield.Current, dmg);
        dmg -= shield_dmg;
        ship->Defenses.Shield.Current -= shield_dmg;

        if(ship->Defenses.Shield.Current == 0)
        {
            EchoToCockpit(AT_BLOOD, ship, "Shields down...");
        }
    }

    if(dmg > 0)
    {
        if(GetRandomNumberFromRange(1, 100) <= 5 * ionFactor && !IsShipDisabled(ship))
        {
            EchoToCockpit(AT_BLOOD + AT_BLINK, ship, "Ships Drive DAMAGED!");
            ship->State = SHIP_DISABLED;
        }

        if(GetRandomNumberFromRange(1, 100) <= 5 * ionFactor
           && ship->WeaponSystems.Tube.State != MISSILE_DAMAGED)
        {
            EchoToRoom(AT_BLOOD + AT_BLINK, GetRoom(ship->Rooms.Gunseat), "Ships Missile Launcher DAMAGED!");
            ship->WeaponSystems.Tube.State = MISSILE_DAMAGED;
        }

        if(GetRandomNumberFromRange(1, 100) <= 2 * ionFactor
           && ship->WeaponSystems.Laser.State != LASER_DAMAGED)
        {
            EchoToRoom(AT_BLOOD + AT_BLINK, GetRoom(ship->Rooms.Gunseat), "Lasers DAMAGED!");
            ship->WeaponSystems.Laser.State = LASER_DAMAGED;
        }

        for(auto turret : ship->WeaponSystems.Turrets)
        {
            if(GetRandomNumberFromRange(1, 100) <= 5 * ionFactor && !IsTurretDamaged(turret))
            {
                EchoToRoom(AT_BLOOD + AT_BLINK, GetRoom(GetTurretRoom(turret)),
                           "Turret DAMAGED!");
                SetTurretDamaged(turret);
            }
        }

        if(GetRandomNumberFromRange(1, 100) <= 5 * ionFactor
           && ship->WeaponSystems.TractorBeam.State != LASER_DAMAGED
           && ship->WeaponSystems.TractorBeam.Strength)
        {
            EchoToRoom(AT_BLOOD + AT_BLINK, GetRoom(ship->Rooms.Pilotseat), "Tractorbeam DAMAGED!");
            ship->WeaponSystems.TractorBeam.State = LASER_DAMAGED;
        }

        if(ions == false)
        {
            ship->Defenses.Hull.Current -= dmg * 5;
        }
    }

    if(ship->Defenses.Hull.Current <= 0)
    {
        DestroyShip(ship, ch);

        if(ch)
        {
            Log->Info("%s(%s) was just destroyed by %s.",
                      ship->Name.c_str(), ship->PersonalName.c_str(), ch->Name.c_str());

            xp = (GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, PILOTING_ABILITY)));
            xp = umin(GetShipValue(ship), xp);
            GainXP(ch, PILOTING_ABILITY, xp);
            ch->Echo("&WYou gain %ld piloting experience!\r\n", xp);
        }
        else
        {
            Log->Info("%s(%s) was just destroyed by %s.",
                      ship->Name.c_str(), ship->PersonalName.c_str(),
                      (assaulter ? assaulter->PersonalName.c_str() : "a collision"));
        }

        return;
    }

    if(ship->Defenses.Hull.Current <= ship->Defenses.Hull.Max / 20)
    {
        EchoToCockpit(AT_BLOOD + AT_BLINK, ship, "WARNING! Ship hull severely damaged!");
    }
}

void DestroyShip(std::shared_ptr<Ship> ship, Character *killer)
{
    char buf[MAX_STRING_LENGTH];

    if(!ship)
    {
        return;
    }

    sprintf(buf, "%s explodes in a blinding flash of light!", ship->Name.c_str());
    EchoToNearbyShips(AT_WHITE + AT_BLINK, ship, buf);
    EchoToShip(AT_WHITE + AT_BLINK, ship, "A blinding flash of light burns your eyes...");
    EchoToShip(AT_WHITE, ship, "But before you have a chance to scream...\r\nYou are ripped apart as your spacecraft explodes...");

#ifdef NODEATH
    ResetShip(ship);
    MakeDebris(ship);
    return;
#endif
#ifdef NODEATHSHIP
    ResetShip(ship);
    MakeDebris(ship);
    return;
#endif

    if(!StrCmp("Trainer", ship->Owner))
    {
        ResetShip(ship);
        return;
    }

    MakeDebris(ship);

    for(vnum_t roomnum = ship->Rooms.First; roomnum <= ship->Rooms.Last; roomnum++)
    {
        auto room = GetRoom(roomnum);

        if(room != NULL)
        {
            while(!room->Characters().empty())
            {
                Character *rch = room->Characters().front();

                if(IsImmortal(rch))
                {
                    CharacterFromRoom(rch);
                    CharacterToRoom(rch, GetRoom(WhereHome(rch)));
                }
                else
                {
                    if(killer)
                    {
                        RawKill(killer, rch);
                    }
                    else
                    {
                        RawKill(rch, rch);
                    }
                }
            }

            auto objectsToExtract(room->Objects());

            for(auto robj : objectsToExtract)
            {
                SeparateOneObjectFromGroup(robj);
                ExtractObject(robj);
            }
        }
    }

    for(auto lship : Ships)
    {
        if(ship->Rooms.Hangar == INVALID_VNUM
           || lship->Location != ship->Rooms.Hangar)
        {
            continue;
        }

        if(lship->Docked && lship->Docked == ship)
        {
            lship->Docked = NULL;
            ship->Docking = SHIP_READY;
        }

        if(killer)
        {
            Log->Info("%s(%s) was just destroyed by %s.",
                      lship->Name.c_str(), lship->PersonalName.c_str(), killer->Name.c_str());
        }
        else
        {
            Log->Info("%s(%s) was just destroyed by a mob ship.",
                      lship->Name.c_str(), lship->PersonalName.c_str());
        }

        DestroyShip(lship, killer);
    }

    ResetShip(ship);
}

bool ShipToRoom(std::shared_ptr<Ship> ship, vnum_t vnum)
{
    std::shared_ptr<Room> shipto;

    if((shipto = GetRoom(vnum)) == NULL)
    {
        return false;
    }

    shipto->Add(ship);
    ship->InRoom = shipto;
    return true;
}

bool RentShip(Character *ch, std::shared_ptr<Ship> ship)
{
    long price = 0;

    if(IsNpc(ch))
    {
        return false;
    }

    price = GetShipValue(ship) / 100;

    if(ch->Gold < price)
    {
        ch->Echo("&RRenting this ship costs %ld. You don't have enough credits!\r\n", price);
        return false;
    }

    ch->Gold -= price;
    ch->Echo("&GYou pay %ld credits to rent the ship.\r\n", price);
    return true;
}

bool ShipNameAndPersonalnameComboIsUnique(const std::string &name,
                                          const std::string &personalname)
{
    auto existingShip = Ships->Find([name, personalname](const auto &ship)
                                    {
                                        return StrCmp(ship->Name, name) == 0
                                            && StrCmp(ship->PersonalName, personalname) == 0;
                                    });
    bool nameIsUnique = false;

    if(existingShip == nullptr)
    {
        nameIsUnique = true;
    }

    return nameIsUnique;
}

void ForEachShip(std::function<bool(std::shared_ptr<Ship>, void *)> callback, void *userData)
{
    for(auto ship : Ships)
    {
        bool keepGoing = callback(ship, userData);

        if(!keepGoing)
        {
            break;
        }
    }
}
