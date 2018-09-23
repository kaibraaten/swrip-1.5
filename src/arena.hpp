#ifndef _SWRIP_ARENA_HPP_
#define _SWRIP_ARENA_HPP_

#include <list>
#include <string>
#include <ctime>

#define ARENA_MAXBET 100

#define PREP_START  42   /* vnum of first prep room */
#define PREP_END    43   /* vnum of last prep room */

class Arena
{
public:
  int PeopleChallenged = 0;
  int PeopleIsInArena = 0;
  int InStartArena = 0;
  int StartTime = 0;
  int GameLength = 0;
  int MinLevel = 0;
  int MaxLevel = 0;
  int TimeToStart = 0;
  int TimeLeftInGame = 0;
  int ArenaPot = 0;
  int BetPot = 0;
};

class HallOfFameElement
{
public:
  std::string Name;
  time_t Date = 0;
  int Award = 0;
};

extern Arena arena;
extern std::list<HallOfFameElement*> FameList;

void StartArena( void );
void LoadHallOfFame( void );
void SaveHallOfFame( void );
void UpdateArena( void );
int CharactersInArena( void );

#endif
