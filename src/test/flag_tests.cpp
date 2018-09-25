// The tests in this file serves the purpose of making sure behavior
// is preserved when moving from int based flags to bitset flags.
#include <string>
#include <bitset>
#include <cstddef>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>
#include "constants.hpp"

namespace Flags
{
  enum TestFlag : size_t
    {
     Bit00, Bit01, Bit02, Bit03, Bit04, Bit05, Bit06, Bit07,
     Bit08, Bit09, Bit10, Bit11, Bit12, Bit13, Bit14, Bit15,
     Bit16, Bit17, Bit18, Bit19, Bit20, Bit21, Bit22, Bit23,
     Bit24, Bit25, Bit26, Bit27, Bit28, Bit29, Bit30, Bit31
    };

  const size_t MAX = 32;
}

class FlagTests : public ::testing::Test
{
protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }
};

TEST_F(FlagTests, NoBits_Diku_And_ulong_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  EXPECT_EQ(bs.to_ulong(), dikuFlags);
};

TEST_F(FlagTests, NoBits_IsBitSet_And_test_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  EXPECT_EQ( bs.test( Flags::Bit00 ), IsBitSet( dikuFlags, BV00 ) );
};

TEST_F(FlagTests, ThreeBits_Diku_And_ulong_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  bs.set( Flags::Bit00 );
  bs.set( Flags::Bit15 );
  bs.set( Flags::Bit31 );

  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );
  
  EXPECT_EQ( bs.to_ulong(), static_cast<unsigned int>( dikuFlags ) );
};

TEST_F(FlagTests, ThreeBits_IsBitSet_And_test_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  bs.set( Flags::Bit00 );
  bs.set( Flags::Bit15 );
  bs.set( Flags::Bit31 );

  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );
  
  bool dikuValue = IsBitSet( dikuFlags, BV00 )
    && IsBitSet( dikuFlags, BV15 )
    && IsBitSet( dikuFlags, BV31 );
  bool bitsetValue = bs.test( Flags::Bit00 )
    && bs.test( Flags::Bit15 )
    && bs.test( Flags::Bit31 );

  EXPECT_EQ( bitsetValue, dikuValue );
};

TEST_F(FlagTests, RemoveOneBit_IsBitSet_And_test_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  bs.set( Flags::Bit00 );
  bs.set( Flags::Bit15 );
  bs.set( Flags::Bit31 );
  bs.reset( Flags::Bit00 );
  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );
  RemoveBit( dikuFlags, BV00 );
  
  bool dikuValue = IsBitSet( dikuFlags, BV15 )
    && IsBitSet( dikuFlags, BV31 );
  bool bitsetValue = bs.test( Flags::Bit15 )
    && bs.test( Flags::Bit31 );

  EXPECT_EQ( bitsetValue, dikuValue );
};

TEST_F(FlagTests, ToggleOneBit_IsBitSet_And_test_HasSameValue)
{
  std::bitset<Flags::MAX> bs;
  int dikuFlags = 0;

  bs.set( Flags::Bit00 );
  bs.set( Flags::Bit15 );
  bs.set( Flags::Bit31 );
  bs.flip( Flags::Bit00 );
  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );
  ToggleBit( dikuFlags, BV00 );

  bool dikuValue = IsBitSet( dikuFlags, BV15 )
    && IsBitSet( dikuFlags, BV31 );
  bool bitsetValue = bs.test( Flags::Bit15 )
    && bs.test( Flags::Bit31 );

  EXPECT_EQ( bitsetValue, dikuValue );
};

TEST_F(FlagTests, ulong_ctor_GivesSameResultAsOriginal_Diku)
{
  int dikuFlags = 0;
  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );

  std::bitset<Flags::MAX> bs( dikuFlags );
  
  EXPECT_TRUE( bs.test( Flags::Bit00 ) && bs.test( Flags::Bit15 ) && bs.test( Flags::Bit31 ) );
};

TEST_F(FlagTests, ulong_CopyAssignmentOperator_GivesSameResultAsOriginal_Diku)
{
  int dikuFlags = 0;
  SetBit( dikuFlags, BV00 );
  SetBit( dikuFlags, BV15 );
  SetBit( dikuFlags, BV31 );

  std::bitset<Flags::MAX> bs = dikuFlags;

  EXPECT_TRUE( bs.test( Flags::Bit00 ) && bs.test( Flags::Bit15 ) && bs.test( Flags::Bit31 ) );
};
