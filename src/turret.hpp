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

#ifndef _SWRIP_TURRET_HPP_
#define _SWRIP_TURRET_HPP_

#include "types.hpp"
#include "script.hpp"

Turret *AllocateTurret( Ship *owner );
void FreeTurret( Turret *turret );
Turret *CopyTurret( const Turret *old_turret, Ship *owner_of_new_turret );

bool IsTurretInstalled( const Turret *turret );

void ResetTurret( Turret *turret );

void SetTurretReady( Turret *turret );
bool IsTurretReady( const Turret *turret );

void SetTurretDamaged( Turret *turret );
bool IsTurretDamaged( const Turret *turret );

bool IsTurretRecharging( const Turret *turret );
void FireTurret( Turret *turret );

void ClearTurretTarget( Turret *turret );
void SetTurretTarget( Turret *turret, Ship *target );
Ship *GetTurretTarget( const Turret *turret );
bool TurretHasTarget( const Turret *turret );

void SetTurretRoom( Turret *turret, vnum_t room_vnum );
vnum_t GetTurretRoom( const Turret *turret );

int GetTurretEnergyDraw( const Turret *turret );

void PushTurret( lua_State *L, const Turret *turret, const int idx );
void LoadTurret( lua_State *L, Turret *turret );

#endif
