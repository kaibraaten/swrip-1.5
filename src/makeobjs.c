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

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"
#include "character.h"

/*
 * Make a fire.
 */
void make_fire(ROOM_INDEX_DATA *in_room, short timer)
{
  OBJ_DATA *fire = create_object( get_obj_index( OBJ_VNUM_FIRE ), 0 );

  fire->timer = number_fuzzy(timer);
  obj_to_room( fire, in_room );
}

/*
 * Make a trap.
 */
OBJ_DATA *make_trap(int v0, int v1, int v2, int v3)
{
  OBJ_DATA *trap = create_object( get_obj_index( OBJ_VNUM_TRAP ), 0 );

  trap->timer = 0;
  trap->value[OVAL_TRAP_CHARGE] = v0;
  trap->value[OVAL_TRAP_TYPE] = v1;
  trap->value[OVAL_TRAP_STRENGTH] = v2;
  trap->value[OVAL_TRAP_FLAGS] = v3;

  return trap;
}


/*
 * Turn an object into scraps.          -Thoric
 */
void make_scraps( OBJ_DATA *obj )
{
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *scraps = create_object( get_obj_index( OBJ_VNUM_SCRAPS ), 0 );
  OBJ_DATA *tmpobj = NULL;
  Character *ch = NULL;

  separate_obj( obj );
  scraps->timer = number_range( 5, 15 );

  /* don't make scraps of scraps of scraps of ... */
  if ( obj->pIndexData->vnum == OBJ_VNUM_SCRAPS )
    {
      STRFREE( scraps->short_descr );
      scraps->short_descr = STRALLOC( "some debris" );
      STRFREE( scraps->description );
      scraps->description = STRALLOC( "Bits of debris lie on the ground here." );
    }
  else
    {
      sprintf( buf, scraps->short_descr, obj->short_descr );
      STRFREE( scraps->short_descr );
      scraps->short_descr = STRALLOC( buf );
      sprintf( buf, scraps->description, obj->short_descr );
      STRFREE( scraps->description );
      scraps->description = STRALLOC( buf );
    }

  if ( obj->carried_by )
    {
      act( AT_OBJECT, "$p falls to the ground in scraps!",
           obj->carried_by, obj, NULL, TO_CHAR );

      if ( obj == GetEquipmentOnCharacter( obj->carried_by, WEAR_WIELD )
           &&  (tmpobj = GetEquipmentOnCharacter( obj->carried_by, WEAR_DUAL_WIELD)) != NULL )
	{
	  tmpobj->wear_loc = WEAR_WIELD;
	}

      obj_to_room( scraps, obj->carried_by->in_room);
    }
  else if ( obj->in_room )
    {
      if ( (ch = obj->in_room->first_person ) != NULL )
	{
	  act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_ROOM );
	  act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_CHAR );
	}

      obj_to_room( scraps, obj->in_room);
    }

  if ( (obj->item_type == ITEM_CONTAINER
        || obj->item_type == ITEM_CORPSE_PC) && obj->first_content )
    {
      if ( ch && ch->in_room )
        {
          act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_ROOM );
          act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_CHAR );
        }

      if ( obj->carried_by )
	{
	  empty_obj( obj, NULL, obj->carried_by->in_room );
	}
      else if ( obj->in_room )
	{
	  empty_obj( obj, NULL, obj->in_room );
	}
      else if ( obj->in_obj )
	{
	  empty_obj( obj, obj->in_obj, NULL );
	}
    }

  extract_obj( obj );
}

/*
 * Make a corpse out of a character.
 */
void make_corpse( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *corpse = NULL;
  OBJ_DATA *obj = NULL;
  OBJ_DATA *obj_next = NULL;
  char *name = NULL;

  if ( IsNpc(ch) )
    {
      name = ch->short_descr;

      if ( IS_SET ( ch->act , ACT_DROID ) )
	{
	  corpse = create_object(get_obj_index(OBJ_VNUM_DROID_CORPSE), 0);
	}
      else
	{
	  corpse = create_object(get_obj_index(OBJ_VNUM_CORPSE_NPC), 0);
	}

      corpse->timer = 6;

      if ( ch->gold > 0 )
        {
          if ( ch->in_room )
	    {
	      ch->in_room->area->gold_looted += ch->gold;
	    }

          obj_to_obj( create_money( ch->gold ), corpse );
          ch->gold = 0;
        }

      /* Using corpse cost to cheat, since corpses not sellable */
      corpse->cost     = (-(int)ch->pIndexData->vnum);
      corpse->value[OVAL_CORPSE_DECAY] = corpse->timer;
    }
  else
    {
      name = ch->name;
      corpse = create_object(get_obj_index(OBJ_VNUM_CORPSE_PC), 0);
      corpse->timer = 40;
      corpse->value[OVAL_CORPSE_DECAY] = (int)(corpse->timer/8);

      if ( ch->gold > 0 )
        {
          if ( ch->in_room )
	    {
	      ch->in_room->area->gold_looted += ch->gold;
	    }

          obj_to_obj( create_money( ch->gold ), corpse );
          ch->gold = 0;
        }
    }

  /* Added corpse name - make locate easier , other skills */
  sprintf( buf, "corpse %s", name );
  STRFREE( corpse->name );
  corpse->name = STRALLOC( buf );

  sprintf( buf, corpse->short_descr, name );
  STRFREE( corpse->short_descr );
  corpse->short_descr = STRALLOC( buf );

  sprintf( buf, corpse->description, name );
  STRFREE( corpse->description );
  corpse->description = STRALLOC( buf );

  for ( obj = ch->first_carrying; obj; obj = obj_next )
    {
      obj_next = obj->next_content;
      obj_from_char( obj );

      if ( IS_OBJ_STAT( obj, ITEM_INVENTORY )
           || IS_OBJ_STAT( obj, ITEM_DEATHROT ) )
	{
	  extract_obj( obj );
	}
      else
	{
	  obj_to_obj( obj, corpse );
	}
    }

  obj_to_room( corpse, ch->in_room );
}

void make_bloodstain( Character *ch )
{
  OBJ_DATA *obj = create_object( get_obj_index( OBJ_VNUM_BLOODSTAIN ), 0 );
  obj->timer = number_range( 1, 2 );
  obj_to_room( obj, ch->in_room );
}

/*
 * make some coinage
 */
OBJ_DATA *create_money( int amount )
{
  char buf[MAX_STRING_LENGTH];
  OBJ_DATA *obj = NULL;

  if ( amount <= 0 )
    {
      bug( "Create_money: zero or negative money %d.", amount );
      amount = 1;
    }

  if ( amount == 1 )
    {
      obj = create_object( get_obj_index( OBJ_VNUM_MONEY_ONE ), 0 );
    }
  else
    {
      obj = create_object( get_obj_index( OBJ_VNUM_MONEY_SOME ), 0 );
      sprintf( buf, obj->short_descr, amount );
      STRFREE( obj->short_descr );
      obj->short_descr = STRALLOC( buf );
      obj->value[OVAL_MONEY_AMOUNT]      = amount;
    }

  return obj;
}
