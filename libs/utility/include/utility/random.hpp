#ifndef _CERIS_RANDOM_HPP_
#define _CERIS_RANDOM_HPP_

#include <cstddef>

class RandomGenerator
{
public:
  virtual ~RandomGenerator() = default;
  virtual long GetRandomNumber( long min, long max ) = 0;
  virtual long GetRandomPercent() = 0;
  virtual long RollDice( size_t numberOfDice, size_t numberOfSides ) = 0;
};

void SetRandomGenerator( RandomGenerator *generator );

int GetRandomNumberFromRange( int from, int to );
int GetRandomPercent();
int GetRandomDoor();
int RollDice( int number, int size );
int NumberFuzzy( int number );
int NumberBits( int width );

#endif
