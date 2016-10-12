/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "track.h"
#include "mud.h"
#include "character.h"

#define TRACK_THROUGH_DOORS

static bool MobSnipe( Character *ch, Character *victim);

/* You can define or not define TRACK_THOUGH_DOORS, above, depending on
   whether or not you want track to find paths which lead through closed
   or hidden doors.
*/

struct bfs_queue_struct {
  Room *room;
  DirectionType dir;
  struct bfs_queue_struct *next;
};

static struct bfs_queue_struct *queue_head = NULL;
static struct bfs_queue_struct *queue_tail = NULL;
static struct bfs_queue_struct *room_queue = NULL;

/* Utility macros */
#define MARK(room)      (SetBit(       (room)->Flags, BFS_MARK) )
#define UNMARK(room)    (RemoveBit(    (room)->Flags, BFS_MARK) )
#define IS_MARKED(room) (IsBitSet(        (room)->Flags, BFS_MARK) )

static Room *ToRoom( const Room *room, DirectionType door )
{
  return (GetExit( room, door )->to_room);
}

static bool IsValidEdge( const Room *room, DirectionType door )
{
  const Exit *pexit = NULL;
  const Room *to_room = NULL;

  pexit = GetExit( room, door );

  if ( pexit
       &&  (to_room = pexit->to_room) != NULL
#ifndef TRACK_THROUGH_DOORS
       &&  !IsBitSet( pexit->Flags, EX_CLOSED )
#endif
       &&  !IS_MARKED( to_room ) )
    {
      return true;
    }
  else
    {
      return false;
    }
}

static void bfs_enqueue(Room *room, DirectionType dir)
{
  struct bfs_queue_struct *curr = NULL;

  AllocateMemory( curr, struct bfs_queue_struct, 1 );
  curr->room = room;
  curr->dir = dir;

  if (queue_tail)
    {
      queue_tail->next = curr;
      queue_tail = curr;
    }
  else
    {
      queue_head = queue_tail = curr;
    }
}

static void bfs_dequeue( void )
{
  struct bfs_queue_struct *curr = queue_head;

  if (!(queue_head = queue_head->next))
    {
      queue_tail = NULL;
    }

  FreeMemory(curr);
}

static void bfs_clear_queue(void)
{
  while (queue_head)
    {
      bfs_dequeue();
    }
}

static void room_enqueue(Room *room)
{
  struct bfs_queue_struct *curr = NULL;

  AllocateMemory( curr, struct bfs_queue_struct, 1 );
  curr->room = room;
  curr->next = room_queue;

  room_queue = curr;
}

static void CleanRoom_queue(void)
{
  struct bfs_queue_struct *curr = NULL;
  struct bfs_queue_struct *curr_next = NULL;

  for (curr = room_queue; curr; curr = curr_next )
    {
      UNMARK( curr->room );
      curr_next = curr->next;
      FreeMemory( curr );
    }

  room_queue = NULL;
}

int FindFirstStep(Room *src, Room *target, int maxdist )
{
  DirectionType curr_dir = DIR_INVALID;
  int count = 0;

  if ( !src || !target )
    {
      Bug("Illegal value passed to FindFirstStep (track.c)", 0 );
      return BFS_ERROR;
    }

  if (src == target)
    {
      return BFS_ALREADY_THERE;
    }

  if ( src->Area != target->Area )
    {
      return BFS_NO_PATH;
    }

  room_enqueue( src );
  MARK(src);

  /* first, enqueue the first steps, saving which direction we're going. */
  for (curr_dir = DIR_NORTH; curr_dir < DIR_SOMEWHERE; curr_dir = (DirectionType)(curr_dir + 1) )
    {
      if (IsValidEdge(src, curr_dir))
	{
	  MARK(ToRoom(src, curr_dir));
	  room_enqueue(ToRoom(src, curr_dir));
	  bfs_enqueue(ToRoom(src, curr_dir), curr_dir);
	}
    }

  count = 0;

  while (queue_head)
    {
      if ( ++count > maxdist )
	{
	  bfs_clear_queue();
	  CleanRoom_queue();
	  return BFS_NO_PATH;
	}

      if (queue_head->room == target)
	{
	  curr_dir = queue_head->dir;
	  bfs_clear_queue();
	  CleanRoom_queue();
	  return curr_dir;
	}
      else
	{
	  for (curr_dir = DIR_NORTH; curr_dir < DIR_SOMEWHERE; curr_dir = (DirectionType)(curr_dir + 1) )
	    {
	      if (IsValidEdge(queue_head->room, curr_dir))
		{
		  MARK(ToRoom(queue_head->room, curr_dir));
		  room_enqueue(ToRoom(queue_head->room, curr_dir));
		  bfs_enqueue(ToRoom(queue_head->room, curr_dir),queue_head->dir);
		}
	    }

	  bfs_dequeue();
	}
    }

  CleanRoom_queue();

  return BFS_NO_PATH;
}

void FoundPrey( Character *ch, Character *victim )
{
  char buf[MAX_STRING_LENGTH];
  char victname[MAX_STRING_LENGTH];

  if (victim == NULL)
    {
      Bug("Found_prey: null victim");
      return;
    }

  if (ch == NULL)
    {
      Bug("Found_prey: null ch");
      return;
    }

  if ( victim->InRoom == NULL )
    {
      Bug( "Found_prey: null victim->in_room" );
      return;
    }

  sprintf( victname, "%s", IsNpc( victim ) ? victim->ShortDescr : victim->Name );

  if ( !CanSeeCharacter(ch, victim) )
    {
      if ( GetRandomPercent() < 90 )
	{
	  return;
	}

      switch( NumberBits( 2 ) )
        {
        case 0:
	  sprintf( buf, "Don't make me find you!" );
          do_say( ch, buf );
          break;

        case 1:
	  Act( AT_ACTION, "$n sniffs around the room for someone.", ch, NULL, victim, TO_NOTVICT );
          Act( AT_ACTION, "You sniff around the room for someone.", ch, NULL, victim, TO_CHAR );
          Act( AT_ACTION, "$n sniffs around the room for someone.", ch, NULL, victim, TO_VICT );
          sprintf( buf, "I can smell your blood!" );
          do_say( ch, buf );
          break;

        case 2:
	  sprintf( buf, "I'm going to tear you apart!" );
          do_yell( ch, buf );
          break;

        case 3:
	  do_say( ch, "Just wait until I find you...");
          break;
        }

      return;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      if ( GetRandomPercent() < 90 )
	{
	  return;
	}

      switch( NumberBits( 2 ) )
        {
        case 0:
	  do_say( ch, "C'mon out, you coward!" );
          sprintf( buf, "%s is a bloody coward!", victname );
          do_yell( ch, buf );
          break;

        case 1: sprintf( buf, "Let's take this outside, %s", victname );
          do_say( ch, buf );
          break;

        case 2:
	  sprintf( buf, "%s is a yellow-bellied wimp!", victname );
          do_yell( ch, buf );
          break;

        case 3:
	  Act( AT_ACTION, "$n takes a few swipes at someone.", ch, NULL, victim, TO_NOTVICT );
          Act( AT_ACTION, "You try to take a few swipes someone.", ch, NULL, victim, TO_CHAR );
          Act( AT_ACTION, "$n takes a few swipes at you.", ch, NULL, victim, TO_VICT );
          break;
        }

      return;
    }

  switch( NumberBits( 2 ) )
    {
    case 0:
      sprintf( buf, "Your blood is mine!" );
      do_yell( ch, buf);
      break;

    case 1:
      sprintf( buf, "Alas, we meet again!" );
      do_say( ch, buf );
      break;

    case 2:
      sprintf( buf, "What do you want on your tombstone?" );
      do_say( ch, buf );
      break;

    case 3:
      Act( AT_ACTION, "$n lunges at $N from out of nowhere!", ch, NULL, victim, TO_NOTVICT );
      Act( AT_ACTION, "You lunge at $N catching $M off guard!", ch, NULL, victim, TO_CHAR );
      Act( AT_ACTION, "$n lunges at you from out of nowhere!", ch, NULL, victim, TO_VICT );
      break;
    }

  StopHunting( ch );
  StartFighting( ch, victim );
  HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
}

void HuntVictim( Character *ch )
{
  bool found = false;
  Character *tmp = NULL;
  DirectionType ret;

  if (!ch || !ch->hhf.hunting || !ch->hhf.hunting->who )
    {
      return;
    }

  /* make sure the char still exists */
  for (found = false, tmp = first_char; tmp && !found; tmp = tmp->next)
    {
      if (ch->hhf.hunting->who == tmp)
	{
	  found = true;
	}
    }

  if (!found)
    {
      do_say(ch, "Damn! My prey is gone!" );
      StopHunting( ch );
      return;
    }

  if ( ch->InRoom == ch->hhf.hunting->who->InRoom )
    {
      if ( ch->Fighting )
	{
	  return;
	}

      FoundPrey( ch, ch->hhf.hunting->who );
      return;
    }

  /* hunting with snipe */
  {
    Object *wield = GetEquipmentOnCharacter( ch, WEAR_WIELD );

    if ( wield != NULL && wield->value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER  )
      {
        if ( MobSnipe( ch, ch->hhf.hunting->who ) == true )
	  {
	    return;
	  }
      }
    else if ( !IsBitSet( ch->Flags, ACT_DROID ) )
      {
	do_hide ( ch, "" );
      }
  }

  ret = (DirectionType)FindFirstStep(ch->InRoom, ch->hhf.hunting->who->InRoom, 5000);

  if ( ret == BFS_NO_PATH )
    {
      Exit *pexit = NULL;
      int attempt = 0;

      for ( attempt = 0; attempt < 25; attempt++ )
        {
          ret = (DirectionType)GetRandomDoor();

          if ( ( pexit = GetExit(ch->InRoom, ret) ) == NULL
               || !pexit->to_room
               || IsBitSet(pexit->Flags, EX_CLOSED)
               || IsBitSet(pexit->to_room->Flags, ROOM_NO_MOB) )
	    {
	      continue;
	    }
        }
    }

  if ( ret < 0)
    {
      do_say( ch, "Damn! Lost my prey!" );
      StopHunting( ch );
      return;
    }
  else
    {
      MoveCharacter( ch, GetExit( ch->InRoom, ret), false );

      if ( CharacterDiedRecently(ch) )
	{
	  return;
	}

      if ( !ch->hhf.hunting )
        {
          if ( !ch->InRoom )
            {
              Bug( "Hunt_victim: no ch->in_room! Mob #%ld, name: %s. Placing mob in limbo.",
		   ch->Prototype->Vnum, ch->Name );
              CharacterToRoom( ch, GetRoom( ROOM_VNUM_LIMBO ) );
              return;
            }
          do_say( ch, "Damn!  Lost my prey!" );
          return;
        }

      if (ch->InRoom == ch->hhf.hunting->who->InRoom)
	{
	  FoundPrey( ch, ch->hhf.hunting->who );
	}

      return;
    }
}

static bool MobSnipe( Character *ch, Character *victim )
{
  DirectionType dir = DIR_INVALID;
  short dist = 0;
  short max_dist = 3;
  Exit *pexit = NULL;
  Room *was_in_room = NULL;
  Room *to_room = NULL;
  char buf[MAX_STRING_LENGTH];
  bool pfound = false;

  if ( !ch->InRoom || !victim->InRoom )
    {
      return false;
    }

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      return false;
    }

  for ( dir = DIR_NORTH ; dir <= DIR_SOMEWHERE ; dir = (DirectionType)(dir + 1) )
    {
      if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
	{
	  continue;
	}

      if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
	{
	  continue;
	}

      was_in_room = ch->InRoom;

      for ( dist = 0; dist <= max_dist; dist++ )
        {
          if ( IsBitSet( pexit->Flags, EX_CLOSED ) )
	    {
	      break;
	    }

          if ( !pexit->to_room )
	    {
	      break;
	    }

          to_room = NULL;

          if ( pexit->distance > 1 )
	    {
	      to_room = GenerateExit( ch->InRoom , &pexit );
	    }

          if ( to_room == NULL )
	    {
	      to_room = pexit->to_room;
	    }

          CharacterFromRoom( ch );
          CharacterToRoom( ch, to_room );

          if ( ch->InRoom == victim->InRoom )
            {
              pfound = true;
              break;
            }

          if ( ( pexit = GetExit( ch->InRoom, dir ) ) == NULL )
	    {
	      break;
	    }
        }

      CharacterFromRoom( ch );
      CharacterToRoom( ch, was_in_room );

      if ( !pfound )
        {
          CharacterFromRoom( ch );
          CharacterToRoom( ch, was_in_room );
          continue;
        }

      if ( IsBitSet( victim->InRoom->Flags, ROOM_SAFE ) )
	{
	  return false;
	}

      if ( IsSafe( ch, victim ) )
	{
	  return false;
	}

      if ( IsAffectedBy(ch, AFF_CHARM) && ch->Master == victim )
	{
	  return false;
	}

      if ( ch->Position == POS_FIGHTING )
	{
	  return false;
	}

      if ( !CanSeeCharacter(ch, victim))
	{
	  return false;
	}

      switch ( dir )
        {
        case DIR_NORTH:
        case DIR_EAST:
          dir = (DirectionType)(dir + 2);
          break;

        case DIR_SOUTH:
        case DIR_WEST:
          dir = (DirectionType)(dir - 2);
          break;

        case DIR_UP:
        case DIR_NORTHWEST:
          dir = (DirectionType)(dir + 1);
          break;

        case DIR_DOWN:
        case DIR_SOUTHEAST:
          dir = (DirectionType)(dir - 1);
          break;

        case DIR_NORTHEAST:
          dir = (DirectionType)(dir + 3);
          break;

        case DIR_SOUTHWEST:
          dir = (DirectionType)(dir - 3);
          break;

	default:
	  break;
        }

      CharacterFromRoom( ch );
      CharacterToRoom( ch, victim->InRoom );

      sprintf( buf , "A blaster shot fires at you from the %s.",
               GetDirectionName(dir) );
      Act( AT_ACTION, buf , victim, NULL, ch, TO_CHAR );
      Act( AT_ACTION, "You fire at $N.", ch, NULL, victim, TO_CHAR );
      sprintf( buf, "A blaster shot fires at $N from the %s.",
               GetDirectionName(dir) );
      Act( AT_ACTION, buf, ch, NULL, victim, TO_NOTVICT );

      HitOnce( ch, victim, TYPE_UNDEFINED );

      if ( CharacterDiedRecently(ch) )
	{
	  return true;
	}

      StopFighting( ch , true );

      if ( victim && !CharacterDiedRecently(victim) && victim->Hit < 0 )
        {
          StopHunting( ch );
          StopHating( ch );
        }

      CharacterFromRoom( ch );
      CharacterToRoom( ch, was_in_room );

      return true;
    }

  return false;
}
