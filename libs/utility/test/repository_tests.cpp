#include <memory>
#include <string>
#include <list>
#include <vector>
#include <array>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/repository.hpp>
#include <numeric>

class IntRepository : public Ceris::Repository<int>
{

};

class RepositoryTests : public ::testing::Test
{
protected:
  void SetUp() override
  {

  }

  void TearDown() override
  {

  }
};

TEST_F(RepositoryTests, WorksWithRangedLoop)
{
  // Arrange
  const std::list<int> original { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
  IntRepository repo;
  int dummy = 0;
  
  for(int i : original)
    {
      repo.Add(i);
    }
  
  // Act
  for(int i : repo)
    {
      dummy = i;
    }

  // Assert
  EXPECT_NE(dummy, 0);
}
