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
#include "character.h"
#include "mud.h"
#include "arena.h"

ARENA_DATA arena;

#define ARENA_START number_range( 29, 41)    /* vnum of first real arena room*/
#define ARENA_END   41   /* vnum of last real arena room*/
#define HALL_FAME_FILE  SYSTEM_DIR "halloffame.lst"

static void show_jack_pot(void);
static void find_game_winner(void);
static void do_end_game(void);
static void start_game(void);
static void silent_end(void);
static void write_fame_list(void);
static void write_one_fame_node(FILE * fp, struct hall_of_fame_element * node);
static void find_bet_winners(Character *winner);
static void reset_bets(void);

struct hall_of_fame_element *fame_list = NULL;

void start_arena(void)
{
  char buf1[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!(arena.ppl_challenged))
    {
      if(arena.time_to_start == 0)
        {
          arena.in_start_arena = 0;
          show_jack_pot();
          arena.ppl_in_arena = 1;    /* start the blood shed */
          arena.time_left_in_game = arena.game_length;
          start_game();
        }
      else
        {
          if(arena.time_to_start >1)
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      arena.lo_lim, arena.hi_lim);
              sprintf(buf1, "%s%d &Whours to start\r\n", buf1, arena.time_to_start);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R%d &Whour to start\r\n",buf2,arena.time_to_start);
            }
          else
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      arena.lo_lim, arena.hi_lim);
              sprintf(buf1, "%s1 &Whour to start\r\n", buf1);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R1 &Whour to start\r\n",buf2);
            }
          sprintf(buf1, "%sType &Rarena &Wto enter.\r\n", buf1);
          to_channel(buf1,CHANNEL_ARENA,"&RArena&W",arena.lo_lim);
          sprintf(buf2,"%sPlace your bets!!!\r\n",buf2);
          to_channel(buf2,CHANNEL_ARENA,"&RArena&W",5);
          /* echo_to_all(AT_WHITE, buf1, ECHOTAR_ALL); */
          arena.time_to_start--;
        }
    }
  else
    if (!(arena.ppl_in_arena))
      {
        if(arena.time_to_start == 0)
          {
            arena.ppl_challenged = 0;
            show_jack_pot();
            arena.ppl_in_arena = 1;    /* start the blood shed */
            arena.time_left_in_game = 5;
            start_game();
          }
        else
          {
            if(arena.time_to_start >1)
              {
                sprintf(buf1, "The dual will start in %d hours. Place your bets!",
                        arena.time_to_start);
              }
            else
              {
                sprintf(buf1, "The dual will start in 1 hour. Place your bets!");
              }
            to_channel(buf1,CHANNEL_ARENA,"&RArena&W",5);
            arena.time_to_start--;
          }
      }
}

void start_game(void)
{
  Character *i;
  Descriptor *d;

  for (d = first_descriptor; d; d = d->next)
    if (!d->connection_state)
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

void do_game(void)
{
  char buf[MAX_INPUT_LENGTH];

  if(num_in_arena() == 1)
    {
      arena.ppl_in_arena = 0;
      arena.ppl_challenged = 0;
      find_game_winner();
    }
  else if(arena.time_left_in_game == 0)
    {
      do_end_game();
    }
  else if(num_in_arena() == 0)
    {
      arena.ppl_in_arena = 0;
      arena.ppl_challenged = 0;
      silent_end();
    }
  else if(arena.time_left_in_game % 5)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.time_left_in_game, num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.time_left_in_game == 1)
    {
      sprintf(buf, "With 1 hour left in the game there are %d players left.",
              num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.time_left_in_game <= 4)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.time_left_in_game, num_in_arena());
      to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  arena.time_left_in_game--;
}

void find_game_winner(void)
{
  char buf[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];
  Character *i;
  Descriptor *d;
  struct hall_of_fame_element *fame_node;

  for (d = first_descriptor; d; d = d->next)
    {
      i = d->original ? d->original : d->character;

      if (i == NULL)
        continue;

      if (i->in_room && IS_SET(i->in_room->room_flags,ROOM_ARENA)
          && !IsImmortal(i))
        {
          char_from_room(i);
          char_to_room(i,get_room_index(i->retran));
          do_look(i, "auto");
          act(AT_YELLOW,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          stop_fighting( i, true );
          if (i->hit > 1)
            {
              if(arena.time_left_in_game == 1)
                {
                  sprintf(buf, "After 1 hour of battle %s is declared the winner",i->name);
                  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              else
                {
                  sprintf(buf, "After %d hours of battle %s is declared the winner",
                          arena.game_length - arena.time_left_in_game, i->name);
                  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              i->gold += arena.arena_pot/2;
              sprintf(buf, "You have been awarded %d credits for winning the arena\r\n",
                      (arena.arena_pot/2));
              send_to_char(buf, i);
              sprintf(buf2, "%s awarded %d credits for winning arena", i->name,
                      (arena.arena_pot/2));
              bug(buf2, 0);
              CREATE(fame_node, struct hall_of_fame_element, 1);
              strncpy(fame_node->name, i->name, MAX_INPUT_LENGTH);
              fame_node->name[MAX_INPUT_LENGTH] = '\0';
              fame_node->date = time(0);
              fame_node->award = (arena.arena_pot/2);
              fame_node->next = fame_list;
              fame_list = fame_node;
              write_fame_list();
              find_bet_winners(i);
              arena.ppl_in_arena = 0;
              reset_bets();
              arena.ppl_challenged = 0;
            }
          i->hit = i->max_hit;
          i->mana = i->max_mana;
          i->move = i->max_move;
          i->challenged=NULL;
        }
    }
}

void show_jack_pot(void)
{
  char buf1[MAX_INPUT_LENGTH];

  sprintf(buf1, "\r\nLets get ready to RUMBLE!!!!!!!!\r\n");
  sprintf(buf1, "%sThe jack pot for this arena is %d credits\r\n",
          buf1, arena.arena_pot);
  sprintf(buf1, "%s%d credits have been bet on this arena.\r\n",buf1, arena.bet_pot);
  to_channel(buf1,CHANNEL_ARENA,"&RArena&W",5);
}

void silent_end(void)
{
  char buf[MAX_INPUT_LENGTH];
  arena.ppl_in_arena = 0;
  arena.ppl_challenged = 0;
  arena.in_start_arena = 0;
  arena.start_time = 0;
  arena.game_length = 0;
  arena.time_to_start = 0;
  arena.time_left_in_game = 0;
  arena.arena_pot = 0;
  arena.bet_pot = 0;
  sprintf(buf, "It looks like no one was brave enough to enter the Arena.");
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  reset_bets();
}

void do_end_game(void)
{
  char buf[MAX_INPUT_LENGTH];
  Character *i;
  Descriptor *d;

  for (d = first_descriptor; d; d = d->next)
    if (!d->connection_state)
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
            stop_fighting(i, true);
            char_from_room(i);
            char_to_room(i, get_room_index(i->retran));
            do_look(i,"auto");
            act(AT_TELL,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          }
      }
  sprintf(buf, "After %d hours of battle the Match is a draw",arena.game_length);
  to_channel(buf,CHANNEL_ARENA,"&RArena&W",5);
  arena.time_left_in_game = 0;
  arena.ppl_in_arena=0;
  arena.ppl_challenged = 0;
  reset_bets();
}

int num_in_arena(void)
{
  Character *i;
  Descriptor *d;
  int num = 0;

  for (d = first_descriptor; d; d = d->next)
    {
      i = d->original ? d->original : d->character;
      if (i == NULL)
        continue;

      if (i->in_room && IS_SET(i->in_room->room_flags,ROOM_ARENA))
        {
          if (!IsImmortal(i)
              && i->hit > 1)
            num++;
        }
    }

  return num;
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

void find_bet_winners(Character *winner)
{
  Descriptor *d;
  Character *wch;

  char buf1[MAX_INPUT_LENGTH];

  for (d = first_descriptor; d; d = d->next)
    if (!d->connection_state)
      {
        wch = d->original ? d->original : d->character;

        if (wch == NULL)
          continue;

        if ((!IsNpc(wch)) && (GET_BET_AMT(wch) > 0) && (GET_BETTED_ON(wch) == winner))
          {
            sprintf(buf1, "You have won %d credits on your bet.\r\n",(GET_BET_AMT(wch))*2);
            send_to_char(buf1, wch);
            wch->gold += GET_BET_AMT(wch)*2;
            GET_BETTED_ON(wch) = NULL;
            GET_BET_AMT(wch) = 0;
          }
      }
}

/*
 * Reset bets for those that did not win.
 * Added by Ulysses, rewritten by Darrik Vequir.
 */
void reset_bets(void)
{
  Character *ch;

  for (ch = first_char; ch; ch = ch->next )
    {
      if (ch == NULL)
        continue;

      if (!IsNpc(ch))
        {
          GET_BETTED_ON(ch) = NULL;
          GET_BET_AMT(ch) = 0;
        }
    }
}
