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
 *                         Object manipulation module                      *
 ****************************************************************************/

#include "character.h"
#include "mud.h"

/*
 * how resistant an object is to damage                         -Thoric
 */
short get_obj_resistance( const OBJ_DATA *obj )
{
  short resist = number_fuzzy(MAX_ITEM_IMPACT);

  /* magical items are more resistant */
  if ( IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    resist += number_fuzzy(12);
  /* blessed objects should have a little bonus */
  if ( IS_OBJ_STAT( obj, ITEM_BLESS ) )
    resist += number_fuzzy(5);
  /* lets make store inventory pretty tough */
  if ( IS_OBJ_STAT( obj, ITEM_INVENTORY ) )
    resist += 20;

  /* okay... let's add some bonus/penalty for item level... */
  resist += (obj->level / 10);

  /* and lasty... take armor or weapon's condition into consideration */
  if (obj->item_type == ITEM_ARMOR || obj->item_type == ITEM_WEAPON)
    resist += (obj->value[0]);

  return URANGE(10, resist, 99);
}

/*
 * Damage an object.                                            -Thoric
 * Affect player's AC if necessary.
 * Make object into scraps if necessary.
 * Send message about damaged object.
 */
obj_ret damage_obj( OBJ_DATA *obj )
{
  Character *ch;
  obj_ret objcode;

  ch = obj->carried_by;
  objcode = rNONE;

  if (ch && ch->in_room && IS_SET(ch->in_room->room_flags,ROOM_ARENA))
    return objcode;

  separate_obj( obj );
  if ( ch )
    act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
  else
    if ( obj->in_room && ( ch = obj->in_room->first_person ) != NULL )
      {
        act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_ROOM );
        act( AT_OBJECT, "($p gets damaged)", ch, obj, NULL, TO_CHAR );
        ch = NULL;
      }

  oprog_damage_trigger(ch, obj);
  if ( obj_extracted(obj) )
    return global_objcode;

  switch( obj->item_type )
    {
    default:
      make_scraps( obj );
      objcode = rOBJ_SCRAPPED;
      break;
    case ITEM_CONTAINER:
      if (--obj->value[3] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    case ITEM_ARMOR:
      if ( ch && obj->value[0] >= 1 )
        ch->armor += apply_ac( obj, obj->wear_loc );
      if (--obj->value[0] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      else
        if ( ch && obj->value[0] >= 1 )
          ch->armor -= apply_ac( obj, obj->wear_loc );
      break;
    case ITEM_WEAPON:
      if (--obj->value[0] <= 0)
        {
          make_scraps( obj );
          objcode = rOBJ_SCRAPPED;
        }
      break;
    }
  return objcode;
}

/*
 * Save items in a clan storage room                    -Scryn & Thoric
 */
void save_clan_storeroom( Character *ch, const CLAN_DATA *clan )
{
  FILE *fp;
  char filename[256];
  short templvl;
  const OBJ_DATA *contents;

  if ( !clan )
    {
      bug( "save_clan_storeroom: Null clan pointer!", 0 );
      return;
    }

  if ( !ch )
    {
      bug ("save_clan_storeroom: Null ch pointer!", 0);
      return;
    }

  sprintf( filename, "%s%s.vault", CLAN_DIR, clan->filename );
  if ( ( fp = fopen( filename, "w" ) ) == NULL )
    {
      bug( "save_clan_storeroom: fopen", 0 );
      perror( filename );
    }
  else
    {
      templvl = ch->top_level;
      ch->top_level = LEVEL_AVATAR;               /* make sure EQ doesn't get lost */
      contents = ch->in_room->last_content;
      if (contents)
        fwrite_obj(ch, contents, fp, 0, OS_CARRY );
      fprintf( fp, "#END\n" );
      ch->top_level = templvl;
      fclose( fp );
      return;
    }
  return;
}

/* Make objects in rooms that are nofloor fall - Scryn 1/23/96 */

void obj_fall( OBJ_DATA *obj, bool through )
{
  Exit *pexit;
  ROOM_INDEX_DATA *to_room;
  static int fall_count;
  char buf[MAX_STRING_LENGTH];
  static bool is_falling; /* Stop loops from the call to obj_to_room()  -- Altrag */

  if ( !obj->in_room || is_falling )
    return;

  if (fall_count > 30)
    {
      bug( "object falling in loop more than 30 times", 0 );
      extract_obj(obj);
      fall_count = 0;
      return;
    }

  if ( IS_SET( obj->in_room->room_flags, ROOM_NOFLOOR )
       &&   CAN_GO( obj, DIR_DOWN )
       &&   !IS_OBJ_STAT( obj, ITEM_MAGIC ) )
    {

      pexit = get_exit( obj->in_room, DIR_DOWN );
      to_room = pexit->to_room;

      if (through)
        fall_count++;
      else
        fall_count = 0;

      if (obj->in_room == to_room)
        {
          sprintf(buf, "Object falling into same room, room %ld",
                  to_room->vnum);
          bug( buf, 0 );
          extract_obj( obj );
          return;
        }

      if (obj->in_room->first_person)
        {
          act( AT_PLAIN, "$p falls far below...",
               obj->in_room->first_person, obj, NULL, TO_ROOM );
          act( AT_PLAIN, "$p falls far below...",
               obj->in_room->first_person, obj, NULL, TO_CHAR );
        }
      obj_from_room( obj );
      is_falling = TRUE;
      obj = obj_to_room( obj, to_room );
      is_falling = FALSE;

      if (obj->in_room->first_person)
        {
          act( AT_PLAIN, "$p falls from above...",
               obj->in_room->first_person, obj, NULL, TO_ROOM );
          act( AT_PLAIN, "$p falls from above...",
               obj->in_room->first_person, obj, NULL, TO_CHAR );
        }

      if (!IS_SET( obj->in_room->room_flags, ROOM_NOFLOOR ) && through )
        {
          /*            int dam = (int)9.81*sqrt(fall_count*2/9.81)*obj->weight/2;
           */           int dam = fall_count*obj->weight/2;
          /* Damage players */
          if ( obj->in_room->first_person && number_percent() > 15 )
            {
              Character *rch;
              Character *vch = NULL;
              int chcnt = 0;

              for ( rch = obj->in_room->first_person; rch;
                    rch = rch->next_in_room, chcnt++ )
                if ( number_range( 0, chcnt ) == 0 )
                  vch = rch;
              act( AT_WHITE, "$p falls on $n!", vch, obj, NULL, TO_ROOM );
              act( AT_WHITE, "$p falls on you!", vch, obj, NULL, TO_CHAR );
              damage( vch, vch, dam*vch->top_level, TYPE_UNDEFINED );
            }
          /* Damage objects */
          switch( obj->item_type )
            {
            case ITEM_WEAPON:
            case ITEM_ARMOR:
              if ( (obj->value[0] - dam) <= 0 )
                {
                  if (obj->in_room->first_person)
                    {
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_ROOM );
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_CHAR );
                    }
                  make_scraps(obj);
                }
              else
                obj->value[0] -= dam;
              break;
            default:
              if ( (dam*15) > get_obj_resistance(obj) )
                {
                  if (obj->in_room->first_person)
                    {
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_ROOM );
                      act( AT_PLAIN, "$p is destroyed by the fall!",
                           obj->in_room->first_person, obj, NULL, TO_CHAR );
                    }
                  make_scraps(obj);
                }
              break;
            }
        }
      obj_fall( obj, TRUE );
    }
}

bool remove_obj( Character *ch, int iWear, bool fReplace )
{
  OBJ_DATA *obj, *tmpobj;

  if ( ( obj = get_eq_char( ch, iWear ) ) == NULL )
    return TRUE;

  if ( !fReplace
       &&   ch->carry_number + get_obj_number( obj ) > can_carry_n( ch ) )
    {
      act( AT_PLAIN, "$d: you can't carry that many items.",
           ch, NULL, obj->name, TO_CHAR );
      return FALSE;
    }

  if ( !fReplace )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_NOREMOVE) )
    {
      act( AT_PLAIN, "You can't remove $p.", ch, obj, NULL, TO_CHAR );
      return FALSE;
    }

  if ( obj == get_eq_char( ch, WEAR_WIELD )
       && ( tmpobj = get_eq_char( ch, WEAR_DUAL_WIELD)) != NULL )
    tmpobj->wear_loc = WEAR_WIELD;

  unequip_char( ch, obj );

  act( AT_ACTION, "$n stops using $p.", ch, obj, NULL, TO_ROOM );
  act( AT_ACTION, "You stop using $p.", ch, obj, NULL, TO_CHAR );
  oprog_remove_trigger( ch, obj );
  return TRUE;
}
