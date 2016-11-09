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

#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"

/*
 * how resistant an object is to damage                         -Thoric
 */
short GetObjectResistance( const Object *obj )
{
  short resist = NumberFuzzy(MAX_ITEM_IMPACT);

  /* magical items are more resistant */
  if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    resist += NumberFuzzy(12);
  /* blessed objects should have a little bonus */
  if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    resist += NumberFuzzy(5);
  /* lets make store inventory pretty tough */
  if ( IS_OBJ_STAT( obj, ITEM_INVENTORY ) )
    resist += 20;

  /* okay... let's add some bonus/penalty for item level... */
  resist += (obj->Level / 10);

  /* and lasty... take armor or weapon's condition into consideration */
  if (obj->ItemType == ITEM_ARMOR )
    {
      resist += (obj->Value[OVAL_ARMOR_CONDITION]);
    }
  else if (obj->ItemType == ITEM_WEAPON)
    {
      resist += (obj->Value[OVAL_WEAPON_CONDITION]);
    }

  return urange(10, resist, 99);
}

/*
 * Damage an object.                                            -Thoric
 * Affect player's AC if necessary.
 * Make object into scraps if necessary.
 * Send message about damaged object.
 */
obj_ret DamageObject( Object *obj )
{
  Character *ch;
  obj_ret objcode;

  ch = obj->CarriedBy;
  objcode = rNONE;

  if (ch && ch->InRoom && IsBitSet(ch->InRoom->Flags,ROOM_ARENA))
    return objcode;

  SeparateOneObjectFromGroup( obj );
  
  if ( ch )
    Act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
  else
    if ( obj->InRoom && ( ch = obj->InRoom->FirstPerson ) != NULL )
      {
        Act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_ROOM );
        Act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
        ch = NULL;
      }

  ObjProgDamageTrigger(ch, obj);
  if ( IsObjectExtracted(obj) )
    return global_objcode;

  switch( obj->ItemType )
    {
    default:
      MakeScraps( obj );
      objcode = rOBJ_SCRAPPED;
      break;
    case ITEM_CONTAINER:
      if (--obj->Value[OVAL_CONTAINER_CONDITION] <= 0)
        {
          MakeScraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    case ITEM_ARMOR:
      if ( ch && obj->Value[OVAL_ARMOR_CONDITION] >= 1 )
        ch->ArmorClass += GetObjectArmorClass( obj, obj->WearLoc );

      if (--obj->Value[OVAL_ARMOR_CONDITION] <= 0)
        {
          MakeScraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      else
        if ( ch && obj->Value[OVAL_ARMOR_CONDITION] >= 1 )
          ch->ArmorClass -= GetObjectArmorClass( obj, obj->WearLoc );

      break;
    case ITEM_WEAPON:
      if (--obj->Value[OVAL_WEAPON_CONDITION] <= 0)
        {
          MakeScraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    }
  return objcode;
}

/* Make objects in rooms that are nofloor fall - Scryn 1/23/96 */
void ObjectFallIfNoFloor( Object *obj, bool through )
{
  Exit *pexit;
  Room *to_room;
  static int fall_count;
  static bool is_falling; /* Stop loops from the call to ObjectToRoom()  -- Altrag */

  if ( !obj->InRoom || is_falling )
    return;

  if (fall_count > 30)
    {
      Bug( "object falling in loop more than 30 times", 0 );
      ExtractObject(obj);
      fall_count = 0;
      return;
    }

  if ( IsBitSet( obj->InRoom->Flags, ROOM_NOFLOOR )
       &&   CAN_GO( obj, DIR_DOWN )
       &&   !IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    {

      pexit = GetExit( obj->InRoom, DIR_DOWN );
      to_room = pexit->ToRoom;

      if (through)
        fall_count++;
      else
        fall_count = 0;

      if (obj->InRoom == to_room)
        {
          Bug( "Object falling into same room, room %ld", to_room->Vnum);
          ExtractObject( obj );
          return;
        }

      if (obj->InRoom->FirstPerson)
        {
          Act( AT_PLAIN, "$p falls far below...",
               obj->InRoom->FirstPerson, obj, NULL, TO_ROOM );
          Act( AT_PLAIN, "$p falls far below...",
               obj->InRoom->FirstPerson, obj, NULL, TO_CHAR );
        }
      ObjectFromRoom( obj );
      is_falling = true;
      obj = ObjectToRoom( obj, to_room );
      is_falling = false;

      if (obj->InRoom->FirstPerson)
        {
          Act( AT_PLAIN, "$p falls from above...",
               obj->InRoom->FirstPerson, obj, NULL, TO_ROOM );
          Act( AT_PLAIN, "$p falls from above...",
               obj->InRoom->FirstPerson, obj, NULL, TO_CHAR );
        }

      if (!IsBitSet( obj->InRoom->Flags, ROOM_NOFLOOR ) && through )
        {
          /*            int dam = (int)9.81*sqrt(fall_count*2/9.81)*obj->weight/2;
           */           int dam = fall_count*obj->Weight/2;
          /* Damage players */
          if ( obj->InRoom->FirstPerson && GetRandomPercent() > 15 )
            {
              Character *rch;
              Character *vch = NULL;
              int chcnt = 0;

              for ( rch = obj->InRoom->FirstPerson; rch;
                    rch = rch->NextInRoom, chcnt++ )
                if ( GetRandomNumberFromRange( 0, chcnt ) == 0 )
                  vch = rch;

              Act( AT_WHITE, "$p falls on $n!", vch, obj, NULL, TO_ROOM );
              Act( AT_WHITE, "$p falls on you!", vch, obj, NULL, TO_CHAR );
              InflictDamage( vch, vch, dam*vch->TopLevel, TYPE_UNDEFINED );
            }
          /* Damage objects */
          switch( obj->ItemType )
            {
            case ITEM_WEAPON:
            case ITEM_ARMOR:
              if ( (obj->Value[OVAL_ARMOR_CONDITION] - dam) <= 0 )
                {
                  if (obj->InRoom->FirstPerson)
                    {
                      Act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->InRoom->FirstPerson, obj, NULL, TO_ROOM );
                      Act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->InRoom->FirstPerson, obj, NULL, TO_CHAR );
                    }
                  MakeScraps(obj);
                }
              else
                obj->Value[OVAL_ARMOR_CONDITION] -= dam;
              break;
            default:
              if ( (dam*15) > GetObjectResistance(obj) )
                {
                  if (obj->InRoom->FirstPerson)
                    {
                      Act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->InRoom->FirstPerson, obj, NULL, TO_ROOM );
                      Act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->InRoom->FirstPerson, obj, NULL, TO_CHAR );
                    }
                  MakeScraps(obj);
                }
              break;
            }
        }
      ObjectFallIfNoFloor( obj, true );
    }
}

bool RemoveObject( Character *ch, WearLocation iWear, bool fReplace )
{
  Object *obj, *tmpobj;

  if ( ( obj = GetEquipmentOnCharacter( ch, iWear ) ) == NULL )
    return true;

  if ( !fReplace
       &&   ch->CarryNumber + GetObjectCount( obj ) > GetCarryCapacityNumber( ch ) )
    {
      Act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->Name, TO_CHAR );
      return false;
    }

  if ( !fReplace )
    return false;

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      Act( AT_PLAIN, "You can't remove $p.", ch, obj, NULL, TO_CHAR );
      return false;
    }

  if ( obj == GetEquipmentOnCharacter( ch, WEAR_WIELD )
       && ( tmpobj = GetEquipmentOnCharacter( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->WearLoc = WEAR_WIELD;

  UnequipCharacter( ch, obj );

  Act( AT_ACTION, "$n stops using $p.", ch, obj, NULL, TO_ROOM );
  Act( AT_ACTION, "You stop using $p.", ch, obj, NULL, TO_CHAR );
  ObjProgRemoveTrigger( ch, obj );
  return true;
}

char *GetObjectShortDescription( const Object *obj )
{
  static char buf[MAX_STRING_LENGTH];

  if ( obj->Count > 1 )
    {
      sprintf( buf, "%s (%d)", obj->ShortDescr, obj->Count );
      return buf;
    }

  return obj->ShortDescr;
}
