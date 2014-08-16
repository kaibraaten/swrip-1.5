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
#include "character.h"
#include "mud.h"
#include "track.h"

extern Character *gch_prev;
extern OBJ_DATA *gobj_prev;

Character *cur_char = NULL;
ROOM_INDEX_DATA *cur_room = NULL;
bool cur_char_died = false;
ch_ret global_retcode = rNONE;

int cur_obj = 0;
int cur_obj_serial = 0;
bool cur_obj_extracted = false;
obj_ret global_objcode = rNONE;

OBJ_DATA *group_object( OBJ_DATA *obj1, OBJ_DATA *obj2 );

static void room_explode( OBJ_DATA *obj , Character *xch, ROOM_INDEX_DATA *room );
static void room_explode_1( OBJ_DATA *obj , Character *xch, ROOM_INDEX_DATA *room , int blast );
static void room_explode_2( ROOM_INDEX_DATA *room , int blast );

void explode( OBJ_DATA *obj )
{
  if ( obj->armed_by )
    {
      ROOM_INDEX_DATA *room;
      Character *xch;
      bool held = false;
      OBJ_DATA *objcont = obj;

      while ( objcont->in_obj && !obj->carried_by )
        objcont = objcont->in_obj;

      for ( xch = first_char; xch; xch = xch->next )
        if ( !IsNpc( xch ) && nifty_is_name( obj->armed_by, xch->name ) )
          {
            if ( objcont->carried_by )
              {
                act( AT_WHITE, "$p EXPLODES in $n's hands!", objcont->carried_by, obj, NULL, TO_ROOM );
                act( AT_WHITE, "$p EXPLODES in your hands!", objcont->carried_by, obj, NULL, TO_CHAR );
                room = xch->in_room;
                held = true;
              }
            else if ( objcont->in_room )
              room = objcont->in_room;
            else
              room = NULL;

            if ( room )
              {
                if ( !held && room->first_person )
                  act( AT_WHITE, "$p EXPLODES!", room->first_person , obj, NULL, TO_ROOM );
                room_explode( obj , xch, room );
              }
          }
    }
  make_scraps(obj);
}

void room_explode( OBJ_DATA *obj, Character *xch, ROOM_INDEX_DATA *room )
{
  int blast = (int) (obj->value[OVAL_EXPLOSIVE_MAX_DMG] / 500) ;
  room_explode_1( obj , xch, room , blast );
  room_explode_2( room , blast );
}

void room_explode_1( OBJ_DATA *obj, Character *xch, ROOM_INDEX_DATA *room, int blast )
{
  Character *rch;
  Character *rnext;
  OBJ_DATA  *robj;
  OBJ_DATA  *robj_next;
  int dam;

  if ( IS_SET( room->room_flags, BFS_MARK ) )
    return;

  SET_BIT( room->room_flags , BFS_MARK );

  for ( rch = room->first_person ; rch ;  rch = rnext )
    {
      rnext = rch->next_in_room;
      act( AT_WHITE, "The shockwave from a massive explosion rips through your body!", room->first_person , obj, NULL, TO_ROOM );
      dam = number_range ( obj->value[OVAL_EXPLOSIVE_MIN_DMG] , obj->value[OVAL_EXPLOSIVE_MAX_DMG] );
      damage( rch, rch , dam, TYPE_UNDEFINED );
      if ( !char_died(rch) )
        {
          if ( IsNpc( rch ) )
            {
              if ( IS_SET( rch->act , ACT_SENTINEL ) )
                {
                  rch->was_sentinel = rch->in_room;
                  REMOVE_BIT( rch->act, ACT_SENTINEL );
                }
              start_hating( rch , xch );
              start_hunting( rch , xch );
            }
        }
    }

  for ( robj = room->first_content; robj; robj = robj_next )
    {
      robj_next = robj->next_content;
      if ( robj != obj && robj->item_type != ITEM_SPACECRAFT && robj->item_type != ITEM_SCRAPS
           && robj->item_type != ITEM_CORPSE_NPC && robj->item_type != ITEM_CORPSE_PC && robj->item_type != ITEM_DROID_CORPSE)
        make_scraps( robj );
    }

  /* other rooms */
  {
    Exit *pexit;

    for ( pexit = room->first_exit; pexit; pexit = pexit->next )
      {
        if ( pexit->to_room
             &&   pexit->to_room != room )
          {
            if ( blast > 0 )
              {
                int roomblast;
                roomblast = blast - 1;
                room_explode_1( obj , xch, pexit->to_room , roomblast );
              }
            else
              echo_to_room( AT_WHITE, pexit->to_room , "You hear a loud EXPLOSION not to far from here." );
          }
      }
  }
}

void room_explode_2( ROOM_INDEX_DATA *room , int blast )
{

  if ( !IS_SET( room->room_flags, BFS_MARK ) )
    return;

  REMOVE_BIT( room->room_flags , BFS_MARK );

  if ( blast > 0 )
    {
      int roomblast;
      Exit *pexit;

      for ( pexit = room->first_exit; pexit; pexit = pexit->next )
        {
          if ( pexit->to_room
               &&   pexit->to_room != room )
            {
              roomblast = blast - 1;
              room_explode_2( pexit->to_room , roomblast );
            }
        }
    }

}

/*                                                              -Thoric
 * Return how much experience is required for ch to get to a certain level
 */
int exp_level( short level)
{
  int lvl = UMAX(0, level - 1);

  return lvl * lvl * 500;
}

/*
 * See if a player/mob can take a piece of prototype eq         -Thoric
 */
bool can_take_proto( const Character *ch )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) && IS_SET(ch->act, ACT_PROTOTYPE) )
    return true;
  else
    return false;
}

/*
 * Apply or remove an affect to a character.
 */
void affect_modify( Character *ch, Affect *paf, bool fAdd )
{
  OBJ_DATA *wield;
  int mod;
  struct skill_type *skill;
  ch_ret retcode;

  mod = paf->modifier;

  if ( fAdd )
    {
      SET_BIT( ch->affected_by, paf->bitvector );
    }
  else
    {
      REMOVE_BIT( ch->affected_by, paf->bitvector );
      /*
       * might be an idea to have a duration removespell which returns
       * the spell after the duration... but would have to store
       * the removed spell's information somewhere...           -Thoric
       */
      if ( (paf->location % REVERSE_APPLY) == APPLY_REMOVESPELL )
        return;
      switch( paf->location % REVERSE_APPLY )
        {
        case APPLY_AFFECT:        REMOVE_BIT( ch->affected_by, mod );   return;
        case APPLY_RESISTANT:     REMOVE_BIT( ch->resistant, mod );     return;
        case APPLY_IMMUNE:        REMOVE_BIT( ch->immune, mod );        return;
        case APPLY_SUSCEPTIBLE:   REMOVE_BIT( ch->susceptible, mod );   return;
        case APPLY_WEARSPELL:       /* affect only on wear */           return;
        case APPLY_REMOVE:          SET_BIT( ch->affected_by, mod );    return;
        }
      mod = 0 - mod;
    }

  switch ( paf->location % REVERSE_APPLY )
    {
    default:
      bug( "Affect_modify: unknown location %d.", paf->location );
      return;

    case APPLY_NONE:                                            break;
    case APPLY_STR:           ch->stats.mod_str               += mod; break;
    case APPLY_DEX:           ch->stats.mod_dex               += mod; break;
    case APPLY_INT:           ch->stats.mod_int               += mod; break;
    case APPLY_WIS:           ch->stats.mod_wis               += mod; break;
    case APPLY_CON:           ch->stats.mod_con               += mod; break;
    case APPLY_CHA:           ch->stats.mod_cha               += mod; break;
    case APPLY_LCK:           ch->stats.mod_lck               += mod; break;
    case APPLY_SEX:
      ch->sex = (ch->sex+mod) % 3;
      if ( ch->sex < 0 )
        ch->sex += 2;
      ch->sex = URANGE( 0, ch->sex, 2 );
      break;
    case APPLY_LEVEL:                                           break;
    case APPLY_AGE:                                             break;
    case APPLY_HEIGHT:        ch->height                += mod; break;
    case APPLY_WEIGHT:        ch->weight                += mod; break;
    case APPLY_MANA:          ch->max_mana              += mod; break;
    case APPLY_HIT:           ch->max_hit               += mod; break;
    case APPLY_MOVE:          ch->max_move              += mod; break;
    case APPLY_GOLD:                                            break;
    case APPLY_EXP:                                             break;
    case APPLY_AC:            ch->armor                 += mod; break;
    case APPLY_HITROLL:       ch->hitroll               += mod; break;
    case APPLY_DAMROLL:       ch->damroll               += mod; break;
    case APPLY_SAVING_POISON: ch->saving.poison_death   += mod; break;
    case APPLY_SAVING_ROD:    ch->saving.wand           += mod; break;
    case APPLY_SAVING_PARA:   ch->saving.para_petri     += mod; break;
    case APPLY_SAVING_BREATH: ch->saving.breath         += mod; break;
    case APPLY_SAVING_SPELL:  ch->saving.spell_staff    += mod; break;
    case APPLY_AFFECT:        SET_BIT( ch->affected_by, mod );  break;
    case APPLY_RESISTANT:     SET_BIT( ch->resistant, mod );    break;
    case APPLY_IMMUNE:        SET_BIT( ch->immune, mod );       break;
    case APPLY_SUSCEPTIBLE:   SET_BIT( ch->susceptible, mod );  break;
    case APPLY_WEAPONSPELL:     /* see fight.c */               break;
    case APPLY_REMOVE:        REMOVE_BIT(ch->affected_by, mod); break;

    case APPLY_FULL:
      if ( !IsNpc(ch) )
        ch->pcdata->condition[COND_FULL] =
          URANGE( 0, ch->pcdata->condition[COND_FULL] + mod, 48 );
      break;

    case APPLY_THIRST:
      if ( !IsNpc(ch) )
        ch->pcdata->condition[COND_THIRST] =
          URANGE( 0, ch->pcdata->condition[COND_THIRST] + mod, 48 );
      break;

    case APPLY_DRUNK:
      if ( !IsNpc(ch) )
        ch->pcdata->condition[COND_DRUNK] =
          URANGE( 0, ch->pcdata->condition[COND_DRUNK] + mod, 48 );
      break;

    case APPLY_MENTALSTATE:
      ch->mental_state  = URANGE(-100, ch->mental_state + mod, 100);
      break;
    case APPLY_EMOTION:
      ch->emotional_state       = URANGE(-100, ch->emotional_state + mod, 100);
      break;

    case APPLY_STRIPSN:
      if ( IS_VALID_SN(mod) )
        affect_strip( ch, mod );
      else
        bug( "affect_modify: APPLY_STRIPSN invalid sn %d", mod );
      break;

      /* spell cast upon wear/removal of an object      -Thoric */
    case APPLY_WEARSPELL:
    case APPLY_REMOVESPELL:
      if ( IS_SET(ch->in_room->room_flags, ROOM_NO_MAGIC)
           ||   IS_SET(ch->immune, RIS_MAGIC)
           ||   saving_char == ch               /* so save/quit doesn't trigger */
           ||   loading_char == ch )    /* so loading doesn't trigger */
        return;

      mod = abs(mod);
      if ( IS_VALID_SN(mod)
           &&  (skill=skill_table[mod]) != NULL
           &&   skill->type == SKILL_SPELL )
        if ( (retcode=(*skill->spell_fun) ( mod, get_level( ch, FORCE_ABILITY ), ch, ch )) == rCHAR_DIED || char_died(ch) )
          return;
      break;


      /* skill apply types      -Thoric */

    case APPLY_PALM:    /* not implemented yet */               break;
    case APPLY_TRACK:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_track]> 0 )
        ch->pcdata->learned[gsn_track] =
          ( ch->pcdata->learned[gsn_track] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_track] + mod, 100 ) );
      break;
    case APPLY_HIDE:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_hide]> 0)
        ch->pcdata->learned[gsn_hide] =
          ( ch->pcdata->learned[gsn_hide] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_hide] + mod, 100 ) );
      break;
    case APPLY_STEAL:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_steal] > 0)
        ch->pcdata->learned[gsn_steal] =
          ( ch->pcdata->learned[gsn_steal] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_steal] + mod, 100 ) );
      break;
    case APPLY_SNEAK:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_sneak]> 0)
        ch->pcdata->learned[gsn_sneak] =
          ( ch->pcdata->learned[gsn_sneak] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_sneak] + mod, 100 ) );
      break;
    case APPLY_PICK:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_pick_lock]> 0)
        ch->pcdata->learned[gsn_pick_lock] =
          ( ch->pcdata->learned[gsn_pick_lock] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_pick_lock] + mod, 100 ) );
      break;
    case APPLY_BACKSTAB:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_backstab]> 0)
        ch->pcdata->learned[gsn_backstab] =
          ( ch->pcdata->learned[gsn_backstab] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_backstab] + mod, 100 ) );
      break;
    case APPLY_DETRAP:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_detrap]> 0)
        ch->pcdata->learned[gsn_detrap] =
          ( ch->pcdata->learned[gsn_detrap] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_detrap] + mod, 100 ) );
      break;
    case APPLY_DODGE:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_dodge]> 0)
        ch->pcdata->learned[gsn_dodge] =
          ( ch->pcdata->learned[gsn_dodge] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_dodge] + mod, 100 ) );
      break;
    case APPLY_PEEK:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_peek]> 0)
        ch->pcdata->learned[gsn_peek] =
          ( ch->pcdata->learned[gsn_peek] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_peek] + mod, 100 ) );
      break;
    case APPLY_SCAN:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_scan]> 0)
        ch->pcdata->learned[gsn_scan] =
          ( ch->pcdata->learned[gsn_scan] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_scan] + mod, 100 ) );
      break;
    case APPLY_GOUGE:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_gouge]> 0)
        ch->pcdata->learned[gsn_gouge] =
          ( ch->pcdata->learned[gsn_gouge] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_gouge] + mod, 100 ) );
      break;
    case APPLY_SEARCH:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_search]> 0)
        ch->pcdata->learned[gsn_search] =
          ( ch->pcdata->learned[gsn_search] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_search] + mod, 100 ) );
      break;
    case APPLY_DIG:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_dig]> 0)
        ch->pcdata->learned[gsn_dig] =
          ( ch->pcdata->learned[gsn_dig] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_dig] + mod, 100 ) );
      break;
    case APPLY_MOUNT:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_mount]> 0 )
        ch->pcdata->learned[gsn_mount] =
          ( ch->pcdata->learned[gsn_mount] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_mount] + mod, 100 ) );
      break;
    case APPLY_DISARM:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_disarm]> 0 )
        ch->pcdata->learned[gsn_disarm] =
          ( ch->pcdata->learned[gsn_disarm] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_disarm] + mod, 100 ) );
      break;
    case APPLY_KICK:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_kick]> 0)
        ch->pcdata->learned[gsn_kick] =
          ( ch->pcdata->learned[gsn_kick] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_kick] + mod, 100 ) );
      break;
    case APPLY_PARRY:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_parry]> 0)
        ch->pcdata->learned[gsn_parry] =
          ( ch->pcdata->learned[gsn_parry] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_parry] + mod, 100 ) );
      break;
    case APPLY_BASH:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_bash]> 0)
        ch->pcdata->learned[gsn_bash] =
          ( ch->pcdata->learned[gsn_bash] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_bash] + mod, 100 ) );
      break;
    case APPLY_STUN:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_stun]> 0)
        ch->pcdata->learned[gsn_stun] =
          ( ch->pcdata->learned[gsn_stun] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_stun] + mod, 100 ) );
      break;
    case APPLY_PUNCH:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_punch]> 0)
        ch->pcdata->learned[gsn_punch] =
          ( ch->pcdata->learned[gsn_punch] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_punch] + mod, 100 ) );
      break;
    case APPLY_CLIMB:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_climb]> 0)
        ch->pcdata->learned[gsn_climb] =
          ( ch->pcdata->learned[gsn_climb] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_climb] + mod, 100 ) );
      break;
    case APPLY_GRIP:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_grip]> 0)
        ch->pcdata->learned[gsn_grip] =
          ( ch->pcdata->learned[gsn_grip] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_grip] + mod, 100 ) );
      break;
    case APPLY_SNIPE:
      if ( !IsNpc(ch) && ch->pcdata->learned[gsn_snipe]> 0)
        ch->pcdata->learned[gsn_snipe] =
          ( ch->pcdata->learned[gsn_snipe] >= 100 ? 100 : URANGE( 1, ch->pcdata->learned[gsn_snipe] + mod, 100 ) );
      break;
    }

  /*
   * Check for weapon wielding.
   * Guard against recursion (for weapons with affects).
   */
  if ( !IsNpc( ch )
       &&   saving_char != ch
       && ( wield = get_eq_char( ch, WEAR_WIELD ) ) != NULL
       &&   get_obj_weight(wield) > str_app[GetCurrentStrength(ch)].wield )
    {
      static int depth;

      if ( depth == 0 )
        {
          depth++;
          act( AT_ACTION, "You are too weak to wield $p any longer.",
               ch, wield, NULL, TO_CHAR );
          act( AT_ACTION, "$n stops wielding $p.", ch, wield, NULL, TO_ROOM );
          unequip_char( ch, wield );
          depth--;
        }
    }
}



/*
 * Give an affect to a char.
 */
void affect_to_char( Character *ch, Affect *paf )
{
  Affect *paf_new;

  if ( !ch )
    {
      bug( "Affect_to_char: NULL ch!", 0 );
      return;
    }

  if ( !paf )
    {
      bug( "Affect_to_char: NULL paf!", 0 );
      return;
    }

  CREATE( paf_new, Affect, 1 );
  LINK( paf_new, ch->first_affect, ch->last_affect, next, prev );
  paf_new->type = paf->type;
  paf_new->duration     = paf->duration;
  paf_new->location     = paf->location;
  paf_new->modifier     = paf->modifier;
  paf_new->bitvector    = paf->bitvector;

  affect_modify( ch, paf_new, true );
}


/*
 * Remove an affect from a char.
 */
void affect_remove( Character *ch, Affect *paf )
{
  if ( !ch->first_affect )
    {
      bug( "Affect_remove: no affect." );
      return;
    }

  affect_modify( ch, paf, false );

  UNLINK( paf, ch->first_affect, ch->last_affect, next, prev );
  DISPOSE( paf );
}

/*
 * Strip all affects of a given sn.
 */
void affect_strip( Character *ch, int sn )
{
  Affect *paf;
  Affect *paf_next;

  for ( paf = ch->first_affect; paf; paf = paf_next )
    {
      paf_next = paf->next;

      if ( paf->type == sn )
        affect_remove( ch, paf );
    }
}

/*
 * Add or enhance an affect.
 * Limitations put in place by Thoric, they may be high... but at least
 * they're there :)
 */
void affect_join( Character *ch, Affect *paf )
{
  Affect *paf_old;

  for ( paf_old = ch->first_affect; paf_old; paf_old = paf_old->next )
    if ( paf_old->type == paf->type )
      {
        paf->duration = UMIN( 1000000, paf->duration + paf_old->duration );
        if ( paf->modifier )
          paf->modifier = UMIN( 5000, paf->modifier + paf_old->modifier );
        else
          paf->modifier = paf_old->modifier;
        affect_remove( ch, paf_old );
        break;
      }

  affect_to_char( ch, paf );
}


/*
 * Move a char out of a room.
 */
void char_from_room( Character *ch )
{
  OBJ_DATA *obj;

  if ( !ch )
    {
      bug( "Char_from_room: NULL char." );
      return;
    }

  if ( !ch->in_room )
    {
      bug( "Char_from_room: NULL room: %s", ch->name );
      return;
    }

  if ( !IsNpc(ch) )
    --ch->in_room->area->nplayer;

  if ( ( obj = get_eq_char( ch, WEAR_LIGHT ) ) != NULL
       && obj->item_type == ITEM_LIGHT
       && obj->value[OVAL_LIGHT_POWER] != 0
       && ch->in_room->light > 0 )
    {
      --ch->in_room->light;
    }

  UNLINK( ch, ch->in_room->first_person, ch->in_room->last_person,
          next_in_room, prev_in_room );
  ch->in_room      = NULL;
  ch->next_in_room = NULL;
  ch->prev_in_room = NULL;

  if ( !IsNpc(ch)
       &&   get_timer( ch, TIMER_SHOVEDRAG ) > 0 )
    remove_timer( ch, TIMER_SHOVEDRAG );
}

/*
 * Move a char into a room.
 */
void char_to_room( Character *ch, ROOM_INDEX_DATA *pRoomIndex )
{
  OBJ_DATA *obj;

  if ( !ch )
    {
      bug( "Char_to_room: NULL ch!" );
      return;
    }
  if ( !pRoomIndex )
    {
      bug( "Char_to_room: %s -> NULL room!  Putting char in limbo (%ld)",
	   ch->name, ROOM_VNUM_LIMBO );
      /* This used to just return, but there was a problem with crashing
         and I saw no reason not to just put the char in limbo. -Narn */
      pRoomIndex = get_room_index( ROOM_VNUM_LIMBO );
    }

  ch->in_room           = pRoomIndex;
  LINK( ch, pRoomIndex->first_person, pRoomIndex->last_person,
        next_in_room, prev_in_room );

  if ( !IsNpc(ch) )
    if ( ++ch->in_room->area->nplayer > ch->in_room->area->max_players )
      ch->in_room->area->max_players = ch->in_room->area->nplayer;

  if ( ( obj = get_eq_char( ch, WEAR_LIGHT ) ) != NULL
       &&   obj->item_type == ITEM_LIGHT
       &&   obj->value[OVAL_LIGHT_POWER] != 0 )
    ++ch->in_room->light;

  if ( !IsNpc(ch)
       &&    IS_SET(ch->in_room->room_flags, ROOM_SAFE)
       &&    get_timer(ch, TIMER_SHOVEDRAG) <= 0 )
    add_timer( ch, TIMER_SHOVEDRAG, 10, NULL, SUB_NONE );  /*-30 Seconds-*/

  /*
   * Delayed Teleport rooms                                     -Thoric
   * Should be the last thing checked in this function
   */
  if ( IS_SET( ch->in_room->room_flags, ROOM_TELEPORT )
       &&        ch->in_room->tele_delay > 0 )
    {
      TELEPORT_DATA *tele;

      for ( tele = first_teleport; tele; tele = tele->next )
        if ( tele->room == pRoomIndex )
          return;

      CREATE( tele, TELEPORT_DATA, 1 );
      LINK( tele, first_teleport, last_teleport, next, prev );
      tele->room                = pRoomIndex;
      tele->timer               = pRoomIndex->tele_delay;
    }
}

/*
 * Give an obj to a char.
 */
OBJ_DATA *obj_to_char( OBJ_DATA *obj, Character *ch )
{
  OBJ_DATA *otmp = NULL;
  OBJ_DATA *oret = obj;
  bool skipgroup = false, grouped = false;
  int oweight = get_obj_weight( obj );
  int onum = get_obj_number( obj );
  int wear_loc = obj->wear_loc;
  int extra_flags = obj->extra_flags;

  if (IS_OBJ_STAT( obj, ITEM_PROTOTYPE ) )
    {
      if (!IsImmortal( ch )
          && (IsNpc(ch) && !IS_SET(ch->act, ACT_PROTOTYPE)) )
        return obj_to_room( obj, ch->in_room );
    }

  if ( loading_char == ch )
    {
      int x,y;
      for ( x = 0; x < MAX_WEAR; x++ )
        for ( y = 0; y < MAX_LAYERS; y++ )
          if ( save_equipment[x][y] == obj )
            {
              skipgroup = true;
              break;
            }
    }

  if ( !skipgroup )
    for ( otmp = ch->first_carrying; otmp; otmp = otmp->next_content )
      if ( (oret=group_object( otmp, obj )) == otmp )
        {
          grouped = true;
          break;
        }

  if ( !grouped )
    {
      LINK( obj, ch->first_carrying, ch->last_carrying, next_content, prev_content );
      obj->carried_by                   = ch;
      obj->in_room                      = NULL;
      obj->in_obj                       = NULL;
    }
  if (wear_loc == WEAR_NONE)
    {
      ch->carry_number  += onum;
      ch->carry_weight  += oweight;
    }
  else
    if ( !IS_SET(extra_flags, ITEM_MAGIC) && wear_loc != WEAR_FLOATING )
      ch->carry_weight  += oweight;
  return (oret ? oret : obj);
}



/*
 * Take an obj from its character.
 */
void obj_from_char( OBJ_DATA *obj )
{
  Character *ch;

  if ( ( ch = obj->carried_by ) == NULL )
    {
      bug( "Obj_from_char: null ch." );
      return;
    }

  if ( obj->wear_loc != WEAR_NONE )
    unequip_char( ch, obj );

  /* obj may drop during unequip... */
  if ( !obj->carried_by )
    return;

  UNLINK( obj, ch->first_carrying, ch->last_carrying, next_content, prev_content );

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && obj->first_content )
    empty_obj( obj, NULL, NULL );

  obj->in_room   = NULL;
  obj->carried_by        = NULL;
  ch->carry_number      -= get_obj_number( obj );
  ch->carry_weight      -= get_obj_weight( obj );
}

int count_users(const OBJ_DATA *obj)
{
  const Character *fch = NULL;
  int count = 0;

  if (obj->in_room == NULL)
    return 0;

  for (fch = obj->in_room->first_person; fch != NULL; fch = fch->next_in_room)
    if (fch->on == obj)
      count++;

  return count;
}


/*
 * Find the ac value of an obj, including position effect.
 */
int apply_ac( const OBJ_DATA *obj, int iWear )
{
  if ( obj->item_type != ITEM_ARMOR )
    return 0;

  switch ( iWear )
    {
    case WEAR_BODY:     return 3 * obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_HEAD:     return 2 * obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_LEGS:     return 2 * obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_FEET:     return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_HANDS:    return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_ARMS:     return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_SHIELD:   return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_FINGER_L: return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_FINGER_R: return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_NECK_1:   return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_NECK_2:   return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_ABOUT:    return 2 * obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_WAIST:    return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_WRIST_L:  return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_WRIST_R:  return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_HOLD:     return     obj->value[OVAL_ARMOR_CONDITION];
    case WEAR_EYES:     return     obj->value[OVAL_ARMOR_CONDITION];
    }

  return 0;
}

/*
 * Count occurrences of an obj in a list.
 */
int count_obj_list( const OBJ_INDEX_DATA *pObjIndex, const OBJ_DATA *list )
{
  const OBJ_DATA *obj = NULL;
  int nMatch = 0;

  for ( obj = list; obj; obj = obj->next_content )
    if ( obj->pIndexData == pObjIndex )
      nMatch++;

  return nMatch;
}

/*
 * Move an obj out of a room.
 */
void write_corpses( Character *ch, const char *name );

int falling = 0;

void obj_from_room( OBJ_DATA *obj )
{
  ROOM_INDEX_DATA *in_room;

  if ( ( in_room = obj->in_room ) == NULL )
    {
      bug( "obj_from_room: NULL." );
      return;
    }

  UNLINK( obj, in_room->first_content, in_room->last_content,
          next_content, prev_content );

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && obj->first_content )
    empty_obj( obj, NULL, obj->in_room );

  if (obj->item_type == ITEM_FIRE)
    obj->in_room->light -= obj->count;

  obj->carried_by   = NULL;
  obj->in_obj         = NULL;
  obj->in_room      = NULL;

  if ( obj->pIndexData->vnum == OBJ_VNUM_CORPSE_PC && falling == 0 )
    write_corpses( NULL, obj->short_descr+14 );
}

/*
 * Move an obj into a room.
 */
OBJ_DATA *obj_to_room( OBJ_DATA *obj, ROOM_INDEX_DATA *pRoomIndex )
{
  OBJ_DATA *otmp, *oret;
  short count = obj->count;
  short item_type = obj->item_type;

  for ( otmp = pRoomIndex->first_content; otmp; otmp = otmp->next_content )
    if ( (oret=group_object( otmp, obj )) == otmp )
      {
        if (item_type == ITEM_FIRE)
          pRoomIndex->light += count;
        return oret;
      }

  LINK( obj, pRoomIndex->first_content, pRoomIndex->last_content,
        next_content, prev_content );
  obj->in_room                          = pRoomIndex;
  obj->carried_by                               = NULL;
  obj->in_obj                                   = NULL;

  if (item_type == ITEM_FIRE)
    pRoomIndex->light += count;

  falling++;
  obj_fall( obj, false );
  falling--;

  if ( obj->pIndexData->vnum == OBJ_VNUM_CORPSE_PC && falling == 0 )
    write_corpses( NULL, obj->short_descr+14 );

  return obj;
}

/*
 * Move an object into an object.
 */
OBJ_DATA *obj_to_obj( OBJ_DATA *obj, OBJ_DATA *obj_to )
{
  OBJ_DATA *otmp, *oret;

  if ( obj == obj_to )
    {
      bug( "Obj_to_obj: trying to put object inside itself: vnum %ld", obj->pIndexData->vnum );
      return obj;
    }
  /* Big carry_weight bug fix here by Thoric */
  if ( obj->carried_by != obj_to->carried_by )
    {
      if ( obj->carried_by )
        obj->carried_by->carry_weight -= get_obj_weight( obj );

      if ( obj_to->carried_by && obj_to->wear_loc != WEAR_FLOATING )
        obj_to->carried_by->carry_weight += get_obj_weight( obj );
    }

  for ( otmp = obj_to->first_content; otmp; otmp = otmp->next_content )
    if ( (oret=group_object( otmp, obj )) == otmp )
      return oret;

  LINK( obj, obj_to->first_content, obj_to->last_content,
        next_content, prev_content );
  obj->in_obj                            = obj_to;
  obj->in_room                   = NULL;
  obj->carried_by                        = NULL;

  return obj;
}

/*
 * Move an object out of an object.
 */
void obj_from_obj( OBJ_DATA *obj )
{
  OBJ_DATA *obj_from;

  if ( ( obj_from = obj->in_obj ) == NULL )
    {
      bug( "Obj_from_obj: null obj_from." );
      return;
    }

  UNLINK( obj, obj_from->first_content, obj_from->last_content,
          next_content, prev_content );

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) && obj->first_content )
    empty_obj( obj, obj->in_obj, NULL );

  obj->in_obj       = NULL;
  obj->in_room      = NULL;
  obj->carried_by   = NULL;

  for ( ; obj_from; obj_from = obj_from->in_obj )
    if ( obj_from->carried_by && obj_from->wear_loc != WEAR_FLOATING )
      obj_from->carried_by->carry_weight -= get_obj_weight( obj );
}

/*
 * Extract an obj from the world.
 */
void extract_obj( OBJ_DATA *obj )
{
  OBJ_DATA *obj_content;

  if ( !obj )
    {
      bug( "extract_obj: !obj" );
      return;
    }

  if ( obj_extracted(obj) )
    {
      bug( "extract_obj: obj %d already extracted!", obj->pIndexData->vnum );
      return;
    }

  if ( obj->item_type == ITEM_PORTAL )
    remove_portal( obj );

  if ( obj->carried_by )
    obj_from_char( obj );
  else
    if ( obj->in_room )
      obj_from_room( obj );
    else
      if ( obj->in_obj )
        obj_from_obj( obj );

  while ( ( obj_content = obj->last_content ) != NULL )
    extract_obj( obj_content );

  {
    Affect *paf;
    Affect *paf_next;

    for ( paf = obj->first_affect; paf; paf = paf_next )
      {
        paf_next    = paf->next;
        DISPOSE( paf );
      }
    obj->first_affect = obj->last_affect = NULL;
  }

  {
    ExtraDescription *ed;
    ExtraDescription *ed_next;

    for ( ed = obj->first_extradesc; ed; ed = ed_next )
      {
        ed_next = ed->next;
        STRFREE( ed->description );
        STRFREE( ed->keyword     );
        DISPOSE( ed );
      }
    obj->first_extradesc = obj->last_extradesc = NULL;
  }

  if ( obj == gobj_prev )
    gobj_prev           = obj->prev;

  UNLINK( obj, first_object, last_object, next, prev );
  /* shove onto extraction queue */
  queue_extracted_obj( obj );

  obj->pIndexData->count -= obj->count;
  numobjsloaded -= obj->count;
  --physicalobjects;

  if ( obj->serial == cur_obj )
    {
      cur_obj_extracted = true;

      if ( global_objcode == rNONE )
        global_objcode = rOBJ_EXTRACTED;
    }
}



/*
 * Extract a char from the world.
 */
void extract_char( Character *ch, bool fPull )
{
  Character *wch;
  OBJ_DATA *obj;
  char buf[MAX_STRING_LENGTH];
  ROOM_INDEX_DATA *location;

  if ( !ch )
    {
      bug( "Extract_char: NULL ch.", 0 );
      return;           /* who removed this line? */
    }

  if ( !ch->in_room )
    {
      bug( "Extract_char: NULL room.", 0 );
      return;
    }

  if ( ch == supermob )
    {
      bug( "Extract_char: ch == supermob!", 0 );
      return;
    }

  if ( char_died(ch) )
    {
      sprintf( buf, "extract_char: %s already died!", ch->name );
      bug( buf, 0 );
      return;
    }

  if ( ch == cur_char )
    cur_char_died = true;

  /* shove onto extraction queue */
  queue_extracted_char( ch, fPull );

  if ( gch_prev == ch )
    gch_prev = ch->prev;

  if ( fPull && !IS_SET(ch->act, ACT_POLYMORPHED))
    die_follower( ch );

  stop_fighting( ch, true );

  if (IS_SET(ch->in_room->room_flags, ROOM_ARENA))
    {
      ch->hit = ch->max_hit;
      ch->mana = ch->max_mana;
      ch->move = ch->max_move;
    }

  if ( ch->mount )
    {
      REMOVE_BIT( ch->mount->act, ACT_MOUNTED );
      ch->mount = NULL;
      ch->position = POS_STANDING;
    }

  if ( IsNpc(ch) && IS_SET( ch->act, ACT_MOUNTED ) )
    for ( wch = first_char; wch; wch = wch->next )
      {
        if ( wch->mount == ch )
          {
            wch->mount = NULL;
            wch->position = POS_STANDING;
          }
        if ( wch->pcdata && wch->pcdata->pet == ch )
          {
            wch->pcdata->pet = NULL;
            if ( wch->in_room == ch->in_room )
              act( AT_SOCIAL, "You mourn for the loss of $N.",
                   wch, NULL, ch, TO_CHAR );
          }
      }
  REMOVE_BIT( ch->act, ACT_MOUNTED );

  while ( (obj = ch->last_carrying) != NULL )
    extract_obj( obj );

  char_from_room( ch );

  if ( !fPull )
    {
      location = NULL;

      if ( !location )
        location = get_room_index( wherehome( ch ) );

      if ( !location )
        location = get_room_index( 1 );

      char_to_room( ch, location );

      act( AT_MAGIC, "$n appears from some strange swirling mists!", ch, NULL, NULL, TO_ROOM );
      ch->position = POS_RESTING;
      return;
    }

  if ( IsNpc(ch) )
    {
      --ch->pIndexData->count;
      --nummobsloaded;
    }

  if ( ch->desc && ch->desc->original && IS_SET(ch->act, ACT_POLYMORPHED))
    do_revert( ch, "" );

  if ( ch->desc && ch->desc->original )
    do_return( ch, "" );

  for ( wch = first_char; wch; wch = wch->next )
    if ( wch->reply == ch )
      wch->reply = NULL;

  UNLINK( ch, first_char, last_char, next, prev );

  if ( ch->desc )
    {
      if ( ch->desc->character != ch )
        bug( "Extract_char: char's descriptor points to another char", 0 );
      else
        {
          ch->desc->character = NULL;
          close_socket( ch->desc, false );
          ch->desc = NULL;
        }
    }
}

/*
 * Find a char in the room.
 */
Character *get_char_room( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *rch;
  int number, count;
  vnum_t vnum = INVALID_VNUM;

  number = number_argument( argument, arg );

  if ( !str_cmp( arg, "self" ) )
    return (Character*)ch;

  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && is_number( arg ) )
    vnum = atoi( arg );

  count  = 0;

  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    if ( can_see( ch, rch )
         &&  (( (nifty_is_name( arg, rch->name ) || (!IsNpc(rch) && nifty_is_name( arg, rch->pcdata->title )))
                ||  (IsNpc(rch) && vnum == rch->pIndexData->vnum))) )
      {
        if ( number == 0 && !IsNpc(rch) )
          return rch;
        else
          if ( ++count == number )
            return rch;
      }

  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of characters
     again looking for prefix matching, ie gu == guard.
     Added by Narn, Sept/96
  */
  count  = 0;
  for ( rch = ch->in_room->first_person; rch; rch = rch->next_in_room )
    {
      if ( !can_see( ch, rch ) ||
           (!nifty_is_name_prefix( arg, rch->name ) &&
            (IsNpc(rch) || (!IsNpc(rch) && !nifty_is_name_prefix( arg, rch->pcdata->title )))
            )
           )
        continue;
      if ( number == 0 && !IsNpc(rch) )
        return rch;
      else
        if ( ++count == number )
          return rch;
    }

  return NULL;
}

/*
 * Find a char in the world.
 */
Character *get_char_world( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *wch;
  int number, count;
  vnum_t vnum = INVALID_VNUM;

  number = number_argument( argument, arg );
  count  = 0;

  if ( !str_cmp( arg, "self" ) )
    return (Character*)ch;

  /*
   * Allow reference by vnum for saints+                        -Thoric
   */
  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && is_number( arg ) )
    vnum = atoi( arg );

  /* check the room for an exact match */
  for ( wch = ch->in_room->first_person; wch; wch = wch->next_in_room )
    if ( (nifty_is_name( arg, wch->name )
          ||  (IsNpc(wch) && vnum == wch->pIndexData->vnum)) && IsWizVis(ch,wch))
      {
        if ( number == 0 && !IsNpc(wch) )
          return wch;
        else
          if ( ++count == number )
            return wch;
      }

  count = 0;

  /* check the world for an exact match */
  for ( wch = first_char; wch; wch = wch->next )
    if ( (nifty_is_name( arg, wch->name )
          ||  (IsNpc(wch) && vnum == wch->pIndexData->vnum)) && IsWizVis(ch,wch) )
      {
        if ( number == 0 && !IsNpc(wch) )
          return wch;
        else
          if ( ++count == number  )
            return wch;
      }

  /* bail out if looking for a vnum match */
  if ( vnum != INVALID_VNUM )
    return NULL;

  /*
   * If we didn't find an exact match, check the room for
   * for a prefix match, ie gu == guard.
   * Added by Narn, Sept/96
   */
  count  = 0;
  for ( wch = ch->in_room->first_person; wch; wch = wch->next_in_room )
    {
      if ( !nifty_is_name_prefix( arg, wch->name ) )
        continue;
      if ( number == 0 && !IsNpc(wch) && IsWizVis(ch,wch))
        return wch;
      else
        if ( ++count == number  && IsWizVis(ch, wch) )
          return wch;
    }

  /*
   * If we didn't find a prefix match in the room, run through the full list
   * of characters looking for prefix matching, ie gu == guard.
   * Added by Narn, Sept/96
   */
  count  = 0;
  for ( wch = first_char; wch; wch = wch->next )
    {
      if ( !nifty_is_name_prefix( arg, wch->name ) )
        continue;
      if ( number == 0 && !IsNpc(wch) && IsWizVis(ch, wch) )
        return wch;
      else
        if ( ++count == number  && IsWizVis(ch, wch) )
          return wch;
    }

  return NULL;
}

/*
 * Find some object with a given index data.
 * Used by area-reset 'P', 'T' and 'H' commands.
 */
OBJ_DATA *get_obj_type( const OBJ_INDEX_DATA *pObjIndex )
{
  OBJ_DATA *obj;

  for ( obj = last_object; obj; obj = obj->prev )
    if ( obj->pIndexData == pObjIndex )
      return obj;

  return NULL;
}

/*
 * Find an obj in a list.
 */
OBJ_DATA *get_obj_list( const Character *ch, const char *argument, OBJ_DATA *list )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj = NULL;
  int number = number_argument( argument, arg );
  int count  = 0;

  for ( obj = list; obj; obj = obj->next_content )
    if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;

  for ( obj = list; obj; obj = obj->next_content )
    if ( can_see_obj( ch, obj ) && nifty_is_name_prefix( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  return NULL;
}

/*
 * Find an obj in a list...going the other way                  -Thoric
 */
OBJ_DATA *get_obj_list_rev( const Character *ch, const char *argument, OBJ_DATA *list )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int number;
  int count;

  number = number_argument( argument, arg );
  count  = 0;
  for ( obj = list; obj; obj = obj->prev_content )
    if ( can_see_obj( ch, obj ) && nifty_is_name( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;
  for ( obj = list; obj; obj = obj->prev_content )
    if ( can_see_obj( ch, obj ) && nifty_is_name_prefix( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  return NULL;
}

/*
 * Find an obj in the room or in inventory.
 */
OBJ_DATA *get_obj_here( const Character *ch, const char *argument )
{
  OBJ_DATA *obj;

  if ( !ch || !ch->in_room )
    return NULL;

  obj = get_obj_list_rev( ch, argument, ch->in_room->last_content );
  if ( obj )
    return obj;

  if ( ( obj = get_obj_carry( ch, argument ) ) != NULL )
    return obj;

  if ( ( obj = get_obj_wear( ch, argument ) ) != NULL )
    return obj;

  return NULL;
}

/*
 * Find an obj in the world.
 */
OBJ_DATA *get_obj_world( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int number, count;
  vnum_t vnum = INVALID_VNUM;

  if (!ch)
    return NULL;

  if ( ( obj = get_obj_here( ch, argument ) ) != NULL )
    return obj;

  number = number_argument( argument, arg );

  /*
   * Allow reference by vnum for saints+                        -Thoric
   */
  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && is_number( arg ) )
    vnum = atoi( arg );

  count  = 0;

  for ( obj = first_object; obj; obj = obj->next )
    if ( can_see_obj( ch, obj ) && (nifty_is_name( arg, obj->name )
                                    ||   vnum == obj->pIndexData->vnum) )
      if ( (count += obj->count) >= number )
        return obj;

  /* bail out if looking for a vnum */
  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count  = 0;
  for ( obj = first_object; obj; obj = obj->next )
    if ( can_see_obj( ch, obj ) && nifty_is_name_prefix( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  return NULL;
}

/*
 * Generic get obj function that supports optional containers.  -Thoric
 * currently only used for "eat" and "quaff".
 */
OBJ_DATA *find_obj( Character *ch, const char *orig_argument, bool carryonly )
{
  char argument_buffer[MAX_INPUT_LENGTH];
  char *argument = argument_buffer;
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;

  strcpy(argument, orig_argument);
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( !str_cmp( arg2, "from" )
       &&   argument[0] != '\0' )
    argument = one_argument( argument, arg2 );

  if ( arg2[0] == '\0' )
    {
      if ( carryonly && ( obj = get_obj_carry( ch, arg1 ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return NULL;
        }
      else
        if ( !carryonly && ( obj = get_obj_here( ch, arg1 ) ) == NULL )
          {
            act( AT_PLAIN, "I see no $T here.", ch, NULL, arg1, TO_CHAR );
            return NULL;
          }
      return obj;
    }
  else
    {
      OBJ_DATA *container;

      if ( carryonly
           && ( container = get_obj_carry( ch, arg2 ) ) == NULL
           && ( container = get_obj_wear( ch, arg2 ) ) == NULL )
        {
          send_to_char( "You do not have that item.\r\n", ch );
          return NULL;
        }
      if ( !carryonly && ( container = get_obj_here( ch, arg2 ) ) == NULL )
        {
          act( AT_PLAIN, "I see no $T here.", ch, NULL, arg2, TO_CHAR );
          return NULL;
        }

      if ( !IS_OBJ_STAT(container, ITEM_COVERING )
           &&    IS_SET(container->value[OVAL_CONTAINER_FLAGS], CONT_CLOSED) )
        {
          act( AT_PLAIN, "The $d is closed.", ch, NULL, container->name, TO_CHAR );
          return NULL;
        }

      obj = get_obj_list( ch, arg1, container->first_content );

      if ( !obj )
        act( AT_PLAIN, IS_OBJ_STAT(container, ITEM_COVERING) ?
             "I see nothing like that beneath $p." :
             "I see nothing like that in $p.",
             ch, container, NULL, TO_CHAR );
      return obj;
    }

  return NULL;
}

int get_obj_number( const OBJ_DATA *obj )
{
  return obj->count;
}

/*
 * Return weight of an object, including weight of contents.
 */
int get_obj_weight( const OBJ_DATA *obj )
{
  int weight = obj->count * obj->weight;

  for ( obj = obj->first_content; obj; obj = obj->next_content )
    weight += get_obj_weight( obj );

  return weight;
}

/*
 * True if room is dark.
 */
bool room_is_dark( const ROOM_INDEX_DATA *pRoomIndex )
{
  if ( !pRoomIndex )
    {
      bug( "room_is_dark: NULL pRoomIndex" );
      return true;
    }

  if ( pRoomIndex->light > 0 )
    return false;

  if ( IS_SET(pRoomIndex->room_flags, ROOM_DARK) )
    return true;

  if ( pRoomIndex->sector_type == SECT_INSIDE
       ||   pRoomIndex->sector_type == SECT_CITY )
    return false;

  if ( weather_info.sunlight == SUN_SET
       ||   weather_info.sunlight == SUN_DARK )
    return true;

  return false;
}



/*
 * True if room is private.
 */
bool room_is_private( const Character *ch, const ROOM_INDEX_DATA *pRoomIndex )
{
  Character *rch;
  int count;

  if ( !ch )
    {
      bug( "room_is_private: NULL ch" );
      return false;
    }

  if ( !pRoomIndex )
    {
      bug( "room_is_private: NULL pRoomIndex" );
      return false;
    }

  if ( IS_SET(pRoomIndex->room_flags, ROOM_PLR_HOME) && ch->plr_home != pRoomIndex)
    return true;

  count = 0;

  for ( rch = pRoomIndex->first_person; rch; rch = rch->next_in_room )
    count++;

  if ( IS_SET(pRoomIndex->room_flags, ROOM_PRIVATE)  && count >= 2 )
    return true;

  if ( IS_SET(pRoomIndex->room_flags, ROOM_SOLITARY) && count >= 1 )
    return true;

  return false;
}

/*
 * Return ascii name of an item type.
 */
const char *item_type_name( const OBJ_DATA *obj )
{
  if ( obj->item_type < 1 || obj->item_type > MAX_ITEM_TYPE )
    {
      bug( "Item_type_name: unknown type %d.", obj->item_type );
      return "(unknown)";
    }

  return object_types[obj->item_type];
}

/*
 * Return ascii name of an affect location.
 */
const char *affect_loc_name( int location )
{
  switch ( location )
    {
    case APPLY_NONE:            return "none";
    case APPLY_STR:             return "strength";
    case APPLY_DEX:             return "dexterity";
    case APPLY_INT:             return "intelligence";
    case APPLY_WIS:             return "wisdom";
    case APPLY_CON:             return "constitution";
    case APPLY_CHA:             return "charisma";
    case APPLY_LCK:             return "luck";
    case APPLY_SEX:             return "sex";
    case APPLY_LEVEL:           return "level";
    case APPLY_AGE:             return "age";
    case APPLY_MANA:            return "mana";
    case APPLY_HIT:             return "hp";
    case APPLY_MOVE:            return "moves";
    case APPLY_GOLD:            return "gold";
    case APPLY_EXP:             return "experience";
    case APPLY_AC:              return "armor class";
    case APPLY_HITROLL:         return "hit roll";
    case APPLY_DAMROLL:         return "damage roll";
    case APPLY_SAVING_POISON:   return "save vs poison";
    case APPLY_SAVING_ROD:      return "save vs rod";
    case APPLY_SAVING_PARA:     return "save vs paralysis";
    case APPLY_SAVING_BREATH:   return "save vs breath";
    case APPLY_SAVING_SPELL:    return "save vs spell";
    case APPLY_HEIGHT:          return "height";
    case APPLY_WEIGHT:          return "weight";
    case APPLY_AFFECT:          return "affected_by";
    case APPLY_RESISTANT:       return "resistant";
    case APPLY_IMMUNE:          return "immune";
    case APPLY_SUSCEPTIBLE:     return "susceptible";
    case APPLY_BACKSTAB:        return "backstab";
    case APPLY_PICK:            return "pick";
    case APPLY_TRACK:           return "track";
    case APPLY_STEAL:           return "steal";
    case APPLY_SNEAK:           return "sneak";
    case APPLY_HIDE:            return "hide";
    case APPLY_PALM:            return "palm";
    case APPLY_DETRAP:          return "detrap";
    case APPLY_DODGE:           return "dodge";
    case APPLY_PEEK:            return "peek";
    case APPLY_SCAN:            return "scan";
    case APPLY_GOUGE:           return "gouge";
    case APPLY_SEARCH:          return "search";
    case APPLY_MOUNT:           return "mount";
    case APPLY_DISARM:          return "disarm";
    case APPLY_KICK:            return "kick";
    case APPLY_PARRY:           return "parry";
    case APPLY_BASH:            return "bash";
    case APPLY_STUN:            return "stun";
    case APPLY_PUNCH:           return "punch";
    case APPLY_CLIMB:           return "climb";
    case APPLY_GRIP:            return "grip";
    case APPLY_SCRIBE:          return "scribe";
    case APPLY_BREW:            return "brew";
    case APPLY_WEAPONSPELL:     return "weapon spell";
    case APPLY_WEARSPELL:       return "wear spell";
    case APPLY_REMOVESPELL:     return "remove spell";
    case APPLY_MENTALSTATE:     return "mental state";
    case APPLY_EMOTION:         return "emotional state";
    case APPLY_STRIPSN:         return "dispel";
    case APPLY_REMOVE:          return "remove";
    case APPLY_DIG:             return "dig";
    case APPLY_FULL:            return "hunger";
    case APPLY_THIRST:          return "thirst";
    case APPLY_DRUNK:           return "drunk";
    case APPLY_BLOOD:           return "blood";
    case APPLY_SNIPE:           return "snipe";
    }

  bug( "Affect_location_name: unknown location %d.", location );
  return "(unknown)";
}

/*
 * Set off a trap (obj) upon character (ch)                     -Thoric
 */
ch_ret spring_trap( Character *ch, OBJ_DATA *obj )
{
  int dam;
  char *txt;
  char buf[MAX_STRING_LENGTH];
  int typ = obj->value[OVAL_TRAP_TYPE];
  int lev = obj->value[OVAL_TRAP_STRENGTH];
  ch_ret retcode = rNONE;

  switch(typ)
    {
    default:
      txt = "hit by a trap";                                    break;
    case TRAP_TYPE_POISON_GAS:
      txt = "surrounded by a green cloud of gas";               break;
    case TRAP_TYPE_POISON_DART:
      txt = "hit by a dart";                                    break;
    case TRAP_TYPE_POISON_NEEDLE:
      txt = "pricked by a needle";                              break;
    case TRAP_TYPE_POISON_DAGGER:
      txt = "stabbed by a dagger";                              break;
    case TRAP_TYPE_POISON_ARROW:
      txt = "struck with an arrow";                             break;
    case TRAP_TYPE_BLINDNESS_GAS:
      txt = "surrounded by a red cloud of gas";         break;
    case TRAP_TYPE_SLEEPING_GAS:
      txt = "surrounded by a yellow cloud of gas";              break;
    case TRAP_TYPE_FLAME:
      txt = "struck by a burst of flame";                       break;
    case TRAP_TYPE_EXPLOSION:
      txt = "hit by an explosion";                              break;
    case TRAP_TYPE_ACID_SPRAY:
      txt = "covered by a spray of acid";                       break;
    case TRAP_TYPE_ELECTRIC_SHOCK:
      txt = "suddenly shocked";                         break;
    case TRAP_TYPE_BLADE:
      txt = "sliced by a razor sharp blade";                    break;
    case TRAP_TYPE_SEX_CHANGE:
      txt = "surrounded by a mysterious aura";          break;
    }

  dam = number_range( obj->value[OVAL_TRAP_STRENGTH], obj->value[OVAL_TRAP_STRENGTH] * 2);
  sprintf( buf, "You are %s!", txt );
  act( AT_HITME, buf, ch, NULL, NULL, TO_CHAR );
  sprintf( buf, "$n is %s.", txt );
  act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );

  --obj->value[OVAL_TRAP_CHARGE];

  if ( obj->value[OVAL_TRAP_CHARGE] <= 0 )
    extract_obj( obj );

  switch(typ)
    {
    default:
    case TRAP_TYPE_POISON_DART:
    case TRAP_TYPE_POISON_NEEDLE:
    case TRAP_TYPE_POISON_DAGGER:
    case TRAP_TYPE_POISON_ARROW:
      /* hmm... why not use spell_poison() here? */
      retcode = obj_cast_spell( gsn_poison, lev, ch, ch, NULL );
      if ( retcode == rNONE )
        retcode = damage( ch, ch, dam, TYPE_UNDEFINED );
      break;
    case TRAP_TYPE_POISON_GAS:
      retcode = obj_cast_spell( gsn_poison, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_BLINDNESS_GAS:
      retcode = obj_cast_spell( gsn_blindness, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_SLEEPING_GAS:
      retcode = obj_cast_spell( skill_lookup("sleep"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_ACID_SPRAY:
      retcode = obj_cast_spell( skill_lookup("acid blast"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_SEX_CHANGE:
      retcode = obj_cast_spell( skill_lookup("change sex"), lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_FLAME:
    case TRAP_TYPE_EXPLOSION:
      retcode = obj_cast_spell( gsn_fireball, lev, ch, ch, NULL );
      break;
    case TRAP_TYPE_ELECTRIC_SHOCK:
    case TRAP_TYPE_BLADE:
      retcode = damage( ch, ch, dam, TYPE_UNDEFINED );
    }
  return retcode;
}

/*
 * Check an object for a trap                                   -Thoric
 */
ch_ret check_for_trap( Character *ch, const OBJ_DATA *obj, int flag )
{
  OBJ_DATA *check;
  ch_ret retcode = rNONE;

  if ( !obj->first_content )
    return rNONE;

  for ( check = obj->first_content; check; check = check->next_content )
    if ( check->item_type == ITEM_TRAP
         && IS_SET(check->value[OVAL_TRAP_FLAGS], flag) )
      {
        retcode = spring_trap( ch, check );

        if ( retcode != rNONE )
          return retcode;
      }

  return retcode;
}

/*
 * Check the room for a trap                                    -Thoric
 */
ch_ret check_room_for_traps( Character *ch, int flag )
{
  OBJ_DATA *check;
  ch_ret retcode = rNONE;

  if ( !ch )

    return rERROR;
  if ( !ch->in_room || !ch->in_room->first_content )
    return rNONE;

  for ( check = ch->in_room->first_content; check; check = check->next_content )
    {
      if ( check->item_type == ITEM_LANDMINE && flag == TRAP_ENTER_ROOM )
        {
          explode (check);
          return rNONE;
        }
      else if ( check->item_type == ITEM_TRAP
                && IS_SET(check->value[OVAL_TRAP_FLAGS], flag) )
        {
          retcode = spring_trap( ch, check );

          if ( retcode != rNONE )
            return retcode;
        }
    }

  return retcode;
}

/*
 * return true if an object contains a trap                     -Thoric
 */
bool is_trapped( const OBJ_DATA *obj )
{
  OBJ_DATA *check;

  if ( !obj->first_content )
    return false;

  for ( check = obj->first_content; check; check = check->next_content )
    if ( check->item_type == ITEM_TRAP )
      return true;

  return false;
}

/*
 * If an object contains a trap, return the pointer to the trap -Thoric
 */
OBJ_DATA *get_trap( const OBJ_DATA *obj )
{
  OBJ_DATA *check;

  if ( !obj->first_content )
    return NULL;

  for ( check = obj->first_content; check; check = check->next_content )
    if ( check->item_type == ITEM_TRAP )
      return check;

  return NULL;
}

/*
 * Remove an exit from a room                                   -Thoric
 */
void extract_exit( ROOM_INDEX_DATA *room, Exit *pexit )
{
  UNLINK( pexit, room->first_exit, room->last_exit, next, prev );
  if ( pexit->rexit )
    pexit->rexit->rexit = NULL;
  STRFREE( pexit->keyword );
  STRFREE( pexit->description );
  DISPOSE( pexit );
}

/*
 * clean out a room (leave list pointers intact )               -Thoric
 */
void clean_room( ROOM_INDEX_DATA *room )
{
  ExtraDescription      *ed, *ed_next;
  Exit             *pexit, *pexit_next;

  if ( !room )
    return;

  STRFREE( room->description );
  STRFREE( room->name );
  for ( ed = room->first_extradesc; ed; ed = ed_next )
    {
      ed_next = ed->next;
      STRFREE( ed->description );
      STRFREE( ed->keyword );
      DISPOSE( ed );
      top_ed--;
    }
  room->first_extradesc = NULL;
  room->last_extradesc          = NULL;
  for ( pexit = room->first_exit; pexit; pexit = pexit_next )
    {
      pexit_next = pexit->next;
      STRFREE( pexit->keyword );
      STRFREE( pexit->description );
      DISPOSE( pexit );
      top_exit--;
    }
  room->first_exit = NULL;
  room->last_exit = NULL;
  room->room_flags = 0;
  room->sector_type = 0;
  room->light = 0;
}

/*
 * clean out an object (index) (leave list pointers intact )    -Thoric
 */
void clean_obj( OBJ_INDEX_DATA *obj )
{
  Affect *paf = NULL;
  Affect *paf_next = NULL;
  ExtraDescription *ed = 0;
  ExtraDescription *ed_next = 0;
  int oval = 0;

  STRFREE( obj->name );
  STRFREE( obj->short_descr );
  STRFREE( obj->description );
  STRFREE( obj->action_desc );
  obj->item_type        = 0;
  obj->extra_flags      = 0;
  obj->wear_flags       = 0;
  obj->count            = 0;
  obj->weight           = 0;
  obj->cost             = 0;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      obj->value[oval] = 0;
    }

  for ( paf = obj->first_affect; paf; paf = paf_next )
    {
      paf_next    = paf->next;
      DISPOSE( paf );
      top_affect--;
    }

  obj->first_affect     = NULL;
  obj->last_affect      = NULL;

  for ( ed = obj->first_extradesc; ed; ed = ed_next )
    {
      ed_next = ed->next;
      STRFREE( ed->description );
      STRFREE( ed->keyword     );
      DISPOSE( ed );
      top_ed--;
    }

  obj->first_extradesc  = NULL;
  obj->last_extradesc   = NULL;
}

/*
 * clean out a mobile (index) (leave list pointers intact )     -Thoric
 */
void clean_mob( ProtoMobile *mob )
{
  MPROG_DATA *mprog, *mprog_next;

  STRFREE( mob->player_name );
  STRFREE( mob->short_descr );
  STRFREE( mob->long_descr  );
  STRFREE( mob->description );
  mob->spec_fun = NULL;
  mob->spec_2   = NULL;
  mob->pShop    = NULL;
  mob->rShop    = NULL;
  mob->mprog.progtypes        = 0;

  for ( mprog = mob->mprog.mudprogs; mprog; mprog = mprog_next )
    {
      mprog_next = mprog->next;
      STRFREE( mprog->arglist );
      STRFREE( mprog->comlist );
      DISPOSE( mprog );
    }
  mob->count     = 0;      mob->killed          = 0;
  mob->sex       = 0;      mob->level           = 0;
  mob->act       = 0;      mob->affected_by     = 0;
  mob->alignment         = 0;      mob->mobthac0        = 0;
  mob->ac                = 0;      mob->hitnodice       = 0;
  mob->hitsizedice = 0;    mob->hitplus         = 0;
  mob->damnodice         = 0;      mob->damsizedice     = 0;
  mob->damplus   = 0;      mob->gold            = 0;
  mob->position  = 0;
  mob->defposition = 0;    mob->height          = 0;
  mob->weight    = 0;
}

/*
 * Remove all resets from an area                               -Thoric
 */
void clean_resets( Area *tarea )
{
  RESET_DATA *pReset, *pReset_next;

  for ( pReset = tarea->first_reset; pReset; pReset = pReset_next )
    {
      pReset_next = pReset->next;
      DISPOSE( pReset );
      --top_reset;
    }
  tarea->first_reset    = NULL;
  tarea->last_reset     = NULL;
}

/*
 * Show an affect verbosely to a character                      -Thoric
 */
void showaffect( const Character *ch, const Affect *paf )
{
  char buf[MAX_STRING_LENGTH];
  int x;

  if ( !paf )
    {
      bug( "showaffect: NULL paf", 0 );
      return;
    }

  if ( paf->location != APPLY_NONE && paf->modifier != 0 )
    {
      switch( paf->location )
        {
        default:
          sprintf( buf, "Affects %s by %d.\r\n",
                   affect_loc_name( paf->location ), paf->modifier );
          break;
        case APPLY_AFFECT:
          sprintf( buf, "Affects %s by",
                   affect_loc_name( paf->location ) );
          for ( x = 0; x < 32 ; x++ )
            if ( IS_SET( paf->modifier, 1 << x ) )
              {
                strcat( buf, " " );
                strcat( buf, affected_flags[x] );
              }
          strcat( buf, "\r\n" );
          break;
        case APPLY_WEAPONSPELL:
        case APPLY_WEARSPELL:
        case APPLY_REMOVESPELL:
          sprintf( buf, "Casts spell '%s'\r\n",
                   IS_VALID_SN(paf->modifier) ? skill_table[paf->modifier]->name
                   : "unknown" );
          break;
        case APPLY_RESISTANT:
        case APPLY_IMMUNE:
        case APPLY_SUSCEPTIBLE:
          sprintf( buf, "Affects %s by",
                   affect_loc_name( paf->location ) );
          for ( x = 0; x < 32 ; x++ )
            if ( IS_SET( paf->modifier, 1 << x ) )
              {
                strcat( buf, " " );
                strcat( buf, ris_flags[x] );
              }
          strcat( buf, "\r\n" );
          break;
        }
      send_to_char( buf, ch );
    }
}

/*
 * Set the current global object to obj                         -Thoric
 */
void set_cur_obj( OBJ_DATA *obj )
{
  cur_obj = obj->serial;
  cur_obj_extracted = false;
  global_objcode = rNONE;
}

/*
 * Check the recently extracted object queue for obj            -Thoric
 */
bool obj_extracted( const OBJ_DATA *obj )
{
  OBJ_DATA *cod;

  if ( !obj )
    return true;

  if ( obj->serial == cur_obj
       &&   cur_obj_extracted )
    return true;

  for (cod = extracted_obj_queue; cod; cod = cod->next )
    if ( obj == cod )
      return true;
  return false;
}

/*
 * Stick obj onto extraction queue
 */
void queue_extracted_obj( OBJ_DATA *obj )
{

  ++cur_qobjs;
  obj->next = extracted_obj_queue;
  extracted_obj_queue = obj;
}

/*
 * Clean out the extracted object queue
 */
void clean_obj_queue()
{
  OBJ_DATA *obj;

  while ( extracted_obj_queue )
    {
      obj = extracted_obj_queue;
      extracted_obj_queue = extracted_obj_queue->next;
      STRFREE( obj->name        );
      STRFREE( obj->description );
      STRFREE( obj->short_descr );
      DISPOSE( obj );
      --cur_qobjs;
    }
}

/*
 * Set the current global character to ch                       -Thoric
 */
void set_cur_char( Character *ch )
{
  cur_char         = ch;
  cur_char_died  = false;
  cur_room         = ch->in_room;
  global_retcode = rNONE;
}

/*
 * Check to see if ch died recently                             -Thoric
 */
bool char_died( const Character *ch )
{
  ExtractedCharacter *ccd;

  if ( ch == cur_char && cur_char_died )
    return true;

  for (ccd = extracted_char_queue; ccd; ccd = ccd->next )
    if ( ccd->ch == ch )
      return true;

  return false;
}

/*
 * Add ch to the queue of recently extracted characters         -Thoric
 */
void queue_extracted_char( Character *ch, bool extract )
{
  ExtractedCharacter *ccd;

  if ( !ch )
    {
      bug( "queue_extracted char: ch = NULL", 0 );
      return;
    }
  CREATE( ccd, ExtractedCharacter, 1 );
  ccd->ch                       = ch;
  ccd->room                     = ch->in_room;
  ccd->extract          = extract;
  if ( ch == cur_char )
    ccd->retcode                = global_retcode;
  else
    ccd->retcode                = rCHAR_DIED;
  ccd->next                     = extracted_char_queue;
  extracted_char_queue  = ccd;
  cur_qchars++;
}

/*
 * clean out the extracted character queue
 */
void clean_char_queue()
{
  ExtractedCharacter *ccd;

  for ( ccd = extracted_char_queue; ccd; ccd = extracted_char_queue )
    {
      extracted_char_queue = ccd->next;
      if ( ccd->extract )
        free_char( ccd->ch );
      DISPOSE( ccd );
      --cur_qchars;
    }
}

/*
 * Add a timer to ch                                            -Thoric
 * Support for "call back" time delayed commands
 */
void add_timer( Character *ch, short type, short count, DO_FUN *fun, int value )
{
  TIMER *timer;

  for ( timer = ch->first_timer; timer; timer = timer->next )
    if ( timer->type == type )
      {
        timer->count  = count;
        timer->do_fun = fun;
        timer->value     = value;
        break;
      }
  if ( !timer )
    {
      CREATE( timer, TIMER, 1 );
      timer->count      = count;
      timer->type       = type;
      timer->do_fun     = fun;
      timer->value      = value;
      LINK( timer, ch->first_timer, ch->last_timer, next, prev );
    }
}

TIMER *get_timerptr( const Character *ch, short type )
{
  TIMER *timer;

  for ( timer = ch->first_timer; timer; timer = timer->next )
    if ( timer->type == type )
      return timer;

  return NULL;
}

short get_timer( const Character *ch, short type )
{
  TIMER *timer;

  if ( (timer = get_timerptr( ch, type )) != NULL )
    return timer->count;
  else
    return 0;
}

void extract_timer( Character *ch, TIMER *timer )
{
  if ( !timer )
    {
      bug( "extract_timer: NULL timer", 0 );
      return;
    }

  UNLINK( timer, ch->first_timer, ch->last_timer, next, prev );
  DISPOSE( timer );
}

void remove_timer( Character *ch, short type )
{
  TIMER *timer;

  for ( timer = ch->first_timer; timer; timer = timer->next )
    if ( timer->type == type )
      break;

  if ( timer )
    extract_timer( ch, timer );
}

bool in_soft_range( const Character *ch, const Area *tarea )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) )
    return true;
  else if ( ch->top_level >= tarea->low_soft_range || ch->top_level <= tarea->hi_soft_range )
    return true;
  else
    return false;
}

bool in_hard_range( const Character *ch, const Area *tarea )
{
  if ( IsImmortal(ch) )
    return true;
  else if ( IsNpc(ch) )
    return true;
  else if ( ch->top_level >= tarea->low_hard_range && ch->top_level <= tarea->hi_hard_range )
    return true;
  else
    return false;
}

/*
 * Scryn, standard luck check 2/2/96
 */
bool chance( const Character *ch, short percent )
{
  short ms;

  if (!ch)
    {
      bug("Chance: null ch!", 0);
      return false;
    }

  /* Code for clan stuff put in by Narn, Feb/96.  The idea is to punish clan
     members who don't keep their alignment in tune with that of their clan by
     making it harder for them to succeed at pretty much everything.  Clan_factor
     will vary from 1 to 3, with 1 meaning there is no effect on the player's
     change of success, and with 3 meaning they have half the chance of doing
     whatever they're trying to do.

     Note that since the neutral clannies can only be off by 1000 points, their
     maximum penalty will only be half that of the other clan types.

     if ( is_clanned( ch ) )
     clan_factor = 1 + abs( ch->alignment - ch->pcdata->clan->alignment ) / 1000;
     else
     clan_factor = 1;
  */
  /* Mental state bonus/penalty:  Your mental state is a ranged value with
   * zero (0) being at a perfect mental state (bonus of 10).
   * negative values would reflect how sedated one is, and
   * positive values would reflect how stimulated one is.
   * In most circumstances you'd do best at a perfectly balanced state.
   */

  ms = 10 - abs(ch->mental_state);

  if ( (number_percent() - GetCurrentLuck(ch) + 13 - ms) <= percent )
    return true;
  else
    return false;
}

bool chance_attrib( const Character *ch, short percent, short attrib )
{
  if (!ch)
    {
      bug("Chance: null ch!", 0);
      return false;
    }

  if (number_percent() - GetCurrentLuck(ch) + 13 - attrib + 13 <= percent )
    return true;
  else
    return false;
}


/*
 * Make a simple clone of an object (no extras...yet)           -Thoric
 */
OBJ_DATA *clone_object( const OBJ_DATA *obj )
{
  OBJ_DATA *clone = NULL;
  int oval = 0;

  CREATE( clone, OBJ_DATA, 1 );
  clone->pIndexData     = obj->pIndexData;
  clone->name           = QUICKLINK( obj->name );
  clone->short_descr    = QUICKLINK( obj->short_descr );
  clone->description    = QUICKLINK( obj->description );
  clone->action_desc    = QUICKLINK( obj->action_desc );
  clone->item_type      = obj->item_type;
  clone->extra_flags    = obj->extra_flags;
  clone->magic_flags    = obj->magic_flags;
  clone->wear_flags     = obj->wear_flags;
  clone->wear_loc       = obj->wear_loc;
  clone->weight = obj->weight;
  clone->cost           = obj->cost;
  clone->level  = obj->level;
  clone->timer  = obj->timer;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      clone->value[oval] = obj->value[oval];
    }

  clone->count  = 1;
  ++obj->pIndexData->count;
  ++numobjsloaded;
  ++physicalobjects;
  cur_obj_serial = UMAX((cur_obj_serial + 1 ) & (BV30-1), 1);
  clone->serial = clone->pIndexData->serial = cur_obj_serial;
  LINK( clone, first_object, last_object, next, prev );
  return clone;
}

static bool HasSameOvalues( const OBJ_DATA *a, const OBJ_DATA *b )
{
  int oval = 0;

  for( oval = 0; oval < MAX_OVAL; ++oval )
    {
      if( a->value[oval] != b->value[oval] )
	{
	  return false;
	}
    }

  return true;
}

/*
 * If possible group obj2 into obj1                             -Thoric
 * This code, along with clone_object, obj->count, and special support
 * for it implemented throughout handler.c and save.c should show improved
 * performance on MUDs with players that hoard tons of potions and scrolls
 * as this will allow them to be grouped together both in memory, and in
 * the player files.
 */
OBJ_DATA *group_object( OBJ_DATA *obj1, OBJ_DATA *obj2 )
{
  if ( !obj1 || !obj2 )
    return NULL;

  if ( obj1 == obj2 )
    return obj1;

  if ( obj1->pIndexData == obj2->pIndexData
       && QUICKMATCH( obj1->name,         obj2->name )
       && QUICKMATCH( obj1->short_descr,  obj2->short_descr )
       && QUICKMATCH( obj1->description,  obj2->description )
       && QUICKMATCH( obj1->action_desc,  obj2->action_desc )
       && obj1->item_type    == obj2->item_type
       && obj1->extra_flags  == obj2->extra_flags
       && obj1->magic_flags  == obj2->magic_flags
       && obj1->wear_flags   == obj2->wear_flags
       && obj1->wear_loc     == obj2->wear_loc
       && obj1->weight       == obj2->weight
       && obj1->cost         == obj2->cost
       && obj1->level        == obj2->level
       && obj1->timer        == obj2->timer
       && HasSameOvalues( obj1, obj2 )
       && !obj1->first_extradesc
       && !obj2->first_extradesc
       && !obj1->first_affect
       && !obj2->first_affect
       && !obj1->first_content
       && !obj2->first_content )
    {
      obj1->count += obj2->count;
      obj1->pIndexData->count += obj2->count;   /* to be decremented in */
      numobjsloaded += obj2->count;             /* extract_obj */
      extract_obj( obj2 );
      return obj1;
    }

  return obj2;
}

/*
 * Split off a grouped object                                   -Thoric
 * decreased obj's count to num, and creates a new object containing the rest
 */
void split_obj( OBJ_DATA *obj, int num )
{
  int count = 0;
  OBJ_DATA *rest = NULL;

  if (!obj)
    {
      return;
    }

  count = obj->count;

  if ( count <= num || num == 0 )
    return;

  rest = clone_object(obj);
  --obj->pIndexData->count;     /* since clone_object() ups this value */
  --numobjsloaded;
  rest->count = obj->count - num;
  obj->count = num;

  if ( obj->carried_by )
    {
      LINK( rest, obj->carried_by->first_carrying,
            obj->carried_by->last_carrying,
            next_content, prev_content );
      rest->carried_by          = obj->carried_by;
      rest->in_room                     = NULL;
      rest->in_obj                      = NULL;
    }
  else
    if ( obj->in_room )
      {
        LINK( rest, obj->in_room->first_content, obj->in_room->last_content,
              next_content, prev_content );
        rest->carried_by                = NULL;
        rest->in_room                   = obj->in_room;
        rest->in_obj                    = NULL;
      }
    else
      if ( obj->in_obj )
        {
          LINK( rest, obj->in_obj->first_content, obj->in_obj->last_content,
                next_content, prev_content );
          rest->in_obj                   = obj->in_obj;
          rest->in_room                  = NULL;
          rest->carried_by               = NULL;
        }
}

void separate_obj( OBJ_DATA *obj )
{
  split_obj( obj, 1 );
}

/*
 * Empty an obj's contents... optionally into another obj, or a room
 */
bool empty_obj( OBJ_DATA *obj, OBJ_DATA *destobj, ROOM_INDEX_DATA *destroom )
{
  OBJ_DATA *otmp, *otmp_next;
  Character *ch = obj->carried_by;
  bool movedsome = false;

  if ( !obj )
    {
      bug( "empty_obj: NULL obj", 0 );
      return false;
    }
  if ( destobj || (!destroom && !ch && (destobj = obj->in_obj) != NULL) )
    {
      for ( otmp = obj->first_content; otmp; otmp = otmp_next )
        {
          otmp_next = otmp->next_content;

          if ( destobj->item_type == ITEM_CONTAINER
               &&   get_obj_weight( otmp ) + get_obj_weight( destobj )
               > destobj->value[OVAL_CONTAINER_CAPACITY] )
	    {
	      continue;
	    }

          obj_from_obj( otmp );
          obj_to_obj( otmp, destobj );
          movedsome = true;
        }
      return movedsome;
    }
  if ( destroom || (!ch && (destroom = obj->in_room) != NULL) )
    {
      for ( otmp = obj->first_content; otmp; otmp = otmp_next )
        {
          otmp_next = otmp->next_content;
          if ( ch && (otmp->pIndexData->mprog.progtypes & DROP_PROG) && otmp->count > 1 )
            {
              separate_obj( otmp );
              obj_from_obj( otmp );
              if ( !otmp_next )
                otmp_next = obj->first_content;
            }
          else
            obj_from_obj( otmp );
          otmp = obj_to_room( otmp, destroom );
          if ( ch )
            {
              oprog_drop_trigger( ch, otmp );           /* mudprogs */
              if ( char_died(ch) )
                ch = NULL;
            }
          movedsome = true;
        }
      return movedsome;
    }
  if ( ch )
    {
      for ( otmp = obj->first_content; otmp; otmp = otmp_next )
        {
          otmp_next = otmp->next_content;
          obj_from_obj( otmp );
          obj_to_char( otmp, ch );
          movedsome = true;
        }
      return movedsome;
    }
  bug( "empty_obj: could not determine a destination for vnum %ld",
       obj->pIndexData->vnum );
  return false;
}

/*
 * Add gold to an area's economy                                -Thoric
 */
void boost_economy( Area *tarea, int gold )
{
  while ( gold >= 1000000000 )
    {
      ++tarea->high_economy;
      gold -= 1000000000;
    }

  tarea->low_economy += gold;

  while ( tarea->low_economy >= 1000000000 )
    {
      ++tarea->high_economy;
      tarea->low_economy -= 1000000000;
    }
}

/*
 * Take gold from an area's economy                             -Thoric
 */
void lower_economy( Area *tarea, int gold )
{
  while ( gold >= 1000000000 )
    {
      tarea->high_economy -= 1;
      gold -= 1000000000;
    }

  tarea->low_economy -= gold;

  while ( tarea->low_economy < 0 )
    {
      tarea->high_economy -=1;
      tarea->low_economy += 1000000000;
    }
}

/*
 * Check to see if economy has at least this much gold             -Thoric
 */
bool economy_has( const Area *tarea, int gold )
{
  int hasgold = ((tarea->high_economy > 0) ? 1 : 0) * 1000000000
    + tarea->low_economy;

  if ( hasgold >= gold )
    return true;

  return false;
}

/*
 * Used in db.c when resetting a mob into an area                   -Thoric
 * Makes sure mob doesn't get more than 10% of that area's gold,
 * and reduces area economy by the amount of gold given to the mob
 */
void economize_mobgold( Character *mob )
{
  int gold;
  Area *tarea;

  /* make sure it isn't way too much */
  mob->gold = UMIN( mob->gold, mob->top_level * mob->top_level * 400 );

  if ( !mob->in_room )
    return;

  tarea = mob->in_room->area;

  gold = ((tarea->high_economy > 0) ? 1 : 0) * 1000000000 + tarea->low_economy;
  mob->gold = URANGE( 0, mob->gold, gold / 100 );

  if ( mob->gold )
    lower_economy( tarea, mob->gold );
}
