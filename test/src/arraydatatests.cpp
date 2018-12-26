#include <string>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "mud.hpp"
#include "constants.hpp"
#include "skill.hpp"

class ArrayDataTests : public ::testing::Test
{
public:

protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }

  
};

TEST_F(ArrayDataTests, GetAbilityReturnsMinusOneOnUnknownData)
{
  constexpr int expected = -1;
  const std::string abilityToSearchFor = "does not exist";

  const int actual = GetAbility(abilityToSearchFor);

  EXPECT_EQ(expected, actual);
}

TEST_F(ArrayDataTests, GetAbilityReturnsCorrectIndex)
{
  constexpr int expectedPilotIndex = 1;
  const std::string pilotAbilityName = "piloting";

  const int returnedPilotIndex = GetAbility(pilotAbilityName);

  EXPECT_EQ(expectedPilotIndex, returnedPilotIndex);
}

TEST_F(ArrayDataTests, GetAbilityIsCaseInsensitive)
{
  constexpr int expectedPilotIndex = 1;
  const std::string pilotAbilityName = "PiLoTiNg";

  const int returnedPilotIndex = GetAbility(pilotAbilityName);

  EXPECT_EQ(expectedPilotIndex, returnedPilotIndex);
}

TEST_F(ArrayDataTests, GetAbilityDoesExactMatchOnly)
{
  constexpr int expectedPilotIndex = 1;
  const std::string pilotAbilityName = "pilot";

  const int returnedPilotIndex = GetAbility(pilotAbilityName);

  EXPECT_NE(expectedPilotIndex, returnedPilotIndex);
  EXPECT_EQ(-1, returnedPilotIndex);
}

TEST_F(ArrayDataTests, GetSkillTypeReturnsSpellAs_SKILL_SPELL)
{
  constexpr SkillType expected = SKILL_SPELL;

  const SkillType actual = GetSkillType("spell");

  EXPECT_EQ(expected, actual);
}

TEST_F(ArrayDataTests, GetSkillTypeReturnsForcePowerAs_SKILL_SPELL)
{
  constexpr SkillType expected = SKILL_SPELL;

  const SkillType actual = GetSkillType("force power");

  EXPECT_EQ(expected, actual);
}

TEST_F(ArrayDataTests, GetDirectionReturnsNorthWestAs_DIR_NORTHWEST)
{
  constexpr DirectionType expected = DIR_NORTHWEST;

  const DirectionType actual = GetDirection("northwest");

  EXPECT_EQ((int)expected, (int)actual);
}

TEST_F(ArrayDataTests, GetDirectionReturnsNwAs_DIR_NORTHWEST)
{
  constexpr DirectionType expected = DIR_NORTHWEST;

  const DirectionType actual = GetDirection("nw");

  EXPECT_EQ((int)expected, (int)actual);
}

TEST_F(ArrayDataTests, GetDirectionReturns7As_DIR_NORTHWEST)
{
  constexpr DirectionType expected = DIR_NORTHWEST;

  const DirectionType actual = GetDirection("7");

  EXPECT_EQ((int)expected, (int)actual);
}

TEST_F(ArrayDataTests, GetDirectionReturnsNonExistentDirAs_DIR_INVALID)
{
  constexpr DirectionType expected = DIR_INVALID;

  const DirectionType actual = GetDirection("sdfsdfsdf");

  EXPECT_EQ((int)expected, (int)actual);
}

TEST_F(ArrayDataTests, GetDirectionReturnsQuestionMarkAs_DIR_SOMEWHERE)
{
  constexpr DirectionType expected = DIR_SOMEWHERE;

  const DirectionType actual = GetDirection("?");

  EXPECT_EQ((int)expected, (int)actual);
}
