#include "mud.hpp"
#include "vector3_aux.hpp"
#include "shiprepository.hpp"
#include "ship.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "room.hpp"
#include "script.hpp"
#include "turret.hpp"

ShipRepository *Ships = nullptr;

static void ExecuteShipFile( const std::string &filePath, void *userData );
static void ReadyShipAfterLoad( Ship *ship );
static void PushShip( lua_State *L, const void *userData );

/**********************************************
 ShipRepository
 **********************************************/

class LuaShipRepository : public ShipRepository
{
public:
  void Save(const Ship *entity) const override;
  void Save() const override;
  void Load() override;
};

void LuaShipRepository::Save(const Ship *ship) const
{
  if( ship->Class == SHIP_DEBRIS )
    {
      return;
    }

  LuaSaveDataFile( GetShipFilename( ship ), PushShip, "ship", ship );
}

void LuaShipRepository::Save() const
{
  for(Ship *ship : Entities())
    {
      Save(ship);
    }
}

void LuaShipRepository::Load()
{
  ForEachLuaFileInDir( SHIP_DIR, ExecuteShipFile, NULL );
}

static void PushInstruments( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Instruments" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "AstroArray", ship->Instruments.AstroArray );
  LuaSetfieldNumber( L, "Comm", ship->Instruments.Comm );
  LuaSetfieldNumber( L, "Sensor", ship->Instruments.Sensor );

  lua_settable( L, -3 );
}

static void PushThrusters( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Thrusters" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Maneuver", ship->Thrusters.Maneuver );
  PushCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
  PushCurrentAndMax( L, "Energy", ship->Thrusters.Energy );

  lua_settable( L, -3 );
}

static void PushHyperdrive( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Hyperdrive" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Speed", ship->Hyperdrive.Speed );

  lua_settable( L, -3 );
}

static void PushTube( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Tube" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Tube.State );
  PushCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
  PushCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
  PushCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );

  lua_settable( L, -3 );
}

static void PushLaser( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Laser" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.Laser.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Laser.State );
  lua_settable( L, -3 );
}

static void PushIonCannon( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "IonCannon" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.IonCannon.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.IonCannon.State );
  lua_settable( L, -3 );
}

static void PushTractorBeam( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "TractorBeam" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Strength", ship->WeaponSystems.TractorBeam.Strength );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.TractorBeam.State );
  lua_settable( L, -3 );
}

static void PushTurrets(lua_State *L,
                        const std::array<class Turret*, MAX_NUMBER_OF_TURRETS_IN_SHIP> &turrets)
{
  lua_pushstring( L, "Turrets" );
  lua_newtable( L );

  for( int idx = 0; idx < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++idx )
    {
      PushTurret( L, turrets[idx], idx );
    }

  lua_settable( L, -3 );
}

static void PushWeaponSystems( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "WeaponSystems" );
  lua_newtable( L );

  PushTube( L, ship );
  PushLaser( L, ship );
  PushIonCannon( L, ship );
  PushTractorBeam( L, ship );
  PushTurrets( L, ship->WeaponSystems.Turrets );

  lua_settable( L, -3 );
}

static void PushDefenses( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Defenses" );
  lua_newtable( L );

  PushCurrentAndMax( L, "Hull", ship->Defenses.Hull );
  PushCurrentAndMax( L, "Shield", ship->Defenses.Shield );
  PushCurrentAndMax( L, "Chaff", ship->Defenses.Chaff );

  lua_settable( L, -3 );
}

static void PushRooms( lua_State *L, const Ship *ship )
{
  lua_pushstring( L, "Rooms" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "First", ship->Rooms.First );
  LuaSetfieldNumber( L, "Last", ship->Rooms.Last );
  LuaSetfieldNumber( L, "Cockpit", ship->Rooms.Cockpit );
  LuaSetfieldNumber( L, "Entrance", ship->Rooms.Entrance );
  LuaSetfieldNumber( L, "Hangar", ship->Rooms.Hangar );
  LuaSetfieldNumber( L, "Engine", ship->Rooms.Engine );
  LuaSetfieldNumber( L, "Navseat", ship->Rooms.Navseat );
  LuaSetfieldNumber( L, "Pilotseat", ship->Rooms.Pilotseat );
  LuaSetfieldNumber( L, "Coseat", ship->Rooms.Coseat );
  LuaSetfieldNumber( L, "Gunseat", ship->Rooms.Gunseat );

  lua_settable( L, -3 );
}

static void PushShip( lua_State *L, const void *userData )
{
  const Ship *ship = (const Ship*) userData;
  lua_pushinteger( L, 1 );
  lua_newtable( L );

  LuaSetfieldString( L, "Name", ship->Name );
  LuaSetfieldString( L, "PersonalName", ship->PersonalName );
  LuaSetfieldString( L, "Description", ship->Description );
  LuaSetfieldString( L, "Owner", ship->Owner );
  LuaSetfieldString( L, "Pilot", ship->Pilot );
  LuaSetfieldString( L, "CoPilot", ship->CoPilot );
  LuaSetfieldString( L, "Class", ShipClasses[ship->Class] );
  LuaSetfieldNumber( L, "Shipyard", ship->Shipyard );
  LuaSetfieldNumber( L, "Location", ship->Location );
  LuaSetfieldNumber( L, "LastDock", ship->LastDock );
  LuaSetfieldString( L, "Type", ShipTypes[ship->Type] );
  LuaSetfieldNumber( L, "State", ship->State );
  LuaSetfieldBoolean( L, "Alarm", ship->Alarm );
  LuaSetfieldNumber( L, "DockingPorts", ship->DockingPorts );
  LuaSetfieldBoolean( L, "Guard", ship->Guard );
  LuaSetfieldString( L, "Home", ship->Home );

  LuaPushVector3( L, &ship->Position, "Position" );
  PushInstruments( L, ship );
  PushThrusters( L, ship );
  PushHyperdrive( L, ship );
  PushWeaponSystems( L, ship );
  PushDefenses( L, ship );
  PushRooms( L, ship );

  LuaPushFlags( L, ship->Flags, ShipFlags, "Flags" );

  lua_setglobal( L, "ship" );
}

static void LoadInstruments( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Instruments" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "AstroArray" );
      lua_getfield( L, sub_idx, "Comm" );
      lua_getfield( L, sub_idx, "Sensor" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.AstroArray = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.Comm = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Instruments.Sensor = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadThrusters( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Thrusters" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Maneuver" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Thrusters.Maneuver = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );

      LoadCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
      ship->Thrusters.Speed.Current = 0;

      LoadCurrentAndMax( L, "Energy", ship->Thrusters.Energy );
    }

  lua_pop( L, 1 );
  }

static void LoadHyperdrive( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Hyperdrive" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Speed" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Hyperdrive.Speed = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTube( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Tube" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Tube.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );

      LoadCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
      LoadCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );
      LoadCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
    }

  lua_pop( L, 1 );
}

static void LoadLaser( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Laser" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Count" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Laser.Count = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.Laser.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadIonCannon( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "IonCannon" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Count" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.IonCannon.Count = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.IonCannon.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTractorBeam( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "TractorBeam" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
      luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "Strength" );
      lua_getfield( L, sub_idx, "State" );
      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.TractorBeam.Strength = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->WeaponSystems.TractorBeam.State = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static void LoadTurrets( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Turrets" );

  if( !lua_isnil(L, ++idx))
    {
      lua_pushnil( L );

       while( lua_next( L, -2 ) )
        {
          size_t arraySubscript = lua_tointeger( L, -2 );
          LoadTurret( L, ship->WeaponSystems.Turrets[arraySubscript] );
          lua_pop( L, 1 );
        }
    }

  lua_pop( L, 1 );
}

static void LoadWeaponSystems( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "WeaponSystems" );

  if( !lua_isnil( L, ++idx ) )
    {
      LoadTube( L, ship );
      LoadLaser( L, ship );
      LoadIonCannon( L, ship );
      LoadTractorBeam( L, ship );
      LoadTurrets( L, ship );
    }

  lua_pop( L, 1 );
  }

static void LoadDefenses( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Defenses" );

  if( !lua_isnil( L, ++idx ) )
    {
      LoadCurrentAndMax( L, "Hull", ship->Defenses.Hull );
      LoadCurrentAndMax( L, "Shield", ship->Defenses.Shield );
      LoadCurrentAndMax( L, "Chaff", ship->Defenses.Chaff );
    }

  lua_pop( L, 1 );
}

static void LoadRooms( lua_State *L, Ship *ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      int sub_idx = lua_gettop( L );
      const int topAtStart = sub_idx;
      int elementsToPop = 0;
luaL_checktype( L, 1, LUA_TTABLE );

      lua_getfield( L, sub_idx, "First" );
      lua_getfield( L, sub_idx, "Last" );
      lua_getfield( L, sub_idx, "Cockpit" );
      lua_getfield( L, sub_idx, "Entrance" );
      lua_getfield( L, sub_idx, "Hangar" );
      lua_getfield( L, sub_idx, "Engine" );
      lua_getfield( L, sub_idx, "Navseat" );
      lua_getfield( L, sub_idx, "Pilotseat" );
      lua_getfield( L, sub_idx, "Coseat" );
      lua_getfield( L, sub_idx, "Gunseat" );

      elementsToPop = lua_gettop( L ) - topAtStart;

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.First = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Last = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Cockpit = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Entrance = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Hangar = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Engine = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Navseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Pilotseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Coseat = lua_tointeger( L, sub_idx );
        }

      if( !lua_isnil( L, ++sub_idx ) )
        {
          ship->Rooms.Gunseat = lua_tointeger( L, sub_idx );
        }

      lua_pop( L, elementsToPop );
    }

  lua_pop( L, 1 );
}

static int L_ShipEntry( lua_State *L )
{
  int idx = lua_gettop( L );
  const int topAtStart = idx;
  int elementsToPop = 0;
  luaL_checktype( L, 1, LUA_TTABLE );

  Ship *ship = new Ship();

  lua_getfield( L, idx, "Name" );
  lua_getfield( L, idx, "PersonalName" );
  lua_getfield( L, idx, "Description" );
  lua_getfield( L, idx, "Owner" );
  lua_getfield( L, idx, "Pilot" );
  lua_getfield( L, idx, "CoPilot" );
  lua_getfield( L, idx, "Class" );
  lua_getfield( L, idx, "Shipyard" );
  lua_getfield( L, idx, "Location" );
  lua_getfield( L, idx, "LastDock" );
  lua_getfield( L, idx, "Type" );
  lua_getfield( L, idx, "State" );
  lua_getfield( L, idx, "Alarm" );
  lua_getfield( L, idx, "DockingPorts" );
  lua_getfield( L, idx, "Guard" );
  lua_getfield( L, idx, "Home" );

  elementsToPop = lua_gettop( L ) - topAtStart;

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Name = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->PersonalName = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Description = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Owner = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Pilot = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->CoPilot = lua_tostring( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Class = GetShipClass( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Shipyard = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Location = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->LastDock = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Type = GetShipType( lua_tostring( L, idx ) );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->State = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Alarm = lua_toboolean( L, idx );
      }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->DockingPorts = lua_tointeger( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Guard = lua_toboolean( L, idx );
    }

  if( !lua_isnil( L, ++idx ) )
    {
      ship->Home = lua_tostring( L, idx );
    }

  lua_pop( L, elementsToPop );

  LuaLoadVector3( L, &ship->Position, "Position" );
  LoadInstruments( L, ship );
  LoadThrusters( L, ship );
  LoadHyperdrive( L, ship );
  LoadWeaponSystems( L, ship );
  LoadDefenses( L, ship );
  LoadRooms( L, ship );
  ship->Flags = LuaLoadFlags( L, "Flags" );
  ReadyShipAfterLoad( ship );
  return 0;
}

static void ReadyShipAfterLoad( Ship *ship )
{
  Clan *clan = NULL;
  Room *room = NULL;

  if (!IsShipDisabled( ship ))
    {
      ship->State = SHIP_LANDED;
    }

  if (ship->WeaponSystems.Laser.State != LASER_DAMAGED)
    {
      ship->WeaponSystems.Laser.State = LASER_READY;
    }

  if (ship->WeaponSystems.IonCannon.State != LASER_DAMAGED)
    {
      ship->WeaponSystems.IonCannon.State = LASER_READY;
    }

  if (ship->WeaponSystems.Tube.State != MISSILE_DAMAGED)
    {
      ship->WeaponSystems.Tube.State = MISSILE_READY;
      }

  if (ship->Shipyard <= 0)
    {
      ship->Shipyard = ROOM_LIMBO_SHIPYARD;
    }

  if (ship->LastDock <= 0)
    {
      ship->LastDock = ship->Shipyard;
    }

  if (ship->Rooms.Navseat <= 0)
    {
      ship->Rooms.Navseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Gunseat <= 0)
    {
      ship->Rooms.Gunseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Coseat <= 0)
    {
      ship->Rooms.Coseat = ship->Rooms.Cockpit;
    }

  if (ship->Rooms.Pilotseat <= 0)
    {
      ship->Rooms.Pilotseat = ship->Rooms.Cockpit;
    }

  if (ship->Type == SHIP_REBEL)
    {
      ship->WeaponSystems.Tube.Torpedoes.Current = ship->WeaponSystems.Tube.Missiles.Current;    /*\for back compatibility */
      ship->WeaponSystems.Tube.Missiles.Current = 0;
    }

  if( ship->Class < SHIP_PLATFORM )
    {
      ship->BayOpen = false;
    }

  Ships->Add(ship);

  ship->Docking = SHIP_READY;

  if ( ( !StrCmp("Trainer", ship->Owner)
         || !StrCmp("Public",ship->Owner)
         || ship->Type == MOB_SHIP ) )
    {
      if ( ship->Class != SHIP_PLATFORM && ship->Type != MOB_SHIP
           && ship->Class != CAPITAL_SHIP )
        {
          ExtractShip( ship );
          ShipToRoom( ship , ship->Shipyard );

          ship->Location = ship->Shipyard;
          ship->LastDock = ship->Shipyard;
          ship->State = SHIP_LANDED;
          ship->Docking = SHIP_READY;
        }

      if( ship->PersonalName.empty() )
        {
          ship->PersonalName = ship->Name;
        }

      ship->Thrusters.Speed.Current = 0;
      ship->Thrusters.Energy.Current = ship->Thrusters.Energy.Max;
      ship->Defenses.Hull.Current = ship->Defenses.Hull.Max;
      ship->Defenses.Shield.Current = 0;

      ship->WeaponSystems.Laser.State = LASER_READY;
      ship->WeaponSystems.Tube.State = MISSILE_READY;
      ship->WeaponSystems.TractorBeam.State = SHIP_READY;
      ship->DockingState = SHIP_READY;
      ship->Docking = SHIP_READY;

      ship->CurrentJump = NULL;
      ship->WeaponSystems.Target = NULL;

      ship->HatchOpen = false;
      ship->BayOpen = false;

      ship->AutoRecharge = false;
      ship->AutoTrack = false;
      ship->AutoSpeed = false;
    }
  else if ( ( room = GetRoom( ship->LastDock ) ) != NULL
            && ship->Class != CAPITAL_SHIP && ship->Class != SHIP_PLATFORM )
    {
      room->Add(ship);
      ship->Location = ship->LastDock;
    }

  if ( ship->Class == SHIP_PLATFORM
       || ship->Type == MOB_SHIP
       || ship->Class == CAPITAL_SHIP )
    {
      ShipToSpaceobject(ship, GetSpaceobject(ship->Home) );
      SetVector( &ship->Heading, 1, 1, 1 );

      if( ship->Position.x == 0 && ship->Position.y == 0 && ship->Position.z == 0 )
        {
          if ( !ship->Home.empty() )
            {
              ShipToSpaceobject(ship, GetSpaceobject(ship->Home));
              InitializeVector( &ship->Position );

              if( ship->Spaceobject )
                {
                  CopyVector( &ship->Position, &ship->Spaceobject->Position );
                }

              RandomizeVector( &ship->Position, -5000, 5000 );
              ship->State = SHIP_READY;
              ship->Autopilot = true;
              ship->AutoRecharge = true;
              ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
            }
        }

      ship->State = SHIP_READY;
      ship->Docking = SHIP_READY;
      ship->Autopilot = true;
      ship->AutoRecharge = true;
      ship->Defenses.Shield.Current = ship->Defenses.Shield.Max;
    }

  if ( ship->Type != MOB_SHIP
       && ( clan = GetClan( ship->Owner ) ) != NULL )
    {
      if ( ship->Class <= SHIP_PLATFORM )
        {
          clan->Spacecraft++;
        }
      else
        {
          clan->Vehicles++;
        }
    }

  ship->Docking = SHIP_READY;
}

static void ExecuteShipFile( const std::string &filePath, void *userData )
{
  LuaLoadDataFile( filePath, L_ShipEntry, "ShipEntry" );
}

///////////////////////////////////////////

ShipRepository *NewShipRepository()
{
  return new LuaShipRepository();
}
