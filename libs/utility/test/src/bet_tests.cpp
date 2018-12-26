#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/utility.hpp>

class BetTests : public ::testing::Test
{
protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }
};

TEST_F(BetTests, AbsoluteBet_PlainNumber)
{
  const int expected = 10000;
  const std::string expression = std::to_string(expected);

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_currentbet_HasNoEffect)
{
  const std::string expression = "10000";

  int resultWith_currentbet = ParseBet(1234, expression);
  int resultWithout_currentbet = ParseBet(0, expression);

  EXPECT_EQ(resultWith_currentbet, resultWithout_currentbet);
}

TEST_F(BetTests, AbsoluteBet_AcceptsKiloNotation)
{
  const int expected = 10000;
  const std::string expression = "10k";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_AcceptsDetailedKiloNotation)
{
  const int expected = 10250;
  const std::string expression = "10k250";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_KiloNotationIsCaseInsensitive)
{
  const std::string lowerCase = "10k250";
  const std::string upperCase = "10K250";

  EXPECT_EQ(ParseBet(0, lowerCase), ParseBet(0, upperCase));
}

TEST_F(BetTests, AbsoluteBet_AcceptsMegaNotation)
{
  const int expected = 10000000;
  const std::string expression = "10M";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_AcceptsDetailedMegaNotation)
{
  const int expected = 10250000;
  const std::string expression = "10M250";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_MegaNotationIsCaseInsensitive)
{
  const std::string lowerCase = "10m250";
  const std::string upperCase = "10M250";

  EXPECT_EQ(ParseBet(0, lowerCase), ParseBet(0, upperCase));
}

TEST_F(BetTests, AbsoluteBet_InvalidArgumentReturnsZero)
{
  const int expected = 0;
  const std::string expression = "10F250";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, AbsoluteBet_ExtraDigitsAreDiscarded)
{
  const int expected = 10250000;
  const std::string expression = "10M2500001234";

  int actual = ParseBet(0, expression);

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_EmptyExpressionReturnsZero)
{
  const int expected = 0;
  const int currentbet = 1000;

  int actual = ParseBet(currentbet, "");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_PlusAdds25Percent)
{
  const int expected = 1250;
  const int currentbet = 1000;

  int actual = ParseBet(currentbet, "+");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_SpecifiedPlusAddsCorrectPercent)
{
  const int expected = 1050;
  const int currentbet = 1000;

  int actual = ParseBet(currentbet, "+5");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_FractionalPartOfPercentIsDiscarded)
{
  const int expected = 1050;
  const int currentbet = 1000;

  int actual = ParseBet(currentbet, "+5.9");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_MinusReturnsZero)
{
  const int expected = 0;
  const int currentbet = 1000;

  int actual = ParseBet(currentbet, "-50");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_MultiplierDefaultTo2)
{
  const int currentbet = 1000;
  const int expected = currentbet * 2;
  
  int actual = ParseBet(currentbet, "*");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_MultiplierBothAsteriskAndXAreAccepted)
{
  const int currentbet = 1000;

  int asteriskActual = ParseBet(currentbet, "*");
  int xActual = ParseBet(currentbet, "x");
  
  EXPECT_EQ(asteriskActual, xActual);
}

TEST_F(BetTests, RelativeBet_xIsCaseInsensitive)
{
  const int currentbet = 1000;

  int lowerActual = ParseBet(currentbet, "x");
  int upperActual = ParseBet(currentbet, "X");

  EXPECT_EQ(lowerActual, upperActual);
}

TEST_F(BetTests, RelativeBet_MultiplierGivesCorrectResult)
{
  const int currentbet = 1000;
  const int expected = currentbet * 5;

  int actual = ParseBet(currentbet, "*5");

  EXPECT_EQ(expected, actual);
}

TEST_F(BetTests, RelativeBet_MultiplierFractionalPartIsDiscarded)
{
  const int currentbet = 1000;
  const int expected = currentbet * 5;

  int actual = ParseBet(currentbet, "*5.9");

  EXPECT_EQ(expected, actual);
}
