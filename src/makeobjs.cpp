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

#include <cstdio>
#include <cstring>
#include <cassert>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "area.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"

/*
 * Make a fire.
 */
void MakeFire(std::shared_ptr<Room> in_room, short timer)
{
  Object *fire = CreateObject( GetProtoObject( OBJ_VNUM_FIRE ), 0 );

  fire->Timer = NumberFuzzy(timer);
  ObjectToRoom( fire, in_room );
}

/*
 * Make a trap.
 */
Object *MakeTrap(int v0, int v1, int v2, int v3)
{
  Object *trap = CreateObject( GetProtoObject( OBJ_VNUM_TRAP ), 0 );

  trap->Timer = 0;
  trap->Value[OVAL_TRAP_CHARGE] = v0;
  trap->Value[OVAL_TRAP_TYPE] = v1;
  trap->Value[OVAL_TRAP_STRENGTH] = v2;
  trap->Value[OVAL_TRAP_FLAGS] = v3;

  return trap;
}


/*
 * Turn an object into scraps.          -Thoric
 */
void MakeScraps( Object *obj )
{
  Object *scraps = CreateObject( GetProtoObject( OBJ_VNUM_SCRAPS ), 0 );
  Object *tmpobj = NULL;
  Character *ch = NULL;

  SeparateOneObjectFromGroup( obj );
  scraps->Timer = GetRandomNumberFromRange( 5, 15 );

  /* don't make scraps of scraps of scraps of ... */
  if ( obj->Prototype->Vnum == OBJ_VNUM_SCRAPS )
    {
      scraps->ShortDescr = "some debris";
      scraps->Description = "Bits of debris lie on the ground here.";
    }
  else
    {
      scraps->ShortDescr = FormatString(scraps->ShortDescr.c_str(), obj->ShortDescr.c_str());
      scraps->Description = FormatString(scraps->Description.c_str(), obj->ShortDescr.c_str());
    }

  if ( obj->CarriedBy )
    {
      Act( AT_OBJECT, "$p falls to the ground in scraps!",
           obj->CarriedBy, obj, NULL, TO_CHAR );

      if ( obj == GetEquipmentOnCharacter( obj->CarriedBy, WEAR_WIELD )
           &&  (tmpobj = GetEquipmentOnCharacter( obj->CarriedBy, WEAR_DUAL_WIELD)) != NULL )
	{
	  tmpobj->WearLoc = WEAR_WIELD;
	}

      ObjectToRoom( scraps, obj->CarriedBy->InRoom);
    }
  else if ( obj->InRoom )
    {
      if(!obj->InRoom->Characters().empty())
	{
          ch = obj->InRoom->Characters().front();
	  Act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_ROOM );
	  Act( AT_OBJECT, "$p is reduced to little more than scraps.",
	       ch, obj, NULL, TO_CHAR );
	}

      ObjectToRoom( scraps, obj->InRoom);
    }

  if ( (obj->ItemType == ITEM_CONTAINER
        || obj->ItemType == ITEM_CORPSE_PC) && !obj->Objects().empty() )
    {
      if ( ch && ch->InRoom )
        {
          Act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_ROOM );
          Act( AT_OBJECT, "The contents of $p fall to the ground.",
               ch, obj, NULL, TO_CHAR );
        }

      if ( obj->CarriedBy )
	{
	  EmptyObjectContents( obj, NULL, obj->CarriedBy->InRoom );
	}
      else if ( obj->InRoom )
	{
	  EmptyObjectContents( obj, NULL, obj->InRoom );
	}
      else if ( obj->InObject )
	{
	  EmptyObjectContents( obj, obj->InObject, NULL );
	}
    }

  ExtractObject( obj );
}

/*
 * Make a corpse out of a character.
 */
void MakeCorpse( Character *ch )
{
  Object *corpse = nullptr;
  std::string name;

  if ( IsNpc(ch) )
    {
      name = ch->ShortDescr;

      if ( IsBitSet ( ch->Flags , ACT_DROID ) )
	{
	  corpse = CreateObject(GetProtoObject(OBJ_VNUM_DROID_CORPSE), 0);
	}
      else
	{
	  corpse = CreateObject(GetProtoObject(OBJ_VNUM_CORPSE_NPC), 0);
	}

      corpse->Timer = 6;

      if ( ch->Gold > 0 )
        {
          if ( ch->InRoom )
	    {
	      ch->InRoom->Area->GoldLooted += ch->Gold;
	    }

          ObjectToObject( CreateMoney( ch->Gold ), corpse );
          ch->Gold = 0;
        }

      /* Using corpse cost to cheat, since corpses not sellable */
      corpse->Cost     = (-(int)ch->Prototype->Vnum);
      corpse->Value[OVAL_CORPSE_DECAY] = corpse->Timer;
    }
  else
    {
      name = ch->Name;
      corpse = CreateObject(GetProtoObject(OBJ_VNUM_CORPSE_PC), 0);
      corpse->Timer = 40;
      corpse->Value[OVAL_CORPSE_DECAY] = (int)(corpse->Timer/8);

      if ( ch->Gold > 0 )
        {
          if ( ch->InRoom )
	    {
	      ch->InRoom->Area->GoldLooted += ch->Gold;
	    }

          ObjectToObject( CreateMoney( ch->Gold ), corpse );
          ch->Gold = 0;
        }
    }

  /* Added corpse name - make locate easier , other skills */
  corpse->Name = FormatString("corpse %s", name.c_str());
  corpse->ShortDescr = FormatString(corpse->ShortDescr.c_str(), name.c_str());
  corpse->Description = FormatString(corpse->Description.c_str(), name.c_str());

  std::list<Object*> carriedObjects(ch->Objects());

  for(Object *obj : carriedObjects)
    {
      ObjectFromCharacter( obj );

      if ( IsBitSet( obj->Flags, ITEM_INVENTORY )
           || IsBitSet( obj->Flags, ITEM_DEATHROT ) )
	{
	  ExtractObject( obj );
	}
      else
	{
	  ObjectToObject( obj, corpse );
	}
    }

  ObjectToRoom( corpse, ch->InRoom );
}

void MakeBloodstain( Character *ch )
{
  Object *obj = CreateObject( GetProtoObject( OBJ_VNUM_BLOODSTAIN ), 0 );
  obj->Timer = GetRandomNumberFromRange( 1, 2 );
  ObjectToRoom( obj, ch->InRoom );
}

/*
 * make some coinage
 */
Object *CreateMoney( int amount )
{
  assert(amount > 0);

  Object *obj = NULL;

  if ( amount == 1 )
    {
      obj = CreateObject( GetProtoObject( OBJ_VNUM_MONEY_ONE ), 0 );
    }
  else
    {
      obj = CreateObject( GetProtoObject( OBJ_VNUM_MONEY_SOME ), 0 );
      obj->ShortDescr = FormatString(obj->ShortDescr.c_str(), amount);
      obj->Value[OVAL_MONEY_AMOUNT]      = amount;
    }

  return obj;
}

