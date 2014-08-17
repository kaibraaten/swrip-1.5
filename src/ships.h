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

ch_ret DriveShip( Character *ch, Ship *ship, Exit *exit, int fall );
void ResetShip( Ship *ship );
void WriteShipList( void );
void EchoToDockedShip( int color, Ship *ship, const char *argument );
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
Ship *GetShipInRange( const char *name , Ship *eShip );
void UpdateShipMovement( void );
void RechargeShips( void );
void UpdateShips( void );
bool IsShipRental( Character *ch , Ship *ship );
void EchoToShip( int color, Ship *ship, const char *argument );
void EchoToCockpit( int color, Ship *ship, const char *argument );
void EchoToNearbyShips( int color, Ship *ship, const char *argument, Ship *ignore );
bool ExtractShip( Ship *ship );
bool ShipToRoom( Ship *ship, vnum_t vnum );
long GetShipValue( Ship *ship );
bool RentShip( Character *ch, Ship *ship );
void DamageShip( Ship *ship, int min, int max, Character *ch, Ship *assaulter);
void DestroyShip( Ship *ship , Character *ch );
void ShipToSpaceobject( Ship *ship, Spaceobject *spaceobject );
void ShipFromSpaceobject( Ship *ship, Spaceobject *spaceobject);
Ship *GetShipInRoom( Room *room, const char *name );
void TransferShip( Ship *ship , vnum_t destination );
void DockShip( Character *ch, Ship *ship );
bool IsShipAutoflying( const Ship *ship );
bool CheckPilot( Character *ch , Ship *ship );

#endif
