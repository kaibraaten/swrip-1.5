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
#include "types.h"
#include "constants.h"

struct Ship
{
  Ship *Next;
  Ship *Previous;
  Ship *NextInSpaceobject;
  Ship *PreviousInSpaceobject;
  Ship *NextInRoom;
  Ship *PreviousInRoom;
  Room *InRoom;
  Spaceobject *Spaceobject;
  char *Filename;
  char *Name;
  char *PersonalName;
  char *Home;
  char *Description;
  char *Owner;
  char *Pilot;
  char *CoPilot;
  char *LandingDestination;
  short Type;
  ShipClass Class;
  int Hyperdistance;
  int OriginalHyperdistance;
  short ShipState;
  short Docking;
  short DockingState;
  short Maneuver;
  short DockingPorts;
  bool BayOpen;
  bool HatchOpen;
  bool AutoRecharge;
  bool AutoTrack;
  bool AutoSpeed;
  bool Tracking;
  int tcount;
  bool Guard;
  Vector3 TrackVector;          /* tx, ty, tz */
  Vector3 Position;              /* vx, vy, vz  */
  Vector3 Heading;               /* hx, hy, hz */
  Vector3 Jump;      /* jx, jy, jz */
  Vector3 HyperPosition;   /* cx, cy, cz */
  Vector3 OriginPosition;       /* ox, oy, oz */

  vnum_t Location;
  vnum_t LastDock;
  vnum_t Shipyard;

  long Collision;
  Ship *TractoredBy;
  Spaceobject *CurrentJump;
  Spaceobject *LastSystem;
  bool Autopilot;
  bool OpenTube;
  Ship *Docked;
  short Alarm;
  Character *Ch;
  Spaceobject *InOrbitOf;
  int Count;
  
  struct
  {
    short Comm;
    short Sensor;
    short AstroArray;
  } Instruments;
  
  struct
  {
    struct
    {
      short Current;
      short Max;
    } Speed, Energy;
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
	short Current;
	short Max;
      } Missiles, Torpedoes, Rockets;

      short State;
      short Type;
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
      Ship *Tractoring;
    } TractorBeam;
    
    Ship *Target;
    Turret *Turret[MAX_NUMBER_OF_TURRETS_IN_SHIP];
  } WeaponSystems;

  struct
  {
    struct
    {
      short Current;
      short Max;
    } Hull, Shield, Chaff;

    bool ChaffReleased;
  } Defenses;
  
  struct
  {
    vnum_t First;
    vnum_t Last;
    vnum_t Cockpit;
    vnum_t Entrance;
    vnum_t Hanger;
    vnum_t Engine;
    vnum_t Navseat;
    vnum_t Pilotseat;
    vnum_t Coseat;
    vnum_t Gunseat;
  } Room;
};

ch_ret DriveShip( Character *ch, Ship *ship, Exit *exit, int fall );
void ResetShip( Ship *ship );
void WriteShipList( void );
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

#endif
