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
    const std::list<int> original{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
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

struct MyStruct
{
    int Dummy = 0;
};

struct CompareMyStruct
{
    bool operator()(const std::shared_ptr<MyStruct> &lhv,
                    const std::shared_ptr<MyStruct> &rhv) const
    {
        return lhv->Dummy < rhv->Dummy;
    }
};

using MyStructRepoBase = Ceris::Repository<std::shared_ptr<MyStruct>, CompareMyStruct>;

class MyStructRepo : public MyStructRepoBase
{

};

TEST_F(RepositoryTests, BeginAndEndWorkWhenRepoStoredInSharedPtr)
{
    // Arrange
    std::shared_ptr<MyStructRepo> repo = std::make_shared<MyStructRepo>();

    // Act/assert (the fact that it compiles is considered success).
    for(std::shared_ptr<MyStruct> myObj : repo)
    {
        ++myObj->Dummy;
    }
}
