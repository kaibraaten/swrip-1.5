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
        Person *person = new Person { item.first, item.second };
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

  std::list<Person*> People;
};

template<typename T>
struct EveryOther
{
  bool operator()(const T &unused) const
  {
    return ++_counter % 2 == 0;
  }
  
private:
  mutable int _counter = 0;
};

TEST_F(AlgorithmsTests, Filter_WorksWithList)
{
  std::list<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
  std::list<const char*> reduced = Filter(original, EveryOther<const char*>());

  EXPECT_EQ(reduced.size(), original.size() / 2);
}

TEST_F(AlgorithmsTests, Filter_WorksWithVector)
{
  std::vector<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
  std::vector<const char*> reduced = Filter(original, EveryOther<const char*>());

  EXPECT_EQ(reduced.size(), original.size() / 2);
}

TEST_F(AlgorithmsTests, Filter_WorksWithLambda)
{
  std::list<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };
  size_t counter = 0;
  std::list<const char*> reduced = Filter(original,
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
  std::list<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

  std::list<const char*> reduced = Filter(original, DoesNotContainA);

  EXPECT_EQ(reduced.size(), original.size() - 1);
}

TEST_F(AlgorithmsTests, Reverse_WorksWithList)
{
  const std::list<const char*> expected { "fff", "eee", "ddd", "ccc", "bbb", "aaa" };
  const std::list<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

  const std::list<const char*> actual = Reverse(original);

  EXPECT_EQ(expected, actual);
}

TEST_F(AlgorithmsTests, Reverse_WorksWithVector)
{
  const std::vector<const char*> expected { "fff", "eee", "ddd", "ccc", "bbb", "aaa" };
  const std::vector<const char*> original { "aaa", "bbb", "ccc", "ddd", "eee", "fff" };

  const std::vector<const char*> actual = Reverse(original);

  EXPECT_EQ(expected, actual);
}

TEST_F(AlgorithmsTests, Count)
{
  const int minAge = 25;
  size_t olderThan25 = Count(People, [minAge](const auto p){ return p->Age > minAge; });

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
  Person *nobody = Find(People, [](const auto p){ return p->Age == 123456; });

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
