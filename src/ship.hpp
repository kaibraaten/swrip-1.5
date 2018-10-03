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

#include <string>
#include <array>
#include <bitset>
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
  Vector3 Position;
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
      Ship *Tractoring = nullptr; /* Not persisted */
    } TractorBeam;
    
    Ship *Target = nullptr; /* Not persisted */
    std::array<Turret*, MAX_NUMBER_OF_TURRETS_IN_SHIP> Turrets;
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
  Room *InRoom = nullptr;
  struct Spaceobject *Spaceobject = nullptr;
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
  Vector3 TrackVector;
  Vector3 Heading;
  Vector3 Jump;
  Vector3 HyperPosition;
  Vector3 OriginPosition;
  long Collision = 0;
  Ship *TractoredBy = nullptr;
  struct Spaceobject *CurrentJump = nullptr;
  struct Spaceobject *LastSystem = nullptr;
  bool Autopilot = false;
  bool OpenTube = false;
  Ship *Docked = nullptr;
  Character *Ch = nullptr;
  struct Spaceobject *InOrbitOf = nullptr;
  int Count = 0;
};

ch_ret DriveShip( Character *ch, Ship *ship, Exit *exit, int fall );
void ResetShip( Ship *ship );
void EchoToDockedShip( int color, const Ship *ship, const std::string &argument );
bool CanDock( const Ship *ship );
bool IsShipInHyperspace( const Ship *ship );
bool IsShipDisabled( const Ship *ship );
bool IsShipInCombatRange( const Ship *ship, const Ship *target );
bool IsMissileInRange( const Ship *ship, const Missile *missile );
bool IsSpaceobjectInRange( const Ship *ship, const Spaceobject *object );
bool IsSpaceobjectInCaptureRange( const Ship *ship, const Spaceobject *object );
bool CheckHostile( Ship *ship );
Ship *GetShipAnywhere( const std::string &name );
Ship *GetShipFromEntrance( vnum_t vnum );
Ship *GetShipFromHangar( vnum_t vnum );
Ship *GetShipFromCockpit( vnum_t vnum );
Ship *GetShipFromNavSeat( vnum_t vnum );
Ship *GetShipFromCoSeat( vnum_t vnum );
Ship *GetShipFromPilotSeat( vnum_t vnum );
Ship *GetShipFromGunSeat( vnum_t vnum );
Ship *GetShipFromTurret( vnum_t vnum );
Ship *GetShipFromEngine( vnum_t vnum );
Ship *GetShipInRange( const std::string &name, const Ship *eShip );
void UpdateShipMovement( void );
void RechargeShips( void );
void ShipUpdate( void );
void UpdateSpaceCombat(void);
bool IsShipRental( const Character *ch, const Ship *ship );
void EchoToShip( int color, const Ship *ship, const std::string &argument );
void EchoToCockpit( int color, const Ship *ship, const std::string &argument );
void EchoToNearbyShips( int color, const Ship *ship, const std::string &argument,
                        const Ship *ignore );
bool ExtractShip( Ship *ship );
bool ShipToRoom( Ship *ship, vnum_t vnum );
long GetShipValue( const Ship *ship );
long GetRentalPrice(const Ship *ship);
bool RentShip( Character *ch, const Ship *ship );
void DamageShip( Ship *ship, int min, int max, Character *ch, const Ship *assaulter);
void DestroyShip( Ship *ship, Character *killer );
void ShipToSpaceobject( Ship *ship, Spaceobject *spaceobject );
void ShipFromSpaceobject( Ship *ship, Spaceobject *spaceobject);
Ship *GetShipInRoom( const Room *room, const std::string &name );
void TransferShip( Ship *ship , vnum_t destination );
bool IsShipAutoflying( const Ship *ship );
bool CheckPilot( const Character *ch, const Ship *ship );
bool ShipNameAndPersonalnameComboIsUnique( const std::string &name,
                                           const std::string &personalname );
void ForEachShip(bool (*callback)(Ship *ship, void *ud), void *userData);

#endif
