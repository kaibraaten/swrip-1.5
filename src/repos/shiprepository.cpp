#include "mud.hpp"
#include "vector3_aux.hpp"
#include "shiprepository.hpp"
#include "ship.hpp"
#include "clan.hpp"
#include "spaceobject.hpp"
#include "room.hpp"
#include "script.hpp"
#include "turret.hpp"

#define SHIP_DIR DATA_DIR "ships/"

std::shared_ptr<ShipRepository> Ships;

static void ExecuteShipFile( const std::string &filePath, void *userData );
static void ReadyShipAfterLoad( std::shared_ptr<Ship> ship );
static void PushShip( lua_State *L, const void *userData );

/**********************************************
 ShipRepository
 **********************************************/

class LuaShipRepository : public ShipRepository
{
public:
  void Save(std::shared_ptr<Ship> entity) const override;
  void Save() const override;
  void Load() override;
};

void LuaShipRepository::Save(std::shared_ptr<Ship> ship) const
{
  if( ship->Class == SHIP_DEBRIS )
    {
      return;
    }

  LuaSaveDataFile( GetShipFilename( ship ), PushShip, "ship", &ship );
}

void LuaShipRepository::Save() const
{
  for(auto ship : Entities())
    {
      Save(ship);
    }
}

void LuaShipRepository::Load()
{
  ForEachLuaFileInDir( SHIP_DIR, ExecuteShipFile, nullptr );
}

static void PushInstruments( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Instruments" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "AstroArray", ship->Instruments.AstroArray );
  LuaSetfieldNumber( L, "Comm", ship->Instruments.Comm );
  LuaSetfieldNumber( L, "Sensor", ship->Instruments.Sensor );

  lua_settable( L, -3 );
}

static void PushThrusters( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Thrusters" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Maneuver", ship->Thrusters.Maneuver );
  PushCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
  PushCurrentAndMax( L, "Energy", ship->Thrusters.Energy );

  lua_settable( L, -3 );
}

static void PushHyperdrive( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Hyperdrive" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "Speed", ship->Hyperdrive.Speed );

  lua_settable( L, -3 );
}

static void PushTube( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Tube" );
  lua_newtable( L );

  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Tube.State );
  PushCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
  PushCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
  PushCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );

  lua_settable( L, -3 );
}

static void PushLaser( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Laser" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.Laser.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.Laser.State );
  lua_settable( L, -3 );
}

static void PushIonCannon( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "IonCannon" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Count", ship->WeaponSystems.IonCannon.Count );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.IonCannon.State );
  lua_settable( L, -3 );
}

static void PushTractorBeam( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "TractorBeam" );
  lua_newtable( L );
  LuaSetfieldNumber( L, "Strength", ship->WeaponSystems.TractorBeam.Strength );
  LuaSetfieldNumber( L, "State", ship->WeaponSystems.TractorBeam.State );
  lua_settable( L, -3 );
}

static void PushTurrets(lua_State *L, const std::vector<Turret*> &turrets)
{
  lua_pushstring( L, "Turrets" );
  lua_newtable( L );

  for( int idx = 0; idx < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++idx )
    {
      PushTurret( L, turrets[idx], idx );
    }

  lua_settable( L, -3 );
}

static void PushWeaponSystems( lua_State *L, std::shared_ptr<Ship> ship )
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

static void PushDefenses( lua_State *L, std::shared_ptr<Ship> ship )
{
  lua_pushstring( L, "Defenses" );
  lua_newtable( L );

  PushCurrentAndMax( L, "Hull", ship->Defenses.Hull );
  PushCurrentAndMax( L, "Shield", ship->Defenses.Shield );
  PushCurrentAndMax( L, "Chaff", ship->Defenses.Chaff );

  lua_settable( L, -3 );
}

static void PushRooms( lua_State *L, std::shared_ptr<Ship> ship )
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
  std::shared_ptr<Ship> ship = *static_cast<const std::shared_ptr<Ship>*>(userData);
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

static void LoadInstruments( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Instruments" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "AstroArray", &ship->Instruments.AstroArray );
      LuaGetfieldInt( L, "Comm", &ship->Instruments.Comm );
      LuaGetfieldInt( L, "Sensor", &ship->Instruments.Sensor );
    }

  lua_pop( L, 1 );
}

static void LoadThrusters( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Thrusters" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "Maneuver", &ship->Thrusters.Maneuver );
      LoadCurrentAndMax( L, "Speed", ship->Thrusters.Speed );
      ship->Thrusters.Speed.Current = 0;
      LoadCurrentAndMax( L, "Energy", ship->Thrusters.Energy );
    }

  lua_pop( L, 1 );
}

static void LoadHyperdrive( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Hyperdrive" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "Speed", &ship->Hyperdrive.Speed );
    }

  lua_pop( L, 1 );
}

static void LoadTube( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Tube" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "State", &ship->WeaponSystems.Tube.State );
      LoadCurrentAndMax( L, "Missiles", ship->WeaponSystems.Tube.Missiles );
      LoadCurrentAndMax( L, "Rockets", ship->WeaponSystems.Tube.Rockets );
      LoadCurrentAndMax( L, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes );
    }

  lua_pop( L, 1 );
}

static void LoadLaser( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Laser" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "Count", &ship->WeaponSystems.Laser.Count );
      LuaGetfieldInt( L, "State", &ship->WeaponSystems.Laser.State );
    }

  lua_pop( L, 1 );
}

static void LoadIonCannon( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "IonCannon" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "Count", &ship->WeaponSystems.IonCannon.Count );
      LuaGetfieldInt( L, "State", &ship->WeaponSystems.IonCannon.State );
    }

  lua_pop( L, 1 );
}

static void LoadTractorBeam( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "TractorBeam" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldInt( L, "Strength", &ship->WeaponSystems.TractorBeam.Strength );
      LuaGetfieldInt( L, "State", &ship->WeaponSystems.TractorBeam.State );
    }

  lua_pop( L, 1 );
}

static void LoadTurrets( lua_State *L, std::shared_ptr<Ship> ship )
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

static void LoadWeaponSystems( lua_State *L, std::shared_ptr<Ship> ship )
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

static void LoadDefenses( lua_State *L, std::shared_ptr<Ship> ship )
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

static void LoadRooms( lua_State *L, std::shared_ptr<Ship> ship )
{
  int idx = lua_gettop( L );
  lua_getfield( L, idx, "Rooms" );

  if( !lua_isnil( L, ++idx ) )
    {
      LuaGetfieldLong( L, "First", &ship->Rooms.First );
      LuaGetfieldLong( L, "Last", &ship->Rooms.Last );
      LuaGetfieldLong( L, "Cockpit", &ship->Rooms.Cockpit );
      LuaGetfieldLong( L, "Entrance", &ship->Rooms.Entrance );
      LuaGetfieldLong( L, "Hangar", &ship->Rooms.Hangar );
      LuaGetfieldLong( L, "Engine", &ship->Rooms.Engine );
      LuaGetfieldLong( L, "Navseat", &ship->Rooms.Navseat );
      LuaGetfieldLong( L, "Pilotseat", &ship->Rooms.Pilotseat );
      LuaGetfieldLong( L, "Coseat", &ship->Rooms.Coseat );
      LuaGetfieldLong( L, "Gunseat", &ship->Rooms.Gunseat );
    }

  lua_pop( L, 1 );
}

static int L_ShipEntry( lua_State *L )
{
  std::shared_ptr<Ship> ship = std::make_shared<Ship>();

  LuaGetfieldString( L, "Name", &ship->Name );
  LuaGetfieldString( L, "PersonalName", &ship->PersonalName );
  LuaGetfieldString( L, "Description", &ship->Description );
  LuaGetfieldString( L, "Owner", &ship->Owner );
  LuaGetfieldString( L, "Pilot", &ship->Pilot );
  LuaGetfieldString( L, "CoPilot", &ship->CoPilot );
  LuaGetfieldString( L, "Class",
                     [ship](const std::string &className)
                     {
                       ship->Class = GetShipClass( className );
                     });
  LuaGetfieldLong( L, "Shipyard", &ship->Shipyard );
  LuaGetfieldLong( L, "Location", &ship->Location );
  LuaGetfieldLong( L, "LastDock", &ship->LastDock );
  LuaGetfieldString( L, "Type",
                     [ship](const std::string typeName)
                     {
                       ship->Type = GetShipType( typeName );
                     });
  LuaGetfieldInt( L, "State", &ship->State );
  LuaGetfieldBool( L, "Alarm", &ship->Alarm );
  LuaGetfieldInt( L, "DockingPorts", &ship->DockingPorts );
  LuaGetfieldBool( L, "Guard", &ship->Guard );
  LuaGetfieldString( L, "Home", &ship->Home );

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

static void ReadyShipAfterLoad( std::shared_ptr<Ship> ship )
{
  std::shared_ptr<Clan> clan;
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

std::shared_ptr<ShipRepository> NewShipRepository()
{
  return std::make_shared<LuaShipRepository>();
}

std::string GetShipFilename( std::shared_ptr<Ship> ship )
{
  std::string buffer;
  std::string fullName;

  if( ship->PersonalName.empty()
      || !StrCmp( ship->Name, ship->PersonalName ) )
    {
      fullName = FormatString( "%s", ship->Name.c_str() );
    }
  else
    {
      fullName = FormatString( "%s %s", ship->Name.c_str(), ship->PersonalName.c_str() );
    }

  buffer = FormatString( "%s%s", SHIP_DIR, ConvertToLuaFilename( fullName ).c_str() );

  return buffer;
}
