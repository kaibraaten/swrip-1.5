#include <string>
#include <list>
#include <vector>
#include <array>
#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <utility/algorithms.hpp>
#include <numeric>

class Person
{
public:
    std::string Name;
    int Age = 0;
};

class AlgorithmsTests : public ::testing::Test
{
protected:
    void SetUp() override
    {
        static const std::array<std::pair<std::string, int>, 4> data
        {
            std::make_pair("Kai", 42),
            { "Sofie", 2 },
            { "Victoria", 25 },
            { "Emma", 28 }
        };

        for(auto item : data)
        {
            Person *person = new Person{ item.first, item.second };
            People.push_back(person);
        }
    }

    void TearDown() override
    {
        for(Person *person : People)
        {
            delete person;
        }

        People.clear();
    }

    std::list<Person *> People;
};

struct EveryOther
{
    template<typename T>
    bool operator()(const T &unused) const
    {
        return ++_counter % 2 == 0;
    }

private:
    mutable int _counter = 0;
};

TEST_F(AlgorithmsTests, Filter_WorksWithList)
{
    std::list original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
    std::list reduced = Filter(original, EveryOther());

    EXPECT_EQ(reduced.size(), original.size() / 2);
}

TEST_F(AlgorithmsTests, Filter_WorksWithVector)
{
    std::vector original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
    std::vector reduced = Filter(original, EveryOther());

    EXPECT_EQ(reduced.size(), original.size() / 2);
}

TEST_F(AlgorithmsTests, Filter_WorksWithLambda)
{
    std::list original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
    size_t counter = 0;
    std::list reduced = Filter(original,
                               [&counter](auto)
                               {
                                   return ++counter % 2 == 0;
                               });

    EXPECT_EQ(reduced.size(), original.size() / 2);
}

static bool DoesNotContainA(const char *txt)
{
    std::string foo(txt);

    return foo.find('a') == std::string::npos && foo.find('A') == std::string::npos;
}

TEST_F(AlgorithmsTests, Filter_WorksWithFunctionPointer)
{
    std::list original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

    std::list reduced = Filter(original, DoesNotContainA);

    EXPECT_EQ(reduced.size(), original.size() - 1);
}

#ifndef DEACTIVATE_FAILING_TESTS
TEST_F(AlgorithmsTests, Reverse_WorksWithList)
{
    const std::list expected{ "fff", "eee", "ddd", "ccc", "bbb", "aaa" };
    const std::list original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

    const std::list actual = Reverse(original);

    EXPECT_EQ(expected, actual);
}

TEST_F(AlgorithmsTests, Reverse_WorksWithVector)
{
    const std::vector expected{ "fff", "eee", "ddd", "ccc", "bbb", "aaa" };
    const std::vector original{ "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

    const std::vector actual = Reverse(original);

    EXPECT_EQ(expected, actual);
}
#endif

TEST_F(AlgorithmsTests, Count)
{
    const int minAge = 25;
    size_t olderThan25 = Count(People, [minAge](const auto p)
                               {
                                   return p->Age > minAge;
                               });

    EXPECT_EQ(2, olderThan25);
}

bool IsCalledEmma(const Person *p)
{
    return p->Name == "Emma";
}

TEST_F(AlgorithmsTests, Find)
{
    Person *emma = Find(People, IsCalledEmma);

    EXPECT_EQ("Emma", emma->Name);
}

TEST_F(AlgorithmsTests, Find_NonExistantReturnsNullptr)
{
    Person *nobody = Find(People, [](const auto p)
                          {
                              return p->Age == 123456;
                          });

    EXPECT_EQ(nullptr, nobody);
}

TEST_F(AlgorithmsTests, Learning_accumulate)
{
    int expectedSumOfAges = 0;

    for(const Person *person : People)
    {
        expectedSumOfAges += person->Age;
    }

    int actualSumOfAges = accumulate(std::begin(People), std::end(People), 0,
                                     [](int sumSoFar, auto person)
                                     {
                                         return sumSoFar + person->Age;
                                     });


    EXPECT_EQ(expectedSumOfAges, actualSumOfAges);
}

// Looks like memory leak, but the "person" object
// is actually freed in the TearDown function.
TEST_F(AlgorithmsTests, Contains_TrueIfFound)
{
    Person *person = new Person();
    People.push_back(person);

    bool found = Contains(People, person);

    EXPECT_TRUE(found);
}

// Looks like memory leak, but the "person1" object
// is actually freed in the TearDown function.
// "person2" is not, however, so we construct it on the stack.
TEST_F(AlgorithmsTests, Contains_FalseIfNotFound)
{
    Person *person1 = new Person();
    Person person2;

    People.push_back(person1);

    bool found = Contains(People, &person2);

    EXPECT_FALSE(found);
}

TEST_F(AlgorithmsTests, RandomizeOrder_SameLengthAsOriginal)
{
    // Arrange
    std::list original{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    // Act
    std::list randomized = RandomizeOrder(original);

    // Assert
    EXPECT_EQ(randomized.size(), original.size());
}

TEST_F(AlgorithmsTests, RandomizeOrder_DifferentOrderThanOriginal)
{
    // Arrange
    std::list<int> original{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

    // Act
    std::list<int> randomized = RandomizeOrder(original);

    // Assert
    EXPECT_NE(randomized, original);
}

TEST_F(AlgorithmsTests, MergeSequences_BothEmptyYieldsEmpty)
{
    // Arrange
    std::list<int> a;
    std::list<int> b;
    std::list<int> expected;

    // Act
    auto result = MergeSequences(a, b);

    // Assert
    EXPECT_EQ(expected, result);
}

TEST_F(AlgorithmsTests, MergeSequences_BothContainingValuesWorksCorrectly)
{
    // Arrange
    std::list<int> a{ 2, 4, 1 };
    std::list<int> b{ 1, 2, 3, 8, 5 };
    std::list<int> expected{ 2, 4, 1, 1, 2, 3, 8, 5 };

    // Act
    auto result = MergeSequences(a, b);

    // Assert
    EXPECT_EQ(expected, result);
}

TEST_F(AlgorithmsTests, MergeSequences_FirstEmpty)
{
    // Arrange
    std::list<int> a;
    std::list<int> b{ 1, 2, 3, 8, 5 };
    std::list<int> expected = b;

    // Act
    auto result = MergeSequences(a, b);

    // Assert
    EXPECT_EQ(expected, result);
}

TEST_F(AlgorithmsTests, MergeSequences_SecondEmpty)
{
    // Arrange
    std::list<int> a{ 2, 4, 1 };
    std::list<int> b;
    std::list<int> expected = a;

    // Act
    auto result = MergeSequences(a, b);

    // Assert
    EXPECT_EQ(expected, result);
}

TEST_F(AlgorithmsTests, MergeSequences_WorksWithVectors)
{
    // Arrange
    std::vector<int> a{ 2, 4, 1 };
    std::vector<int> b{ 1, 2, 3, 8, 5 };
    std::vector<int> expected{ 2, 4, 1, 1, 2, 3, 8, 5 };

    // Act
    auto result = MergeSequences(a, b);

    // Assert
    EXPECT_EQ(expected, result);
}
