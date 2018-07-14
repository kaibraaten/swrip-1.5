#include "mud.hpp"
#include "arena.hpp"

void do_chaos(Character *ch, char *argument)
{
  char lolimit[MAX_INPUT_LENGTH];
  char hilimit[MAX_INPUT_LENGTH], start_delay[MAX_INPUT_LENGTH];
  char length[MAX_INPUT_LENGTH], buf[MAX_INPUT_LENGTH];
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

  sprintf(buf,"LowLim %d HiLim %d Delay %d Length %d\r\n", arena.MinLevel,
          arena.MaxLevel, arena.StartTime, arena.GameLength);
  SendToCharacter(buf,ch);

  if(arena.MaxLevel >= LEVEL_IMPLEMENTOR)
    {
      SendToCharacter("Please choose a arena.MaxLevel under the Imps level\r\n", ch);
      return;
    }

  if(!*lolimit || !*hilimit || !*start_delay || !*length)
    {
      SendToCharacter("Usage: chaos lo hi start_delay length [purse]", ch);
      return;
    }

  if (arena.MinLevel >= arena.MaxLevel)
    {
      SendToCharacter("Ya that just might be smart.\r\n", ch);
      return;
    }

  if ( arena.MinLevel < 0 || arena.MaxLevel < 0 || arena.GameLength < 0 )
    {
      SendToCharacter("I like positive numbers thank you.\r\n", ch);
      return;
    }

  if ( arena.StartTime <= 0)
    {
      SendToCharacter("Lets at least give them a chance to enter!\r\n", ch);
      return;
    }

  arena.PeopleIsInArena = 0;
  arena.InStartArena = 1;
  arena.TimeToStart = arena.StartTime;
  arena.TimeLeftInGame =0;
  arena.BetPot = 0;
  StartArena();
}
