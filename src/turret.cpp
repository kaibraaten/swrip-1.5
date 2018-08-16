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
  Ship *Target = nullptr;
  Ship *Owner = nullptr;
};

Turret *AllocateTurret( Ship *owner )
{
  Turret *turret = new Turret();
  turret->Owner = owner;
  ResetTurret( turret );

  return turret;
}

Turret *CopyTurret( const Turret *old_turret, Ship *owner_of_new_turret )
{
  Turret *new_turret = AllocateTurret( owner_of_new_turret );

  SetTurretRoom( new_turret, old_turret->RoomVnum );
  new_turret->WeaponState = old_turret->WeaponState;
  SetTurretTarget( new_turret, old_turret->Target );
  new_turret->Owner = old_turret->Owner;

  return new_turret;
}

bool IsTurretInstalled( const Turret *turret )
{
  return GetTurretRoom( turret ) != 0;
}

void FreeTurret( Turret *turret )
{
  delete turret;
}

void ResetTurret( Turret *turret )
{
  SetTurretReady( turret );
  ClearTurretTarget( turret );
}

void SetTurretReady( Turret *turret )
{
  turret->WeaponState = LASER_READY;
}

bool IsTurretReady( const Turret *turret )
{
  return turret->WeaponState == LASER_READY;
}

bool IsTurretRecharging( const Turret *turret )
{
  return turret->WeaponState > (int)turret->Owner->Class;
}

void FireTurret( Turret *turret )
{
  if( TurretHasTarget( turret ) )
    {
      turret->WeaponState++;
    }
}

void SetTurretDamaged( Turret *turret )
{
  if( IsTurretInstalled( turret ) )
    {
      turret->WeaponState = LASER_DAMAGED;
    }
}

bool IsTurretDamaged( const Turret *turret )
{
  return turret->WeaponState == LASER_DAMAGED;
}

void ClearTurretTarget( Turret *turret )
{
  turret->Target = 0;
}

void SetTurretTarget( Turret *turret, Ship *target )
{
  turret->Target = target;
}

Ship *GetTurretTarget( const Turret *turret )
{
  return turret->Target;
}

bool TurretHasTarget( const Turret *turret )
{
  return GetTurretTarget( turret ) != NULL;
}

void SetTurretRoom( Turret *turret, vnum_t room_vnum )
{
  turret->RoomVnum = room_vnum;
}

vnum_t GetTurretRoom( const Turret *turret )
{
  return turret->RoomVnum;
}

int GetTurretEnergyDraw( const Turret *turret )
{
  int draw = 0;

  if( TurretHasTarget( turret ) )
    {
      draw = turret->WeaponState;
    }

  return draw;
}

void PushTurret( lua_State *L, const Turret *turret, const int idx )
{
  lua_pushinteger( L, idx );
  lua_newtable( L );

  LuaSetfieldNumber( L, "RoomVnum", turret->RoomVnum );
  LuaSetfieldNumber( L, "State", turret->WeaponState );
  
  lua_settable( L, -3 );
}

void LoadTurret( lua_State *L, Turret *turret )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;

  lua_getfield( L, idx, "RoomVnum" );
  lua_getfield( L, idx, "State" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      SetTurretRoom( turret, lua_tointeger( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      turret->WeaponState = lua_tointeger( L, idx );
    }

  lua_pop( L, elementsToPop );
}
