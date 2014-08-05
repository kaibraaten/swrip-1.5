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
 *          Misc module for general commands: not skills or spells         *
 ****************************************************************************
 * Note: Most of the stuff in here would go in act_obj.c, but act_obj was   *
 * getting big.                                                            *
 ****************************************************************************/

#include <string.h>
#include "mud.h"
#include "character.h"

void jedi_bonus( Character *ch )
{
  if ( number_range( 1 , 100 ) == 1 )
    {
      ch->max_mana++;
      send_to_char("&YYou are wise in your use of the force.\r\n", ch);
      send_to_char("You feel a little stronger in your wisdom.&w\r\n", ch);
    }
}

void sith_penalty( Character *ch )
{
  if ( number_range( 1 , 100 ) == 1 )
    {
      ch->max_mana++ ;
      if (ch->max_hit > 100)
        ch->max_hit--   ;
      ch->hit--   ;
      send_to_char("&zYour body grows weaker as your strength in the dark side grows.&w\r\n",ch);
    }
}

/*
 * Function to handle the state changing of a triggerobject (lever)  -Thoric
 */
void pullorpush( Character *ch, OBJ_DATA *obj, bool pull )
{
  char buf[MAX_STRING_LENGTH];
  Character             *rch;
  bool           isup;
  ROOM_INDEX_DATA       *room,  *to_room = NULL;
  Exit             *pexit, *pexit_rev;
  int                    edir;
  char          *txt;

  if ( IS_SET( obj->value[0], TRIG_UP ) )
    isup = TRUE;
  else
    isup = FALSE;
  switch( obj->item_type )
    {
    default:
      sprintf( buf, "You can't %s that!\r\n", pull ? "pull" : "push" );
      send_to_char( buf, ch );
      return;
      break;
    case ITEM_SWITCH:
    case ITEM_LEVER:
    case ITEM_PULLCHAIN:
      if ( (!pull && isup) || (pull && !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "up" : "down" );
          send_to_char( buf, ch );
          return;
        }
    case ITEM_BUTTON:
      if ( (!pull && isup) || (pull & !isup) )
        {
          sprintf( buf, "It is already %s.\r\n", isup ? "in" : "out" );
          send_to_char( buf, ch );
          return;
        }
      break;
    }
  if( (pull) && IS_SET(obj->pIndexData->mprog.progtypes,PULL_PROG) )
    {
      if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
        REMOVE_BIT( obj->value[0], TRIG_UP );
      oprog_pull_trigger( ch, obj );
      return;
    }
  if( (!pull) && IS_SET(obj->pIndexData->mprog.progtypes,PUSH_PROG) )
    {
      if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
        SET_BIT( obj->value[0], TRIG_UP );
      oprog_push_trigger( ch, obj );
      return;
    }

  if ( !oprog_use_trigger( ch, obj, NULL, NULL, NULL ) )
    {
      sprintf( buf, "$n %s $p.", pull ? "pulls" : "pushes" );
      act( AT_ACTION, buf,  ch, obj, NULL, TO_ROOM );
      sprintf( buf, "You %s $p.", pull ? "pull" : "push" );
      act( AT_ACTION, buf, ch, obj, NULL, TO_CHAR );
    }

  if ( !IS_SET(obj->value[0], TRIG_AUTORETURN ) )
    {
      if ( pull )
        REMOVE_BIT( obj->value[0], TRIG_UP );
      else
        SET_BIT( obj->value[0], TRIG_UP );
    }
  if ( IS_SET( obj->value[0], TRIG_TELEPORT )
       ||   IS_SET( obj->value[0], TRIG_TELEPORTALL )
       ||   IS_SET( obj->value[0], TRIG_TELEPORTPLUS ) )
    {
      int flags;

      if ( ( room = get_room_index( obj->value[1] ) ) == NULL )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }
      flags = 0;
      if ( IS_SET( obj->value[0], TRIG_SHOWROOMDESC ) )
        SET_BIT( flags, TELE_SHOWDESC );
      if ( IS_SET( obj->value[0], TRIG_TELEPORTALL ) )
        SET_BIT( flags, TELE_TRANSALL );
      if ( IS_SET( obj->value[0], TRIG_TELEPORTPLUS ) )
        SET_BIT( flags, TELE_TRANSALLPLUS );

      teleport( ch, obj->value[1], flags );
      return;
    }

  if ( IS_SET( obj->value[0], TRIG_RAND4 )
       ||        IS_SET( obj->value[0], TRIG_RAND6 ) )
    {
      int maxd;

      if ( ( room = get_room_index( obj->value[1] ) ) == NULL )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }

      if ( IS_SET( obj->value[0], TRIG_RAND4 ) )
        maxd = 3;
      else
        maxd = 5;

      randomize_exits( room, maxd );
      for ( rch = room->first_person; rch; rch = rch->next_in_room )
        {
          send_to_char( "You hear a loud rumbling sound.\r\n", rch );
          send_to_char( "Something seems different...\r\n", rch );
        }
    }
  if ( IS_SET( obj->value[0], TRIG_DOOR ) )
    {
      room = get_room_index( obj->value[1] );
      if ( !room )
        room = obj->in_room;
      if ( !room )
        {
          bug( "PullOrPush: obj points to invalid room %d", obj->value[1] );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_D_NORTH ) )
        {
          edir = DIR_NORTH;
          txt = "to the north";
        }
      else
        if ( IS_SET( obj->value[0], TRIG_D_SOUTH ) )
          {
            edir = DIR_SOUTH;
            txt = "to the south";
          }
        else
          if ( IS_SET( obj->value[0], TRIG_D_EAST ) )
            {
              edir = DIR_EAST;
              txt = "to the east";
            }
          else
            if ( IS_SET( obj->value[0], TRIG_D_WEST ) )
              {
                edir = DIR_WEST;
                txt = "to the west";
              }
            else
              if ( IS_SET( obj->value[0], TRIG_D_UP ) )
                {
                  edir = DIR_UP;
                  txt = "from above";
                }
              else
                if ( IS_SET( obj->value[0], TRIG_D_DOWN ) )
                  {
                    edir = DIR_DOWN;
                    txt = "from below";
                  }
                else
                  {
                    bug( "PullOrPush: door: no direction flag set.", 0 );
                    return;
                  }
      pexit = get_exit( room, edir );
      if ( !pexit )
        {
          if ( !IS_SET( obj->value[0], TRIG_PASSAGE ) )
            {
              bug( "PullOrPush: obj points to non-exit %d", obj->value[1] );
              return;
            }
          to_room = get_room_index( obj->value[2] );
          if ( !to_room )
            {
              bug( "PullOrPush: dest points to invalid room %d", obj->value[2] );
              return;
            }
          pexit = make_exit( room, to_room, edir );
          pexit->keyword        = STRALLOC( "" );
          pexit->description    = STRALLOC( "" );
          pexit->key            = -1;
          pexit->exit_info      = 0;
          top_exit++;
          act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_CHAR );
          act( AT_PLAIN, "A passage opens!", ch, NULL, NULL, TO_ROOM );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_UNLOCK )
           &&   IS_SET( pexit->exit_info, EX_LOCKED) )
        {
          REMOVE_BIT(pexit->exit_info, EX_LOCKED);
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            REMOVE_BIT( pexit_rev->exit_info, EX_LOCKED );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_LOCK   )
           &&  !IS_SET( pexit->exit_info, EX_LOCKED) )
        {
          SET_BIT(pexit->exit_info, EX_LOCKED);
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_CHAR );
          act( AT_PLAIN, "You hear a faint click $T.", ch, NULL, txt, TO_ROOM );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            SET_BIT( pexit_rev->exit_info, EX_LOCKED );
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_OPEN   )
           &&   IS_SET( pexit->exit_info, EX_CLOSED) )
        {
          REMOVE_BIT(pexit->exit_info, EX_CLOSED);
          for ( rch = room->first_person; rch; rch = rch->next_in_room )
            act( AT_ACTION, "The $d opens.", rch, NULL, pexit->keyword, TO_CHAR );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            {
              REMOVE_BIT( pexit_rev->exit_info, EX_CLOSED );
              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                act( AT_ACTION, "The $d opens.", rch, NULL, pexit_rev->keyword, TO_CHAR );
            }
          check_room_for_traps( ch, trap_door[edir]);
          return;
        }
      if ( IS_SET( obj->value[0], TRIG_CLOSE   )
           &&  !IS_SET( pexit->exit_info, EX_CLOSED) )
        {
          SET_BIT(pexit->exit_info, EX_CLOSED);
          for ( rch = room->first_person; rch; rch = rch->next_in_room )
            act( AT_ACTION, "The $d closes.", rch, NULL, pexit->keyword, TO_CHAR );
          if ( ( pexit_rev = pexit->rexit ) != NULL
               &&   pexit_rev->to_room == ch->in_room )
            {
              SET_BIT( pexit_rev->exit_info, EX_CLOSED );
              for ( rch = to_room->first_person; rch; rch = rch->next_in_room )
                act( AT_ACTION, "The $d closes.", rch, NULL, pexit_rev->keyword, TO_CHAR );
            }
          check_room_for_traps( ch, trap_door[edir]);
          return;
        }
    }
}

void actiondesc( Character *ch, OBJ_DATA *obj, void *vo )
{
  char charbuf[MAX_STRING_LENGTH];
  char roombuf[MAX_STRING_LENGTH];
  char *srcptr = obj->action_desc;
  char *charptr = charbuf;
  char *roomptr = roombuf;
  const char *ichar;
  const char *iroom;

  while ( *srcptr != '\0' )
    {
      if ( *srcptr == '$' )
        {
          srcptr++;
          switch ( *srcptr )
            {
            case 'e':
              ichar = "you";
              iroom = "$e";
              break;

            case 'm':
              ichar = "you";
              iroom = "$m";
              break;

            case 'n':
              ichar = "you";
              iroom = "$n";
              break;

            case 's':
              ichar = "your";
              iroom = "$s";
              break;

            default:
              srcptr--;
              *charptr++ = *srcptr;
              *roomptr++ = *srcptr;
              break;
            }
        }
      else if ( *srcptr == '%' && *++srcptr == 's' )
        {
          ichar = "You";
          iroom = is_npc( ch ) ? ch->short_descr : ch->name;
        }
      else
        {
          *charptr++ = *srcptr;
          *roomptr++ = *srcptr;
          srcptr++;
          continue;
        }

      while ( ( *charptr = *ichar ) != '\0' )
        {
          charptr++;
          ichar++;
        }

      while ( ( *roomptr = *iroom ) != '\0' )
        {
          roomptr++;
          iroom++;
        }
      srcptr++;
    }

  *charptr = '\0';
  *roomptr = '\0';

  switch( obj->item_type )
    {
    case ITEM_DRINK_CON:
      act( AT_ACTION, charbuf, ch, obj, liq_table[obj->value[2]].liq_name, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, liq_table[obj->value[2]].liq_name, TO_ROOM );
      return;

    case ITEM_ARMOR:
    case ITEM_WEAPON:
    case ITEM_LIGHT:
    case ITEM_FOOD:
    case ITEM_PILL:
    case ITEM_BLOOD:
    case ITEM_FOUNTAIN:
      act( AT_ACTION, charbuf, ch, obj, ch, TO_CHAR );
      act( AT_ACTION, roombuf, ch, obj, ch, TO_ROOM );
      return;

    default:
      return;
    }
}

bool check_bad_name( const char *name )
{
  FILE *fp = fopen(BAD_NAME_FILE,"r");

  if( fp == NULL )
    {
      bug("Bad Name file missing. Creating.");
      fp = fopen(BAD_NAME_FILE,"w+");
      fprintf(fp,"ShitEater~\n");
      fprintf(fp,"$~");
      fclose(fp);
      return FALSE;
    }

  while (!feof(fp))
    {
      const char *ln = fread_string_nohash(fp);

      if (is_name(name,ln))
        {
          fclose(fp);
          return TRUE;
        }

      if (is_name("$",ln))
        {
          fclose(fp);
          return FALSE;
        }
    }

  fclose(fp);
  return FALSE;
}

int add_bad_name(const char *name)
{
  FILE *fp;
  const char *ln = NULL;
  fpos_t pos;

  if (check_bad_name(name))
    return 0;

  if ((fp = fopen(BAD_NAME_FILE,"r+")) == NULL)
    {
      bug("Error opening Bad Name file.");
      return -1;
    }

  ln = fread_string_nohash(fp);

  while(!is_name("$",ln) && !feof(fp))
    ln = fread_string_nohash(fp);

  /* Delete the $~ from the end of the file */
  fgetpos(fp, &pos);

  fsetpos(fp, &pos -2);
  fsetpos(fp, &pos);
  fprintf(fp,"%s~\n",name);
  fprintf(fp,"$~");
  fclose(fp);
  return 1;
}

/*
 * This function examines a text string to see if the first "word" is a
 * color indicator (e.g. _red, _whi_, _blu).  -  Gorog
 */
int get_color(const char *origarg)    /* get color code from command string */
{
  char argument[MAX_INPUT_LENGTH];
  char color[MAX_INPUT_LENGTH];
  const char *cptr = NULL;
  static char const * color_list =
    "_bla_red_dgr_bro_dbl_pur_cya_cha_dch_ora_gre_yel_blu_pin_lbl_whi";
  static char const * blink_list =
    "*bla*red*dgr*bro*dbl*pur*cya*cha*dch*ora*gre*yel*blu*pin*lbl*whi";

  strcpy(argument, origarg);
  one_argument (argument, color);

  if (color[0]!='_' && color[0]!='*')
    return 0;

  if ( (cptr = strstr(color_list, color)) )
    return (cptr - color_list) / 4;

  if ( (cptr = strstr(blink_list, color)) )
    return (cptr - blink_list) / 4 + AT_BLINK;

  return 0;
}

static const long VALID_LANGUAGES  = LANG_COMMON
  | LANG_WOOKIEE | LANG_TWI_LEK | LANG_RODIAN
  | LANG_HUTT | LANG_MON_CALAMARI | LANG_NOGHRI | LANG_GAMORREAN
  | LANG_JAWA | LANG_ADARIAN | LANG_EWOK | LANG_VERPINE | LANG_DEFEL
  | LANG_TRANDOSHAN | LANG_CHADRA_FAN | LANG_QUARREN | LANG_SULLUSTAN
  | LANG_BARABEL | LANG_FIRRERREO | LANG_BOTHAN | LANG_TOGORIAN
  | LANG_KUBAZ | LANG_YEVETHAN | LANG_GAND | LANG_DUROS | LANG_COYNITE
  | LANG_GOTAL | LANG_DEVARONIAN | LANG_FALLEEN | LANG_ITHORIAN
  | LANG_BINARY;

bool is_valid_language( int language )
{
  return VALID_LANGUAGES & language ? true : false;
}
