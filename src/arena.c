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

Arena arena;

#define ARENA_FIRST_ROOM 29
#define ARENA_LAST_ROOM  43
#define ARENA_END   41   /* vnum of last real arena room*/
#define ARENA_START GetRandomNumberFromRange( ARENA_FIRST_ROOM, ARENA_END)
#define HALL_FAME_FILE  SYSTEM_DIR "halloffame.lst"

static void ShowJackpot(void);
static void FindGameWinner(void);
static void DoEndGame(void);
static void StartGame(void);
static void SilentEnd(void);
static void WriteFameList(void);
static void WriteOneFameNode(FILE * fp, struct HallOfFameElement * node);
static void FindBetWinners(Character *winner);
static void ResetBets(void);

struct HallOfFameElement *fame_list = NULL;

void StartArena(void)
{
  char buf1[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!arena.ppl_challenged)
    {
      if(arena.time_to_start == 0)
        {
          arena.in_StartArena = 0;
          ShowJackpot();
          arena.ppl_IsInArena = 1;    /* start the blood shed */
          arena.time_left_in_game = arena.game_length;
          StartGame();
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
          ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",arena.lo_lim);
          sprintf(buf2,"%sPlace your bets!!!\r\n",buf2);
          ToChannel(buf2,CHANNEL_ARENA,"&RArena&W",5);
          arena.time_to_start--;
        }
    }
  else if (!arena.ppl_IsInArena)
    {
      if(arena.time_to_start == 0)
	{
	  arena.ppl_challenged = 0;
	  ShowJackpot();
	  arena.ppl_IsInArena = 1;    /* start the blood shed */
	  arena.time_left_in_game = 5;
	  StartGame();
	}
      else
	{
	  if(arena.time_to_start >1)
	    {
	      sprintf(buf1, "The duel will start in %d hours. Place your bets!",
		      arena.time_to_start);
	    }
	  else
	    {
	      sprintf(buf1, "The duel will start in 1 hour. Place your bets!");
	    }

	  ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",5);
	  arena.time_to_start--;
	}
    }
}

static void StartGame(void)
{
  Descriptor *d = NULL;

  for (d = first_descriptor; d; d = d->next)
    {
      if (!d->connection_state)
	{
	  Character *i = d->character;

	  if (i == NULL)
	    {
	      continue;
	    }

	  if (i->in_room && IsBitSet(i->in_room->room_flags, ROOM_ARENA))
	    {
	      SendToCharacter("\r\nThe floor falls out from below, dropping you in the arena.\r\n", i);
	      char_from_room(i);
	      char_to_room(i, GetRoom( ARENA_START));
	      do_look(i,"auto");
	    }
	}
    }

  UpdateArena();
}

void UpdateArena(void)
{
  char buf[MAX_INPUT_LENGTH];

  if(CharactersInArena() == 1)
    {
      arena.ppl_IsInArena = 0;
      arena.ppl_challenged = 0;
      FindGameWinner();
    }
  else if(arena.time_left_in_game == 0)
    {
      DoEndGame();
    }
  else if(CharactersInArena() == 0)
    {
      arena.ppl_IsInArena = 0;
      arena.ppl_challenged = 0;
      SilentEnd();
    }
  else if(arena.time_left_in_game % 5)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.time_left_in_game, CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.time_left_in_game == 1)
    {
      sprintf(buf, "With 1 hour left in the game there are %d players left.",
              CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.time_left_in_game <= 4)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.time_left_in_game, CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }

  arena.time_left_in_game--;
}

static void FindGameWinner(void)
{
  Descriptor *d = NULL;

  for (d = first_descriptor; d; d = d->next)
    {
      Character *i = d->original ? d->original : d->character;

      if (i == NULL)
	{
	  continue;
	}

      if (i->in_room && IsBitSet(i->in_room->room_flags,ROOM_ARENA)
          && !IsImmortal(i))
        {
          char_from_room(i);
          char_to_room(i,GetRoom(i->retran));
          do_look(i, "auto");
          Act(AT_YELLOW,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          StopFighting( i, true );

          if (i->hit > 1)
            {
	      struct HallOfFameElement *fame_node = NULL;
	      char buf[MAX_INPUT_LENGTH];

              if(arena.time_left_in_game == 1)
                {
                  sprintf(buf, "After 1 hour of battle %s is declared the winner",i->name);
                  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              else
                {
                  sprintf(buf, "After %d hours of battle %s is declared the winner",
                          arena.game_length - arena.time_left_in_game, i->name);
                  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }

              i->gold += arena.arena_pot/2;
              ChPrintf(i, "You have been awarded %d credits for winning the arena\r\n",
			(arena.arena_pot/2));

              Bug( "%s awarded %d credits for winning arena", i->name,
		   (arena.arena_pot/2));

              AllocateMemory(fame_node, struct HallOfFameElement, 1);
              strncpy(fame_node->name, i->name, MAX_INPUT_LENGTH);
              fame_node->name[MAX_INPUT_LENGTH] = '\0';
              fame_node->date = time(0);
              fame_node->award = (arena.arena_pot/2);
              fame_node->next = fame_list;
              fame_list = fame_node;

              WriteFameList();
              FindBetWinners(i);
              arena.ppl_IsInArena = 0;
              ResetBets();
              arena.ppl_challenged = 0;
            }

          i->hit = i->max_hit;
          i->mana = i->max_mana;
          i->move = i->max_move;
          i->challenged = NULL;
        }
    }
}

static void ShowJackpot(void)
{
  char buf1[MAX_INPUT_LENGTH];

  sprintf(buf1, "\r\nLets get ready to RUMBLE!!!!!!!!\r\n");
  sprintf(buf1, "%sThe jack pot for this arena is %d credits\r\n",
          buf1, arena.arena_pot);
  sprintf(buf1, "%s%d credits have been bet on this arena.\r\n",buf1, arena.bet_pot);
  ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",5);
}

static void SilentEnd(void)
{
  char buf[MAX_INPUT_LENGTH];

  arena.ppl_IsInArena = 0;
  arena.ppl_challenged = 0;
  arena.in_StartArena = 0;
  arena.start_time = 0;
  arena.game_length = 0;
  arena.time_to_start = 0;
  arena.time_left_in_game = 0;
  arena.arena_pot = 0;
  arena.bet_pot = 0;
  sprintf(buf, "It looks like no one was brave enough to enter the Arena.");
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  ResetBets();
}

static void DoEndGame(void)
{
  char buf[MAX_INPUT_LENGTH];
  Descriptor *d = NULL;

  for (d = first_descriptor; d; d = d->next)
    {
      if (!d->connection_state)
	{
	  Character *i = d->character;

	  if (i == NULL)
	    {
	      continue;
	    }

	  if (i->in_room && IsBitSet(i->in_room->room_flags, ROOM_ARENA))
	    {
	      i->hit = i->max_hit;
	      i->mana = i->max_mana;
	      i->move = i->max_move;
	      i->challenged = NULL;
	      StopFighting(i, true);
	      char_from_room(i);
	      char_to_room(i, GetRoom(i->retran));
	      do_look(i,"auto");
	      Act(AT_TELL,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
	    }
	}
    }

  sprintf(buf, "After %d hours of battle the Match is a draw",arena.game_length);
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  arena.time_left_in_game = 0;
  arena.ppl_IsInArena=0;
  arena.ppl_challenged = 0;
  ResetBets();
}

int CharactersInArena(void)
{
  Descriptor *d;
  int num = 0;

  for (d = first_descriptor; d; d = d->next)
    {
      Character *i = d->original ? d->original : d->character;

      if (i == NULL)
	{
	  continue;
	}

      if (i->in_room && IsBitSet(i->in_room->room_flags,ROOM_ARENA))
        {
          if (!IsImmortal(i) && i->hit > 1)
	    {
	      num++;
	    }
        }
    }

  return num;
}

void LoadHallOfFame(void)
{
  FILE *fl = NULL;
  int date = 0;
  int award = 0;
  char name[MAX_INPUT_LENGTH + 1];

  if (!(fl = fopen(HALL_FAME_FILE, "r")))
    {
      perror("Unable to open hall of fame file");
      return;
    }

  while (fscanf(fl, "%s %d %d", name, &date, &award) == 3)
    {
      struct HallOfFameElement *next_node = NULL;

      AllocateMemory(next_node, struct HallOfFameElement, 1);
      strncpy(next_node->name, name, MAX_INPUT_LENGTH);
      next_node->date = date;
      next_node->award = award;
      next_node->next = fame_list;
      fame_list = next_node;
    }

  fclose(fl);
}

static void WriteFameList(void)
{
  FILE *fl = NULL;

  if (!(fl = fopen(HALL_FAME_FILE, "w")))
    {
      Bug("Error writing _hall_of_fame_list", 0);
      return;
    }

  WriteOneFameNode(fl, fame_list);/* recursively write from end to start */
  fclose(fl);
}

static void WriteOneFameNode(FILE * fp, struct HallOfFameElement * node)
{
  if (node)
    {
      WriteOneFameNode(fp, node->next);
      fprintf(fp, "%s %ld %d\n",node->name,(long) node->date, node->award);
    }
}

static void FindBetWinners(Character *winner)
{
  Descriptor *d = NULL;

  for (d = first_descriptor; d; d = d->next)
    {
      if (!d->connection_state)
	{
	  Character *wch = d->original ? d->original : d->character;

	  if (wch == NULL)
	    {
	      continue;
	    }

	  if ((!IsNpc(wch)) && (GET_BET_AMT(wch) > 0) && (GET_BETTED_ON(wch) == winner))
	    {
	      ChPrintf(wch, "You have won %d credits on your bet.\r\n",
			(GET_BET_AMT(wch))*2);
	      wch->gold += GET_BET_AMT(wch)*2;
	      GET_BETTED_ON(wch) = NULL;
	      GET_BET_AMT(wch) = 0;
	    }
	}
    }
}

/*
 * Reset bets for those that did not win.
 * Added by Ulysses, rewritten by Darrik Vequir.
 */
static void ResetBets(void)
{
  Character *ch = NULL;

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
