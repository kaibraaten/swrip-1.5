#include "character.h"
#include "mud.h"
#include "arena.h"

void do_bet(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  char buf1[MAX_INPUT_LENGTH];
  int newbet;

  argument = OneArgument(argument,arg);
  OneArgument(argument,buf1);

  if (IsNpc(ch))
    {
      SendToCharacter("Mobs cant bet on the arena.\r\n",ch);
      return;
    }

  if (IsBitSet(ch->InRoom->Flags, ROOM_ARENA))
    {
      SendToCharacter("Arena players can not make bets.",ch);
      return;
    }

  if( IsNullOrEmpty( arg ) )
    {
      SendToCharacter("Usage: bet <player> <amount>\r\n",ch);
      return;
    }
  else if(!arena.InStartArena && !arena.PeopleChallenged)
    {
      SendToCharacter("Sorry the arena is closed, wait until it opens up to bet.\r\n", ch);
      return;
    }
  else if(arena.PeopleIsInArena)
    {
      SendToCharacter("Sorry Arena has already started, no more bets.\r\n", ch);
      return;
    }
  else if (!(ch->BettedOn = GetCharacterAnywhere(ch, arg)))
    SendToCharacter("No such person exists in the galaxy.", ch);
  else if (ch->BettedOn == ch)
    SendToCharacter("That doesn't make much sense, does it?\r\n", ch);
  else if(ch->InRoom && !(IsBitSet(ch->BettedOn->InRoom->Flags, ROOM_ARENA)))
    SendToCharacter("Sorry that person is not in the arena.\r\n", ch);
  else
    {
      if(GET_BET_AMT(ch) > 0)
        {
          SendToCharacter("Sorry you have already bet.\r\n", ch);
          return;
        }

      GET_BETTED_ON(ch) = ch->BettedOn;
      newbet=ParseBet(arena.BetPot,buf1);

      if(newbet == 0)
        {
          SendToCharacter("Bet some gold why dont you!\r\n", ch);
          return;
        }

      if (newbet > ch->Gold)
        {
          SendToCharacter("You don't have that much money!\r\n",ch);
          return;
        }

      if(newbet > ARENA_MAXBET)
        {
          SendToCharacter("Sorry the house will not accept that much.\r\n", ch);
          return;
        }

      ch->Gold -= newbet;
      arena.ArenaPot += (newbet / 2);
      arena.BetPot += (newbet / 2);
      GET_BET_AMT(ch) = newbet;
      sprintf(buf, "You place %d credits on %s.\r\n", newbet, ch->BettedOn->Name);
      SendToCharacter(buf, ch);
      sprintf(buf,"%s has placed %d credits on %s.", ch->Name,
              newbet, ch->BettedOn->Name);
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
}
