#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>

class MiscTests : public ::testing::Test
{
protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }
};

TEST_F(MiscTests, umin)
{
  EXPECT_EQ(4, umin(4, 6));
  EXPECT_EQ(-6, umin(-4, -6));
  EXPECT_EQ(4, umin(6, 4));
  EXPECT_EQ(-6, umin(-6, -4));
  EXPECT_EQ(5, umin(5, 5));
}

TEST_F(MiscTests, umax)
{
  EXPECT_EQ(6, umax(4, 6));
  EXPECT_EQ(-4, umax(-4, -6));
  EXPECT_EQ(6, umax(6, 4));
  EXPECT_EQ(-4, umax(-6, -4));
  EXPECT_EQ(5, umax(5, 5));
}

TEST_F(MiscTests, urange)
{
  const int lower_bound = 50;
  const int upper_bound = 100;

  EXPECT_EQ(75, urange(lower_bound, 75, upper_bound));
  EXPECT_EQ(lower_bound, urange(lower_bound, 25, upper_bound));
  EXPECT_EQ(upper_bound, urange(lower_bound, 125, upper_bound));
}
