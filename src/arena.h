#ifndef _SWRIP_ARENA_H_
#define _SWRIP_ARENA_H_

#define ARENA_MAXBET 100

#define PREP_START  42   /* vnum of first prep room */
#define PREP_END    43   /* vnum of last prep room */

typedef struct Arena Arena;

struct Arena
{
  int PeopleChallenged;
  int PeopleIsInArena;
  int InStartArena;
  int StartTime;
  int GameLength;
  int MinLevel;
  int MaxLevel;
  int TimeToStart;
  int TimeLeftInGame;
  int ArenaPot;
  int BetPot;
};

struct HallOfFameElement
{
  char Name[MAX_INPUT_LENGTH+1];
  time_t Date;
  int Award;
  struct  HallOfFameElement *next;
};

extern Arena arena;
extern struct HallOfFameElement *FameList;

void StartArena(void);
void LoadHallOfFame(void);
void UpdateArena(void);
int CharactersInArena(void);

#endif
