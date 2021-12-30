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
#include "room.hpp"

class Turret
{
public:
    vnum_t RoomVnum = INVALID_VNUM;
    int WeaponState = LASER_READY;
    std::shared_ptr<Ship> Target;
    ShipClass OwnerClass = FIGHTER_SHIP;
};

std::shared_ptr<Turret> AllocateTurret(ShipClass ownerClass)
{
    auto turret = std::make_shared<Turret>();
    turret->OwnerClass = ownerClass;
    ResetTurret(turret);

    return turret;
}

std::shared_ptr<Turret> CopyTurret(const std::shared_ptr<Turret> &old_turret, ShipClass ownerClassOfNewTurret)
{
    auto new_turret = AllocateTurret(ownerClassOfNewTurret);

    SetTurretRoom(new_turret, old_turret->RoomVnum);
    new_turret->WeaponState = old_turret->WeaponState;
    SetTurretTarget(new_turret, old_turret->Target);
    new_turret->OwnerClass = old_turret->OwnerClass;

    return new_turret;
}

bool IsTurretInstalled(const std::shared_ptr<Turret> &turret)
{
    return GetTurretRoom(turret) != 0;
}

void ResetTurret(const std::shared_ptr<Turret> &turret)
{
    SetTurretReady(turret);
    ClearTurretTarget(turret);
}

void SetTurretReady(const std::shared_ptr<Turret> &turret)
{
    turret->WeaponState = LASER_READY;
}

bool IsTurretReady(const std::shared_ptr<Turret> &turret)
{
    return turret->WeaponState == LASER_READY;
}

bool IsTurretRecharging(const std::shared_ptr<Turret> &turret)
{
    return turret->WeaponState > turret->OwnerClass;
}

void FireTurret(const std::shared_ptr<Turret> &turret)
{
    if (TurretHasTarget(turret))
    {
        turret->WeaponState++;
    }
}

void SetTurretDamaged(const std::shared_ptr<Turret> &turret)
{
    if (IsTurretInstalled(turret))
    {
        turret->WeaponState = LASER_DAMAGED;
    }
}

bool IsTurretDamaged(const std::shared_ptr<Turret> &turret)
{
    return turret->WeaponState == LASER_DAMAGED;
}

void ClearTurretTarget(const std::shared_ptr<Turret> &turret)
{
    turret->Target = 0;
}

void SetTurretTarget(const std::shared_ptr<Turret> &turret, std::shared_ptr<Ship> target)
{
    turret->Target = target;
}

std::shared_ptr<Ship> GetTurretTarget(const std::shared_ptr<Turret> &turret)
{
    return turret->Target;
}

bool TurretHasTarget(const std::shared_ptr<Turret> &turret)
{
    return GetTurretTarget(turret) != nullptr;
}

void SetTurretRoom(const std::shared_ptr<Turret> &turret, vnum_t room_vnum)
{
    turret->RoomVnum = room_vnum;
}

vnum_t GetTurretRoom(const std::shared_ptr<Turret> &turret)
{
    return turret->RoomVnum;
}

int GetTurretEnergyDraw(const std::shared_ptr<Turret> &turret)
{
    int draw = 0;

    if (TurretHasTarget(turret))
    {
        draw = turret->WeaponState;
    }

    return draw;
}

void PushTurret(lua_State *L, const std::shared_ptr<Turret> &turret, const int idx)
{
    std::string vnumOrTag = "0";
    auto room = turret->RoomVnum != INVALID_VNUM ? GetRoom(turret->RoomVnum) : nullptr;

    if(room != nullptr)
    {
        vnumOrTag = VnumOrTag(room);
    }

    lua_pushinteger(L, idx);
    lua_newtable(L);

    LuaSetfieldString(L, "RoomVnum", vnumOrTag);
    LuaSetfieldNumber(L, "State", turret->WeaponState);

    lua_settable(L, -3);
}

void LoadTurret(lua_State *L, const std::shared_ptr<Turret> &turret)
{
    LuaGetfieldString(L, "RoomVnum",
                      [turret](const auto &vnumOrTag)
                      {
                          if(IsValidVnumOrTag(vnumOrTag))
                          {
                              auto room = GetRoom(vnumOrTag);

                              if(room != nullptr)
                              {
                                  SetTurretRoom(turret, room->Vnum);
                              }
                          }
                      });
    LuaGetfieldInt(L, "State", &turret->WeaponState);
}
