/***************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik St{rfeldt, Tom Madsen, and Katja Nyboe.     *
 * ------------------------------------------------------------------------ *
 *                         Player movement module                          *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "character.h"
#include "mud.h"

ROOM_INDEX_DATA *vroom_hash[64];

int wherehome( const Character *ch)
{
  if( ch->plr_home )
    return ch->plr_home->vnum;

  if( get_trust(ch) >= LEVEL_IMMORTAL )
    return ROOM_START_IMMORTAL;
  if( ch->race  == RACE_HUMAN)
    return ROOM_START_HUMAN;
  if( ch->race  == RACE_WOOKIEE)
    return ROOM_START_WOOKIEE;
  if( ch->race  == RACE_RODIAN)
    return ROOM_START_RODIAN;
  if( ch->race  == RACE_MON_CALAMARI)
    return ROOM_START_MON_CALAMARIAN;
  if( ch->race  == RACE_TWI_LEK)
    return ROOM_START_TWILEK;
  if( ch->race  == RACE_HUTT)
    return ROOM_START_HUTT;
  if( ch->race  == RACE_GAMORREAN)
    return ROOM_START_GAMORREAN;
  if( ch->race  == RACE_JAWA)
    return ROOM_START_JAWA;
  if( ch->race  == RACE_ADARIAN)
    return ROOM_START_ADARIAN;
  if( ch->race  == RACE_EWOK)
    return ROOM_START_EWOK;
  if( ch->race  == RACE_VERPINE)
    return ROOM_START_VERPINE;
  if( ch->race  == RACE_DEFEL)
    return ROOM_START_DEFEL;
  if( ch->race  == RACE_TRANDOSHAN)
    return ROOM_START_TRANDOSHAN;
  if( ch->race  == RACE_CHADRA_FAN)
    return ROOM_START_CHADRA_FAN;
  if( ch->race  == RACE_QUARREN)
    return ROOM_START_QUARREN;
  if( ch->race  == RACE_SULLUSTAN)
    return ROOM_START_SULLUSTAN;

  return ROOM_VNUM_TEMPLE;
}

static void decorate_room( ROOM_INDEX_DATA *room )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  int nRand;
  int iRand, len;
  int previous[8];
  int sector = room->sector_type;

  if ( room->name )
    STRFREE( room->name );
  if ( room->description )
    STRFREE( room->description );

  room->name    = STRALLOC( sect_names[sector][0] );
  buf[0] = '\0';
  nRand = number_range( 1, UMIN(8,sent_total[sector]) );

  for ( iRand = 0; iRand < nRand; iRand++ )
    previous[iRand] = -1;

  for ( iRand = 0; iRand < nRand; iRand++ )
    {
      while ( previous[iRand] == -1 )
        {
          int x, z;

          x = number_range( 0, sent_total[sector]-1 );

          for ( z = 0; z < iRand; z++ )
            if ( previous[z] == x )
              break;

          if ( z < iRand )
            continue;

          previous[iRand] = x;

          len = strlen(buf);
          sprintf( buf2, "%s", room_sents[sector][x] );
          if ( len > 5 && buf[len-1] == '.' )
            {
              strcat( buf, "  " );
              buf2[0] = UPPER(buf2[0] );
            }
          else
            if ( len == 0 )
              buf2[0] = UPPER(buf2[0] );
          strcat( buf, buf2 );
        }
    }
  sprintf( buf2, "%s\r\n", wordwrap(buf, 78) );
  room->description = STRALLOC( buf2 );
}

/*
 * Remove any unused virtual rooms                              -Thoric
 */
void clear_vrooms( void )
{
  int hash;
  ROOM_INDEX_DATA *room, *room_next, *prev;

  for ( hash = 0; hash < 64; hash++ )
    {
      int peopleInRoom = List_Count( vroom_hash[hash]->People );

      while ( vroom_hash[hash]
              && peopleInRoom == 0
              && !vroom_hash[hash]->first_content )
        {
          room = vroom_hash[hash];
          vroom_hash[hash] = room->next;
          clean_room( room );
	  DestroyList( room->People );
          DISPOSE( room );
          --top_vroom;
        }

      prev = NULL;

      for ( room = vroom_hash[hash]; room; room = room_next )
        {
	  peopleInRoom = List_Count( room->People );
          room_next = room->next;

          if ( peopleInRoom == 0 && !room->first_content )
            {
              if ( prev )
                prev->next = room_next;

              clean_room( room );
	      DestroyList( room->People );
              DISPOSE( room );
              --top_vroom;
            }

          if ( room )
            prev = room;
        }
    }
}

/*
 * Function to get the equivelant exit of DIR 0-MAXDIR out of linked list.
 * Made to allow old-style diku-merc exit functions to work.    -Thoric
 */
EXIT_DATA *get_exit( const ROOM_INDEX_DATA *room, short dir )
{
  EXIT_DATA *xit;

  if ( !room )
    {
      bug( "Get_exit: NULL room", 0 );
      return NULL;
    }

  for (xit = room->first_exit; xit; xit = xit->next )
    if ( xit->vdir == dir )
      return xit;
  return NULL;
}

/*
 * Function to get an exit, leading the the specified room
 */
EXIT_DATA *get_exit_to( const ROOM_INDEX_DATA *room, short dir, int vnum )
{
  EXIT_DATA *xit;

  if ( !room )
    {
      bug( "Get_exit: NULL room", 0 );
      return NULL;
    }

  for (xit = room->first_exit; xit; xit = xit->next )
    if ( xit->vdir == dir && xit->vnum == vnum )
      return xit;
  return NULL;
}

/*
 * Function to get the nth exit of a room                       -Thoric
 */
EXIT_DATA *get_exit_num( const ROOM_INDEX_DATA *room, short count )
{
  EXIT_DATA *xit;
  int cnt;

  if ( !room )
    {
      bug( "Get_exit: NULL room", 0 );
      return NULL;
    }

  for (cnt = 0, xit = room->first_exit; xit; xit = xit->next )
    if ( ++cnt == count )
      return xit;
  return NULL;
}


/*
 * Modify movement due to encumbrance                           -Thoric
 */
short encumbrance( const Character *ch, short move )
{
  int cur, max;

  max = can_carry_w(ch);
  cur = ch->carry_weight;

  if ( cur >= max )
    return move * 4;
  else
    if ( cur >= max * 0.95 )
      return move * 3.5;
    else
      if ( cur >= max * 0.90 )
        return move * 3;
      else
        if ( cur >= max * 0.85 )
          return move * 2.5;
        else
          if ( cur >= max * 0.80 )
            return move * 2;
          else
            if ( cur >= max * 0.75 )
              return move * 1.5;
            else
              return move;
}


/*
 * Check to see if a character can fall down, checks for looping   -Thoric
 */
bool will_fall( Character *ch, int fall )
{
  if ( IS_SET( ch->in_room->room_flags, ROOM_NOFLOOR )
       &&   CAN_GO(ch, DIR_DOWN)
       && (!is_affected_by( ch, AFF_FLYING )
           || ( ch->mount && !is_affected_by( ch->mount, AFF_FLYING ) ) ) )
    {
      if ( fall > 80 )
        {
          bug( "Falling (in a loop?) more than 80 rooms: vnum %d", ch->in_room->vnum );
          char_from_room( ch );
          char_to_room( ch, get_room_index( wherehome(ch) ) );
          fall = 0;
          return TRUE;
        }
      set_char_color( AT_FALLING, ch );
      send_to_char( "You're falling down...\r\n", ch );
      move_char( ch, get_exit(ch->in_room, DIR_DOWN), ++fall );
      return TRUE;
    }
  return FALSE;
}


/*
 * create a 'virtual' room                                      -Thoric
 */
ROOM_INDEX_DATA *generate_exit( ROOM_INDEX_DATA *in_room, EXIT_DATA **pexit )
{
  EXIT_DATA *xit, *bxit;
  EXIT_DATA *orig_exit = (EXIT_DATA *) *pexit;
  ROOM_INDEX_DATA *room, *backroom;
  int brvnum;
  int serial;
  int roomnum;
  int distance = -1;
  int vdir = orig_exit->vdir;
  short hash;
  bool found = FALSE;

  if ( in_room->vnum > MAX_VNUM )  /* room is virtual */
    {
      serial = in_room->vnum;
      roomnum = in_room->tele_vnum;

      if ( (serial & 65535) == orig_exit->vnum )
        {
          brvnum = serial >> 16;
          --roomnum;
          distance = roomnum;
        }
      else
        {
          brvnum = serial & 65535;
          ++roomnum;
          distance = orig_exit->distance - 1;
        }

      backroom = get_room_index( brvnum );
    }
  else
    {
      int r1 = in_room->vnum;
      int r2 = orig_exit->vnum;

      brvnum = r1;
      backroom = in_room;
      serial = (UMAX( r1, r2 ) << 16) | UMIN( r1, r2 );
      distance = orig_exit->distance - 1;
      roomnum = r1 < r2 ? 1 : distance;
    }

  hash = serial % 64;

  for ( room = vroom_hash[hash]; room; room = room->next )
    if ( room->vnum == serial && room->tele_vnum == roomnum )
      {
        found = TRUE;
        break;
      }

  if ( !found )
    {
      CREATE( room, ROOM_INDEX_DATA, 1 );
      room->area          = in_room->area;
      room->vnum          = serial;
      room->tele_vnum     = roomnum;
      room->sector_type = in_room->sector_type;
      room->room_flags  = in_room->room_flags;
      decorate_room( room );
      room->next          = vroom_hash[hash];
      vroom_hash[hash]  = room;
      ++top_vroom;
      room->People = CreateList();
    }

  if ( !found || (xit=get_exit(room, vdir))==NULL )
    {
      xit = make_exit(room, orig_exit->to_room, vdir);
      xit->keyword              = STRALLOC( "" );
      xit->description  = STRALLOC( "" );
      xit->key          = -1;
      xit->distance = distance;
    }

  if ( !found )
    {
      bxit = make_exit(room, backroom, get_rev_dir(vdir));
      bxit->keyword             = STRALLOC( "" );
      bxit->description = STRALLOC( "" );
      bxit->key         = -1;

      if ( (serial & 65535) != orig_exit->vnum )
	{
	  bxit->distance = roomnum;
	}
      else
        {
          EXIT_DATA *tmp = get_exit( backroom, vdir );
          int fulldist = tmp->distance;

          bxit->distance = fulldist - distance;
        }
    }

  *pexit = xit;
  return room;
}

ch_ret move_char( Character *ch, EXIT_DATA *pexit, int fall )
{
  ROOM_INDEX_DATA *in_room = NULL;
  ROOM_INDEX_DATA *to_room = NULL;
  ROOM_INDEX_DATA *from_room = NULL;
  char buf[MAX_STRING_LENGTH];
  const char *txt = NULL;
  const char *dtxt = NULL;
  ch_ret retcode = rNONE;
  short door = DIR_INVALID;
  short distance = 0;
  bool drunk = FALSE;
  bool brief = FALSE;
  int hpmove = 0;

  if ( !is_npc( ch ) && is_drunk( ch ) && ( ch->position != POS_SHOVE )
         && ( ch->position != POS_DRAG ) )
    {
      drunk = TRUE;
    }

  if ( drunk && !fall )
    {
      door = number_door();
      pexit = get_exit( ch->in_room, door );
    }

#ifdef DEBUG
  if ( pexit )
    {
      sprintf( buf, "move_char: %s to door %d", ch->name, pexit->vdir );
      log_string( buf );
    }
#endif

  if ( is_npc(ch) && IS_SET( ch->act, ACT_MOUNTED ) )
    {
      return retcode;
    }

  in_room = ch->in_room;
  from_room = in_room;
  to_room = pexit ? pexit->to_room : NULL;

  if ( !pexit || !to_room )
    {
      if ( drunk )
	{
	  send_to_char( "You hit a wall in your drunken state.\r\n", ch );
	}
      else
	{
	  send_to_char( "Alas, you cannot go that way.\r\n", ch );
	}

      return rNONE;
    }

  door = pexit->vdir;
  distance = pexit->distance;

  /*
   * Exit is only a "window", there is no way to travel in that direction
   * unless it's a door with a window in it             -Thoric
   */
  if ( IS_SET( pexit->exit_info, EX_WINDOW )
       && !IS_SET( pexit->exit_info, EX_ISDOOR ) )
    {
      send_to_char( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_PORTAL) && is_npc(ch) )
    {
      act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_NOMOB)
       && is_npc(ch) && !IS_SET(ch->act, ACT_SCAVENGER) )
    {
      act( AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IS_SET(pexit->exit_info, EX_CLOSED)
       && ( !is_affected_by(ch, AFF_PASS_DOOR)
           || IS_SET(pexit->exit_info, EX_NOPASSDOOR) ) )
    {
      if ( !IS_SET( pexit->exit_info, EX_SECRET )
           && !IS_SET( pexit->exit_info, EX_DIG ) )
        {
          if ( drunk )
            {
              act( AT_PLAIN, "$n runs into the $d in $s drunken state.", ch,
                   NULL, pexit->keyword, TO_ROOM );
              act( AT_PLAIN, "You run into the $d in your drunken state.", ch,
                   NULL, pexit->keyword, TO_CHAR );
            }
          else
	    {
	      act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
	    }
        }
      else
        {
          if ( drunk )
	    {
	      send_to_char( "You hit a wall in your drunken state.\r\n", ch );
	    }
          else
	    {
	      send_to_char( "Alas, you cannot go that way.\r\n", ch );
	    }
        }

      return rNONE;
    }

  /*
   * Crazy virtual room idea, created upon demand.              -Thoric
   */
  if ( distance > 1 )
    {
      if ( (to_room=generate_exit(in_room, &pexit)) == NULL )
	{
	  send_to_char( "Alas, you cannot go that way.\r\n", ch );
	}
    }

  if ( !fall
       && is_affected_by(ch, AFF_CHARM)
       && ch->master
       && in_room == ch->master->in_room )
    {
      send_to_char( "What? And leave your beloved master?\r\n", ch );
      return rNONE;
    }

  if ( room_is_private( ch, to_room ) )
    {
      send_to_char( "That room is private right now.\r\n", ch );
      return rNONE;
    }

  if ( !is_immortal(ch)
       && !is_npc(ch)
       && ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_hard_range )
        {
          set_char_color( AT_TELL, ch );

          switch( to_room->area->low_hard_range - ch->top_level )
            {
            case 1:
              send_to_char( "A voice in your mind says, 'You are nearly ready to go that way...'", ch );
              break;

            case 2:
              send_to_char( "A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'", ch );
              break;

            case 3:
              send_to_char( "A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n", ch);
              break;

            default:
              send_to_char( "A voice in your mind says, 'You are not ready to go down that path.'.\r\n", ch);
            }
          return rNONE;
        }
      else if ( ch->top_level > to_room->area->hi_hard_range )
	{
	  set_char_color( AT_TELL, ch );
	  send_to_char( "A voice in your mind says, 'There is nothing more for you down that path.'", ch );
	  return rNONE;
	}
    }

  if ( !fall && !is_npc(ch) )
    {
      int move = 0;

      if ( in_room->sector_type == SECT_AIR
           || to_room->sector_type == SECT_AIR
           || IS_SET( pexit->exit_info, EX_FLY ) )
        {
          if ( ch->mount && !is_affected_by( ch->mount, AFF_FLYING ) )
            {
              send_to_char( "Your mount can't fly.\r\n", ch );
              return rNONE;
            }
          if ( !ch->mount && !is_affected_by(ch, AFF_FLYING) )
            {
              send_to_char( "You'd need to fly to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( in_room->sector_type == SECT_WATER_NOSWIM
           ||   to_room->sector_type == SECT_WATER_NOSWIM )
        {
          OBJ_DATA *obj = NULL;
          bool found = FALSE;

          if ( ch->mount )
            {
              if ( is_affected_by( ch->mount, AFF_FLYING )
                   || is_affected_by( ch->mount, AFF_FLOATING ) )
		{
		  found = TRUE;
		}
            }
          else if ( is_affected_by(ch, AFF_FLYING)
		    || is_affected_by(ch, AFF_FLOATING) )
	    {
              found = TRUE;
	    }

          /*
           * Look for a boat.
           */
          if ( !found )
	    {
	      for ( obj = ch->first_carrying; obj; obj = obj->next_content )
		{
		  if ( obj->item_type == ITEM_BOAT )
		    {
		      found = TRUE;

		      if ( drunk )
			{
			  txt = "paddles unevenly";
			}
		      else
			{
			  txt = "paddles";
			}

		      break;
		    }
		}
	    }

          if ( !found )
            {
              send_to_char( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( IS_SET( pexit->exit_info, EX_CLIMB ) )
        {
          bool found = FALSE;

          if ( ch->mount && is_affected_by( ch->mount, AFF_FLYING ) )
	    {
	      found = TRUE;
	    }
          else if ( is_affected_by(ch, AFF_FLYING) )
	    {
	      found = TRUE;
	    }

          if ( !found && !ch->mount )
            {
              if ( ( !is_npc(ch) && number_percent( ) > ch->pcdata->learned[gsn_climb] )
                   || drunk || ch->mental_state < -90 )
                {
                  OBJ_DATA *obj = NULL;
                  bool ch_rope = FALSE;

                  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
                    {
                      if (obj->item_type == ITEM_ROPE)
                        {
                          ch_rope = TRUE;
                          break;
                        }
                    }

                  if( !ch_rope )
                    {
                      send_to_char( "You start to climb... but lose your grip and fall!\r\n", ch);
                      learn_from_failure( ch, gsn_climb );

                      if ( pexit->vdir == DIR_DOWN )
                        {
                          retcode = move_char( ch, pexit, 1 );
                          return retcode;
                        }

                      set_char_color( AT_HURT, ch );
                      send_to_char( "OUCH! You hit the ground!\r\n", ch );
                      set_wait_state( ch, 20 );
                      retcode = damage( ch, ch, (pexit->vdir == DIR_UP ? 10 : 5),
                                        TYPE_UNDEFINED );
                      return retcode;
                    }
                }

              found = TRUE;
              learn_from_success( ch, gsn_climb );
              set_wait_state( ch, skill_table[gsn_climb]->beats );
              txt = "climbs";
            }

          if ( !found )
            {
              send_to_char( "You can't climb.\r\n", ch );
              return rNONE;
            }
        }

      if ( ch->mount )
        {
          switch (ch->mount->position)
            {
            case POS_DEAD:
              send_to_char( "Your mount is dead!\r\n", ch );
              return rNONE;
              break;

            case POS_MORTAL:
            case POS_INCAP:
              send_to_char( "Your mount is hurt far too badly to move.\r\n", ch );
              return rNONE;
              break;

            case POS_STUNNED:
              send_to_char( "Your mount is too stunned to do that.\r\n", ch );
              return rNONE;
              break;

            case POS_SLEEPING:
              send_to_char( "Your mount is sleeping.\r\n", ch );
              return rNONE;
              break;

            case POS_RESTING:
              send_to_char( "Your mount is resting.\r\n", ch);
              return rNONE;
              break;

            case POS_SITTING:
              send_to_char( "Your mount is sitting down.\r\n", ch);
              return rNONE;
              break;

            default:
              break;
            }

          if ( !is_affected_by(ch->mount, AFF_FLYING)
               &&   !is_affected_by(ch->mount, AFF_FLOATING) )
	    {
	      move = movement_loss[UMIN(SECT_MAX-1, in_room->sector_type)];
	    }
          else
	    {
	      move = 1;
	    }

          if ( ch->mount->move < move )
            {
              send_to_char( "Your mount is too exhausted.\r\n", ch );
              return rNONE;
            }
        }
      else
        {
          hpmove = 500/( ch->hit? ch->hit : 1 );

          if ( !is_affected_by(ch, AFF_FLYING)
               && !is_affected_by(ch, AFF_FLOATING) )
	    {
	      move = hpmove * encumbrance( ch, movement_loss[UMIN(SECT_MAX-1, in_room->sector_type)] );
	    }
          else
	    {
	      move = 1;
	    }

          if ( ch->move < move )
            {
              send_to_char( "You are too exhausted.\r\n", ch );
              return rNONE;
            }
        }

      set_wait_state( ch, move );

      if ( ch->mount )
	{
	  ch->mount->move -= move;
	}
      else
	{
	  ch->move -= move;
	}
    }

  /*
   * Check if player can fit in the room
   */
  if ( to_room->tunnel > 0 )
    {
      int count = ch->mount ? 1 : 0;
      CerisListIterator *iter = CreateListIterator( to_room->People, ForwardsIterator );

      for( ; !ListIterator_IsDone( iter ); ListIterator_Next( iter ) )
	{
	  if ( ++count >= to_room->tunnel )
	    {
	      if ( ch->mount && count == to_room->tunnel )
		{
		  send_to_char( "There is no room for both you and your mount in there.\r\n", ch );
		}
	      else
		{
		  send_to_char( "There is no room for you in there.\r\n", ch );
		}

	      DestroyListIterator( iter );
	      return rNONE;
	    }
	}

      DestroyListIterator( iter );
    }

  /* check for traps on exit - later */

  if ( !is_affected_by(ch, AFF_SNEAK)
       && ( is_npc(ch) || !IS_SET(ch->act, PLR_WIZINVIS) ) )
    {
      if ( fall )
	{
	  txt = "falls";
	}
      else
        if ( !txt )
          {
            if ( ch->mount )
              {
                if ( is_affected_by( ch->mount, AFF_FLOATING ) )
		  {
		    txt = "floats";
		  }
                else if ( is_affected_by( ch->mount, AFF_FLYING ) )
		  {
                    txt = "flys";
		  }
		else
		  {
                    txt = "rides";
		  }
              }
            else
              {
                if ( is_affected_by( ch, AFF_FLOATING ) )
                  {
                    if ( drunk )
		      {
			txt = "floats unsteadily";
		      }
                    else
		      {
			txt = "floats";
		      }
                  }
                else
                  if ( is_affected_by( ch, AFF_FLYING ) )
                    {
                      if ( drunk )
			{
			  txt = "flys shakily";
			}
                      else
			{
			  txt = "flys";
			}
                    }
                  else
                    if ( ch->position == POS_SHOVE )
		      {
			txt = "is shoved";
		      }
                    else
                      if ( ch->position == POS_DRAG )
			{
			  txt = "is dragged";
			}
                      else
                        {
                          if ( drunk )
			    {
			      txt = "stumbles drunkenly";
			    }
                          else
			    {
			      txt = "leaves";
			    }
                        }
              }
          }

      if ( ch->mount )
        {
          sprintf( buf, "$n %s %s upon $N.", txt, get_dir_name(door) );
          act( AT_ACTION, buf, ch, NULL, ch->mount, TO_NOTVICT );
        }
      else
        {
          sprintf( buf, "$n %s $T.", txt );
          act( AT_ACTION, buf, ch, NULL, get_dir_name(door), TO_ROOM );
        }
    }

  rprog_leave_trigger( ch );

  if( char_died(ch) )
    {
      return global_retcode;
    }

  char_from_room( ch );

  if ( ch->mount )
    {
      rprog_leave_trigger( ch->mount );

      if( char_died(ch) )
	{
	  return global_retcode;
	}

      if( ch->mount )
        {
          char_from_room( ch->mount );
          char_to_room( ch->mount, to_room );
        }
    }

  char_to_room( ch, to_room );

  if ( !is_affected_by(ch, AFF_SNEAK)
       && ( is_npc(ch) || !IS_SET(ch->act, PLR_WIZINVIS) ) )
    {
      if ( fall )
	{
	  txt = "falls";
	}
      else
        if ( ch->mount )
          {
            if ( is_affected_by( ch->mount, AFF_FLOATING ) )
              txt = "floats in";
            else
              if ( is_affected_by( ch->mount, AFF_FLYING ) )
                txt = "flys in";
              else
                txt = "rides in";
          }
        else
          {
            if ( is_affected_by( ch, AFF_FLOATING ) )
              {
                if ( drunk )
                  txt = "floats in unsteadily";
                else
                  txt = "floats in";
              }
            else
              if ( is_affected_by( ch, AFF_FLYING ) )
                {
                  if ( drunk )
                    txt = "flys in shakily";
                  else
                    txt = "flys in";
                }
              else
                if ( ch->position == POS_SHOVE )
                  txt = "is shoved in";
                else
                  if ( ch->position == POS_DRAG )
                    txt = "is dragged in";
                  else
                    {
                      if ( drunk )
                        txt = "stumbles drunkenly in";
                      else
                        txt = "arrives";
                    }
          }

      switch( door )
        {
        default:
	  dtxt = "somewhere";
	  break;

        case DIR_NORTH:
	  dtxt = "the south";
	  break;

        case DIR_EAST:
	  dtxt = "the west";
	  break;

        case DIR_SOUTH:
	  dtxt = "the north";
	  break;

        case DIR_WEST:
	  dtxt = "the east";
	  break;
	  
        case DIR_UP:
	  dtxt = "below";
	  break;

        case DIR_DOWN:
	  dtxt = "above";
	  break;

        case DIR_NORTHEAST:
	  dtxt = "the south-west";
	  break;

        case DIR_NORTHWEST:
	  dtxt = "the south-east";
	  break;

        case DIR_SOUTHEAST:
	  dtxt = "the north-west";
	  break;

        case DIR_SOUTHWEST:
	  dtxt = "the north-east";
	  break;
        }

      if ( ch->mount )
        {
          sprintf( buf, "$n %s from %s upon $N.", txt, dtxt );
          act( AT_ACTION, buf, ch, NULL, ch->mount, TO_ROOM );
        }
      else
        {
          sprintf( buf, "$n %s from %s.", txt, dtxt );
          act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
        }
    }

  if ( !is_immortal(ch)
       &&  !is_npc(ch)
       &&  ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_soft_range )
        {
          set_char_color( AT_MAGIC, ch );
          send_to_char("You feel uncomfortable being in this strange land...\r\n", ch);
        }
      else if ( ch->top_level > to_room->area->hi_soft_range )
	{
	  set_char_color( AT_MAGIC, ch );
	  send_to_char("You feel there is not much to gain visiting this place...\r\n", ch);
	}
    }

  do_look( ch, "auto" );

  if ( brief )
    {
      SET_BIT( ch->act, PLR_BRIEF );
    }

  /* BIG ugly looping problem here when the character is mptransed back
     to the starting room.  To avoid this, check how many chars are in
     the room at the start and stop processing followers after doing
     the right number of them.  -- Narn
  */
  if ( !fall )
    {
      int count = 0;
      int chars = List_Count( from_room->People );
      CerisList *peopleInOriginRoom = List_Copy( from_room->People );
      CerisListIterator *iter = CreateListIterator( peopleInOriginRoom, ForwardsIterator );

      for( ; !ListIterator_IsDone( iter ) && count < chars; ListIterator_Next( iter ) )
        {
	  Character *follower = (Character*) ListIterator_GetData( iter );
          count++;

          if ( follower != ch                /* loop room bug fix here by Thoric */
               && follower->master == ch
               && follower->position == POS_STANDING )
            {
              act( AT_ACTION, "You follow $N.", follower, NULL, ch, TO_CHAR );
              move_char( follower, pexit, 0 );
            }
        }

      DestroyListIterator( iter );
      DestroyList( peopleInOriginRoom );
    }

  if ( ch->in_room->first_content )
    {
      retcode = check_room_for_traps( ch, TRAP_ENTER_ROOM );
    }

  if ( retcode != rNONE )
    {
      return retcode;
    }

  if ( char_died(ch) )
    {
      return retcode;
    }

  mprog_entry_trigger( ch );

  if ( char_died(ch) )
    {
      return retcode;
    }

  rprog_enter_trigger( ch );

  if ( char_died(ch) )
    {
      return retcode;
    }

  mprog_greet_trigger( ch );

  if ( char_died(ch) )
    {
      return retcode;
    }

  oprog_greet_trigger( ch );

  if ( char_died(ch) )
    {
      return retcode;
    }

  if (!will_fall( ch, fall )
      && fall > 0 )
    {
      if (!is_affected_by( ch, AFF_FLOATING )
          || ( ch->mount && !is_affected_by( ch->mount, AFF_FLOATING ) ) )
        {
          set_char_color( AT_HURT, ch );
          send_to_char( "OUCH! You hit the ground!\r\n", ch );
          set_wait_state( ch, 20 );
          retcode = damage( ch, ch, 50 * fall, TYPE_UNDEFINED );
        }
      else
        {
          set_char_color( AT_MAGIC, ch );
          send_to_char( "You lightly float down to the ground.\r\n", ch );
        }
    }

  return retcode;
}

EXIT_DATA *find_door( Character *ch, const char *arg, bool quiet )
{
  EXIT_DATA *pexit;
  int door;

  if (arg == NULL || !str_cmp(arg,""))
    return NULL;

  pexit = NULL;
  if ( !str_cmp( arg, "n"  ) || !str_cmp( arg, "north"    ) ) door = 0;
  else if ( !str_cmp( arg, "e"  ) || !str_cmp( arg, "east"        ) ) door = 1;
  else if ( !str_cmp( arg, "s"  ) || !str_cmp( arg, "south"       ) ) door = 2;
  else if ( !str_cmp( arg, "w"  ) || !str_cmp( arg, "west"        ) ) door = 3;
  else if ( !str_cmp( arg, "u"  ) || !str_cmp( arg, "up"          ) ) door = 4;
  else if ( !str_cmp( arg, "d"  ) || !str_cmp( arg, "down"        ) ) door = 5;
  else if ( !str_cmp( arg, "ne" ) || !str_cmp( arg, "northeast" ) ) door = 6;
  else if ( !str_cmp( arg, "nw" ) || !str_cmp( arg, "northwest" ) ) door = 7;
  else if ( !str_cmp( arg, "se" ) || !str_cmp( arg, "southeast" ) ) door = 8;
  else if ( !str_cmp( arg, "sw" ) || !str_cmp( arg, "southwest" ) ) door = 9;
  else
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
        {
          if ( (quiet || IS_SET(pexit->exit_info, EX_ISDOOR))
               &&    pexit->keyword
               &&    nifty_is_name( arg, pexit->keyword ) )
            return pexit;
        }
      if ( !quiet )
        act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
      return NULL;
    }

  if ( (pexit = get_exit( ch->in_room, door )) == NULL )
    {
      if ( !quiet)
        act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
      return NULL;
    }

  if ( quiet )
    return pexit;

  if ( IS_SET(pexit->exit_info, EX_SECRET) )
    {
      act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
      return NULL;
    }

  if ( !IS_SET(pexit->exit_info, EX_ISDOOR) )
    {
      send_to_char( "You can't do that.\r\n", ch );
      return NULL;
    }

  return pexit;
}

void toggle_bexit_flag( EXIT_DATA *pexit, int flag )
{
  EXIT_DATA *pexit_rev;

  TOGGLE_BIT(pexit->exit_info, flag);
  if ( (pexit_rev = pexit->rexit) != NULL
       &&   pexit_rev != pexit )
    TOGGLE_BIT( pexit_rev->exit_info, flag );
}

void set_bexit_flag( EXIT_DATA *pexit, int flag )
{
  EXIT_DATA *pexit_rev;

  SET_BIT(pexit->exit_info, flag);
  if ( (pexit_rev = pexit->rexit) != NULL
       &&   pexit_rev != pexit )
    SET_BIT( pexit_rev->exit_info, flag );
}

void remove_bexit_flag( EXIT_DATA *pexit, int flag )
{
  EXIT_DATA *pexit_rev;

  REMOVE_BIT(pexit->exit_info, flag);
  if ( (pexit_rev = pexit->rexit) != NULL
       &&   pexit_rev != pexit )
    REMOVE_BIT( pexit_rev->exit_info, flag );
}

bool has_key( const Character *ch, int key )
{
  OBJ_DATA *obj;

  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->pIndexData->vnum == key || obj->value[0] == key )
      return TRUE;

  return FALSE;
}

/*
 * teleport a character to another room
 */
void teleportch( Character *ch, ROOM_INDEX_DATA *room, bool show )
{
  if ( room_is_private( ch, room ) )
    {
      return;
    }

  act( AT_ACTION, "$n disappears suddenly!", ch, NULL, NULL, TO_ROOM );
  char_from_room( ch );
  char_to_room( ch, room );
  act( AT_ACTION, "$n arrives suddenly!", ch, NULL, NULL, TO_ROOM );

  if ( show )
    {
      do_look( ch, "auto" );
    }
}

void teleport( Character *ch, short room, int flags )
{
  bool show = FALSE;
  ROOM_INDEX_DATA *pRoomIndex = get_room_index( room );

  if ( !pRoomIndex )
    {
      bug( "teleport: bad room vnum %d", room );
      return;
    }

  if ( IS_SET( flags, TELE_SHOWDESC ) )
    {
      show = TRUE;
    }
  else
    {
      show = FALSE;
    }

  if ( !IS_SET( flags, TELE_TRANSALL ) )
    {
      teleportch( ch, pRoomIndex, show );
      return;
    }
  else
    {
      CerisList *peopleInOriginRoom = List_Copy( ch->in_room->People );
      CerisListIterator *personIterator = CreateListIterator( peopleInOriginRoom, ForwardsIterator );

      for( ; !ListIterator_IsDone( personIterator ); ListIterator_Next( personIterator ) )
	{
	  Character *follower = (Character*) ListIterator_GetData( personIterator );
	  teleportch( follower, pRoomIndex, show );
	}

      DestroyListIterator( personIterator );
      DestroyList( peopleInOriginRoom );
    }
}
