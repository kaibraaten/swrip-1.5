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

TEST_F(MiscTests, FlagString)
{
  std::vector<const char*> flagNames;

  for(int i = 0; i < 32; ++i)
    {
      char *name = CopyString(std::to_string(i));
      flagNames.push_back(name);
    }

  unsigned long bitvector = 1 << 4 | 1 << 7 | 1 << 23;
  const std::string expected = "4 7 23";

  const std::string actual = FlagString(bitvector, &flagNames[0]);

  EXPECT_EQ(expected, actual);

  for(const char *name : flagNames)
    {
      char *nonConst = const_cast<char*>(name);
      FreeMemory(nonConst);
    }
}

TEST_F(MiscTests, StripColorCodes_StripsForeground)
{
  char *input = "&WYo &gman!&G";
  const std::string expected = "Yo man!";

  const std::string actual = StripColorCodes(input);

  EXPECT_EQ(expected, actual);
}

TEST_F(MiscTests, StripColorCodes_StripsBackground)
{
  char *input = "^WYo ^xman!^G";
  const std::string expected = "Yo man!";

  const std::string actual = StripColorCodes(input);

  EXPECT_EQ(expected, actual);
}

TEST_F(MiscTests, StripColorCodes_StripsMixOfForeAndBackground)
{
  char *input = "^WYo ^xma&Bn!^G";
  const std::string expected = "Yo man!";

  const std::string actual = StripColorCodes(input);

  EXPECT_EQ(expected, actual);
}

TEST_F(MiscTests, PunctuateNumber)
{
  EXPECT_EQ("5", PunctuateNumber(5));
  EXPECT_EQ("50", PunctuateNumber(50));
  EXPECT_EQ("500", PunctuateNumber(500));
  EXPECT_EQ("5,000", PunctuateNumber(5000));
  EXPECT_EQ("2,000,000,000", PunctuateNumber(2000000000));
  EXPECT_EQ("-5", PunctuateNumber(-5));
  EXPECT_EQ("-5,000", PunctuateNumber(-5000));
}
