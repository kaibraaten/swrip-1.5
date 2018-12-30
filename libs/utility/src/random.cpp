#include <random>
#include <chrono>
#include "random.hpp"
#include "utility.hpp"

static RandomGenerator *ActiveRandomGenerator = nullptr;

class UniformDistributionRandomGenerator : public RandomGenerator
{
public:
    UniformDistributionRandomGenerator();
    long GetRandomNumber(long min, long max) override;
    long GetRandomPercent() override;
    long RollDice(size_t numberOfDice, size_t numberOfSides) override;

private:
    std::default_random_engine _generator;
};

UniformDistributionRandomGenerator::UniformDistributionRandomGenerator()
    : _generator(std::chrono::system_clock::now().time_since_epoch().count())
{

}

long UniformDistributionRandomGenerator::GetRandomNumber(long min, long max)
{
    const std::uniform_int_distribution<long> distribution(min, max);
    return distribution(_generator);
}

long UniformDistributionRandomGenerator::GetRandomPercent()
{
    return GetRandomNumber(1, 100);
}

long UniformDistributionRandomGenerator::RollDice(size_t numberOfDice, size_t numberOfSides)
{
    std::uniform_int_distribution<long> distribution(1, numberOfSides);
    long result = 0;

    for (size_t roll = 0; roll < numberOfDice; ++roll)
    {
        result += distribution(_generator);
    }

    return result;
}

/////////////////////////////////////////////////////////////////

int GetRandomNumberFromRange(int from, int to)
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    return ActiveRandomGenerator->GetRandomNumber(from, to);
}

/*
 * Generate a percentile roll.
 */
int GetRandomPercent()
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    return ActiveRandomGenerator->GetRandomPercent();
}

int RollDice(int number, int size)
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    return ActiveRandomGenerator->RollDice(number, size);
}

/*
 * Generate a random door.
 */
int GetRandomDoor()
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    return ActiveRandomGenerator->GetRandomNumber(0, 9);
}

int NumberBits(int width)
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    return ActiveRandomGenerator->GetRandomNumber(0, (1 << width) - 1);
}

/*
 * Stick a little fuzz on a number.
 */
int NumberFuzzy(int number)
{
    if (ActiveRandomGenerator == nullptr)
    {
        ActiveRandomGenerator = new UniformDistributionRandomGenerator();
    }

    switch (NumberBits(2))
    {
    case 0:
        number -= 1;
        break;

    case 3:
        number += 1;
        break;

    default:
        break;;
    }

    return umax(1, number);
}

void SetRandomGenerator(RandomGenerator *generator)
{
    delete ActiveRandomGenerator;
    ActiveRandomGenerator = generator;
}
