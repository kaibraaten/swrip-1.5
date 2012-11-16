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
 *                         "Special procedure" module                      *
 ****************************************************************************/

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "mud.h"

/* jails for wanted flags */

#define ROOM_JAIL_MON_CALAMARI_1   21148
#define ROOM_JAIL_MON_CALAMARI_2   21149
#define ROOM_JAIL_CORUSCANT        9000
#define ROOM_JAIL_ADARI        29108
#define ROOM_JAIL_RODIA            0
#define ROOM_JAIL_RYLOTH           0
#define ROOM_JAIL_GAMORR           0
#define ROOM_JAIL_TATOOINE         0
#define ROOM_JAIL_BYSS             0
#define ROOM_JAIL_NAL_HUTTA        0
#define ROOM_JAIL_KASHYYYK         0
#define ROOM_JAIL_HONOGHR          0
#define ROOM_JAIL_ENDOR            0
#define ROOM_JAIL_ROCHE            0
#define ROOM_JAIL_AF_EL            0
#define ROOM_JAIL_TRANDOSH         0
#define ROOM_JAIL_CHAD             0
#define ROOM_JAIL_QUARREN_1     6931
#define ROOM_JAIL_QUARREN_2     6932

bool  remove_obj( CHAR_DATA *ch, int iWear, bool fReplace );

/*
 * The following special functions are available for mobiles.
 */
DECLARE_SPEC_FUN( spec_jedi );
DECLARE_SPEC_FUN( spec_dark_jedi );
DECLARE_SPEC_FUN( spec_fido );
DECLARE_SPEC_FUN( spec_guardian );
DECLARE_SPEC_FUN( spec_janitor );
DECLARE_SPEC_FUN( spec_poison );
DECLARE_SPEC_FUN( spec_thief );
DECLARE_SPEC_FUN( spec_auth );
DECLARE_SPEC_FUN( spec_stormtrooper );
DECLARE_SPEC_FUN( spec_rebel_trooper );
DECLARE_SPEC_FUN( spec_customs_smut );
DECLARE_SPEC_FUN( spec_customs_alcohol );
DECLARE_SPEC_FUN( spec_customs_weapons );
DECLARE_SPEC_FUN( spec_customs_spice );
DECLARE_SPEC_FUN( spec_police_attack );
DECLARE_SPEC_FUN( spec_police_undercover );
DECLARE_SPEC_FUN( spec_police_jail );
DECLARE_SPEC_FUN( spec_police_fine );
DECLARE_SPEC_FUN( spec_police );
DECLARE_SPEC_FUN( spec_clan_guard );
DECLARE_SPEC_FUN( spec_newbie_pilot );
DECLARE_SPEC_FUN( spec_questmaster );

typedef struct spec_fun_entry
{
  const char *fun_name;
  SPEC_FUN *fun_ptr;
} SPEC_FUN_ENTRY;

static const SPEC_FUN_ENTRY spec_fun_table[] = {
  { "spec_jedi",              spec_jedi },
  { "spec_dark_jedi",         spec_dark_jedi },
  { "spec_fido",              spec_fido },
  { "spec_guardian",          spec_guardian },
  { "spec_janitor",           spec_janitor },
  { "spec_poison",            spec_poison },
  { "spec_thief",             spec_thief },
  { "spec_questmaster",       spec_questmaster },
  { "spec_auth",              spec_auth },
  { "spec_stormtrooper",      spec_stormtrooper },
  { "spec_rebel_trooper",     spec_rebel_trooper },
  { "spec_customs_smut",      spec_customs_smut },
  { "spec_customs_alcohol",   spec_customs_alcohol },
  { "spec_customs_weapons",   spec_customs_weapons },
  { "spec_customs_spice",     spec_customs_spice },
  { "spec_police_attack",     spec_police_attack },
  { "spec_police_jail",       spec_police_jail },
  { "spec_police_fine",       spec_police_fine },
  { "spec_police_undercover", spec_police_undercover },
  { "spec_police",            spec_police },
  { "spec_clan_guard",        spec_clan_guard },
  { "spec_newbie_pilot",      spec_newbie_pilot }
};

static size_t spec_fun_table_size( void )
{
  return sizeof( spec_fun_table ) / sizeof( *spec_fun_table );
}

/*
 * Given a name, return the appropriate spec fun.
 */
SPEC_FUN *spec_lookup( const char *name )
{
  SPEC_FUN *fun_ptr = NULL;
  size_t i = 0;

  for( i = 0; i < spec_fun_table_size(); ++i )
    {
      if( !str_cmp( name, spec_fun_table[i].fun_name ) )
        {
          fun_ptr = spec_fun_table[i].fun_ptr;
          break;
        }
    }

  return fun_ptr;
}

/*
 * Given a pointer, return the appropriate spec fun text.
 */
const char *lookup_spec( SPEC_FUN *special )
{
  size_t i = 0;

  for( i = 0; i < spec_fun_table_size(); ++i )
    {
      if( spec_fun_table[i].fun_ptr == special )
        {
          return spec_fun_table[i].fun_name;
        }
    }

  return "";
}

bool spec_questmaster( CHAR_DATA *ch )
{
  return FALSE;
}


bool spec_newbie_pilot( CHAR_DATA *ch )
{
  int           home = 32149;
  CHAR_DATA   * victim;
  CHAR_DATA   * v_next;
  OBJ_DATA    * obj;
  char          buf[MAX_STRING_LENGTH];
  bool          diploma = FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IS_NPC(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        if ( obj->pIndexData->vnum == OBJ_VNUM_SCHOOL_DIPLOMA )
          diploma = TRUE;

      if ( !diploma )
        continue;

      switch ( victim->race )
        {
        case RACE_MON_CALAMARI:
          home = 21100;
          strcpy ( buf , "After a brief journey you arrive on Mon Calamari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_QUARREN:
          home = 6904;
          strcpy ( buf , "After a brief journey you arrive on Mon Calamari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_GAMORREAN:
          home = 28038;
          strcpy ( buf , "After a brief journey you arrive on Gamorr.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_ADARIAN:
          home = 29006;
          strcpy ( buf , "After a brief journey you arrive on Adari.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_JAWA:
          home = 31821;
          strcpy ( buf , "After a brief journey you arrive on Tatooine.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_WOOKIEE:
          home = 28600;
          strcpy ( buf , "After a brief journey you arrive on Kashyyyk.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

        case RACE_HUMAN:
          home = 201;
          strcpy ( buf , "After a brief journey you arrive at Coruscants Menari Spaceport.\r\n\r\n" );
          echo_to_room( AT_ACTION , ch->in_room, buf );
          break;

          /*
            case RACE_NOGHRI:
            home = 1001;
            strcpy ( buf , "After a brief journey you arrive at Honoghr's Nystao Spaceport.\r\n\r\n" );
            echo_to_room( AT_ACTION , ch->in_room, buf );
            break;
          */
        default:
          sprintf ( buf , "Hmm, a %s." , race_table[victim->race].race_name );
          do_look ( ch, victim->name );
          do_say ( ch, buf );
          do_say ( ch, "You're home planet is a little hard to get to right now." );
          do_say ( ch, "I'll take you to the Pluogus instead." );
          echo_to_room( AT_ACTION , ch->in_room, "After a brief journey the shuttle docks with the Serin Pluogus.\r\n\r\n" );
          break;
        }

      char_from_room ( victim );
      char_to_room ( victim , get_room_index ( home ) );

      do_look ( victim , "" );

      sprintf ( buf , "%s steps out and the shuttle quickly returns to the academy.\r\n" , victim->name );
      echo_to_room( AT_ACTION , ch->in_room, buf );
    }

  return FALSE;
}

bool spec_jedi( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && can_see( ch, victim ) && number_bits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return FALSE;

  switch ( number_bits( 3 ) )
    {
    case 0:
      //    act( AT_MAGIC, "$n utters the word 'ciroht'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return TRUE;

    case 1:
      //    act( AT_MAGIC, "$n utters the word 'sunimod'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "alertness" ), ch->top_level, ch, victim );
      return TRUE;

    case 2:
      //    act( AT_MAGIC, "$n utters the word 'suah'.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return TRUE;

    case 3:
      //    act( AT_MAGIC, "$n utters the word 'nran'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return TRUE;

    case 4:
      //    act( AT_MAGIC, "$n utters the word 'nyrcs'.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return TRUE;

    case 5:
      //    act( AT_MAGIC, "$n utters the word 'gartla'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return TRUE;

    case 6:
      //    act( AT_MAGIC, "$n utters the word 'naimad'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "cure serious" ), ch->top_level, ch, victim );
      return TRUE;

    case 7:
      //    act( AT_MAGIC, "$n utters the word 'gorog'.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "beauty" ), ch->top_level, ch, victim );
      return TRUE;

    }

  return FALSE;
}

bool spec_clan_guard( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  CLAN_DATA *clan;
  bool found = FALSE;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  clan = get_clan(ch->name);

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( !IS_NPC( victim ) && victim->pcdata && victim->pcdata->clan && clan && IS_AWAKE(victim)
           && (clan != victim->pcdata->clan )
           && ( !victim->pcdata->clan->mainclan || clan != victim->pcdata->clan->mainclan )
           && ( !clan->mainclan || clan->mainclan != victim->pcdata->clan ) )
        {
          if(found)
            continue;

          do_yell( ch, "Hey your not allowed in here!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return TRUE;
        }
    }

  return FALSE;
}

bool spec_customs_smut( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  OBJ_DATA  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IS_AWAKE(ch) || ch->position == POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IS_NPC(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_SMUT)
            {
              if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                {
                  sprintf( buf , "%s is illegal contraband. I'm going to have to confiscate that.", obj->short_descr );
                  do_say( ch , buf );
                  if ( obj->wear_loc != WEAR_NONE )
                    remove_obj( victim, obj->wear_loc, TRUE );
                  separate_obj( obj );
                  obj_from_char( obj );
                  act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = obj_to_char( obj, ch );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You lose %ld experience.\r\n " , ch_exp );
                  gain_exp( victim, 0-ch_exp , SMUGGLING_ABILITY);
                  return TRUE;
                }
              else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , obj->short_descr );
                  gain_exp( victim, ch_exp , SMUGGLING_ABILITY );

                  act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);

                  return TRUE;
                }
              else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp, obj->short_descr );
                  gain_exp( victim, ch_exp , SMUGGLING_ABILITY );

                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content;
              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_SMUT
                      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      ch_exp = UMIN( content->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , content->short_descr );
                      gain_exp( victim, ch_exp, SMUGGLING_ABILITY );
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
        }

    }

  return FALSE;
}

bool spec_customs_weapons( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  OBJ_DATA  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IS_AWAKE(ch) || ch->position == POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IS_NPC(victim) || victim->position == POS_FIGHTING )
        continue;

      if (  victim->pcdata && victim->pcdata->clan && !str_cmp(victim->pcdata->clan->name , ch->mob_clan) )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_WEAPON)
            {
              if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                {
                  sprintf( buf , "Weapons are banned from non-military usage. I'm going to have to confiscate %s.", obj->short_descr );
                  do_say( ch , buf );
                  if ( obj->wear_loc != WEAR_NONE )
                    remove_obj( victim, obj->wear_loc, TRUE );
                  separate_obj( obj );
                  obj_from_char( obj );
                  act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = obj_to_char( obj, ch );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )  );
                  ch_printf( victim, "You lose %ld experience.\r\n " , ch_exp );
                  gain_exp( victim, 0-ch_exp , SMUGGLING_ABILITY);
                  return TRUE;
                }
              else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp, obj->short_descr );
                  gain_exp( victim, ch_exp, SMUGGLING_ABILITY );

                  act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
              else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , obj->short_descr);
                  gain_exp( victim, ch_exp , SMUGGLING_ABILITY);

                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content;
              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_WEAPON
                      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      ch_exp = UMIN( content->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , content->short_descr);
                      gain_exp( victim, ch_exp, SMUGGLING_ABILITY );
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
        }

    }

  return FALSE;
}

bool spec_customs_alcohol( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  OBJ_DATA  *obj;
  char       buf[MAX_STRING_LENGTH];
  int        liquid;
  long       ch_exp;

  if ( !IS_AWAKE(ch) || ch->position == POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IS_NPC(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_DRINK_CON)
            {
              if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
                liquid = obj->value[2] = 0;

              if ( liq_table[ liquid ].liq_affect[COND_DRUNK] > 0 )
                {
                  if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                    {
                      sprintf( buf , "%s is illegal contraband. I'm going to have to confiscate that.", obj->short_descr );
                      do_say( ch , buf );
                      if ( obj->wear_loc != WEAR_NONE )
                        remove_obj( victim, obj->wear_loc, TRUE );
                      separate_obj( obj );
                      obj_from_char( obj );
                      act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                      obj = obj_to_char( obj, ch );
                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                      ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You lose %ld experience. \r\n" , ch_exp );
                      gain_exp( victim, 0-ch_exp , SMUGGLING_ABILITY);
                      return TRUE;
                    }
                  else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, ch_exp , SMUGGLING_ABILITY);

                      act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                      act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                  else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                    {
                      ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %d. \r\n" , ch_exp , obj->short_descr);
                      gain_exp( victim, ch_exp , SMUGGLING_ABILITY);

                      SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content;
              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_DRINK_CON
                      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      if ( ( liquid = obj->value[2] ) >= LIQ_MAX )
                        liquid = obj->value[2] = 0;
                      if ( liq_table[ liquid ].liq_affect[COND_DRUNK] <= 0 )
                        continue;
                      ch_exp = UMIN( content->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %d.\r\n " , ch_exp , content->short_descr);
                      gain_exp( victim, ch_exp , SMUGGLING_ABILITY);
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
        }

    }

  return FALSE;
}

bool spec_customs_spice( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  OBJ_DATA  *obj;
  char       buf[MAX_STRING_LENGTH];
  long       ch_exp;

  if ( !IS_AWAKE(ch) || ch->position == POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( IS_NPC(victim) || victim->position == POS_FIGHTING )
        continue;

      for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
        {
          if (obj->pIndexData->item_type == ITEM_SPICE || obj->pIndexData->item_type  == ITEM_RAWSPICE)
            {
              if ( victim != ch && can_see( ch, victim ) && can_see_obj( ch,obj ) )
                {
                  sprintf( buf , "%s is illegal contraband. I'm going to have to confiscate that.", obj->short_descr );
                  do_say( ch , buf );
                  if ( obj->wear_loc != WEAR_NONE )
                    remove_obj( victim, obj->wear_loc, TRUE );
                  separate_obj( obj );
                  obj_from_char( obj );
                  act( AT_ACTION, "$n confiscates $p from $N.", ch, obj, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n takes $p from you.",   ch, obj, victim, TO_VICT    );
                  obj = obj_to_char( obj, ch );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You lose %ld experience. \r\n" , ch_exp );
                  gain_exp( victim, 0-ch_exp , SMUGGLING_ABILITY);
                  return TRUE;
                }
              else if ( can_see( ch, victim ) && !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %s. \r\n" , ch_exp , obj->short_descr);
                  gain_exp( victim, ch_exp , SMUGGLING_ABILITY );

                  act( AT_ACTION, "$n looks at $N suspiciously.", ch, NULL, victim, TO_NOTVICT );
                  act( AT_ACTION, "$n look at you suspiciously.",   ch, NULL, victim, TO_VICT  );
                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
              else if ( !IS_SET( obj->extra_flags , ITEM_CONTRABAND)  )
                {
                  ch_exp = UMIN( obj->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                  ch_printf( victim, "You receive %ld experience for smuggling %s. \r\n" , ch_exp , obj->short_descr);
                  gain_exp( victim, ch_exp , SMUGGLING_ABILITY);

                  SET_BIT( obj->extra_flags , ITEM_CONTRABAND);
                  return TRUE;
                }
            }
          else if ( obj->item_type == ITEM_CONTAINER )
            {
              OBJ_DATA *content;
              for ( content = obj->first_content; content; content = content->next_content )
                {
                  if (content->pIndexData->item_type == ITEM_SPICE
                      && !IS_SET( content->extra_flags , ITEM_CONTRABAND ) )
                    {
                      ch_exp = UMIN( content->cost*10 , ( exp_level( victim->skill_level[SMUGGLING_ABILITY]+1) - exp_level( victim->skill_level[SMUGGLING_ABILITY])  )   );
                      ch_printf( victim, "You receive %ld experience for smuggling %s.\r\n " , ch_exp , content->short_descr);
                      gain_exp( victim, ch_exp, SMUGGLING_ABILITY );
                      SET_BIT( content->extra_flags , ITEM_CONTRABAND);
                      return TRUE;
                    }
                }
            }
        }

    }

  return FALSE;
}

bool spec_police( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IS_NPC(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < 32 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            ROOM_INDEX_DATA *jail = NULL;

            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            if ( ch->top_level >= victim->top_level )
              multi_hit( ch, victim, TYPE_UNDEFINED );
            else if( 1 << vip == VIP_ADARI )
              jail = get_room_index( ROOM_JAIL_ADARI );
            else if( 1 << vip == VIP_MON_CALAMARI )
              switch ( number_range(1,4) )
                {
                case 1:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_1 );
                  break;
                case 2:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_2 );
                  break;
                case 3:
                  jail = get_room_index( ROOM_JAIL_QUARREN_2 );
                  break;
                case 4:
                  jail = get_room_index( ROOM_JAIL_QUARREN_1 );
                  break;
                }
            else
              {
                act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
                if( victim->in_room && victim->in_room->area )
                  boost_economy( victim->in_room->area, (victim->gold)/2 );
                victim->gold /= 2;
              }

            if ( jail )
              {
                REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
                act( AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n escorts you to jail.",   ch, NULL, victim, TO_VICT    );
                char_from_room( victim );
                char_to_room( victim , jail );
              }
            return TRUE;
          }

    }

  return FALSE;

}

bool spec_police_attack( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IS_NPC(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < 32 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            multi_hit( ch, victim, TYPE_UNDEFINED );
            return TRUE;
          }

    }

  return FALSE;

}

bool spec_police_undercover( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IS_NPC(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip < 32 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Got you!" );
            do_say( ch , buf );
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            multi_hit( ch, victim, TYPE_UNDEFINED );
            return TRUE;
          }

    }

  return FALSE;

}

bool spec_police_fine( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IS_NPC(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip <= 31 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );
            act( AT_ACTION, "$n fines $N an enormous amount of money.", ch, NULL, victim, TO_NOTVICT );
            act( AT_ACTION, "$n fines you an enourmous amount of money.",   ch, NULL, victim, TO_VICT    );
            if( victim->in_room && victim->in_room->area )
              boost_economy( victim->in_room->area, (victim->gold)/2 );
            victim->gold /= 2;
            REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
            return TRUE;
          }

    }

  return FALSE;

}

bool spec_police_jail( CHAR_DATA *ch )
{

  ROOM_INDEX_DATA *jail = NULL;
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int vip;
  char buf[MAX_STRING_LENGTH];

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( IS_NPC(victim) )
        continue;
      if ( !can_see( ch, victim ) )
        continue;
      if ( number_bits ( 1 ) == 0 )
        continue;
      for ( vip = 0 ; vip <= 31 ; vip++ )
        if ( IS_SET ( ch->vip_flags , 1 << vip ) &&  IS_SET( victim->pcdata->wanted_flags , 1 << vip) )
          {
            sprintf( buf , "Hey you're wanted on %s!", planet_flags[vip] );
            do_say( ch , buf );

            if( 1 << vip == VIP_ADARI )
              jail = get_room_index( ROOM_JAIL_ADARI );
            else if( 1 << vip == VIP_MON_CALAMARI )
              switch ( number_range(1,4) )
                {
                case 1:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_1 );
                  break;
                case 2:
                  jail = get_room_index( ROOM_JAIL_MON_CALAMARI_2 );
                  break;
                case 3:
                  jail = get_room_index( ROOM_JAIL_QUARREN_1 );
                  break;
                case 4:
                  jail = get_room_index( ROOM_JAIL_QUARREN_2 );
                  break;
                }

            if ( jail )
              {
                REMOVE_BIT( victim->pcdata->wanted_flags , 1 << vip );
                act( AT_ACTION, "$n ushers $N off to jail.", ch, NULL, victim, TO_NOTVICT );
                act( AT_ACTION, "$n escorts you to jail.",   ch, NULL, victim, TO_VICT    );
                char_from_room( victim );
                char_to_room( victim , jail );
              }
            return TRUE;
          }

    }

  return FALSE;

  /*
    VIP_CORUSCANT           BV00
    VIP_KASHYYYK            BV01
    VIP_RYLOTH              BV02
    VIP_RODIA               BV03
    VIP_NAL_HUTTA           BV04
    VIP_MON_CALAMARI        BV05
    VIP_HONOGHR             BV06
    VIP_GAMORR              BV07
    VIP_TATOOINE            BV08
    VIP_ADARI               BV09
    VIP_BYSS                BV10
    VIP_ENDOR               BV11
    VIP_ROCHE               BV12
    VIP_AF_EL               BV13
    VIP_TRANDOSH            BV14
    VIP_CHAD                BV15
  */

  jail = get_room_index( ROOM_JAIL_CORUSCANT );

}

bool spec_jedi_healer( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;

  if ( !IS_AWAKE(ch) )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim != ch && can_see( ch, victim ) && number_bits( 1 ) == 0 )
        break;
    }

  if ( !victim )
    return FALSE;

  switch ( number_bits( 12 ) )
    {
    case 0:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "armor" ), ch->top_level, ch, victim );
      return TRUE;

    case 1:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "good fortune" ), ch->top_level, ch, victim );
      return TRUE;

    case 2:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_blindness( skill_lookup( "cure blindness" ),
                            ch->top_level, ch, victim );
      return TRUE;

    case 3:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "cure light" ),
                   ch->top_level, ch, victim );
      return TRUE;

    case 4:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_cure_poison( skill_lookup( "cure poison" ),
                         ch->top_level, ch, victim );
      return TRUE;

    case 5:
      act( AT_MAGIC, "$n pauses and concentrates for a moment.", ch, NULL, NULL, TO_ROOM );
      spell_smaug( skill_lookup( "refresh" ), ch->top_level, ch, victim );
      return TRUE;

    }

  return FALSE;
}



bool spec_dark_jedi( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  char *spell;
  int sn;


  if ( ch->position != POS_FIGHTING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( who_fighting( victim ) && number_bits( 2 ) == 0 )
        break;
    }

  if ( !victim || victim == ch )
    return FALSE;

  for ( ;; )
    {
      int min_level;

      switch ( number_bits( 4 ) )
        {
        case  0: min_level =  5; spell = "blindness";      break;
        case  1: min_level =  5; spell = "fingers of the force";    break;
        case  2: min_level =  9; spell = "choke";         break;
        case  3: min_level =  8; spell = "invade essence";       break;
        case  4: min_level = 11; spell = "force projectile";   break;
        case  6: min_level = 13; spell = "drain essence";   break;
        case  7: min_level =  4; spell = "force whip";   break;
        case  8: min_level = 13; spell = "harm";          break;
        case  9: min_level = 9; spell = "force bolt";       break;
        case 10: min_level = 1; spell = "force spray";     break;
        default: return FALSE;
        }

      if ( ch->top_level >= min_level )
        break;
    }

  if ( ( sn = skill_lookup( spell ) ) < 0 )
    return FALSE;
  (*skill_table[sn]->spell_fun) ( sn, ch->top_level, ch, victim );
  return TRUE;
}



bool spec_fido( CHAR_DATA *ch )
{
  OBJ_DATA *corpse;
  OBJ_DATA *c_next;
  OBJ_DATA *obj;
  OBJ_DATA *obj_next;

  if ( !IS_AWAKE(ch) )
    return FALSE;

  for ( corpse = ch->in_room->first_content; corpse; corpse = c_next )
    {
      c_next = corpse->next_content;
      if ( corpse->item_type != ITEM_CORPSE_NPC )
        continue;

      act( AT_ACTION, "$n savagely devours a corpse.", ch, NULL, NULL, TO_ROOM );
      for ( obj = corpse->first_content; obj; obj = obj_next )
        {
          obj_next = obj->next_content;
          obj_from_obj( obj );
          obj_to_room( obj, ch->in_room );
        }
      extract_obj( corpse );
      return TRUE;
    }

  return FALSE;
}

bool spec_stormtrooper( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( ( IS_NPC( victim ) && nifty_is_name( "rebel" , victim->name )
             && victim->fighting && who_fighting( victim ) != ch ) ||
           ( !IS_NPC( victim ) && victim->pcdata && victim->pcdata->clan && IS_AWAKE(victim)
             && nifty_is_name( "rebel" , victim->pcdata->clan->name ) ) )
        {
          do_yell( ch, "Die Rebel Scum!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return TRUE;
        }

    }

  return FALSE;

}

bool spec_rebel_trooper( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( !can_see( ch, victim ) )
        continue;
      if ( get_timer(victim, TIMER_RECENTFIGHT) > 0 )
        continue;
      if ( ( IS_NPC( victim ) && nifty_is_name( "imperial" , victim->name )
             && victim->fighting && who_fighting( victim ) != ch ) ||
           ( !IS_NPC( victim ) && victim->pcdata && victim->pcdata->clan && IS_AWAKE(victim)
             && nifty_is_name( "empire" , victim->pcdata->clan->name ) ) )
        {
          do_yell( ch, "Long live the Rebel Alliance!" );
          multi_hit( ch, victim, TYPE_UNDEFINED );
          return TRUE;
        }

    }

  return FALSE;

}


bool spec_guardian( CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  CHAR_DATA *ech;
  char *crime;
  int max_evil;

  if ( !IS_AWAKE(ch) || ch->fighting )
    return FALSE;

  max_evil = 300;
  ech      = NULL;
  crime    = "";

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;
      if ( victim->fighting
           &&   who_fighting( victim ) != ch
           &&   victim->alignment < max_evil )
        {
          max_evil = victim->alignment;
          ech      = victim;
        }
    }

  if ( victim && IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      sprintf( buf, "%s is a %s!  As well as a COWARD!",
               victim->name, crime );
      do_yell( ch, buf );
      return TRUE;
    }

  if ( victim )
    {
      sprintf( buf, "%s is a %s!  PROTECT THE INNOCENT!!",
               victim->name, crime );
      do_shout( ch, buf );
      multi_hit( ch, victim, TYPE_UNDEFINED );
      return TRUE;
    }

  if ( ech )
    {
      act( AT_YELL, "$n screams 'PROTECT THE INNOCENT!!",
           ch, NULL, NULL, TO_ROOM );
      multi_hit( ch, ech, TYPE_UNDEFINED );
      return TRUE;
    }

  return FALSE;
}



bool spec_janitor( CHAR_DATA *ch )
{
  OBJ_DATA *trash;
  OBJ_DATA *trash_next;

  if ( !IS_AWAKE(ch) )
    return FALSE;

  for ( trash = ch->in_room->first_content; trash; trash = trash_next )
    {
      trash_next = trash->next_content;
      if ( !IS_SET( trash->wear_flags, ITEM_TAKE )
           ||    IS_OBJ_STAT( trash, ITEM_BURRIED ) )
        continue;
      if ( trash->item_type == ITEM_DRINK_CON
           ||   trash->item_type == ITEM_TRASH
           ||   trash->cost < 10
           ||  (trash->pIndexData->vnum == OBJ_VNUM_SHOPPING_BAG
                &&  !trash->first_content) )
        {
          act( AT_ACTION, "$n picks up some trash.", ch, NULL, NULL, TO_ROOM );
          obj_from_room( trash );
          obj_to_char( trash, ch );
          return TRUE;
        }
    }

  return FALSE;
}



bool spec_poison( CHAR_DATA *ch )
{
  CHAR_DATA *victim;

  if ( ch->position != POS_FIGHTING
       || ( victim = who_fighting( ch ) ) == NULL
       ||   number_percent( ) > 2 * ch->top_level )
    return FALSE;

  act( AT_HIT, "You bite $N!",  ch, NULL, victim, TO_CHAR    );
  act( AT_ACTION, "$n bites $N!",  ch, NULL, victim, TO_NOTVICT );
  act( AT_POISON, "$n bites you!", ch, NULL, victim, TO_VICT    );
  spell_poison( gsn_poison, ch->top_level, ch, victim );
  return TRUE;
}



bool spec_thief( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  int gold, maxgold;

  if ( ch->position != POS_STANDING )
    return FALSE;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( get_trust(victim) >= LEVEL_IMMORTAL
           ||   number_bits( 2 ) != 0
           ||   !can_see( ch, victim ) )        /* Thx Glop */
        continue;

      if ( IS_AWAKE(victim) && number_range( 0, ch->top_level ) == 0 )
        {
          act( AT_ACTION, "You discover $n's hands in your wallet!",
               ch, NULL, victim, TO_VICT );
          act( AT_ACTION, "$N discovers $n's hands in $S wallet!",
               ch, NULL, victim, TO_NOTVICT );
          return TRUE;
        }
      else
        {
          maxgold = 1000;
          gold = victim->gold
            * number_range( 1, URANGE(2, ch->top_level/4, 10) ) / 100;
          ch->gold     += 9 * gold / 10;
          victim->gold -= gold;
          if ( ch->gold > maxgold )
            {
              boost_economy( ch->in_room->area, ch->gold - maxgold/2 );
              ch->gold = maxgold/2;
            }
          return TRUE;
        }
    }

  return FALSE;
}

bool spec_auth( CHAR_DATA *ch )
{
  CHAR_DATA *victim;
  CHAR_DATA *v_next;
  char buf[MAX_STRING_LENGTH];
  OBJ_INDEX_DATA *pObjIndex;
  OBJ_DATA *obj;
  bool hasdiploma;

  for ( victim = ch->in_room->first_person; victim; victim = v_next )
    {
      v_next = victim->next_in_room;

      if ( !IS_NPC(victim) && ( pObjIndex = get_obj_index( OBJ_VNUM_SCHOOL_DIPLOMA ) ) != NULL )
        {
          hasdiploma = FALSE;

          for ( obj = victim->last_carrying; obj; obj = obj->prev_content )
            if (obj->pIndexData == get_obj_index( OBJ_VNUM_SCHOOL_DIPLOMA ) )
              hasdiploma = TRUE;

          if ( !hasdiploma )
            {
              obj = create_object( pObjIndex, 1 );
              obj = obj_to_char( obj, victim );
              send_to_char( "&cThe schoolmaster gives you a diploma, and shakes your hand.\r\n&w",victim);
            }
        }

      if ( IS_NPC(victim)
           ||   !IS_SET(victim->pcdata->flags, PCFLAG_UNAUTHED) || victim->pcdata->auth_state == 2 )
        continue;

      victim->pcdata->auth_state = 3;
      REMOVE_BIT(victim->pcdata->flags, PCFLAG_UNAUTHED);
      if ( victim->pcdata->authed_by )
        STRFREE( victim->pcdata->authed_by );
      victim->pcdata->authed_by = QUICKLINK( ch->name );
      sprintf( buf, "%s authorized %s", ch->name,
               victim->name );
      to_channel( buf, CHANNEL_MONITOR, "Monitor", ch->top_level );


    }
  return FALSE;

}

/*
  bool spec_random_pop( CHAR_DATA *ch )
  {

  int ran_array[MAX_RAN_POP] = { 309, 205, 10510, 28209, 29087, 26000, 1030, 5555,
  3026, 6230, 7340, 11215, 21050, 540, 28100, 28612,
  };
  }
*/
