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
void MakeFire(Room *in_room, short timer)
{
  Object *fire = CreateObject( GetProtoObject( OBJ_VNUM_FIRE ), 0 );

  fire->timer = NumberFuzzy(timer);
  ObjectToRoom( fire, in_room );
}

/*
 * Make a trap.
 */
Object *MakeTrap(int v0, int v1, int v2, int v3)
{
  Object *trap = CreateObject( GetProtoObject( OBJ_VNUM_TRAP ), 0 );

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
void MakeScraps( Object *obj )
{
  char buf[MAX_STRING_LENGTH];
  Object *scraps = CreateObject( GetProtoObject( OBJ_VNUM_SCRAPS ), 0 );
  Object *tmpobj = NULL;
  Character *ch = NULL;

  SeparateOneObjectFromGroup( obj );
  scraps->timer = GetRandomNumberFromRange( 5, 15 );

  /* don't make scraps of scraps of scraps of ... */
  if ( obj->Prototype->vnum == OBJ_VNUM_SCRAPS )
    {
      FreeMemory( scraps->short_descr );
      scraps->short_descr = CopyString( "some debris" );
      FreeMemory( scraps->description );
      scraps->description = CopyString( "Bits of debris lie on the ground here." );
    }
  else
    {
      sprintf( buf, scraps->short_descr, obj->short_descr );
      FreeMemory( scraps->short_descr );
      scraps->short_descr = CopyString( buf );
      sprintf( buf, scraps->description, obj->short_descr );
      FreeMemory( scraps->description );
      scraps->description = CopyString( buf );
    }

  if ( obj->carried_by )
    {
      Act( AT_OBJECT, "$p falls to the ground in scraps!",
           obj->carried_by, obj, NULL, TO_CHAR );

      if ( obj == GetEquipmentOnCharacter( obj->carried_by, WEAR_WIELD )
           &&  (tmpobj = GetEquipmentOnCharacter( obj->carried_by, WEAR_DUAL_WIELD)) != NULL )
	{
	  tmpobj->wear_loc = WEAR_WIELD;
	}

      ObjectToRoom( scraps, obj->carried_by->in_room);
    }
  else if ( obj->in_room )
    {
      if ( (ch = obj->in_room->FirstPerson ) != NULL )
	{
	  Act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_ROOM );
	  Act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_CHAR );
	}

      ObjectToRoom( scraps, obj->in_room);
    }

  if ( (obj->item_type == ITEM_CONTAINER
        || obj->item_type == ITEM_CORPSE_PC) && obj->first_content )
    {
      if ( ch && ch->in_room )
        {
          Act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_ROOM );
          Act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_CHAR );
        }

      if ( obj->carried_by )
	{
	  EmptyObjectContents( obj, NULL, obj->carried_by->in_room );
	}
      else if ( obj->in_room )
	{
	  EmptyObjectContents( obj, NULL, obj->in_room );
	}
      else if ( obj->in_obj )
	{
	  EmptyObjectContents( obj, obj->in_obj, NULL );
	}
    }

  ExtractObject( obj );
}

/*
 * Make a corpse out of a character.
 */
void MakeCorpse( Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  Object *corpse = NULL;
  Object *obj = NULL;
  Object *obj_next = NULL;
  char *name = NULL;

  if ( IsNpc(ch) )
    {
      name = ch->short_descr;

      if ( IsBitSet ( ch->Flags , ACT_DROID ) )
	{
	  corpse = CreateObject(GetProtoObject(OBJ_VNUM_DROID_CORPSE), 0);
	}
      else
	{
	  corpse = CreateObject(GetProtoObject(OBJ_VNUM_CORPSE_NPC), 0);
	}

      corpse->timer = 6;

      if ( ch->gold > 0 )
        {
          if ( ch->in_room )
	    {
	      ch->in_room->Area->gold_looted += ch->gold;
	    }

          ObjectToObject( CreateMoney( ch->gold ), corpse );
          ch->gold = 0;
        }

      /* Using corpse cost to cheat, since corpses not sellable */
      corpse->cost     = (-(int)ch->Prototype->vnum);
      corpse->value[OVAL_CORPSE_DECAY] = corpse->timer;
    }
  else
    {
      name = ch->name;
      corpse = CreateObject(GetProtoObject(OBJ_VNUM_CORPSE_PC), 0);
      corpse->timer = 40;
      corpse->value[OVAL_CORPSE_DECAY] = (int)(corpse->timer/8);

      if ( ch->gold > 0 )
        {
          if ( ch->in_room )
	    {
	      ch->in_room->Area->gold_looted += ch->gold;
	    }

          ObjectToObject( CreateMoney( ch->gold ), corpse );
          ch->gold = 0;
        }
    }

  /* Added corpse name - make locate easier , other skills */
  sprintf( buf, "corpse %s", name );
  FreeMemory( corpse->name );
  corpse->name = CopyString( buf );

  sprintf( buf, corpse->short_descr, name );
  FreeMemory( corpse->short_descr );
  corpse->short_descr = CopyString( buf );

  sprintf( buf, corpse->description, name );
  FreeMemory( corpse->description );
  corpse->description = CopyString( buf );

  for ( obj = ch->first_carrying; obj; obj = obj_next )
    {
      obj_next = obj->next_content;
      ObjectFromCharacter( obj );

      if ( IS_OBJ_STAT( obj, ITEM_INVENTORY )
           || IS_OBJ_STAT( obj, ITEM_DEATHROT ) )
	{
	  ExtractObject( obj );
	}
      else
	{
	  ObjectToObject( obj, corpse );
	}
    }

  ObjectToRoom( corpse, ch->in_room );
}

void MakeBloodstain( Character *ch )
{
  Object *obj = CreateObject( GetProtoObject( OBJ_VNUM_BLOODSTAIN ), 0 );
  obj->timer = GetRandomNumberFromRange( 1, 2 );
  ObjectToRoom( obj, ch->in_room );
}

/*
 * make some coinage
 */
Object *CreateMoney( int amount )
{
  char buf[MAX_STRING_LENGTH];
  Object *obj = NULL;

  if ( amount <= 0 )
    {
      Bug( "Create_money: zero or negative money %d.", amount );
      amount = 1;
    }

  if ( amount == 1 )
    {
      obj = CreateObject( GetProtoObject( OBJ_VNUM_MONEY_ONE ), 0 );
    }
  else
    {
      obj = CreateObject( GetProtoObject( OBJ_VNUM_MONEY_SOME ), 0 );
      sprintf( buf, obj->short_descr, amount );
      FreeMemory( obj->short_descr );
      obj->short_descr = CopyString( buf );
      obj->value[OVAL_MONEY_AMOUNT]      = amount;
    }

  return obj;
}
