#ifndef _SWRIP_ARENA_H_
#define _SWRIP_ARENA_H_

#define ARENA_MAXBET 100
#define PREP_START  42   /* vnum of first prep room */
#define PREP_END    43   /* vnum of last prep room */

typedef struct arena_data ARENA_DATA;

struct arena_data
{
  int ppl_challenged;
  int ppl_in_arena;
  int in_start_arena;
  int start_time;
  int game_length;
  int lo_lim;
  int hi_lim;
  int time_to_start;
  int time_left_in_game;
  int arena_pot;
  int bet_pot;
};

struct hall_of_fame_element
{
  char name[MAX_INPUT_LENGTH+1];
  time_t date;
  int award;
  struct  hall_of_fame_element *next;
};

extern ARENA_DATA arena;
extern struct hall_of_fame_element *fame_list;

void start_arena();
void load_hall_of_fame(void);
void do_game();
int num_in_arena();

#endif
