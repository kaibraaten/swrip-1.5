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

#include <memory>
#include "types.hpp"
#include "luascript.hpp"

class Turret;

std::shared_ptr<Turret> AllocateTurret(ShipClass ownerClass);
std::shared_ptr<Turret> CopyTurret(const std::shared_ptr<Turret> &old_turret, ShipClass ownerClassOfNewTurret);

bool IsTurretInstalled(const std::shared_ptr<Turret> &turret);

void ResetTurret(const std::shared_ptr<Turret> &turret);

void SetTurretReady(const std::shared_ptr<Turret> &turret);
bool IsTurretReady(const std::shared_ptr<Turret> &turret);

void SetTurretDamaged(const std::shared_ptr<Turret> &turret);
bool IsTurretDamaged(const std::shared_ptr<Turret> &turret);

bool IsTurretRecharging(const std::shared_ptr<Turret> &turret);
void FireTurret(const std::shared_ptr<Turret> &turret);

void ClearTurretTarget(const std::shared_ptr<Turret> &turret);
void SetTurretTarget(const std::shared_ptr<Turret> &turret, std::shared_ptr<Ship> target);
std::shared_ptr<Ship> GetTurretTarget(const std::shared_ptr<Turret> &turret);
bool TurretHasTarget(const std::shared_ptr<Turret> &turret);

void SetTurretRoom(const std::shared_ptr<Turret> &turret, vnum_t room_vnum);
vnum_t GetTurretRoom(const std::shared_ptr<Turret> &turret);

int GetTurretEnergyDraw(const std::shared_ptr<Turret> &turret);

void PushTurret(lua_State *L, const std::shared_ptr<Turret> &turret, const int idx);
void LoadTurret(lua_State *L, const std::shared_ptr<Turret> &turret);

#endif
