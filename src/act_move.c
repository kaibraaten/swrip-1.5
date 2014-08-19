/****************************************************************************
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
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <string.h>
#include <ctype.h>
#include "character.h"
#include "mud.h"

Room *vroom_hash[64];

vnum_t WhereHome( const Character *ch)
{
  if( ch->plr_home )
    {
      return ch->plr_home->vnum;
    }
  else if( IsImmortal(ch)  )
    {
      return ROOM_START_IMMORTAL;
    }
  else
    {
      return ROOM_START_PLAYER;
    }
}

static void decorate_room( Room *room )
{
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  int nRand;
  int iRand, len;
  int previous[8];
  int sector = room->sector_type;

  if ( room->name )
    FreeMemory( room->name );
  if ( room->description )
    FreeMemory( room->description );

  room->name    = CopyString( sect_names[sector][0] );
  buf[0] = '\0';
  nRand = GetRandomNumberFromRange( 1, umin(8,sent_total[sector]) );

  for ( iRand = 0; iRand < nRand; iRand++ )
    previous[iRand] = -1;

  for ( iRand = 0; iRand < nRand; iRand++ )
    {
      while ( previous[iRand] == -1 )
        {
          int x, z;

          x = GetRandomNumberFromRange( 0, sent_total[sector]-1 );

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
              buf2[0] = CharToUppercase(buf2[0] );
            }
          else
            if ( len == 0 )
              buf2[0] = CharToUppercase(buf2[0] );
          strcat( buf, buf2 );
        }
    }
  sprintf( buf2, "%s\r\n", WordWrap(buf, 78) );
  room->description = CopyString( buf2 );
}

/*
 * Remove any unused virtual rooms                              -Thoric
 */
void ClearVirtualRooms( void )
{
  int hash = 0;
  Room *room = NULL;
  Room *room_next = NULL;
  Room *prev = NULL;

  for ( hash = 0; hash < 64; hash++ )
    {
      while ( vroom_hash[hash]
              && !vroom_hash[hash]->first_person
              && !vroom_hash[hash]->first_content )
        {
          room = vroom_hash[hash];
          vroom_hash[hash] = room->next;
          clean_room( room );
          FreeMemory( room );
          --top_vroom;
        }

      prev = NULL;

      for ( room = vroom_hash[hash]; room; room = room_next )
        {
          room_next = room->next;

          if ( !room->first_person && !room->first_content )
            {
              if ( prev )
		{
		  prev->next = room_next;
		}

              clean_room( room );
              FreeMemory( room );
              --top_vroom;
            }

          if ( room )
	    {
	      prev = room;
	    }
        }
    }
}

/*
 * Function to get the equivelant exit of DIR 0-MAXDIR out of linked list.
 * Made to allow old-style diku-merc exit functions to work.    -Thoric
 */
Exit *GetExit( const Room *room, short dir )
{
  Exit *xit = NULL;

  if ( !room )
    {
      Bug( "Get_exit: NULL room" );
      return NULL;
    }

  for (xit = room->first_exit; xit; xit = xit->next )
    {
      if ( xit->vdir == dir )
	{
	  return xit;
	}
    }

  return NULL;
}

/*
 * Function to get an exit, leading the the specified room
 */
Exit *GetExitTo( const Room *room, short dir, vnum_t vnum )
{
  Exit *xit = NULL;

  if ( !room )
    {
      Bug( "Get_exit: NULL room" );
      return NULL;
    }

  for (xit = room->first_exit; xit; xit = xit->next )
    {
      if ( xit->vdir == dir && xit->vnum == vnum )
	{
	  return xit;
	}
    }

  return NULL;
}

/*
 * Function to get the nth exit of a room                       -Thoric
 */
Exit *GetExitNumber( const Room *room, short count )
{
  Exit *xit = NULL;
  int cnt = 0;

  if ( !room )
    {
      Bug( "Get_exit: NULL room", 0 );
      return NULL;
    }

  for (cnt = 0, xit = room->first_exit; xit; xit = xit->next )
    {
      if ( ++cnt == count )
	{
	  return xit;
	}
    }

  return NULL;
}


/*
 * Modify movement due to encumbrance                           -Thoric
 */
short GetCarryEncumbrance( const Character *ch, short move )
{
  int max = GetCarryCapacityWeight(ch);
  int cur = ch->carry_weight;

  if ( cur >= max )
    {
      return move * 4;
    }
  else if ( cur >= max * 0.95 )
    {
      return move * 3.5;
    }
  else if ( cur >= max * 0.90 )
    {
      return move * 3;
    }
  else if ( cur >= max * 0.85 )
    {
      return move * 2.5;
    }
  else if ( cur >= max * 0.80 )
    {
      return move * 2;
    }
  else if ( cur >= max * 0.75 )
    {
      return move * 1.5;
    }
  else
    {
      return move;
    }
}


/*
 * Check to see if a character can fall down, checks for looping   -Thoric
 */
bool CharacterFallIfNoFloor( Character *ch, int fall )
{
  if ( IsBitSet( ch->in_room->room_flags, ROOM_NOFLOOR )
       && CAN_GO(ch, DIR_DOWN)
       && (!IsAffectedBy( ch, AFF_FLYING )
           || ( ch->mount && !IsAffectedBy( ch->mount, AFF_FLYING ) ) ) )
    {
      if ( fall > 80 )
        {
          Bug( "Falling (in a loop?) more than 80 rooms: vnum %d", ch->in_room->vnum );
          char_from_room( ch );
          char_to_room( ch, GetRoom( WhereHome(ch) ) );
          fall = 0;
          return true;
        }

      SetCharacterColor( AT_FALLING, ch );
      SendToCharacter( "You're falling down...\r\n", ch );
      MoveCharacter( ch, GetExit(ch->in_room, DIR_DOWN), ++fall );
      return true;
    }

  return false;
}


/*
 * create a 'virtual' room                                      -Thoric
 */
Room *GenerateExit( Room *in_room, Exit **pexit )
{
  Exit *xit = NULL, *bxit = NULL;
  Exit *orig_exit = (Exit *) *pexit;
  Room *room = NULL;
  Room *backroom = NULL;
  vnum_t brvnum = INVALID_VNUM;
  vnum_t serial = INVALID_VNUM;
  vnum_t roomnum = INVALID_VNUM;
  int distance = -1;
  int vdir = orig_exit->vdir;
  short hash = 0;
  bool found = false;

  if ( in_room->vnum > 32767 )  /* room is virtual */
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

      backroom = GetRoom( brvnum );
    }
  else
    {
      int r1 = in_room->vnum;
      int r2 = orig_exit->vnum;

      brvnum = r1;
      backroom = in_room;
      serial = (umax( r1, r2 ) << 16) | umin( r1, r2 );
      distance = orig_exit->distance - 1;
      roomnum = r1 < r2 ? 1 : distance;
    }

  hash = serial % 64;

  for ( room = vroom_hash[hash]; room; room = room->next )
    {
      if ( room->vnum == serial && room->tele_vnum == roomnum )
	{
	  found = true;
	  break;
	}
    }

  if ( !found )
    {
      AllocateMemory( room, Room, 1 );
      room->area          = in_room->area;
      room->vnum          = serial;
      room->tele_vnum     = roomnum;
      room->sector_type = in_room->sector_type;
      room->room_flags  = in_room->room_flags;
      decorate_room( room );
      room->next          = vroom_hash[hash];
      vroom_hash[hash]  = room;
      ++top_vroom;
    }

  if ( !found || (xit=GetExit(room, vdir))==NULL )
    {
      xit = MakeExit(room, orig_exit->to_room, vdir);
      xit->keyword              = CopyString( "" );
      xit->description  = CopyString( "" );
      xit->key          = -1;
      xit->distance = distance;
    }

  if ( !found )
    {
      bxit = MakeExit(room, backroom, GetReverseDirection(vdir));
      bxit->keyword             = CopyString( "" );
      bxit->description = CopyString( "" );
      bxit->key         = -1;

      if ( (serial & 65535) != orig_exit->vnum )
	{
	  bxit->distance = roomnum;
	}
      else
        {
          Exit *tmp = GetExit( backroom, vdir );
          int fulldist = tmp->distance;

          bxit->distance = fulldist - distance;
        }
    }

  *pexit = xit;
  return room;
}

ch_ret MoveCharacter( Character *ch, Exit *pexit, int fall )
{
  Room *in_room;
  Room *to_room;
  Room *from_room;
  char buf[MAX_STRING_LENGTH];
  const char *txt;
  const char *dtxt;
  ch_ret retcode;
  short door, distance;
  bool drunk = false;
  bool brief = false;
  int hpmove;

  if ( !IsNpc( ch ) )
    if ( IsDrunk( ch ) && ( ch->position != POS_SHOVE )
         && ( ch->position != POS_DRAG ) )
      drunk = true;

  if ( drunk && !fall )
    {
      door = GetRandomDoor();
      pexit = GetExit( ch->in_room, door );
    }

#ifdef DEBUG
  if ( pexit )
    {
      sprintf( buf, "MoveCharacter: %s to door %d", ch->name, pexit->vdir );
      log_string( buf );
    }
#endif

  retcode = rNONE;
  txt = NULL;

  if ( IsNpc(ch) && IsBitSet( ch->act, ACT_MOUNTED ) )
    return retcode;

  in_room = ch->in_room;
  from_room = in_room;
  if ( !pexit || (to_room = pexit->to_room) == NULL )
    {
      if ( drunk )
        SendToCharacter( "You hit a wall in your drunken state.\r\n", ch );
      else
        SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  door = pexit->vdir;
  distance = pexit->distance;

  /*
   * Exit is only a "window", there is no way to travel in that direction
   * unless it's a door with a window in it             -Thoric
   */
  if ( IsBitSet( pexit->exit_info, EX_WINDOW )
       &&  !IsBitSet( pexit->exit_info, EX_ISDOOR ) )
    {
      SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
      return rNONE;
    }

  if (  IsBitSet(pexit->exit_info, EX_PORTAL)
        && IsNpc(ch) )
    {
      Act( AT_PLAIN, "Mobs can't use portals.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->exit_info, EX_NOMOB)
       && IsNpc(ch) && !IsBitSet(ch->act, ACT_SCAVENGER) )
    {
      Act( AT_PLAIN, "Mobs can't enter there.", ch, NULL, NULL, TO_CHAR );
      return rNONE;
    }

  if ( IsBitSet(pexit->exit_info, EX_CLOSED)
       && (!IsAffectedBy(ch, AFF_PASS_DOOR)
           ||   IsBitSet(pexit->exit_info, EX_NOPASSDOOR)) )
    {
      if ( !IsBitSet( pexit->exit_info, EX_SECRET )
           &&   !IsBitSet( pexit->exit_info, EX_DIG ) )
        {
          if ( drunk )
            {
              Act( AT_PLAIN, "$n runs into the $d in $s drunken state.", ch,
                   NULL, pexit->keyword, TO_ROOM );
              Act( AT_PLAIN, "You run into the $d in your drunken state.", ch,
                   NULL, pexit->keyword, TO_CHAR );
            }
          else
            Act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
        }
      else
        {
          if ( drunk )
            SendToCharacter( "You hit a wall in your drunken state.\r\n", ch );
          else
            SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
        }

      return rNONE;
    }

  /*
   * Crazy virtual room idea, created upon demand.              -Thoric
   */
  if ( distance > 1 )
    {
      if ( (to_room=GenerateExit(in_room, &pexit)) == NULL )
	{
	  SendToCharacter( "Alas, you cannot go that way.\r\n", ch );
	}
    }

  if ( !fall
       && IsAffectedBy(ch, AFF_CHARM)
       && ch->master
       && in_room == ch->master->in_room )
    {
      SendToCharacter( "What?  And leave your beloved master?\r\n", ch );
      return rNONE;
    }

  if ( room_is_private( ch, to_room ) )
    {
      SendToCharacter( "That room is private right now.\r\n", ch );
      return rNONE;
    }

  if ( !IsImmortal(ch)
       && !IsNpc(ch)
       && ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_hard_range )
        {
          SetCharacterColor( AT_TELL, ch );

          switch( to_room->area->low_hard_range - ch->top_level )
            {
            case 1:
              SendToCharacter( "A voice in your mind says, 'You are nearly ready to go that way...'", ch );
              break;
            case 2:
              SendToCharacter( "A voice in your mind says, 'Soon you shall be ready to travel down this path... soon.'", ch );
              break;
            case 3:
              SendToCharacter( "A voice in your mind says, 'You are not ready to go down that path... yet.'.\r\n", ch);
              break;
            default:
              SendToCharacter( "A voice in your mind says, 'You are not ready to go down that path.'.\r\n", ch);
            }
          return rNONE;
        }
      else if ( ch->top_level > to_room->area->hi_hard_range )
	{
	  SetCharacterColor( AT_TELL, ch );
	  SendToCharacter( "A voice in your mind says, 'There is nothing more for you down that path.'", ch );
	  return rNONE;
	}
    }

  if ( !fall && !IsNpc(ch) )
    {
      int move;

      if ( in_room->sector_type == SECT_AIR
           ||   to_room->sector_type == SECT_AIR
           ||   IsBitSet( pexit->exit_info, EX_FLY ) )
        {
          if ( ch->mount && !IsAffectedBy( ch->mount, AFF_FLYING ) )
            {
              SendToCharacter( "Your mount can't fly.\r\n", ch );
              return rNONE;
            }
          if ( !ch->mount && !IsAffectedBy(ch, AFF_FLYING) )
            {
              SendToCharacter( "You'd need to fly to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( in_room->sector_type == SECT_WATER_NOSWIM
           ||   to_room->sector_type == SECT_WATER_NOSWIM )
        {
          Object *obj = NULL;
          bool found = false;

          if ( ch->mount )
            {
              if ( IsAffectedBy( ch->mount, AFF_FLYING )
                   || IsAffectedBy( ch->mount, AFF_FLOATING ) )
		{
		  found = true;
		}
            }
          else if ( IsAffectedBy(ch, AFF_FLYING)
		    || IsAffectedBy(ch, AFF_FLOATING) )
	    {
              found = true;
	    }

          /*
           * Look for a boat.
           */
          if ( !found )
            for ( obj = ch->first_carrying; obj; obj = obj->next_content )
              {
                if ( obj->item_type == ITEM_BOAT )
                  {
                    found = true;
                    if ( drunk )
                      txt = "paddles unevenly";
                    else
                      txt = "paddles";
                    break;
                  }
              }

          if ( !found )
            {
              SendToCharacter( "You'd need a boat to go there.\r\n", ch );
              return rNONE;
            }
        }

      if ( IsBitSet( pexit->exit_info, EX_CLIMB ) )
        {
          bool found;

          found = false;
          if ( ch->mount && IsAffectedBy( ch->mount, AFF_FLYING ) )
            found = true;
          else
            if ( IsAffectedBy(ch, AFF_FLYING) )
              found = true;

          if ( !found && !ch->mount )
            {

              if ( ( !IsNpc(ch) && GetRandomPercent( ) > ch->pcdata->learned[gsn_climb] )
                   ||      drunk || ch->mental_state < -90 )
                {
                  Object *obj;
                  bool ch_rope = false;
                  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
                    {
                      if (obj->item_type == ITEM_ROPE)
                        {
                          ch_rope = true;
                          break;
                        }
                    }
                  if( !ch_rope )
                    {
                      SendToCharacter( "You start to climb... but lose your grip and fall!\r\n", ch);
                      LearnFromFailure( ch, gsn_climb );
                      if ( pexit->vdir == DIR_DOWN )
                        {
                          retcode = MoveCharacter( ch, pexit, 1 );
                          return retcode;
                        }
                      SetCharacterColor( AT_HURT, ch );
                      SendToCharacter( "OUCH! You hit the ground!\r\n", ch );
                      SetWaitState( ch, 20 );
                      retcode = InflictDamage( ch, ch, (pexit->vdir == DIR_UP ? 10 : 5),
                                        TYPE_UNDEFINED );
                      return retcode;
                    }
                }
              found = true;
              LearnFromSuccess( ch, gsn_climb );
              SetWaitState( ch, skill_table[gsn_climb]->beats );
              txt = "climbs";
            }

          if ( !found )
            {
              SendToCharacter( "You can't climb.\r\n", ch );
              return rNONE;
            }
        }

      if ( ch->mount )
        {
          switch (ch->mount->position)
            {
            case POS_DEAD:
              SendToCharacter( "Your mount is dead!\r\n", ch );
              return rNONE;
              break;

            case POS_MORTAL:
            case POS_INCAP:
              SendToCharacter( "Your mount is hurt far too badly to move.\r\n", ch );
              return rNONE;
              break;

            case POS_STUNNED:
              SendToCharacter( "Your mount is too stunned to do that.\r\n", ch );
              return rNONE;
              break;

            case POS_SLEEPING:
              SendToCharacter( "Your mount is sleeping.\r\n", ch );
              return rNONE;
              break;

            case POS_RESTING:
              SendToCharacter( "Your mount is resting.\r\n", ch);
              return rNONE;
              break;

            case POS_SITTING:
              SendToCharacter( "Your mount is sitting down.\r\n", ch);
              return rNONE;
              break;

            default:
              break;
            }

          if ( !IsAffectedBy(ch->mount, AFF_FLYING)
               &&   !IsAffectedBy(ch->mount, AFF_FLOATING) )
            move = movement_loss[umin(SECT_MAX-1, in_room->sector_type)];
          else
            move = 1;

          if ( ch->mount->move < move )
            {
              SendToCharacter( "Your mount is too exhausted.\r\n", ch );
              return rNONE;
            }
        }
      else
        {
          hpmove = 500/( ch->hit? ch->hit : 1 );

          if ( !IsAffectedBy(ch, AFF_FLYING)
               &&   !IsAffectedBy(ch, AFF_FLOATING) )
            move = hpmove*GetCarryEncumbrance( ch, movement_loss[umin(SECT_MAX-1, in_room->sector_type)] );
          else
            move = 1;

          if ( ch->move < move )
            {
              SendToCharacter( "You are too exhausted.\r\n", ch );
              return rNONE;
            }
        }

      SetWaitState( ch, move );
      if ( ch->mount )
        ch->mount->move -= move;
      else
        ch->move -= move;
    }

  /*
   * Check if player can fit in the room
   */
  if ( to_room->tunnel > 0 )
    {
      Character *ctmp;
      int count = ch->mount ? 1 : 0;

      for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
        if ( ++count >= to_room->tunnel )
          {
            if ( ch->mount && count == to_room->tunnel )
              SendToCharacter( "There is no room for both you and your mount in there.\r\n", ch );
            else
              SendToCharacter( "There is no room for you in there.\r\n", ch );
            return rNONE;
          }
    }

  /* check for traps on exit - later */

  if ( !IsAffectedBy(ch, AFF_SNEAK)
       && ( IsNpc(ch) || !IsBitSet(ch->act, PLR_WIZINVIS) ) )
    {
      if ( fall )
        txt = "falls";
      else
        if ( !txt )
          {
            if ( ch->mount )
              {
                if ( IsAffectedBy( ch->mount, AFF_FLOATING ) )
                  txt = "floats";
                else
                  if ( IsAffectedBy( ch->mount, AFF_FLYING ) )
                    txt = "flys";
                  else
                    txt = "rides";
              }
            else
              {
                if ( IsAffectedBy( ch, AFF_FLOATING ) )
                  {
                    if ( drunk )
                      txt = "floats unsteadily";
                    else
                      txt = "floats";
                  }
                else
                  if ( IsAffectedBy( ch, AFF_FLYING ) )
                    {
                      if ( drunk )
                        txt = "flys shakily";
                      else
                        txt = "flys";
                    }
                  else
                    if ( ch->position == POS_SHOVE )
                      txt = "is shoved";
                    else
                      if ( ch->position == POS_DRAG )
                        txt = "is dragged";
                      else
                        {
                          if ( drunk )
                            txt = "stumbles drunkenly";
                          else
                            txt = "leaves";
                        }
              }
          }
      if ( ch->mount )
        {
          sprintf( buf, "$n %s %s upon $N.", txt, GetDirectionName(door) );
          Act( AT_ACTION, buf, ch, NULL, ch->mount, TO_NOTVICT );
        }
      else
        {
          sprintf( buf, "$n %s $T.", txt );
          Act( AT_ACTION, buf, ch, NULL, GetDirectionName(door), TO_ROOM );
        }
    }

  rprog_leave_trigger( ch );

  if( char_died(ch) )
    return global_retcode;

  char_from_room( ch );

  if ( ch->mount )
    {
      rprog_leave_trigger( ch->mount );
      if( char_died(ch) )
        return global_retcode;
      if( ch->mount )
        {
          char_from_room( ch->mount );
          char_to_room( ch->mount, to_room );
        }
    }


  char_to_room( ch, to_room );
  if ( !IsAffectedBy(ch, AFF_SNEAK)
       && ( IsNpc(ch) || !IsBitSet(ch->act, PLR_WIZINVIS) ) )
    {
      if ( fall )
        txt = "falls";
      else
        if ( ch->mount )
          {
            if ( IsAffectedBy( ch->mount, AFF_FLOATING ) )
              txt = "floats in";
            else
              if ( IsAffectedBy( ch->mount, AFF_FLYING ) )
                txt = "flys in";
              else
                txt = "rides in";
          }
        else
          {
            if ( IsAffectedBy( ch, AFF_FLOATING ) )
              {
                if ( drunk )
                  txt = "floats in unsteadily";
                else
                  txt = "floats in";
              }
            else
              if ( IsAffectedBy( ch, AFF_FLYING ) )
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
          Act( AT_ACTION, buf, ch, NULL, ch->mount, TO_ROOM );
        }
      else
        {
          sprintf( buf, "$n %s from %s.", txt, dtxt );
          Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
        }
    }

  if ( !IsImmortal(ch)
       &&  !IsNpc(ch)
       &&  ch->in_room->area != to_room->area )
    {
      if ( ch->top_level < to_room->area->low_soft_range )
        {
          SetCharacterColor( AT_MAGIC, ch );
          SendToCharacter("You feel uncomfortable being in this strange land...\r\n", ch);
        }
      else
        if ( ch->top_level > to_room->area->hi_soft_range )
          {
            SetCharacterColor( AT_MAGIC, ch );
            SendToCharacter("You feel there is not much to gain visiting this place...\r\n", ch);
          }
    }

  do_look( ch, "auto" );
  if ( brief )
    SetBit( ch->act, PLR_BRIEF );


  /* BIG ugly looping problem here when the character is mptransed back
     to the starting room.  To avoid this, check how many chars are in
     the room at the start and stop processing followers after doing
     the right number of them.  -- Narn
  */
  if ( !fall )
    {
      Character *fch;
      Character *nextinroom;
      int chars = 0, count = 0;

      for ( fch = from_room->first_person; fch; fch = fch->next_in_room )
        chars++;

      for ( fch = from_room->first_person; fch && ( count < chars ); fch = nextinroom )
        {
          nextinroom = fch->next_in_room;
          count++;
          if ( fch != ch                /* loop room bug fix here by Thoric */
               && fch->master == ch
               && fch->position == POS_STANDING )
            {
              Act( AT_ACTION, "You follow $N.", fch, NULL, ch, TO_CHAR );
              MoveCharacter( fch, pexit, 0 );
            }
        }
    }

  if ( ch->in_room->first_content )
    retcode = check_room_for_traps( ch, TRAP_ENTER_ROOM );
  if ( retcode != rNONE )
    return retcode;

  if ( char_died(ch) )
    return retcode;

  MobProgEntryTrigger( ch );

  if ( char_died(ch) )
    return retcode;

  rprog_enter_trigger( ch );

  if ( char_died(ch) )
    return retcode;

  MobProgGreetTrigger( ch );

  if ( char_died(ch) )
    return retcode;

  oprog_greet_trigger( ch );
  if ( char_died(ch) )
    return retcode;

  if (!CharacterFallIfNoFloor( ch, fall )
      &&   fall > 0 )
    {
      if (!IsAffectedBy( ch, AFF_FLOATING )
          || ( ch->mount && !IsAffectedBy( ch->mount, AFF_FLOATING ) ) )
        {
          SetCharacterColor( AT_HURT, ch );
          SendToCharacter( "OUCH! You hit the ground!\r\n", ch );
          SetWaitState( ch, 20 );
          retcode = InflictDamage( ch, ch, 50 * fall, TYPE_UNDEFINED );
        }
      else
        {
          SetCharacterColor( AT_MAGIC, ch );
          SendToCharacter( "You lightly float down to the ground.\r\n", ch );
        }
    }
  return retcode;
}

Exit *FindDoor( Character *ch, const char *arg, bool quiet )
{
  Exit *pexit;
  int door;

  if (arg == NULL || !StrCmp(arg,""))
    return NULL;

  pexit = NULL;
  if ( !StrCmp( arg, "n" ) || !StrCmp( arg, "north" ) )
    {
      door = DIR_NORTH;
    }
  else if ( !StrCmp( arg, "e" ) || !StrCmp( arg, "east" ) )
    {
      door = DIR_EAST;
    }
  else if ( !StrCmp( arg, "s" ) || !StrCmp( arg, "south" ) )
    {
      door = DIR_SOUTH;
    }
  else if ( !StrCmp( arg, "w" ) || !StrCmp( arg, "west" ) )
    {
      door = DIR_WEST;
    }
  else if ( !StrCmp( arg, "u" ) || !StrCmp( arg, "up" ) )
    {
      door = DIR_UP;
    }
  else if ( !StrCmp( arg, "d" ) || !StrCmp( arg, "down" ) )
    {
      door = DIR_DOWN;
    }
  else if ( !StrCmp( arg, "ne" ) || !StrCmp( arg, "northeast" ) )
    {
      door = DIR_NORTHEAST;
    }
  else if ( !StrCmp( arg, "nw" ) || !StrCmp( arg, "northwest" ) )
    {
      door = DIR_NORTHWEST;
    }
  else if ( !StrCmp( arg, "se" ) || !StrCmp( arg, "southeast" ) )
    {
      door = DIR_SOUTHEAST;
    }
  else if ( !StrCmp( arg, "sw" ) || !StrCmp( arg, "southwest" ) )
    {
      door = DIR_SOUTHWEST;
    }
  else
    {
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
        {
          if ( (quiet || IsBitSet(pexit->exit_info, EX_ISDOOR))
               && pexit->keyword
               && NiftyIsName( arg, pexit->keyword ) )
	    {
	      return pexit;
	    }
        }

      if ( !quiet )
	{
	  Act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
	}

      return NULL;
    }

  if ( (pexit = GetExit( ch->in_room, door )) == NULL )
    {
      if ( !quiet)
        Act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
      return NULL;
    }

  if ( quiet )
    return pexit;

  if ( IsBitSet(pexit->exit_info, EX_SECRET) )
    {
      Act( AT_PLAIN, "You see no $T here.", ch, NULL, arg, TO_CHAR );
      return NULL;
    }

  if ( !IsBitSet(pexit->exit_info, EX_ISDOOR) )
    {
      SendToCharacter( "You can't do that.\r\n", ch );
      return NULL;
    }

  return pexit;
}

void toggle_bexit_flag( Exit *pexit, int flag )
{
  Exit *pexit_rev;

  ToggleBit(pexit->exit_info, flag);

  if ( (pexit_rev = pexit->rexit) != NULL
       && pexit_rev != pexit )
    ToggleBit( pexit_rev->exit_info, flag );
}

void SetBExitFlag( Exit *pexit, int flag )
{
  Exit *pexit_rev;

  SetBit(pexit->exit_info, flag);

  if ( (pexit_rev = pexit->rexit) != NULL
       && pexit_rev != pexit )
    SetBit( pexit_rev->exit_info, flag );
}

void RemoveBExitFlag( Exit *pexit, int flag )
{
  Exit *pexit_rev;

  RemoveBit(pexit->exit_info, flag);

  if ( (pexit_rev = pexit->rexit) != NULL
       && pexit_rev != pexit )
    RemoveBit( pexit_rev->exit_info, flag );
}

bool HasKey( const Character *ch, vnum_t key )
{
  Object *obj = NULL;

  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    {
      if ( obj->Prototype->vnum == key || obj->value[OVAL_KEY_UNLOCKS_VNUM] == key )
	{
	  return true;
	}
    }

  return false;
}

/*
 * teleport a character to another room
 */
void teleportch( Character *ch, Room *room, bool show )
{
  if ( room_is_private( ch, room ) )
    return;

  Act( AT_ACTION, "$n disappears suddenly!", ch, NULL, NULL, TO_ROOM );
  char_from_room( ch );
  char_to_room( ch, room );
  Act( AT_ACTION, "$n arrives suddenly!", ch, NULL, NULL, TO_ROOM );

  if ( show )
    do_look( ch, "auto" );
}

void Teleport( Character *ch, vnum_t room, int flags )
{
  Character *nch = NULL, *nch_next = NULL;
  Room *pRoomIndex = GetRoom( room );
  bool show = false;

  if ( !pRoomIndex )
    {
      Bug( "teleport: bad room vnum %d", room );
      return;
    }

  if ( IsBitSet( flags, TELE_SHOWDESC ) )
    show = true;
  else
    show = false;

  if ( !IsBitSet( flags, TELE_TRANSALL ) )
    {
      teleportch( ch, pRoomIndex, show );
      return;
    }

  for ( nch = ch->in_room->first_person; nch; nch = nch_next )
    {
      nch_next = nch->next_in_room;
      teleportch( nch, pRoomIndex, show );
    }
}
