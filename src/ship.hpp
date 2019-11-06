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

#ifndef _SWRIP_SHIPS_HPP_
#define _SWRIP_SHIPS_HPP_

#include <functional>
#include <memory>
#include <string>
#include <bitset>
#include <list>
#include <vector>
#include <utility/vector3.hpp>
#include "types.hpp"
#include "constants.hpp"

namespace Flag
{
    namespace Ship
    {
        enum : size_t
        {
            Permanent,
            Prototype
        };
    }
}

class Ship
{
public:
    Ship();

    /* Persisted state */
    std::string Name;
    std::string PersonalName;
    std::string Description;
    std::string Owner;
    std::string Pilot;
    std::string CoPilot;
    ShipClass Class = FIGHTER_SHIP;
    vnum_t Shipyard = INVALID_VNUM;
    std::shared_ptr<Vector3> Position = std::make_shared<Vector3>();
    vnum_t Location = INVALID_VNUM;
    vnum_t LastDock = INVALID_VNUM;
    ShipType Type = SHIP_CIVILIAN;
    ShipState State = SHIP_LANDED;
    bool Alarm = false;
    int DockingPorts = 0;
    bool Guard = false;
    std::bitset<Flag::MAX> Flags;
    std::string Home;

    struct
    {
        int Comm = 0;
        int Sensor = 0;
        int AstroArray = 0;
    } Instruments;

    struct
    {
        /* Speed.Current not persisted */
        struct
        {
            int Current = 0;
            int Max = 0;
        } Speed, Energy;

        int Maneuver = 0;
    } Thrusters;

    struct
    {
        int Speed = 0;
    } Hyperdrive;

    struct
    {
        struct
        {
            struct
            {
                int Current = 0;
                int Max = 0;
            } Missiles, Torpedoes, Rockets;

            MissileState State = MISSILE_READY;
        } Tube;

        struct
        {
            int Count = 0;
            int State = LASER_READY;
        } Laser, IonCannon;

        struct
        {
            int Strength = 0;
            int State = LASER_READY;
            std::shared_ptr<Ship> Tractoring; /* Not persisted */
        } TractorBeam;

        std::shared_ptr<Ship> Target; /* Not persisted */
        std::vector<Turret*> Turrets = std::vector<Turret*>(MAX_NUMBER_OF_TURRETS_IN_SHIP);
    } WeaponSystems;

    struct
    {
        struct
        {
            int Current = 0;
            int Max = 0;
        } Hull, Shield, Chaff;

        int ChaffReleased = 0; /* Not persisted */
    } Defenses;

    struct
    {
        vnum_t First = INVALID_VNUM;
        vnum_t Last = INVALID_VNUM;
        vnum_t Cockpit = INVALID_VNUM;
        vnum_t Entrance = INVALID_VNUM;
        vnum_t Hangar = INVALID_VNUM;
        vnum_t Engine = INVALID_VNUM;
        vnum_t Navseat = INVALID_VNUM;
        vnum_t Pilotseat = INVALID_VNUM;
        vnum_t Coseat = INVALID_VNUM;
        vnum_t Gunseat = INVALID_VNUM;
    } Rooms;

    /* Runtime state, not persisted */
    std::shared_ptr<Room> InRoom;
    std::shared_ptr<class Spaceobject> Spaceobject;
    std::string LandingDestination;
    int Hyperdistance = 0;
    int OriginalHyperdistance = 0;
    int Docking = SHIP_READY;
    int DockingState = 0;
    bool BayOpen = false;
    bool HatchOpen = false;
    bool AutoRecharge = false;
    bool AutoTrack = false;
    bool AutoSpeed = false;
    bool Tracking = false;
    int tcount = 0;
    std::shared_ptr<Vector3> TrackVector = std::make_shared<Vector3>();
    std::shared_ptr<Vector3> Heading = std::make_shared<Vector3>();
    std::shared_ptr<Vector3> Jump = std::make_shared<Vector3>();
    std::shared_ptr<Vector3> HyperPosition = std::make_shared<Vector3>();
    std::shared_ptr<Vector3> OriginPosition = std::make_shared<Vector3>();
    long Collision = 0;
    std::shared_ptr<Ship> TractoredBy;
    std::shared_ptr<class Spaceobject> CurrentJump;
    std::shared_ptr<class Spaceobject> LastSystem;
    bool Autopilot = false;
    bool OpenTube = false;
    std::shared_ptr<Ship> Docked;
    Character *Ch = nullptr;
    std::shared_ptr<class Spaceobject> InOrbitOf;
    int Count = 0;
};

ch_ret DriveShip(Character *ch, std::shared_ptr<Ship> ship, std::shared_ptr<Exit> exit, int fall);
void ResetShip(std::shared_ptr<Ship> ship);
void EchoToDockedShip(int color, std::shared_ptr<Ship> ship, const std::string &argument);
bool CanDock(std::shared_ptr<Ship> ship);
bool IsShipInHyperspace(std::shared_ptr<Ship> ship);
bool IsShipDisabled(std::shared_ptr<Ship> ship);
bool IsShipInCombatRange(std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target);
bool IsMissileInRange(std::shared_ptr<Ship> ship, std::shared_ptr<Missile> missile);
bool IsSpaceobjectInRange(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> object);
bool IsSpaceobjectInCaptureRange(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> object);
bool CheckHostile(std::shared_ptr<Ship> ship);
std::shared_ptr<Ship> GetShipAnywhere(const std::string &name);
std::shared_ptr<Ship> GetShipFromEntrance(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromHangar(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromCockpit(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromNavSeat(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromCoSeat(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromPilotSeat(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromGunSeat(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromTurret(vnum_t vnum);
std::shared_ptr<Ship> GetShipFromEngine(vnum_t vnum);
std::shared_ptr<Ship> GetShipInRange(const std::string &name, std::shared_ptr<Ship> eShip);
void UpdateShipMovement();
void RechargeShips();
void ShipUpdate();
void UpdateSpaceCombat();
bool IsShipRental(const Character *ch, std::shared_ptr<Ship> ship);
void EchoToShip(int color, std::shared_ptr<Ship> ship, const std::string &argument);
void EchoToCockpit(int color, std::shared_ptr<Ship> ship, const std::string &argument);
void EchoToNearbyShips(int color, std::shared_ptr<Ship> ship, const std::string &argument,
    std::list<std::shared_ptr<Ship>> ignore = {});
bool ExtractShip(std::shared_ptr<Ship> ship);
bool ShipToRoom(std::shared_ptr<Ship> ship, vnum_t vnum);
long GetShipValue(std::shared_ptr<Ship> ship);
long GetRentalPrice(std::shared_ptr<Ship> ship);
bool RentShip(Character *ch, std::shared_ptr<Ship> ship);
void DamageShip(std::shared_ptr<Ship> ship, int min, int max, Character *ch,
    std::shared_ptr<Ship> assaulter);
void DestroyShip(std::shared_ptr<Ship> ship, Character *killer);
void ShipToSpaceobject(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> spaceobject);
void ShipFromSpaceobject(std::shared_ptr<Ship> ship, std::shared_ptr<Spaceobject> spaceobject);
std::shared_ptr<Ship> GetShipInRoom(std::shared_ptr<Room> room, const std::string &name);
void TransferShip(std::shared_ptr<Ship> ship, vnum_t destination);
bool IsShipAutoflying(std::shared_ptr<Ship> ship);
bool CheckPilot(const Character *ch, std::shared_ptr<Ship> ship);
bool ShipNameAndPersonalnameComboIsUnique(const std::string &name,
    const std::string &personalname);
void ForEachShip(std::function<bool(std::shared_ptr<Ship>, void*)> callback,
    void *userData);

#endif
