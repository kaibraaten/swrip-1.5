#include "mud.hpp"
#include "arena.hpp"
#include "character.hpp"

void do_chaos(Character *ch, char *argument)
{
  char lolimit[MAX_INPUT_LENGTH];
  char hilimit[MAX_INPUT_LENGTH], start_delay[MAX_INPUT_LENGTH];
  char length[MAX_INPUT_LENGTH];
  char purse[MAX_INPUT_LENGTH];
  /*Usage: chaos lo hi start_delay cost/lev length*/

  argument = OneArgument(argument, lolimit);
  arena.MinLevel = atoi(lolimit);
  argument = OneArgument(argument, hilimit);
  arena.MaxLevel = atoi(hilimit);
  argument = OneArgument(argument, start_delay);
  arena.StartTime = atoi(start_delay);
  argument = OneArgument(argument, length);
  arena.GameLength = atoi(length);
  OneArgument(argument, purse);
  arena.ArenaPot = atoi(purse);

  ch->Echo("LowLim %d HiLim %d Delay %d Length %d\r\n", arena.MinLevel,
           arena.MaxLevel, arena.StartTime, arena.GameLength);

  if(arena.MaxLevel >= LEVEL_IMPLEMENTOR)
    {
      ch->Echo("Please choose a arena.MaxLevel under the Imps level\r\n");
      return;
    }

  if(!*lolimit || !*hilimit || !*start_delay || !*length)
    {
      ch->Echo("Usage: chaos lo hi start_delay length [purse]");
      return;
    }

  if (arena.MinLevel >= arena.MaxLevel)
    {
      ch->Echo("Ya that just might be smart.\r\n");
      return;
    }

  if ( arena.MinLevel < 0 || arena.MaxLevel < 0 || arena.GameLength < 0 )
    {
      ch->Echo("I like positive numbers thank you.\r\n");
      return;
    }

  if ( arena.StartTime <= 0)
    {
      ch->Echo("Lets at least give them a chance to enter!\r\n");
      return;
    }

  arena.PeopleIsInArena = 0;
  arena.InStartArena = 1;
  arena.TimeToStart = arena.StartTime;
  arena.TimeLeftInGame =0;
  arena.BetPot = 0;
  StartArena();
}

