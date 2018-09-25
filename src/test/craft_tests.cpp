#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "protoobject.hpp"
#include "descriptor.hpp"
#include "room.hpp"
#include "craft.hpp"
#include "log.hpp"
#include "fakelogger.hpp"

class CraftTests : public ::testing::Test
{
protected:
  void SetUp() override
  {
    Log = new FakeLogger();
    _engineer = new Character( new PCData(), new NullDescriptor() );
  }

  void TearDown() override
  {
    delete _engineer->Desc;
    delete _engineer;
    _engineer = nullptr;

    delete Log;
    Log = nullptr;
  }

  Character *_engineer = nullptr;
};

static void Counting_InterpretArgumentsHandler( void *userData, InterpretArgumentsEventArgs *e )
{
  int *callCounter = static_cast<int*>( userData );
  ++(*callCounter);
}

TEST_F(CraftTests, InterpretArgumentsHandler_IsCalledExactlyOnce)
{
  int callCounter = 0;
  const CraftingMaterial material;
  CraftRecipe *recipe = AllocateCraftRecipe( 0, &material, 0, nullptr, {} );
  CraftingSession *session = AllocateCraftingSession( recipe, _engineer, "" );
  AddInterpretArgumentsCraftingHandler( session, &callCounter,
                                        Counting_InterpretArgumentsHandler );

  StartCrafting( session );

  EXPECT_EQ( callCounter, 1 );
}
