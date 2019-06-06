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

#include "mud.hpp"
#include "turret.hpp"
#include "constants.hpp"
#include "ship.hpp"

class Turret
{
public:
    vnum_t RoomVnum = INVALID_VNUM;
    int WeaponState = LASER_READY;
    std::shared_ptr<Ship> Target;
    ShipClass OwnerClass = FIGHTER_SHIP;
};

Turret *AllocateTurret(ShipClass ownerClass)
{
    auto turret = new Turret();
    turret->OwnerClass = ownerClass;
    ResetTurret(turret);

    return turret;
}

Turret *CopyTurret(const Turret *old_turret, ShipClass ownerClassOfNewTurret)
{
    Turret *new_turret = AllocateTurret(ownerClassOfNewTurret);

    SetTurretRoom(new_turret, old_turret->RoomVnum);
    new_turret->WeaponState = old_turret->WeaponState;
    SetTurretTarget(new_turret, old_turret->Target);
    new_turret->OwnerClass = old_turret->OwnerClass;

    return new_turret;
}

bool IsTurretInstalled(const Turret *turret)
{
    return GetTurretRoom(turret) != 0;
}

void FreeTurret(Turret *turret)
{
    delete turret;
}

void ResetTurret(Turret *turret)
{
    SetTurretReady(turret);
    ClearTurretTarget(turret);
}

void SetTurretReady(Turret *turret)
{
    turret->WeaponState = LASER_READY;
}

bool IsTurretReady(const Turret *turret)
{
    return turret->WeaponState == LASER_READY;
}

bool IsTurretRecharging(const Turret *turret)
{
    return turret->WeaponState > turret->OwnerClass;
}

void FireTurret(Turret *turret)
{
    if (TurretHasTarget(turret))
    {
        turret->WeaponState++;
    }
}

void SetTurretDamaged(Turret *turret)
{
    if (IsTurretInstalled(turret))
    {
        turret->WeaponState = LASER_DAMAGED;
    }
}

bool IsTurretDamaged(const Turret *turret)
{
    return turret->WeaponState == LASER_DAMAGED;
}

void ClearTurretTarget(Turret *turret)
{
    turret->Target = 0;
}

void SetTurretTarget(Turret *turret, std::shared_ptr<Ship> target)
{
    turret->Target = target;
}

std::shared_ptr<Ship> GetTurretTarget(const Turret *turret)
{
    return turret->Target;
}

bool TurretHasTarget(const Turret *turret)
{
    return GetTurretTarget(turret) != NULL;
}

void SetTurretRoom(Turret *turret, vnum_t room_vnum)
{
    turret->RoomVnum = room_vnum;
}

vnum_t GetTurretRoom(const Turret *turret)
{
    return turret->RoomVnum;
}

int GetTurretEnergyDraw(const Turret *turret)
{
    int draw = 0;

    if (TurretHasTarget(turret))
    {
        draw = turret->WeaponState;
    }

    return draw;
}

void PushTurret(lua_State *L, const Turret *turret, const int idx)
{
    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldNumber(L, "RoomVnum", turret->RoomVnum);
    LuaSetfieldNumber(L, "State", turret->WeaponState);

    lua_settable(L, -3);
}

void LoadTurret(lua_State *L, Turret *turret)
{
    LuaGetfieldLong(L, "RoomVnum",
        [turret](const vnum_t vnum)
    {
        SetTurretRoom(turret, vnum);
    });
    LuaGetfieldInt(L, "State", &turret->WeaponState);
}

