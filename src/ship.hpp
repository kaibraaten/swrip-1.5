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

#ifndef _SWRIP_SHIPS_H_
#define _SWRIP_SHIPS_H_

#include <utility/vector3.h>
#include "types.hpp"
#include "constants.hpp"

struct Ship
{
  Ship *Next;
  Ship *Previous;
  Ship *NextInSpaceobject;
  Ship *PreviousInSpaceobject;
  Ship *NextInRoom;
  Ship *PreviousInRoom;

  /* Persisted state */
  char *Name;
  char *PersonalName;
  char *Description;
  char *Owner;
  char *Pilot;
  char *CoPilot;
  ShipClass Class;
  vnum_t Shipyard;
  Vector3 Position;
  vnum_t Location;
  vnum_t LastDock;
  ShipType Type;
  ShipState State;
  bool Alarm;
  short DockingPorts;
  bool Guard;
  int Flags;
  char *Home;
  
  struct
  {
    short Comm;
    short Sensor;
    short AstroArray;
  } Instruments;
  
  struct
  {
    /* Speed.Current not persisted */
    struct
    {
      int Current;
      int Max;
    } Speed, Energy;

    short Maneuver;
  } Thrusters;

  struct
  {
    short Speed;
  } Hyperdrive;
  
  struct
  {
    struct
    {
      struct
      {
	int Current;
	int Max;
      } Missiles, Torpedoes, Rockets;

      MissileState State;
    } Tube;
    
    struct
    {
      short Count;
      short State;
    } Laser, IonCannon;

    struct
    {
      short Strength;
      short State;
      Ship *Tractoring; /* Not persisted */
    } TractorBeam;
    
    Ship *Target; /* Not persisted */
    struct Turret *Turret[MAX_NUMBER_OF_TURRETS_IN_SHIP];
  } WeaponSystems;

  struct
  {
    struct
    {
      int Current;
      int Max;
    } Hull, Shield, Chaff;

    int ChaffReleased; /* Not persisted */
  } Defenses;
  
  struct
  {
    vnum_t First;
    vnum_t Last;
    vnum_t Cockpit;
    vnum_t Entrance;
    vnum_t Hangar;
    vnum_t Engine;
    vnum_t Navseat;
    vnum_t Pilotseat;
    vnum_t Coseat;
    vnum_t Gunseat;
  } Rooms;

   /* Runtime state, not persisted */
  Room *InRoom;
  struct Spaceobject *Spaceobject;
  char *LandingDestination;
  int Hyperdistance;
  int OriginalHyperdistance;
  short Docking;
  short DockingState;
  bool BayOpen;
  bool HatchOpen;
  bool AutoRecharge;
  bool AutoTrack;
  bool AutoSpeed;
  bool Tracking;
  int tcount;
  Vector3 TrackVector;
  Vector3 Heading;
  Vector3 Jump;
  Vector3 HyperPosition;
  Vector3 OriginPosition;
  long Collision;
  Ship *TractoredBy;
  struct Spaceobject *CurrentJump;
  struct Spaceobject *LastSystem;
  bool Autopilot;
  bool OpenTube;
  Ship *Docked;
  Character *Ch;
  struct Spaceobject *InOrbitOf;
  int Count;
};

ch_ret DriveShip( Character *ch, Ship *ship, Exit *exit, int fall );
void ResetShip( Ship *ship );
void EchoToDockedShip( int color, const Ship *ship, const char *argument );
bool CanDock( const Ship *ship );
bool IsShipInHyperspace( const Ship *ship );
bool IsShipDisabled( const Ship *ship );
bool IsShipInCombatRange( const Ship *ship, const Ship *target );
bool IsMissileInRange( const Ship *ship, const Missile *missile );
bool IsSpaceobjectInRange( const Ship *ship, const Spaceobject *object );
bool IsSpaceobjectInCaptureRange( const Ship *ship, const Spaceobject *object );
bool CheckHostile( Ship *ship );
void LoadShips( void );
void SaveShip( const Ship *ship );
Ship *GetShipAnywhere( const char *name );
Ship *GetShipFromEntrance( vnum_t vnum );
Ship *GetShipFromHangar( vnum_t vnum );
Ship *GetShipFromCockpit( vnum_t vnum );
Ship *GetShipFromNavSeat( vnum_t vnum );
Ship *GetShipFromCoSeat( vnum_t vnum );
Ship *GetShipFromPilotSeat( vnum_t vnum );
Ship *GetShipFromGunSeat( vnum_t vnum );
Ship *GetShipFromTurret( vnum_t vnum );
Ship *GetShipFromEngine( vnum_t vnum );
Ship *GetShipInRange( const char *name, const Ship *eShip );
void UpdateShipMovement( void );
void RechargeShips( void );
void ShipUpdate( void );
bool IsShipRental( const Character *ch, const Ship *ship );
void EchoToShip( int color, const Ship *ship, const char *argument );
void EchoToCockpit( int color, const Ship *ship, const char *argument );
void EchoToNearbyShips( int color, const Ship *ship, const char *argument, const Ship *ignore );
bool ExtractShip( Ship *ship );
bool ShipToRoom( Ship *ship, vnum_t vnum );
long GetShipValue( const Ship *ship );
bool RentShip( Character *ch, const Ship *ship );
void DamageShip( Ship *ship, int min, int max, Character *ch, const Ship *assaulter);
void DestroyShip( Ship *ship, Character *killer );
void ShipToSpaceobject( Ship *ship, Spaceobject *spaceobject );
void ShipFromSpaceobject( Ship *ship, Spaceobject *spaceobject);
Ship *GetShipInRoom( const Room *room, const char *name );
void TransferShip( Ship *ship , vnum_t destination );
bool IsShipAutoflying( const Ship *ship );
bool CheckPilot( const Character *ch, const Ship *ship );
const char *GetShipFilename( const Ship *ship );
bool ShipNameAndPersonalnameComboIsUnique( const char *name, const char *personalname );

#endif
