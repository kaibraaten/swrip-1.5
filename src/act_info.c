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

#include <ctype.h>
#include <string.h>
#include "character.h"
#include "mud.h"
#include "vector3_aux.h"

int get_race_from_name( const char *arg )
{
  int iRace;

  for ( iRace = 0; iRace < MAX_RACE; iRace++ )
    {
      if ( toupper(arg[0]) == toupper(race_table[iRace].race_name[0])
           &&   !str_prefix( arg, race_table[iRace].race_name ) )
        break;
    }
  if( iRace == MAX_RACE )
    return -1;
  return iRace;
}

int get_class_from_name( const char *arg )
{
  int iClass;

  for ( iClass = 0; iClass < MAX_ABILITY; iClass++ )
    {
      if ( toupper(arg[0]) == toupper(ability_name[iClass][0])
           &&   !str_prefix( arg, ability_name[iClass] ) )
        break;
    }
  if( iClass == MAX_ABILITY )
    return -1;
  return iClass;
}

char *format_obj_to_char( const OBJ_DATA *obj, const Character *ch, bool fShort )
{
  static char buf[MAX_STRING_LENGTH];

  buf[0] = '\0';
  if ( IS_OBJ_STAT(obj, ITEM_INVIS)     )   strcat( buf, "(Invis) "     );
  if ( ( IsAffectedBy(ch, AFF_DETECT_MAGIC) || IsImmortal(ch) )
       && IS_OBJ_STAT(obj, ITEM_MAGIC)  )   strcat( buf, "&B(Blue Aura)&w "   );
  if ( IS_OBJ_STAT(obj, ITEM_GLOW)      )   strcat( buf, "(Glowing) "   );
  if ( IS_OBJ_STAT(obj, ITEM_HUM)       )   strcat( buf, "(Humming) "   );
  if ( IS_OBJ_STAT(obj, ITEM_HIDDEN)      )   strcat( buf, "(Hidden) "    );
  if ( IS_OBJ_STAT(obj, ITEM_BURRIED)     )   strcat( buf, "(Burried) "   );
  if ( IsImmortal(ch)
       && IS_OBJ_STAT(obj, ITEM_PROTOTYPE) ) strcat( buf, "(PROTO) "      );
  if ( IsAffectedBy(ch, AFF_DETECTTRAPS)
       && is_trapped(obj)   )   strcat( buf, "(Trap) "  );

  if ( fShort )
    {
      if ( obj->short_descr )
        strcat( buf, obj->short_descr );
    }
  else
    {
      if ( obj->description )
        strcat( buf, obj->description );
    }

  return buf;
}


/*
 * Some increasingly freaky halucinated objects         -Thoric
 */
char *halucinated_object( int ms, bool fShort )
{
  int sms = urange( 1, (ms+10)/5, 20 );

  if ( fShort )
    switch( number_range( 6-urange(1,sms/2,5), sms ) )
      {
      case  1: return "a sword";
      case  2: return "a stick";
      case  3: return "something shiny";
      case  4: return "something";
      case  5: return "something interesting";
      case  6: return "something colorful";
      case  7: return "something that looks cool";
      case  8: return "a nifty thing";
      case  9: return "a cloak of flowing colors";
      case 10: return "a mystical flaming sword";
      case 11: return "a swarm of insects";
      case 12: return "a deathbane";
      case 13: return "a figment of your imagination";
      case 14: return "your gravestone";
      case 15: return "the long lost boots of Ranger Thoric";
      case 16: return "a glowing tome of arcane knowledge";
      case 17: return "a long sought secret";
      case 18: return "the meaning of it all";
      case 19: return "the answer";
      case 20: return "the key to life, the universe and everything";
      }
  switch( number_range( 6-urange(1,sms/2,5), sms ) )
    {
    case  1: return "A nice looking sword catches your eye.";
    case  2: return "The ground is covered in small sticks.";
    case  3: return "Something shiny catches your eye.";
    case  4: return "Something catches your attention.";
    case  5: return "Something interesting catches your eye.";
    case  6: return "Something colorful flows by.";
    case  7: return "Something that looks cool calls out to you.";
    case  8: return "A nifty thing of great importance stands here.";
    case  9: return "A cloak of flowing colors asks you to wear it.";
    case 10: return "A mystical flaming sword awaits your grasp.";
    case 11: return "A swarm of insects buzzes in your face!";
    case 12: return "The extremely rare Deathbane lies at your feet.";
    case 13: return "A figment of your imagination is at your command.";
    case 14: return "You notice a gravestone here... upon closer examination, it reads your name.";
    case 15: return "The long lost boots of Ranger Thoric lie off to the side.";
    case 16: return "A glowing tome of arcane knowledge hovers in the air before you.";
    case 17: return "A long sought secret of all mankind is now clear to you.";
    case 18: return "The meaning of it all, so simple, so clear... of course!";
    case 19: return "The answer.  One.  It's always been One.";
    case 20: return "The key to life, the universe and everything awaits your hand.";
    }
  return "Whoa!!!";
}


/*
 * Show a list to a character.
 * Can coalesce duplicated items.
 */
void show_list_to_char( const OBJ_DATA *list, Character *ch, bool fShort, bool fShowNothing )
{
  char **prgpstrShow;
  int *prgnShow;
  int *pitShow;
  char *pstrShow;
  const OBJ_DATA *obj;
  int nShow;
  int iShow;
  int count, offcount, tmp, ms, cnt;
  bool fCombine;

  if ( !ch->desc )
    return;

  /*
   * if there's no list... then don't do all this crap!  -Thoric
   */
  if ( !list )
    {
      if ( fShowNothing )
        {
          if ( IsNpc(ch) || IS_SET(ch->act, PLR_COMBINE) )
            send_to_char( "     ", ch );
          send_to_char( "Nothing.\r\n", ch );
        }
      return;
    }
  /*
   * Alloc space for output lines.
   */
  count = 0;
  for ( obj = list; obj; obj = obj->next_content )
    count++;

  ms  = (ch->mental_state ? ch->mental_state : 1)
    * (IsNpc(ch) ? 1 : (ch->pcdata->condition[COND_DRUNK] ? (ch->pcdata->condition[COND_DRUNK]/12) : 1));

  /*
   * If not mentally stable...
   */
  if ( abs(ms) > 40 )
    {
      offcount = urange( -(count), (count * ms) / 100, count*2 );
      if ( offcount < 0 )
        offcount += number_range(0, abs(offcount));
      else
        if ( offcount > 0 )
          offcount -= number_range(0, offcount);
    }
  else
    offcount = 0;

  if ( count + offcount <= 0 )
    {
      if ( fShowNothing )
        {
          if ( IsNpc(ch) || IS_SET(ch->act, PLR_COMBINE) )
            send_to_char( "     ", ch );
          send_to_char( "Nothing.\r\n", ch );
        }
      return;
    }

  CREATE( prgpstrShow,  char*,  count + ((offcount > 0) ? offcount : 0) );
  CREATE( prgnShow,             int,    count + ((offcount > 0) ? offcount : 0) );
  CREATE( pitShow,              int,    count + ((offcount > 0) ? offcount : 0) );
  nShow = 0;
  tmp           = (offcount > 0) ? offcount : 0;
  cnt           = 0;

  /*
   * Format the list of objects.
   */
  for ( obj = list; obj; obj = obj->next_content )
    {
      if ( offcount < 0 && ++cnt > (count + offcount) )
        break;
      if ( tmp > 0 && number_bits(1) == 0 )
        {
          prgpstrShow [nShow] = str_dup( halucinated_object(ms, fShort) );
          prgnShow      [nShow] = 1;
          pitShow       [nShow] = number_range( ITEM_LIGHT, ITEM_BOOK );
          nShow++;
          --tmp;
        }
      if ( obj->wear_loc == WEAR_NONE
           && CanSeeItem( ch, obj )
           && ( ( obj->description && obj->description[0] != '\0' ) || ( IS_SET(ch->act, PLR_HOLYLIGHT) || IsNpc(ch) ) )
           && (obj->item_type != ITEM_TRAP || IsAffectedBy(ch, AFF_DETECTTRAPS) ) )
        {
          pstrShow = format_obj_to_char( obj, ch, fShort );
          fCombine = false;

          if ( IsNpc(ch) || IS_SET(ch->act, PLR_COMBINE) )
            {
              /*
               * Look for duplicates, case sensitive.
               * Matches tend to be near end so run loop backwords.
               */
              for ( iShow = nShow - 1; iShow >= 0; iShow-- )
                {
                  if ( !str_cmp( prgpstrShow[iShow], pstrShow ) )
                    {
                      prgnShow[iShow] += obj->count;
                      fCombine = true;
                      break;
                    }
                }
            }

          pitShow[nShow] = obj->item_type;
          /*
           * Couldn't combine, or didn't want to.
           */
          if ( !fCombine )
            {
              prgpstrShow [nShow] = str_dup( pstrShow );
              prgnShow    [nShow] = obj->count;
              nShow++;
            }
        }
    }
  if ( tmp > 0 )
    {
      int x;
      for ( x = 0; x < tmp; x++ )
        {
          prgpstrShow [nShow] = str_dup( halucinated_object(ms, fShort) );
          prgnShow      [nShow] = 1;
          pitShow       [nShow] = number_range( ITEM_LIGHT, ITEM_BOOK );
          nShow++;
        }
    }

  /*
   * Output the formatted list.         -Color support by Thoric
   */
  for ( iShow = 0; iShow < nShow; iShow++ )
    {
      switch(pitShow[iShow]) {
      default:
        set_char_color( AT_OBJECT, ch );
        break;
      case ITEM_BLOOD:
        set_char_color( AT_BLOOD, ch );
        break;
      case ITEM_MONEY:
      case ITEM_TREASURE:
        set_char_color( AT_YELLOW, ch );
        break;
      case ITEM_FOOD:
        set_char_color( AT_HUNGRY, ch );
        break;
      case ITEM_DRINK_CON:
      case ITEM_FOUNTAIN:
        set_char_color( AT_THIRSTY, ch );
        break;
      case ITEM_FIRE:
        set_char_color( AT_FIRE, ch );
        break;
      case ITEM_SCROLL:
      case ITEM_WAND:
      case ITEM_STAFF:
        break;
      }
      if ( fShowNothing )
        send_to_char( "     ", ch );
      send_to_char( prgpstrShow[iShow], ch );
      /*        if ( IsNpc(ch) || IS_SET(ch->act, PLR_COMBINE) ) */
      {
        if ( prgnShow[iShow] != 1 )
          ch_printf( ch, " (%d)", prgnShow[iShow] );
      }

      send_to_char( "\r\n", ch );
      DISPOSE( prgpstrShow[iShow] );
    }

  if ( fShowNothing && nShow == 0 )
    {
      if ( IsNpc(ch) || IS_SET(ch->act, PLR_COMBINE) )
        send_to_char( "     ", ch );
      send_to_char( "Nothing.\r\n", ch );
    }

  /*
   * Clean up.
   */
  DISPOSE( prgpstrShow );
  DISPOSE( prgnShow );
  DISPOSE( pitShow );
}

bool check_blind( const Character *ch )
{
  if ( !IsNpc(ch) && IS_SET(ch->act, PLR_HOLYLIGHT) )
    return true;

  if ( IsAffectedBy(ch, AFF_TRUESIGHT) )
    return true;

  if ( IsAffectedBy(ch, AFF_BLIND) )
    {
      send_to_char( "You can't see a thing!\r\n", ch );
      return false;
    }

  return true;
}

void show_condition( const Character *ch, const Character *victim )
{
  char buf[MAX_STRING_LENGTH];
  int percent;

  if ( victim->max_hit > 0 )
    percent = ( 100 * victim->hit ) / victim->max_hit;
  else
    percent = -1;


  strcpy( buf, PERS(victim, ch) );

  if ( (IsNpc ( victim ) && IS_SET( victim->act , ACT_DROID ) ) ||
       ( victim->race == RACE_DROID ) )
    {

      if ( percent >= 100 ) strcat( buf, " is in perfect condition.\r\n"  );
      else if ( percent >=  90 ) strcat( buf, " is slightly scratched.\r\n" );
      else if ( percent >=  80 ) strcat( buf, " has a few scrapes.\r\n"     );
      else if ( percent >=  70 ) strcat( buf, " has some dents.\r\n"         );
      else if ( percent >=  60 ) strcat( buf, " has a couple holes in its plating.\r\n"    );
      else if ( percent >=  50 ) strcat( buf, " has a many broken pieces.\r\n" );
      else if ( percent >=  40 ) strcat( buf, " has many exposed circuits.\r\n"    );
      else if ( percent >=  30 ) strcat( buf, " is leaking oil.\r\n"   );
      else if ( percent >=  20 ) strcat( buf, " has smoke coming out of it.\r\n"       );
      else if ( percent >=  10 ) strcat( buf, " is almost completely broken.\r\n"        );
      else                       strcat( buf, " is about to EXPLODE.\r\n"              );

    }
  else
    {

      if ( percent >= 100 ) strcat( buf, " is in perfect health.\r\n"  );
      else if ( percent >=  90 ) strcat( buf, " is slightly scratched.\r\n" );
      else if ( percent >=  80 ) strcat( buf, " has a few bruises.\r\n"     );
      else if ( percent >=  70 ) strcat( buf, " has some cuts.\r\n"         );
      else if ( percent >=  60 ) strcat( buf, " has several wounds.\r\n"    );
      else if ( percent >=  50 ) strcat( buf, " has many nasty wounds.\r\n" );
      else if ( percent >=  40 ) strcat( buf, " is bleeding freely.\r\n"    );
      else if ( percent >=  30 ) strcat( buf, " is covered in blood.\r\n"   );
      else if ( percent >=  20 ) strcat( buf, " is leaking guts.\r\n"       );
      else if ( percent >=  10 ) strcat( buf, " is almost dead.\r\n"        );
      else                       strcat( buf, " is DYING.\r\n"              );

    }
  buf[0] = UPPER(buf[0]);
  send_to_char( buf, ch );
}
