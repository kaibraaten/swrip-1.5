#ifndef _SWRIP_ARENA_H_
#define _SWRIP_ARENA_H_

#define ARENA_MAXBET 100

#define PREP_START  42   /* vnum of first prep room */
#define PREP_END    43   /* vnum of last prep room */

typedef struct Arena Arena;

struct Arena
{
  int ppl_challenged;
  int ppl_IsInArena;
  int in_StartArena;
  int start_time;
  int game_length;
  int lo_lim;
  int hi_lim;
  int time_to_start;
  int time_left_in_game;
  int arena_pot;
  int bet_pot;
};

struct HallOfFameElement
{
  char name[MAX_INPUT_LENGTH+1];
  time_t date;
  int award;
  struct  HallOfFameElement *next;
};

extern Arena arena;
extern struct HallOfFameElement *fame_list;

void StartArena(void);
void LoadHallOfFame(void);
void UpdateArena(void);
int CharactersInArena(void);

#endif
