/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *
 * This is a new automated arena for Smaug 1.4.
 * You can do anything you want with this code, I hope it will be
 * compatible with the DOS version.
 *
 * INSTALLATION:
 * Add to mud.h
 * in pc_data ...
 * char *     betted_on;
 * int        bet_amt;
 * down at the bottom of mud.h with all the rest of this stuff ...
 * #define GET_BETTED_ON(ch)    ((ch)->betted_on)
 * #define GET_BET_AMT(ch) ((ch)->bet_amt)
 *
 * change around the Makefile to include this file,
 * You also have to set the room flags in the limbo.are for the arena.
 * The arena bit is 67108864 (It's not included in the help roomflags)
 * This snippet is based on the ROM arena snippet by Kevin Hoogheem
 * It was ported to SMAUG1.4 by LrdElder
 * If you have any cool additions or questions just e-mail me at
 * tdison@swetland.net - LrdElder 10/24/98
 * Bugs fixed made for Star Wars: Rise in Power by Ulysses and Darrik Vequir
 */

#include <sys/types.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "arena.h"

#define PREP_START  42   /* vnum of first prep room */
#define PREP_END    43   /* vnum of last prep room */
#define ARENA_START number_range( 29, 41)    /* vnum of first real arena room*/
#define ARENA_END   41   /* vnum of last real arena room*/
#define HALL_FAME_FILE  SYSTEM_DIR "halloffame.lst"
#define ARENA_MAXBET 100

struct hall_of_fame_element
{
  char name[MAX_INPUT_LENGTH+1];
  time_t date;
  int award;
  struct  hall_of_fame_element *next;
};

static void show_jack_pot();
static void find_game_winner();
static void do_end_game();
static void start_game();
static void silent_end();
static void write_fame_list(void);
static void write_one_fame_node(FILE * fp, struct hall_of_fame_element * node);
static void find_bet_winners(CHAR_DATA *winner);
static void reset_bets();

struct hall_of_fame_element *fame_list = NULL;

int ppl_challenged = 0;
int ppl_in_arena = 0;
int in_start_arena = 0;

static int start_time = 0;
static int game_length = 0;
static int lo_lim = 0;
static int hi_lim = 0;
static int time_to_start = 0;
static int time_left_in_game = 0;
static int arena_pot = 0;
static int bet_pot = 0;
static int barena = 0;

void do_bet(CHAR_DATA *ch, char *argument)
{
  char arg[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  char buf1[MAX_INPUT_LENGTH];
  int newbet;

  argument = one_argument(argument,arg);
  one_argument(argument,buf1);

  if (IS_NPC(ch))
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
  else if(!in_start_arena && !ppl_challenged)
    {
      send_to_char("Sorry the arena is closed, wait until it opens up to bet.\r\n", ch);
      return;
    }
  else if(ppl_in_arena)
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
      newbet=parsebet(bet_pot,buf1);
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
      arena_pot += (newbet / 2);
      bet_pot += (newbet / 2);
      GET_BET_AMT(ch) = newbet;
      sprintf(buf, "You place %d credits on %s.\r\n", newbet, ch->betted_on->name);
      send_to_char(buf, ch);
      sprintf(buf,"%s has placed %d credits on %s.", ch->name,
              newbet, ch->betted_on->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
}

void do_arena(CHAR_DATA *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (IS_NPC(ch))
    {
      send_to_char("Mobs cant play in the arena.\r\n",ch);
      return;
    }

  if(!in_start_arena)
    {
      send_to_char("The killing fields are closed right now.\r\n", ch);
      return;
    }

  if(ch->top_level < lo_lim)
    {
      sprintf(buf, "Sorry but you must be at least level %d to enter this arena.\r\n", lo_lim);
      send_to_char(buf, ch);
      return;
    }

  if( ch->top_level > hi_lim)
    {
      send_to_char("This arena is for lower level characters.\r\n", ch);
      return;
    }

  if(IS_SET(ch->in_room->room_flags, ROOM_ARENA))
    {
      send_to_char("You are in the arena already\r\n",ch);
      return;
    }
  else
    {
      act(AT_RED, "$n has been whisked away to the killing fields.", ch, NULL, NULL, TO_ROOM);
      ch->retran = ch->in_room->vnum;
      char_from_room(ch);
      char_to_room(ch, get_room_index(PREP_START));
      act(AT_WHITE,"$n is dropped from the sky.", ch, NULL, NULL, TO_ROOM);
      send_to_char("You have been taken to the killing fields\r\n",ch);
      do_look(ch, "auto");
      sprintf(buf, "%s has joined the blood bath.", ch->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      send_to_char(buf, ch);
      ch->hit = ch->max_hit;
      ch->mana = ch->max_mana;
      ch->move = ch->max_move;
      return;
    }
}

void do_chaos(CHAR_DATA *ch, char *argument)
{
  char lolimit[MAX_INPUT_LENGTH];
  char hilimit[MAX_INPUT_LENGTH], start_delay[MAX_INPUT_LENGTH];
  char length[MAX_INPUT_LENGTH], buf[MAX_INPUT_LENGTH];
  char purse[MAX_INPUT_LENGTH];
  /*Usage: chaos lo hi start_delay cost/lev length*/

  argument = one_argument(argument, lolimit);
  lo_lim = atoi(lolimit);
  argument = one_argument(argument, hilimit);
  hi_lim = atoi(hilimit);
  argument = one_argument(argument, start_delay);
  start_time = atoi(start_delay);
  argument = one_argument(argument, length);
  game_length = atoi(length);
  one_argument(argument, purse);
  arena_pot = atoi(purse);

  sprintf(buf,"LowLim %d HiLim %d Delay %d Length %d\r\n", lo_lim,
          hi_lim, start_time, game_length);
  send_to_char(buf,ch);

  if(hi_lim >= LEVEL_IMPLEMENTOR +1)
    {
      send_to_char("Please choose a hi_lim under the Imps level\r\n", ch);
      return;
    }

  if(!*lolimit || !*hilimit || !*start_delay || !*length)
    {
      send_to_char("Usage: chaos lo hi start_delay length [purse]", ch);
      return;
    }

  if (lo_lim >= hi_lim)
    {
      send_to_char("Ya that just might be smart.\r\n", ch);
      return;
    }

  if ( lo_lim < 0 || hi_lim < 0 || game_length < 0 )
    {
      send_to_char("I like positive numbers thank you.\r\n", ch);
      return;
    }

  if ( start_time <= 0)
    {
      send_to_char("Lets at least give them a chance to enter!\r\n", ch);
      return;
    }

  ppl_in_arena = 0;
  in_start_arena = 1;
  time_to_start = start_time;
  time_left_in_game =0;
  bet_pot = 0;
  barena = 1;
  start_arena();
}

void start_arena()
{
  char buf1[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!(ppl_challenged))
    {
      if(time_to_start == 0)
        {
          in_start_arena = 0;
          show_jack_pot();
          ppl_in_arena = 1;    /* start the blood shed */
          time_left_in_game = game_length;
          start_game();
        }
      else
        {
          if(time_to_start >1)
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      lo_lim, hi_lim);
              sprintf(buf1, "%s%d &Whours to start\r\n", buf1, time_to_start);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R%d &Whour to start\r\n",buf2,time_to_start);
            }
          else
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      lo_lim, hi_lim);
              sprintf(buf1, "%s1 &Whour to start\r\n", buf1);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R1 &Whour to start\r\n",buf2);
            }
          sprintf(buf1, "%sType &Rarena &Wto enter.\r\n", buf1);
          to_channel(buf1,CHANNEL_ARENA,"&RArena&W",lo_lim);
          sprintf(buf2,"%sPlace your bets!!!\r\n",buf2);
          to_channel(buf2,CHANNEL_ARENA,"&RArena&W",5);
          /* echo_to_all(AT_WHITE, buf1, ECHOTAR_ALL); */
          time_to_start--;
        }
    }
  else
    if (!(ppl_in_arena))
      {
        if(time_to_start == 0)
          {
            ppl_challenged = 0;
            show_jack_pot();
            ppl_in_arena = 1;    /* start the blood shed */
            time_left_in_game = 5;
            start_game();
          }
        else
          {
            if(time_to_start >1)
              {
                sprintf(buf1, "The dual will start in %d hours. Place your bets!",
                        time_to_start);
              }
            else
              {
                sprintf(buf1, "The dual will start in 1 hour. Place your bets!");
              }
            to_channel(buf1,CHANNEL_ARENA,"&RArena&W",5);
            time_to_start--;
          }
      }
}

void start_game()
{
  CHAR_DATA *i;
  DESCRIPTOR_DATA *d;

  for (d = first_descriptor; d; d = d->next)
    if (!d->connected)
      {
        i = d->character;
        if (i == NULL)
          continue;

        if (i->in_room && IS_SET(i->in_room->room_flags, ROOM_ARENA))
          {
            send_to_char("\r\nThe floor falls out from below, dropping you in the arena.\r\n", i);
            char_from_room(i);
            char_to_room(i, get_room_index( ARENA_START));
            do_look(i,"auto");
          }
      }
  do_game();
}

void do_game()
{
  char buf[MAX_INPUT_LENGTH];

  if(num_in_arena() == 1)
    {
      ppl_in_arena = 0;
      ppl_challenged = 0;
      find_game_winner();
    }
  else if(time_left_in_game == 0)
    {
      do_end_game();
    }
  else if(num_in_arena() == 0)
    {
      ppl_in_arena = 0;
      ppl_challenged = 0;
      silent_end();
    }
  else if(time_left_in_game % 5)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              time_left_in_game, num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(time_left_in_game == 1)
    {
      sprintf(buf, "With 1 hour left in the game there are %d players left.",
              num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(time_left_in_game <= 4)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              time_left_in_game, num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  time_left_in_game--;
}

void find_game_winner()
{
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  CHAR_DATA *i;
  DESCRIPTOR_DATA *d;
  struct hall_of_fame_element *fame_node;

  for (d = first_descriptor; d; d = d->next)
    {
      i = d->original ? d->original : d->character;

      if (i == NULL)
        continue;

      if (i->in_room && IS_SET(i->in_room->room_flags,ROOM_ARENA)
          && !IS_IMMORTAL(i))
        {
          char_from_room(i);
          char_to_room(i,get_room_index(i->retran));
          do_look(i, "auto");
          act(AT_YELLOW,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          stop_fighting( i, TRUE );
          if (i->hit > 1)
            {
              if(time_left_in_game == 1)
                {
                  sprintf(buf, "After 1 hour of battle %s is declared the winner",i->name);
                  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              else
                {
                  sprintf(buf, "After %d hours of battle %s is declared the winner",
                          game_length - time_left_in_game, i->name);
                  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              i->gold += arena_pot/2;
              sprintf(buf, "You have been awarded %d credits for winning the arena\r\n",
                      (arena_pot/2));
              send_to_char(buf, i);
              sprintf(buf2, "%s awarded %d credits for winning arena", i->name,
                      (arena_pot/2));
              bug(buf2, 0);
              CREATE(fame_node, struct hall_of_fame_element, 1);
              strncpy(fame_node->name, i->name, MAX_INPUT_LENGTH);
              fame_node->name[MAX_INPUT_LENGTH] = '\0';
              fame_node->date = time(0);
              fame_node->award = (arena_pot/2);
              fame_node->next = fame_list;
              fame_list = fame_node;
              write_fame_list();
              find_bet_winners(i);
              ppl_in_arena = 0;
              reset_bets();
              ppl_challenged = 0;
            }
          i->hit = i->max_hit;
          i->mana = i->max_mana;
          i->move = i->max_move;
          i->challenged=NULL;
        }
    }
}

void show_jack_pot()
{
  char buf1[MAX_INPUT_LENGTH];

  sprintf(buf1, "\r\nLets get ready to RUMBLE!!!!!!!!\r\n");
  sprintf(buf1, "%sThe jack pot for this arena is %d credits\r\n",
          buf1, arena_pot);
  sprintf(buf1, "%s%d credits have been bet on this arena.\r\n",buf1, bet_pot);
  to_channel(buf1,CHANNEL_ARENA,"&RArena&W",5);
}

void silent_end()
{
  char buf[MAX_INPUT_LENGTH];
  ppl_in_arena = 0;
  ppl_challenged = 0;
  in_start_arena = 0;
  start_time = 0;
  game_length = 0;
  time_to_start = 0;
  time_left_in_game = 0;
  arena_pot = 0;
  bet_pot = 0;
  sprintf(buf, "It looks like no one was brave enough to enter the Arena.");
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  reset_bets();
}

void do_end_game()
{
  char buf[MAX_INPUT_LENGTH];
  CHAR_DATA *i;
  DESCRIPTOR_DATA *d;

  for (d = first_descriptor; d; d = d->next)
    if (!d->connected)
      {
        i = d->character;

        if (i == NULL)
          continue;

        if (i->in_room && IS_SET(i->in_room->room_flags, ROOM_ARENA))
          {
            i->hit = i->max_hit;
            i->mana = i->max_mana;
            i->move = i->max_move;
            i->challenged = NULL;
            stop_fighting(i, TRUE);
            char_from_room(i);
            char_to_room(i, get_room_index(i->retran));
            do_look(i,"auto");
            act(AT_TELL,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          }
      }
  sprintf(buf, "After %d hours of battle the Match is a draw",game_length);
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  time_left_in_game = 0;
  ppl_in_arena=0;
  ppl_challenged = 0;
  reset_bets();
}

int num_in_arena()
{
  CHAR_DATA *i;
  DESCRIPTOR_DATA *d;
  int num = 0;

  for (d = first_descriptor; d; d = d->next)
    {
      i = d->original ? d->original : d->character;
      if (i == NULL)
        continue;

      if (i->in_room && IS_SET(i->in_room->room_flags,ROOM_ARENA))
        {
          if (!IS_IMMORTAL(i)
              && i->hit > 1)
            num++;
        }
    }

  return num;
}

void do_awho(CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *tch;
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  int num=num_in_arena();

  if(num==0)
    {
      send_to_char("There is noone in the arena right now.\r\n", ch);
      return;
    }

  sprintf(buf,"&W  Players in the &BRise in Power&W Arena\r\n");
  sprintf(buf,"%s-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-", buf);
  sprintf(buf,"%s&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-\r\n", buf);
  sprintf(buf,"%sGame Length = &R%-3d   &WTime To Start &R%-3d\r\n", buf, game_length, time_to_start);
  sprintf(buf,"%s&WLevel Limits &R%d &Wto &R%d\r\n", buf, lo_lim, hi_lim);
  sprintf(buf,"%s         &WJackpot = &R%d\r\n", buf, arena_pot);
  sprintf(buf,"%s&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B", buf);
  sprintf(buf,"%s-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B-&W-&B\r\n", buf);
  send_to_char(buf, ch);

  for ( tch = first_char; tch; tch = tch->next )
    if (tch->in_room && IS_SET(tch->in_room->room_flags, ROOM_ARENA)
        && (tch->top_level < LEVEL_IMMORTAL))
      {
        sprintf(buf2, "&W%s\r\n", tch->name);
        send_to_char(buf2,ch);
      }
}

void do_ahall(CHAR_DATA *ch, char *argument)
{
  char site[MAX_INPUT_LENGTH], format[MAX_INPUT_LENGTH], *timestr;
  char format2[MAX_INPUT_LENGTH];
  struct hall_of_fame_element *fame_node;

  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!fame_list)
    {
      send_to_char("No-one is in the Hall of Fame.\r\n", ch);
      return;
    }

  sprintf(buf2, "&B|---------------------------------------|\r\n");
  strcat(buf2, "| &WPast Winners of The Rise in Power Arena&B  |\r\n");
  strcat(buf2, "|---------------------------------------|\r\r\n\n");

  send_to_char(buf2, ch);
  strcpy(format, "%-25.25s  %-10.10s  %-16.16s\r\n");
  sprintf(buf, format,
          "&RName",
          "&RDate",
          "&RAward Amt");
  send_to_char(buf, ch);
  sprintf(buf, format,
          "&B---------------------------------",
          "&B---------------------------------",
          "&B---------------------------------");

  send_to_char(buf, ch);
  strcpy(format2, "&W%-25.25s  &R%-10.10s  &Y%-16d\r\n");
  for (fame_node = fame_list; fame_node; fame_node = fame_node->next)
    {
      if (fame_node->date)
        {
          timestr = asctime(localtime(&(fame_node->date)));
          *(timestr + 10) = 0;
          strcpy(site, timestr);
        }
      else
        strcpy(site, "Unknown");
      sprintf(buf, format2, fame_node->name, site, fame_node->award);
      send_to_char(buf, ch);
    }
}

void load_hall_of_fame(void)
{
  FILE *fl;
  int date, award;
  char name[MAX_INPUT_LENGTH + 1];
  struct hall_of_fame_element *next_node;

  if (!(fl = fopen(HALL_FAME_FILE, "r")))
    {
      perror("Unable to open hall of fame file");
      return;
    }

  while (fscanf(fl, "%s %d %d", name, &date, &award) == 3)
    {
      CREATE(next_node, struct hall_of_fame_element, 1);
      strncpy(next_node->name, name, MAX_INPUT_LENGTH);
      next_node->date = date;
      next_node->award = award;
      next_node->next = fame_list;
      fame_list = next_node;
    }

  fclose(fl);
}

void write_fame_list(void)
{
  FILE *fl;

  if (!(fl = fopen(HALL_FAME_FILE, "w")))
    {
      bug("Error writing _hall_of_fame_list", 0);
      return;
    }

  write_one_fame_node(fl, fame_list);/* recursively write from end to start */
  fclose(fl);
}

void write_one_fame_node(FILE * fp, struct hall_of_fame_element * node)
{
  if (node)
    {
      write_one_fame_node(fp, node->next);
      fprintf(fp, "%s %ld %d\n",node->name,(long) node->date, node->award);
    }
}

void find_bet_winners(CHAR_DATA *winner)
{
  DESCRIPTOR_DATA *d;
  CHAR_DATA *wch;

  char buf1[MAX_INPUT_LENGTH];

  for (d = first_descriptor; d; d = d->next)
    if (!d->connected)
      {
        wch = d->original ? d->original : d->character;

        if (wch == NULL)
          continue;

        if ((!IS_NPC(wch)) && (GET_BET_AMT(wch) > 0) && (GET_BETTED_ON(wch) == winner))
          {
            sprintf(buf1, "You have won %d credits on your bet.\r\n",(GET_BET_AMT(wch))*2);
            send_to_char(buf1, wch);
            wch->gold += GET_BET_AMT(wch)*2;
            GET_BETTED_ON(wch) = NULL;
            GET_BET_AMT(wch) = 0;
          }
      }
}

void do_challenge(CHAR_DATA *ch, char *argument)
{
  CHAR_DATA *victim;
  char buf[MAX_INPUT_LENGTH];

  if ( ( victim = get_char_world( ch, argument ) ) == NULL)
    {
      send_to_char("&WThat character is not of these realms!\r\n",ch);
      return;
    }

  if (IS_IMMORTAL(ch) || IS_IMMORTAL(victim))
    {
      send_to_char("Sorry, Immortals are not allowed to participate in the arena.\r\n",ch);
      return;
    }

  if (IS_NPC(victim))
    {
      send_to_char("&WYou cannot challenge mobiles!\r\n",ch);
      return;
    }

  if (victim->name == ch->name)
    {
      send_to_char("&WYou cannot challenge yourself!",ch);
      return;
    }

  if (victim->top_level < 5)
    {
      send_to_char("&WThat character is too young.\r\n",ch);
      return;
    }

  if ( ( !( ch->top_level - 15 < victim->top_level) )
       || ( !(ch->top_level + 15 > victim->top_level) ) )
    {
      send_to_char("&WThat character is out of your level range.\r\n",ch);
      return;
    }

  if (get_timer(victim,TIMER_PKILLED)>0)
    {
      send_to_char("&WThat player has died within the last 5 minutes and cannot be challenged!\r\n",ch);
      return;
    }

  if ( victim->top_level < 5 )
    {
      send_to_char("You are too young to die.\r\n",ch);
      return;
    }

  if (get_timer(ch,TIMER_PKILLED)>0)
    {
      send_to_char("&WYou have died within the last 5 minutes and cannot challenge anyone.\r\n",ch);
      return;
    }

  if (num_in_arena()>0)
    {
      send_to_char("&WSomeone is already in the arena!\r\n",ch);
      return;
    }
  sprintf(buf,"&R%s &Whas challenged you to a dual!\r\n",ch->name);
  send_to_char(buf,victim);
  send_to_char("&WPlease either accept or decline the challenge.\r\n\r\n",victim);
  sprintf(buf,"%s has challenged %s to a dual!!\r\n",ch->name,victim->name);
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  victim->challenged = ch;
}

void do_accept(CHAR_DATA *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (num_in_arena()>0)
    {
      send_to_char("Please wait until the current arena is closed before you accept.\r\n",ch);
      return;
    }

  if (!(ch->challenged))
    {
      send_to_char("You have not been challenged!\r\n",ch);
      return;
    }
  else
    {
      CHAR_DATA *dch;
      dch = ch->challenged;

      if (!dch || !(dch->in_room) || !(dch->name) || (ch->name[0] == '\0'))
        return;

      if ( dch->in_room == ch->in_room )
        {
          send_to_char("You must be in a different room as your challenger.\r\n",ch);
        }

      if ( dch->in_room == ch->in_room )
        {
          send_to_char("You must be in a different room as your challenger.\r\n",ch);
          return;
        }

      sprintf(buf,"%s has accepted %s's challenge!\r\n",ch->name,dch->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->challenged = NULL;
      ch->retran = ch->in_room->vnum;
      char_from_room(ch);
      char_to_room(ch, get_room_index(PREP_END));
      do_look(ch,"auto");
      dch->retran = dch->in_room->vnum;
      char_from_room(dch);
      char_to_room(dch, get_room_index(PREP_START));
      do_look(dch,"auto");
      ppl_in_arena = 0;
      ppl_challenged = 1;
      time_to_start = 3;
      time_left_in_game =0;
      arena_pot =0;
      bet_pot = 0;
      start_arena();
      return;
    }
}

void do_decline(CHAR_DATA *ch, char *argument)
{
  char buf[MAX_INPUT_LENGTH];

  if (ch->challenged)
    {
      sprintf(buf,"%s has DECLINED %s's challenge! WHAT A WUSS!!!\r\n",ch->name,ch->challenged->name);
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
      ch->challenged=NULL;
      return;
    }
  else
    {
      send_to_char("You have not been challenged!\r\n",ch);
      return;
    }
}

/*
 * Reset bets for those that did not win.
 * Added by Ulysses, rewritten by Darrik Vequir.
 */
void reset_bets()
{
  CHAR_DATA *ch;

  for (ch = first_char; ch; ch = ch->next )
    {
      if (ch == NULL)
        continue;

      if (!IS_NPC(ch))
        {
          GET_BETTED_ON(ch) = NULL;
          GET_BET_AMT(ch) = 0;
        }
    }
}
