#include <array>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/datadom.hpp>
#include <lua.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "turret.hpp"

struct FakeStringField : public DataDOM::PrimitiveField
{
  FakeStringField(lua_State *L, const std::string &name, std::string &targetField)
    : PrimitiveField(L, name),
      TargetField(targetField)
  {

  }

  void Write() const override
  {

  }

  void Read() override
  {
    TargetField = "FOO123";
  }

  std::string &TargetField;

protected:
  void AssignFromLuaToField(int) override
  {
    // nothing to do
  }
};

class ContainedByFoo
{
public:
  int SomeData = 0;
  int MoreData = 0;
};

class Foo
{
public:
  std::string SomeStringField;
  int SomeIntegerField = 0;
  double SomeDoubleField = 0.0;
  bool SomeBooleanField = false;
  unsigned long Flags = 0;
  std::list<ContainedByFoo> SubObjects;
};

class DataDOMTests : public ::testing::Test
{
protected:
  void SetUp() override
  {
    MyFoo = new Foo
      {
      SomeStringField: "My foo",
      SomeIntegerField: 123,
      SomeDoubleField: 3.14,
      SomeBooleanField: true,
      Flags: 1 << 0 | 1 << 13,
      SubObjects: { {1, 2}, {2, 3}, {3, 4}, {4, 5} }
      };
  }

  void TearDown() override
  {

  }

  Foo *MyFoo = nullptr;
  const std::array<const char * const, 32> FlagNameArray = { "Flag0", "Flag1", "Flag2", "Flag3", "Flag4", "Flag5", "Flag6", "Flag7", "Flag8", "Flag9", "Flag10", "Flag11", "Flag12", "Flag13", "Flag14", "Flag15", "Flag16", "Flag17", "Flag18", "Flag19", "Flag20", "Flag21", "Flag22", "Flag23", "Flag24", "Flag25", "Flag26", "Flag27", "Flag28", "Flag29", "Flag30", "Flag31" };
};

TEST_F(DataDOMTests, CreatingFieldObjectCompiles)
{
  Foo myFoo;
  lua_State *L = luaL_newstate();
  std::shared_ptr<DataDOM::Data> data = std::make_shared<DataDOM::StringField>(L, "SomeStringField", myFoo.SomeStringField);

  EXPECT_NE(nullptr, data);
  lua_close(L);
}

TEST_F(DataDOMTests, TargetFieldCanBeModified)
{
  // Arrange
  Foo myFoo;
  lua_State *L = luaL_newstate();
  std::shared_ptr<DataDOM::Data> data = std::make_shared<FakeStringField>(L, "SomeStringField", myFoo.SomeStringField);

  // Act
  data->Read();

  // Assert
  EXPECT_EQ("FOO123", myFoo.SomeStringField);
  lua_close(L);
}

TEST_F(DataDOMTests, PushData)
{
  DataDOM::ReadWriteDocument doc("foo", "foo.lua");
  doc.AddString("SomeStringField", MyFoo->SomeStringField);
  doc.AddInteger("SomeIntegerField", MyFoo->SomeIntegerField);
  doc.AddDouble("SomeDoubleField", MyFoo->SomeDoubleField);
  doc.AddBoolean("SomeBooleanField", MyFoo->SomeBooleanField);
  doc.AddFlags("Flags", MyFoo->Flags, FlagNameArray);

  DataDOM::Table *subObjects = doc.AddTable("SubObjects");
  int counter = 0;

  for(ContainedByFoo &contained : MyFoo->SubObjects)
    {
      DataDOM::Table *oneObject = subObjects->AddTable(counter++);
      oneObject->AddInteger("SomeData", contained.SomeData);
      oneObject->AddInteger("MoreData", contained.MoreData);
    }

  doc.Write();
}

static void AddBasicData(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  container->AddCString("Name", ship->Name);
  container->AddCString("PersonalName", ship->PersonalName);
  container->AddCString("Owner", ship->Owner);
  container->AddCString("Pilot", ship->Pilot);
  container->AddCString("CoPilot", ship->CoPilot);
  container->AddCString("Class", ShipClasses[ship->Class]);
  container->AddInteger("Shipyard", ship->Shipyard);
  container->AddInteger("Location", ship->Location);
  container->AddInteger("LastDock", ship->LastDock);
  container->AddCString("Type", ShipTypes[ship->Type]);
  container->AddInteger("State", ship->State);
  container->AddBoolean("Alarm", ship->Alarm);
  container->AddInteger("DockingPorts", ship->DockingPorts);
  container->AddBoolean("Guard", ship->Guard);
  container->AddCString("Home", ship->Home);
}

static void AddPosition(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto positionTable = container->AddTable("Position");
  positionTable->AddDouble("X", ship->Position.x);
  positionTable->AddDouble("Y", ship->Position.y);
  positionTable->AddDouble("Z", ship->Position.z);
}

static void AddInstruments(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto instruments = container->AddTable("Instruments");
  instruments->AddInteger("AstroArray", ship->Instruments.AstroArray);
  instruments->AddInteger("Comm", ship->Instruments.Comm);
  instruments->AddInteger("Sensor", ship->Instruments.Sensor);
}

static void AddThrusters(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto thrusters = container->AddTable("Thrusters");
  thrusters->AddInteger("Maneuver", ship->Thrusters.Maneuver);
  DataDOM::AddCurrentAndMax(thrusters, "Speed", ship->Thrusters.Speed);
  DataDOM::AddCurrentAndMax(thrusters, "Energy", ship->Thrusters.Energy);
}

static void AddHyperdrive(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto hyperdrive = container->AddTable("Hyperdrive");
  hyperdrive->AddInteger("Speed", ship->Hyperdrive.Speed);
}

static void AddTube(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto tube = container->AddTable("Tube");
  tube->AddInteger("State", ship->WeaponSystems.Tube.State);
  DataDOM::AddCurrentAndMax(tube, "Missiles", ship->WeaponSystems.Tube.Missiles);
  DataDOM::AddCurrentAndMax(tube, "Torpedoes", ship->WeaponSystems.Tube.Torpedoes);
  DataDOM::AddCurrentAndMax(tube, "Rockets",  ship->WeaponSystems.Tube.Rockets);
}

static void AddLaser(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto laser = container->AddTable("Laser");
  laser->AddInteger("Count", ship->WeaponSystems.Laser.Count);
  laser->AddInteger("State", ship->WeaponSystems.Laser.State);
}

static void AddIonCannon(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto ionCannon = container->AddTable("IonCannon");
  ionCannon->AddInteger("Count", ship->WeaponSystems.IonCannon.Count);
  ionCannon->AddInteger("State", ship->WeaponSystems.IonCannon.State);
}

static void AddTractorBeam(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto tractorBeam = container->AddTable("TractorBeam");
  tractorBeam->AddInteger("Strength", ship->WeaponSystems.TractorBeam.Strength);
  tractorBeam->AddInteger("State", ship->WeaponSystems.TractorBeam.State);
}

static void AddTurrets(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto turrets = container->AddTable("Turrets");

  for(size_t i = 0; i < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++i)
    {
      const Turret *physicalTurret = ship->WeaponSystems.Turrets[i];
      auto oneTurret = turrets->AddTable(i);
      oneTurret->AddInteger("RoomVnum", GetTurretRoom(physicalTurret));
      oneTurret->AddInteger("State", IsTurretDamaged(physicalTurret) ? LASER_DAMAGED : LASER_READY);
    }
}

static void AddWeaponSystems(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto ws = container->AddTable("WeaponSystems");
  AddTube(ws, ship);
  AddLaser(ws, ship);
  AddIonCannon(ws, ship);
  AddTractorBeam(ws, ship);
  AddTurrets(ws, ship);
}

static void AddDefenses(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto defenses = container->AddTable("Defenses");
  DataDOM::AddCurrentAndMax(defenses, "Hull", ship->Defenses.Hull);
  DataDOM::AddCurrentAndMax(defenses, "Shield", ship->Defenses.Shield);
  DataDOM::AddCurrentAndMax(defenses, "Chaff", ship->Defenses.Chaff);
}

static void AddRooms(DataDOM::WriteOnlyContainer *container, const Ship *ship)
{
  auto table = container->AddTable("Rooms");
  const auto &rooms = ship->Rooms;
  table->AddInteger("First", rooms.First);
  table->AddInteger("Last", rooms.Last);
  table->AddInteger("Cockpit", rooms.Cockpit);
  table->AddInteger("Entrance", rooms.Entrance);
  table->AddInteger("Hangar", rooms.Hangar);
  table->AddInteger("Engine", rooms.Engine);
  table->AddInteger("Navseat", rooms.Navseat);
  table->AddInteger("Pilotseat", rooms.Pilotseat);
  table->AddInteger("Coseat", rooms.Coseat);
  table->AddInteger("Gunseat", rooms.Gunseat);
}

static void AddShipToDocument(DataDOM::WriteOnlyDocument *doc, const Ship *ship)
{
  AddBasicData(doc, ship);
  AddPosition(doc, ship);
  AddInstruments(doc, ship);
  AddThrusters(doc, ship);
  AddHyperdrive(doc, ship);
  AddWeaponSystems(doc, ship);
  AddDefenses(doc, ship);
  AddRooms(doc, ship);
}

static Ship *CreateShip()
{
  Ship *ship = new Ship();
  ship->Name = CopyString("X-Wing");
  ship->PersonalName = CopyString("Betsy");
  ship->Description = CopyString("It's a ship-> An X-Wing, even. Not much else to say.");
  ship->Owner = CopyString("Kai");
  ship->Position.x = 1;
  ship->Position.y = 2;
  ship->Position.z = 3;
  ship->Thrusters.Maneuver = 100;
  ship->Thrusters.Speed.Current = 0;
  ship->Thrusters.Speed.Max = 115;
  ship->Thrusters.Energy.Current = 750;
  ship->Thrusters.Energy.Max = 1000;

  return ship;
}

TEST_F(DataDOMTests, WriteShip)
{
  const Ship *ship = CreateShip();
  DataDOM::WriteOnlyDocument doc("ship", GetShipFilename(ship));
  AddShipToDocument(&doc, ship);

  doc.Write();
}
