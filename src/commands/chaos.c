#include "mud.h"
#include "arena.h"

void do_chaos(Character *ch, char *argument)
{
  char lolimit[MAX_INPUT_LENGTH];
  char hilimit[MAX_INPUT_LENGTH], start_delay[MAX_INPUT_LENGTH];
  char length[MAX_INPUT_LENGTH], buf[MAX_INPUT_LENGTH];
  char purse[MAX_INPUT_LENGTH];
  /*Usage: chaos lo hi start_delay cost/lev length*/

  argument = one_argument(argument, lolimit);
  arena.lo_lim = atoi(lolimit);
  argument = one_argument(argument, hilimit);
  arena.hi_lim = atoi(hilimit);
  argument = one_argument(argument, start_delay);
  arena.start_time = atoi(start_delay);
  argument = one_argument(argument, length);
  arena.game_length = atoi(length);
  one_argument(argument, purse);
  arena.arena_pot = atoi(purse);

  sprintf(buf,"LowLim %d HiLim %d Delay %d Length %d\r\n", arena.lo_lim,
          arena.hi_lim, arena.start_time, arena.game_length);
  send_to_char(buf,ch);

  if(arena.hi_lim >= LEVEL_IMPLEMENTOR)
    {
      send_to_char("Please choose a arena.hi_lim under the Imps level\r\n", ch);
      return;
    }

  if(!*lolimit || !*hilimit || !*start_delay || !*length)
    {
      send_to_char("Usage: chaos lo hi start_delay length [purse]", ch);
      return;
    }

  if (arena.lo_lim >= arena.hi_lim)
    {
      send_to_char("Ya that just might be smart.\r\n", ch);
      return;
    }

  if ( arena.lo_lim < 0 || arena.hi_lim < 0 || arena.game_length < 0 )
    {
      send_to_char("I like positive numbers thank you.\r\n", ch);
      return;
    }

  if ( arena.start_time <= 0)
    {
      send_to_char("Lets at least give them a chance to enter!\r\n", ch);
      return;
    }

  arena.ppl_in_arena = 0;
  arena.in_start_arena = 1;
  arena.time_to_start = arena.start_time;
  arena.time_left_in_game =0;
  arena.bet_pot = 0;
  start_arena();
}
