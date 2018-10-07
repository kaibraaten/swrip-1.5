#include "character.hpp"
#include "mud.hpp"
#include "arena.hpp"
#include "room.hpp"

void do_bet(Character *ch, std::string argument)
{
  std::string arg;
  std::string buf1;

  argument = OneArgument(argument,arg);
  OneArgument(argument,buf1);

  if (IsNpc(ch))
    {
      ch->Echo("Mobs cant bet on the arena.\r\n");
      return;
    }

  if ( IsInArena( ch ) )
    {
      ch->Echo("Arena players can not make bets.");
      return;
    }

  if( arg.empty() )
    {
      ch->Echo("Usage: bet <player> <amount>\r\n");
      return;
    }
  else if(!arena.InStartArena && !arena.PeopleChallenged)
    {
      ch->Echo("Sorry the arena is closed, wait until it opens up to bet.\r\n");
      return;
    }
  else if(arena.PeopleIsInArena)
    {
      ch->Echo("Sorry Arena has already started, no more bets.\r\n");
      return;
    }
  else if (!(ch->BettedOn = GetCharacterAnywhere(ch, arg)))
    {
      ch->Echo("No such person exists in the galaxy.");
    }
  else if (ch->BettedOn == ch)
    {
      ch->Echo("That doesn't make much sense, does it?\r\n");
    }
  else if( IsInArena( ch ) )
    {
      ch->Echo("Sorry that person is not in the arena.\r\n");
    }
  else
    {
      if(GET_BET_AMT(ch) > 0)
        {
          ch->Echo("Sorry you have already bet.\r\n");
          return;
        }

      GET_BETTED_ON(ch) = ch->BettedOn;
      int newbet = ParseBet(arena.BetPot, buf1);

      if(newbet == 0)
        {
          ch->Echo("Bet some gold why dont you!\r\n");
          return;
        }

      if (newbet > ch->Gold)
        {
          ch->Echo("You don't have that much money!\r\n");
          return;
        }

      if(newbet > ARENA_MAXBET)
        {
          ch->Echo("Sorry the house will not accept that much.\r\n");
          return;
        }

      ch->Gold -= newbet;
      arena.ArenaPot += (newbet / 2);
      arena.BetPot += (newbet / 2);
      GET_BET_AMT(ch) = newbet;
      ch->Echo("You place %d credits on %s.\r\n",
               newbet, ch->BettedOn->Name.c_str());

      char buf[MAX_STRING_LENGTH];
      sprintf(buf,"%s has placed %d credits on %s.", ch->Name.c_str(),
              newbet, ch->BettedOn->Name.c_str());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
}

