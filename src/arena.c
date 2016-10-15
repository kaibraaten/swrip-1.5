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

struct HallOfFameElement *FameList = NULL;

void StartArena(void)
{
  char buf1[MAX_INPUT_LENGTH];
  char buf2[MAX_INPUT_LENGTH];

  if (!arena.PeopleChallenged)
    {
      if(arena.TimeToStart == 0)
        {
          arena.InStartArena = 0;
          ShowJackpot();
          arena.PeopleIsInArena = 1;    /* start the blood shed */
          arena.TimeLeftInGame = arena.GameLength;
          StartGame();
        }
      else
        {
          if(arena.TimeToStart >1)
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      arena.MinLevel, arena.MaxLevel);
              sprintf(buf1, "%s%d &Whours to start\r\n", buf1, arena.TimeToStart);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R%d &Whour to start\r\n",buf2,arena.TimeToStart);
            }
          else
            {
              sprintf(buf1, "&WThe Killing Fields are open to levels &R%d &Wthru &R%d\r\n",
                      arena.MinLevel, arena.MaxLevel);
              sprintf(buf1, "%s1 &Whour to start\r\n", buf1);
              sprintf(buf2,"The killing fields are open.\r\n");
              sprintf(buf2,"%s&R1 &Whour to start\r\n",buf2);
            }

          sprintf(buf1, "%sType &Rarena &Wto enter.\r\n", buf1);
          ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",arena.MinLevel);
          sprintf(buf2,"%sPlace your bets!!!\r\n",buf2);
          ToChannel(buf2,CHANNEL_ARENA,"&RArena&W",5);
          arena.TimeToStart--;
        }
    }
  else if (!arena.PeopleIsInArena)
    {
      if(arena.TimeToStart == 0)
	{
	  arena.PeopleChallenged = 0;
	  ShowJackpot();
	  arena.PeopleIsInArena = 1;    /* start the blood shed */
	  arena.TimeLeftInGame = 5;
	  StartGame();
	}
      else
	{
	  if(arena.TimeToStart >1)
	    {
	      sprintf(buf1, "The duel will start in %d hours. Place your bets!",
		      arena.TimeToStart);
	    }
	  else
	    {
	      sprintf(buf1, "The duel will start in 1 hour. Place your bets!");
	    }

	  ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",5);
	  arena.TimeToStart--;
	}
    }
}

static void StartGame(void)
{
  Descriptor *d = NULL;

  for (d = FirstDescriptor; d; d = d->Next)
    {
      if (!d->ConnectionState)
	{
	  Character *i = d->Character;

	  if (i == NULL)
	    {
	      continue;
	    }

	  if (i->InRoom && IsBitSet(i->InRoom->Flags, ROOM_ARENA))
	    {
	      SendToCharacter("\r\nThe floor falls out from below, dropping you in the arena.\r\n", i);
	      CharacterFromRoom(i);
	      CharacterToRoom(i, GetRoom( ARENA_START));
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
      arena.PeopleIsInArena = 0;
      arena.PeopleChallenged = 0;
      FindGameWinner();
    }
  else if(arena.TimeLeftInGame == 0)
    {
      DoEndGame();
    }
  else if(CharactersInArena() == 0)
    {
      arena.PeopleIsInArena = 0;
      arena.PeopleChallenged = 0;
      SilentEnd();
    }
  else if(arena.TimeLeftInGame % 5)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.TimeLeftInGame, CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.TimeLeftInGame == 1)
    {
      sprintf(buf, "With 1 hour left in the game there are %d players left.",
              CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }
  else if(arena.TimeLeftInGame <= 4)
    {
      sprintf(buf, "With %d hours left in the game there are %d players left.",
              arena.TimeLeftInGame, CharactersInArena());
      ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
    }

  arena.TimeLeftInGame--;
}

static void FindGameWinner(void)
{
  Descriptor *d = NULL;

  for (d = FirstDescriptor; d; d = d->Next)
    {
      Character *i = d->Original ? d->Original : d->Character;

      if (i == NULL)
	{
	  continue;
	}

      if (i->InRoom && IsBitSet(i->InRoom->Flags,ROOM_ARENA)
          && !IsImmortal(i))
        {
          CharacterFromRoom(i);
          CharacterToRoom(i,GetRoom(i->ReTran));
          do_look(i, "auto");
          Act(AT_YELLOW,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
          StopFighting( i, true );

          if (i->Hit > 1)
            {
	      struct HallOfFameElement *fame_node = NULL;
	      char buf[MAX_INPUT_LENGTH];

              if(arena.TimeLeftInGame == 1)
                {
                  sprintf(buf, "After 1 hour of battle %s is declared the winner",i->Name);
                  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }
              else
                {
                  sprintf(buf, "After %d hours of battle %s is declared the winner",
                          arena.GameLength - arena.TimeLeftInGame, i->Name);
                  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
                }

              i->Gold += arena.ArenaPot/2;
              Echo(i, "You have been awarded %d credits for winning the arena\r\n",
			(arena.ArenaPot/2));

              Bug( "%s awarded %d credits for winning arena", i->Name,
		   (arena.ArenaPot/2));

              AllocateMemory(fame_node, struct HallOfFameElement, 1);
              strncpy(fame_node->Name, i->Name, MAX_INPUT_LENGTH);
              fame_node->Name[MAX_INPUT_LENGTH] = '\0';
              fame_node->Date = time(0);
              fame_node->Award = (arena.ArenaPot/2);
              fame_node->Next = FameList;
              FameList = fame_node;

              WriteFameList();
              FindBetWinners(i);
              arena.PeopleIsInArena = 0;
              ResetBets();
              arena.PeopleChallenged = 0;
            }

          i->Hit = i->MaxHit;
          i->Mana = i->MaxMana;
          i->Move = i->MaxMove;
          i->Challenged = NULL;
        }
    }
}

static void ShowJackpot(void)
{
  char buf1[MAX_INPUT_LENGTH];

  sprintf(buf1, "\r\nLets get ready to RUMBLE!!!!!!!!\r\n");
  sprintf(buf1, "%sThe jack pot for this arena is %d credits\r\n",
          buf1, arena.ArenaPot);
  sprintf(buf1, "%s%d credits have been bet on this arena.\r\n",buf1, arena.BetPot);
  ToChannel(buf1,CHANNEL_ARENA,"&RArena&W",5);
}

static void SilentEnd(void)
{
  char buf[MAX_INPUT_LENGTH];

  arena.PeopleIsInArena = 0;
  arena.PeopleChallenged = 0;
  arena.InStartArena = 0;
  arena.StartTime = 0;
  arena.GameLength = 0;
  arena.TimeToStart = 0;
  arena.TimeLeftInGame = 0;
  arena.ArenaPot = 0;
  arena.BetPot = 0;
  sprintf(buf, "It looks like no one was brave enough to enter the Arena.");
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  ResetBets();
}

static void DoEndGame(void)
{
  char buf[MAX_INPUT_LENGTH];
  Descriptor *d = NULL;

  for (d = FirstDescriptor; d; d = d->Next)
    {
      if (!d->ConnectionState)
	{
	  Character *i = d->Character;

	  if (i == NULL)
	    {
	      continue;
	    }

	  if (i->InRoom && IsBitSet(i->InRoom->Flags, ROOM_ARENA))
	    {
	      i->Hit = i->MaxHit;
	      i->Mana = i->MaxMana;
	      i->Move = i->MaxMove;
	      i->Challenged = NULL;
	      StopFighting(i, true);
	      CharacterFromRoom(i);
	      CharacterToRoom(i, GetRoom(i->ReTran));
	      do_look(i,"auto");
	      Act(AT_TELL,"$n falls from the sky.", i, NULL, NULL, TO_ROOM);
	    }
	}
    }

  sprintf(buf, "After %d hours of battle the Match is a draw",arena.GameLength);
  ToChannel(buf,CHANNEL_ARENA,"&RArena&W",5);
  arena.TimeLeftInGame = 0;
  arena.PeopleIsInArena=0;
  arena.PeopleChallenged = 0;
  ResetBets();
}

int CharactersInArena(void)
{
  Descriptor *d;
  int num = 0;

  for (d = FirstDescriptor; d; d = d->Next)
    {
      Character *i = d->Original ? d->Original : d->Character;

      if (i == NULL)
	{
	  continue;
	}

      if (i->InRoom && IsBitSet(i->InRoom->Flags, ROOM_ARENA))
        {
          if (!IsImmortal(i) && i->Hit > 1)
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
      strncpy(next_node->Name, name, MAX_INPUT_LENGTH);
      next_node->Date = date;
      next_node->Award = award;
      next_node->Next = FameList;
      FameList = next_node;
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

  WriteOneFameNode(fl, FameList);/* recursively write from end to start */
  fclose(fl);
}

static void WriteOneFameNode(FILE * fp, struct HallOfFameElement * node)
{
  if (node)
    {
      WriteOneFameNode(fp, node->Next);
      fprintf(fp, "%s %ld %d\n",node->Name,(long) node->Date, node->Award);
    }
}

static void FindBetWinners(Character *winner)
{
  Descriptor *d = NULL;

  for (d = FirstDescriptor; d; d = d->Next)
    {
      if (!d->ConnectionState)
	{
	  Character *wch = d->Original ? d->Original : d->Character;

	  if (wch == NULL)
	    {
	      continue;
	    }

	  if ((!IsNpc(wch)) && (GET_BET_AMT(wch) > 0) && (GET_BETTED_ON(wch) == winner))
	    {
	      Echo(wch, "You have won %d credits on your bet.\r\n",
			(GET_BET_AMT(wch))*2);
	      wch->Gold += GET_BET_AMT(wch)*2;
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

  for (ch = first_char; ch; ch = ch->Next )
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
