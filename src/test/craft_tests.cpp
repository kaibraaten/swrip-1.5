#include <string>
#include <vector>
#include <cassert>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "object.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "protoobject.hpp"
#include "descriptor.hpp"
#include "room.hpp"
#include "craft.hpp"
#include "log.hpp"
#include "fakelogger.hpp"
#include "area.hpp"
#include "repos/objectrepository.hpp"
#include "repos/skillrepository.hpp"
#include "skill.hpp"

constexpr short gsn_mycraftingskill = 0;

static void CleanupCharacter( Character *ch )
{
  Timer *timer = GetTimerPointer( ch, TIMER_CMD_FUN );

  if( timer != nullptr )
    {
      ExtractTimer( ch, timer );
    }

  while( !ch->Objects().empty() )
    {
      Object *obj = ch->Objects().front();
      ObjectFromCharacter( obj );
      delete obj;
    }

  if( IsCrafting( ch ) )
    {
      FreeCraftingSession( ch->PCData->CraftingSession );
    }
}

class NotRandomGenerator : public RandomGenerator
{
public:
  long GetRandomNumber( long min, long max ) override
  {
    return (min + max) / 2;
  }

  long GetRandomPercent() override
  {
    return 50;
  }

  long RollDice( size_t numberOfDice, size_t numberOfSides ) override
  {
    return numberOfDice * numberOfSides;
  }
};

class FakeObjectRepository : public ObjectRepository
{

};

class FakeSkillRepository : public SkillRepository
{
public:
  FakeSkillRepository()
  {
    _myCraftingSkill.UseRec = new timerset();
    _myCraftingSkill.Name = "makesomething";
    SkillTable[gsn_mycraftingskill] = &_myCraftingSkill;
  }

  ~FakeSkillRepository()
  {
    delete _myCraftingSkill.UseRec;
    SkillTable[gsn_mycraftingskill] = nullptr;
  }
  
  Skill *GetSkill( int sn ) override
  {
    return sn == gsn_mycraftingskill ? &_myCraftingSkill : nullptr;
  }

  int LookupSkill( const std::string &name ) override
  {
    return !StrCmp( name, _myCraftingSkill.Name ) ? gsn_mycraftingskill : -1;
  }
  
private:
  Skill _myCraftingSkill;
};

class CraftTests : public ::testing::Test
{  
protected:
  void SetUp() override
  {
    Log = new FakeLogger();
    Objects = new FakeObjectRepository();
    Skills = new FakeSkillRepository();
    
    SetRandomGenerator( new NotRandomGenerator() );
    
    _resultantObject = new ProtoObject( 1 );
    _resultantObject->Name = "crafted thingy";

    _location = new Room();
    _area = new Area();
    _location->Area = _area;
    SetBit( _location->Flags, ROOM_FACTORY );
    SetBit( _location->Flags, ROOM_REFINERY );
    
    _engineer = new Character( new PCData(), new NullDescriptor() );
    _engineer->PCData->Learned[gsn_mycraftingskill] = 100;

    CharacterToRoom( _engineer, _location );
  }

  void TearDown() override
  {
    CleanupCharacter( _engineer );
    delete _engineer->Desc;
    delete _engineer;
    _engineer = nullptr;

    delete _resultantObject;
    _resultantObject = nullptr;

    delete _location;
    _location = nullptr;

    delete _area;
    _area = nullptr;

    delete Skills;
    Skills = nullptr;
    
    delete Objects;
    Objects = nullptr;
    
    delete Log;
    Log = nullptr;
  }

  std::list<Object*> MakeMaterials() const
  {
    std::list<Object*> output;
    
    for( const auto &m : _materials )
      {
        if( m.ItemType == ITEM_NONE )
          {
            continue;
          }
        
        ProtoObject *proto = new ProtoObject( GetNewVnum() );
        proto->ItemType = m.ItemType;
        Object *obj = AllocateObject( proto, 100 );
        output.push_back( obj );

        assert( obj->ItemType == obj->Prototype->ItemType );
      }

    return output;
  }

  vnum_t GetNewVnum() const
  {
    return ++_lastVnum;
  }
  
  Character *_engineer = nullptr;
  ProtoObject *_resultantObject = nullptr;
  Room *_location = nullptr;
  Area *_area = nullptr;
  static const std::vector<CraftingMaterial> _materials;
  static vnum_t _lastVnum;
};

vnum_t CraftTests::_lastVnum = INVALID_VNUM;

const std::vector<CraftingMaterial> CraftTests::_materials =
  {
   { ITEM_TOOLKIT,        {} },
   { ITEM_OVEN,           {} },
   { ITEM_LENS,           { Flag::Crafting::Extract } },
   { ITEM_CRYSTAL,        { Flag::Crafting::Extract } },
   { ITEM_MIRROR,         { Flag::Crafting::Extract } },
   { ITEM_DURAPLAST,      { Flag::Crafting::Extract } },
   { ITEM_BATTERY,        { Flag::Crafting::Extract } },
   { ITEM_CIRCUIT,        { Flag::Crafting::Extract } },
   { ITEM_SUPERCONDUCTOR, { Flag::Crafting::Extract } },
   { ITEM_NONE,           {} }
  };

template<typename EventArgs>
static void Counting_EventHandler( void *userData, EventArgs *e )
{
  int *callCounter = static_cast<int*>( userData );
  ++(*callCounter);
}

TEST_F(CraftTests, InterpretArgumentsHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddInterpretArgumentsCraftingHandler( session, &callCounter,
                                        Counting_EventHandler );

  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}

TEST_F(CraftTests, CheckRequirementsHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddCheckRequirementsCraftingHandler( session, &callCounter,
                                       Counting_EventHandler );

  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}

template<typename EventArgs>
static void Failing_EventHandler( void *userData, EventArgs *e )
{
  e->AbortSession = true;
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Fails_SessionNotStarted)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddInterpretArgumentsCraftingHandler( session, nullptr,
                                        Failing_EventHandler );

  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, When_CheckRequirementsHandler_Fails_SessionNotStarted)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddCheckRequirementsCraftingHandler( session, nullptr,
                                       Failing_EventHandler );

  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

template<typename EventArgs>
static void DoNothing_EventHandler( void *userData, EventArgs *e )
{
  // Intentionally empty
}

TEST_F(CraftTests, When_CheckArgumentsHandler_Succeeds_SessionIsStarted)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddCheckRequirementsCraftingHandler( session, nullptr,
                                       DoNothing_EventHandler );

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Succeeds_SessionIsStarted)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddInterpretArgumentsCraftingHandler( session, nullptr,
                                        DoNothing_EventHandler );

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenUnskilled_SessionNotStarted)
{
  const CraftingMaterial material;
  _engineer->PCData->Learned[gsn_mycraftingskill] = 0;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenSkilled_SessionIsStarted)
{
  const CraftingMaterial material;
  _engineer->PCData->Learned[gsn_mycraftingskill] = 100;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenUnskilled_AbortCraftingHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  _engineer->PCData->Learned[gsn_mycraftingskill] = 0;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddAbortCraftingHandler( session, &callCounter,
                           Counting_EventHandler );

  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}

TEST_F(CraftTests, When_InterpretArgumentsHandler_Fails_AbortCraftingHandler_IsCalledExactlyOnce)
{
  const CraftingMaterial material;
  int callCounter = 0;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddInterpretArgumentsCraftingHandler( session, nullptr,
                                        Failing_EventHandler );
  AddAbortCraftingHandler( session, &callCounter,
                           Counting_EventHandler );
  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}

TEST_F(CraftTests, When_CheckRequirementsHandler_Fails_AbortCraftingHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddCheckRequirementsCraftingHandler( session, nullptr,
                                       Failing_EventHandler );
  AddAbortCraftingHandler( session, &callCounter,
                           Counting_EventHandler );

  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}

TEST_F(CraftTests, WhenMissingAllMaterials_SessionNotStarted)
{
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, _materials.data(), 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenMissingSomeMaterials_SessionNotStarted)
{
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, _materials.data(), 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  auto objects = MakeMaterials();
  int i = 0;
  for( Object *obj : objects )
    {
      if( ++i % 2 == 0 )
        {
          ObjectToCharacter( obj, _engineer );
        }
    }
  
  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenHasAllMaterials_SessionIsStarted)
{
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, _materials.data(), 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  auto objects = MakeMaterials();
  
  for( Object *obj : objects )
    {
      ObjectToCharacter( obj, _engineer );
    }

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenMissingOptionalMaterials_SessionIsStarted)
{
  auto materials = _materials;

  int i = 0;
  for( auto m : materials )
    {
      if( i % 2 == 0 )
        {
          m.Flags.reset( Flag::Crafting::Optional );
        }
    }
  
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, materials.data(), 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );

  auto objects = MakeMaterials();

  for( Object *obj : objects )
    {
      if( find_if( std::begin(materials), std::end(materials),
                   [obj](const auto m)
                   {
                     return m.Flags.test( Flag::Crafting::Optional )
                       && m.ItemType == obj->ItemType;
                   }) == std::end(materials))
        {
          ObjectToCharacter( obj, _engineer );
        }
    }

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenWorkshopRequired_IfNotInWorkshop_SessionNotStarted)
{
  const CraftingMaterial material;

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, { Flag::Crafting::NeedsWorkshop } );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  RemoveBit( _engineer->InRoom->Flags, ROOM_FACTORY );
  
  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenWorkshopRequired_IfInWorkshop_SessionIsStarted)
{
  const CraftingMaterial material;

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, { Flag::Crafting::NeedsWorkshop } );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  SetBit( _engineer->InRoom->Flags, ROOM_FACTORY );

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenRefineryRequired_IfNotInRefinery_SessionNotStarted)
{
  const CraftingMaterial material;

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, { Flag::Crafting::NeedsRefinery } );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  RemoveBit( _engineer->InRoom->Flags, ROOM_REFINERY );

  StartCrafting( session );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, WhenRefineryRequired_IfInRefinery_SessionIsStarted)
{
  const CraftingMaterial material;

  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, { Flag::Crafting::NeedsRefinery } );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  SetBit( _engineer->InRoom->Flags, ROOM_REFINERY );

  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, AfterStartCrafting_CharacterHas_DoFunTimer)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  StartCrafting( session );

  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );

  EXPECT_NE( timer, nullptr );
}

TEST_F(CraftTests, AfterStartCrafting_CharacterHas_Correct_DoFunTimer)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  StartCrafting( session );

  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );

  EXPECT_EQ( timer->DoFun, do_craftingengine );
}

TEST_F(CraftTests, AfterStartCrafting_CharacterIsCrafting)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  StartCrafting( session );

  EXPECT_TRUE( IsCrafting( _engineer ) );
}

TEST_F(CraftTests, AfterCallback_CharacterNoLongerCrafting)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  StartCrafting( session );
  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );
  _engineer->SubState = timer->Value;
  
  timer->DoFun( _engineer, "" );

  EXPECT_FALSE( IsCrafting( _engineer ) );
}

static bool HasObjectInstanceOf( const Character *ch, const ProtoObject *proto )
{
  return Find( ch->Objects(),
               [proto](const auto obj)
               {
                 return obj->Prototype == proto;
               });
}

TEST_F(CraftTests, AfterCallback_CharacterReceivedObject)
{
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  StartCrafting( session );
  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );
  _engineer->SubState = timer->Value;

  timer->DoFun( _engineer, "" );

  EXPECT_TRUE( HasObjectInstanceOf( _engineer, _resultantObject ) );
}

TEST_F(CraftTests, AfterCallback_SetObjectStatsEventHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddSetObjectStatsCraftingHandler( session, &callCounter, Counting_EventHandler );
  StartCrafting( session );
  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );
  _engineer->SubState = timer->Value;

  timer->DoFun( _engineer, "" );

  EXPECT_EQ( callCounter, 1 );
}

TEST_F(CraftTests, AfterCallback_FinishedCraftingEventHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( gsn_mycraftingskill, &material, 0,
                                             _resultantObject, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddFinishedCraftingHandler( session, &callCounter, Counting_EventHandler );
  StartCrafting( session );
  Timer *timer = GetTimerPointer( _engineer, TIMER_CMD_FUN );
  _engineer->SubState = timer->Value;

  timer->DoFun( _engineer, "" );

  EXPECT_EQ( callCounter, 1 );
}
