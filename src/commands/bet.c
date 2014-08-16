#include "character.h"
#include "mud.h"
#include "arena.h"

void do_bet(Character *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  char buf1[MAX_INPUT_LENGTH];
  int newbet;

  argument = one_argument(argument,arg);
  one_argument(argument,buf1);

  if (IsNpc(ch))
    {
      send_to_char("Mobs cant bet on the arena.\r\n",ch);
      return;
    }

  if (IS_SET(ch->in_room->room_flags, ROOM_ARENA))
    {
      send_to_char("Arena players can not make bets.",ch);
      return;
    }

  if(arg[0]=='\0')
    {
      send_to_char("Usage: bet <player> <amt>\r\n",ch);
      return;
    }
  else if(!arena.in_StartArena && !arena.ppl_challenged)
    {
      send_to_char("Sorry the arena is closed, wait until it opens up to bet.\r\n", ch);
      return;
    }
  else if(arena.ppl_in_arena)
    {
      send_to_char("Sorry Arena has already started, no more bets.\r\n", ch);
      return;
    }
  else if (!(ch->betted_on = get_char_world(ch, arg)))
    send_to_char("No such person exists in the galaxy.", ch);
  else if (ch->betted_on == ch)
    send_to_char("That doesn't make much sense, does it?\r\n", ch);
  else if(ch->in_room && !(IS_SET(ch->betted_on->in_room->room_flags, ROOM_ARENA)))
    send_to_char("Sorry that person is not in the arena.\r\n", ch);
  else
    {
      if(GET_BET_AMT(ch) > 0)
        {
          send_to_char("Sorry you have already bet.\r\n", ch);
          return;
        }
      GET_BETTED_ON(ch) = ch->betted_on;
      newbet=parsebet(arena.bet_pot,buf1);
      if(newbet == 0)
        {
          send_to_char("Bet some gold why dont you!\r\n", ch);
          return;
        }
      if (newbet > ch->gold)
        {
          send_to_char("You don't have that much money!\r\n",ch);
          return;
        }
      if(newbet > ARENA_MAXBET)
        {
          send_to_char("Sorry the house will not accept that much.\r\n", ch);
          return;
        }

      ch->gold -= newbet;
      arena.arena_pot += (newbet / 2);
      arena.bet_pot += (newbet / 2);
      GET_BET_AMT(ch) = newbet;
      sprintf(buf, "You place %d credits on %s.\r\n", newbet, ch->betted_on->name);
      send_to_char(buf, ch);
      sprintf(buf,"%s has placed %d credits on %s.", ch->name,
              newbet, ch->betted_on->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
}
