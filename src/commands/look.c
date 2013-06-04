#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "vector3_aux.h"
#include "ships.h"
#include "shuttle.h"
#include "character.h"

/* Locals */
void show_char_to_char( Character *list, Character *ch );

static void show_char_to_char_0( Character *victim, Character *ch );
static void show_char_to_char_1( Character *victim, Character *ch );
static void show_ships_to_char( SHIP_DATA *ship, Character *ch );
static void show_visible_affects_to_char( Character *victim, Character *ch );
static void show_exit_to_char( Character *ch, EXIT_DATA *pexit, short door );
static void show_no_arg( Character *ch, bool is_auto );

static char *get_sex( Character *ch );
static void look_under( Character *ch, char *what, bool doexaprog );
static void look_in( Character *ch, char *what, bool doexaprog );
static bool requirements_are_met( Character *ch );

void do_look( Character *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  EXIT_DATA *pexit;
  Character *victim;
  OBJ_DATA *obj;
  char *pdesc;
  bool doexaprog;
  short door;
  int number, cnt;
  bool is_auto = FALSE;

  if( !requirements_are_met( ch ) )
    {
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  doexaprog = str_cmp( "noprog", arg2 ) && str_cmp( "noprog", arg3 );
  is_auto = !str_cmp( arg1, "auto" );

  if ( arg1[0] == '\0' || is_auto )
    {
      show_no_arg( ch, is_auto );
      return;
    }

  if ( !str_cmp( arg1, "under" ) )
    {
      look_under( ch, arg2, doexaprog );
      return;
    }

  if ( !str_cmp( arg1, "i" ) || !str_cmp( arg1, "in" ) )
    {
      look_in( ch, arg2, doexaprog );
      return;
    }

  pdesc = get_extra_descr(arg1, ch->in_room->first_extradesc);

  if ( pdesc )
    {
      send_to_char( "\r\n", ch );
      send_to_char( pdesc, ch );
      return;
    }

  door = get_dir( arg1 );
  pexit = find_door( ch, arg1, TRUE );

  if ( pexit )
    {
      show_exit_to_char( ch, pexit, door );
      return;
    }
  else if ( door != DIR_INVALID )
    {
      bug("%s:%s:%d: door != DIR_INVALID", __FUNCTION__, __FILE__, __LINE__);
      send_to_char( "Nothing special there.\r\n", ch );
      return;
    }

  victim = get_char_room( ch, arg1 );

  if ( victim )
    {
      show_char_to_char_1( victim, ch );
      return;
    }

  number = number_argument( arg1, arg );

  for ( cnt = 0, obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if ( can_see_obj( ch, obj ) )
        {
          if ( (pdesc=get_extra_descr(arg, obj->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;
              send_to_char( pdesc, ch );
              if ( doexaprog ) oprog_examine_trigger( ch, obj );
              return;
            }

          if ( (pdesc=get_extra_descr(arg, obj->pIndexData->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
		continue;
              send_to_char( pdesc, ch );
              if ( doexaprog ) oprog_examine_trigger( ch, obj );
              return;
            }

          if ( nifty_is_name_prefix( arg, obj->name ) )
            {
              if ( (cnt += obj->count) < number )
                continue;
              pdesc = get_extra_descr( obj->name, obj->pIndexData->first_extradesc );
              if ( !pdesc )
                pdesc = get_extra_descr( obj->name, obj->first_extradesc );
              if ( !pdesc )
                send_to_char( "You see nothing special.\r\n", ch );
              else
                send_to_char( pdesc, ch );
              if ( doexaprog ) oprog_examine_trigger( ch, obj );
              return;
            }
        }
    }

  for ( obj = ch->in_room->last_content; obj; obj = obj->prev_content )
    {
      if ( can_see_obj( ch, obj ) )
        {
          if ( (pdesc=get_extra_descr(arg, obj->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;

              send_to_char( pdesc, ch );

              if ( doexaprog )
		oprog_examine_trigger( ch, obj );

              return;
            }

          if ( (pdesc=get_extra_descr(arg, obj->pIndexData->first_extradesc)) != NULL )
            {
              if ( (cnt += obj->count) < number )
                continue;
              send_to_char( pdesc, ch );

              if ( doexaprog )
		oprog_examine_trigger( ch, obj );

              return;
            }

          if ( nifty_is_name_prefix( arg, obj->name ) )
	    {
              if ( (cnt += obj->count) < number )
                continue;
              pdesc = get_extra_descr( obj->name, obj->pIndexData->first_extradesc );
              if ( !pdesc )
                pdesc = get_extra_descr( obj->name, obj->first_extradesc );
              if ( !pdesc )
                send_to_char( "You see nothing special.\r\n", ch );
              else
                send_to_char( pdesc, ch );
              if ( doexaprog ) oprog_examine_trigger( ch, obj );
              return;
            }
        }
    }

  send_to_char( "You do not see that here.\r\n", ch );
}

static void show_char_to_char_0( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf1[MAX_STRING_LENGTH];
  char message[MAX_STRING_LENGTH];

  buf[0] = '\0';

  if ( is_npc(victim) )
    strcat( buf, " "  );

  if ( !is_npc(victim) && !victim->desc )
    {
      if ( !victim->switched )          strcat( buf, "(Link Dead) "  );
      else
        if ( !is_affected_by(victim->switched, AFF_POSSESS) )
          strcat( buf, "(Switched) " );
    }
  if ( !is_npc(victim)
       && IS_SET(victim->act, PLR_AFK) )                strcat( buf, "[AFK] ");

  if ( (!is_npc(victim) && IS_SET(victim->act, PLR_WIZINVIS))
       || (is_npc(victim) && IS_SET(victim->act, ACT_MOBINVIS)) )
    {
      if (!is_npc(victim))
        sprintf( buf1,"(Invis %d) ", victim->pcdata->wizinvis );
      else sprintf( buf1,"(Mobinvis %d) ", victim->mobinvis);
      strcat( buf, buf1 );
    }
  if ( is_affected_by(victim, AFF_INVISIBLE)   ) strcat( buf, "(Invis) "      );
  if ( is_affected_by(victim, AFF_HIDE)        ) strcat( buf, "(Stealth) "       );
  if ( is_affected_by(victim, AFF_PASS_DOOR)   ) strcat( buf, "(Translucent) ");
  if ( is_affected_by(victim, AFF_FAERIE_FIRE) ) strcat( buf, "&P(Pink Aura)&w "  );
  if ( is_evil(victim)
       &&   is_affected_by(ch, AFF_DETECT_EVIL)     ) strcat( buf, "&R(Red Aura)&w "   );
  if ( ( victim->mana > 10 )
       &&   ( is_affected_by( ch , AFF_DETECT_MAGIC ) || is_immortal( ch ) ) )
    strcat( buf, "&B(Blue Aura)&w "  );
  if ( !is_npc(victim) && IS_SET(victim->act, PLR_LITTERBUG  ) )
    strcat( buf, "(LITTERBUG) "  );
  if ( is_npc(victim) && is_immortal(ch)
       && IS_SET(victim->act, ACT_PROTOTYPE) ) strcat( buf, "(PROTO) " );
  if ( victim->desc && victim->desc->connection_state == CON_EDITING )
    strcat( buf, "(Writing) " );

  set_char_color( AT_PERSON, ch );
  if ( victim->position == victim->defposition && victim->long_descr[0] != '\0' )
    {
      strcat( buf, victim->long_descr );
      send_to_char( buf, ch );
      show_visible_affects_to_char( victim, ch );
      return;
    }

  if ( !is_npc(victim) && !IS_SET(ch->act, PLR_BRIEF) )
    strcat( buf, victim->pcdata->title );
  else
    strcat( buf, PERS( victim, ch ) );

  switch ( victim->position )
    {
    case POS_DEAD:     strcat( buf, " is DEAD!!" );                     break;
    case POS_MORTAL:   strcat( buf, " is mortally wounded." );          break;
    case POS_INCAP:    strcat( buf, " is incapacitated." );             break;
    case POS_STUNNED:  strcat( buf, " is lying here stunned." );        break;
    case POS_SLEEPING:
      if (victim->on != NULL)
        {
          if (victim->on->value[2] == SLEEP_AT)
            {
              sprintf(message," is sleeping at %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[2] == SLEEP_ON)
            {
              sprintf(message," is sleeping on %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
		  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sleeping in %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_SITTING
              ||  ch->position == POS_RESTING )
            strcat( buf, " is sleeping nearby." );
          else
            strcat( buf, " is deep in slumber here." );
        }
      break;
    case POS_RESTING:
      if (victim->on != NULL)
        {
          if (victim->on->value[2] == REST_AT)
            {
              sprintf(message," is resting at %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[2] == REST_ON)
            {
              sprintf(message," is resting on %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is resting in %s",
                      victim->on->short_descr);
              if( ((ch->position < POS_FIGHTING) && (ch->position > POS_STUNNED))
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_RESTING)
            strcat ( buf, " is sprawled out alongside you." );
          else
            if (ch->position == POS_MOUNTED)
              strcat ( buf, " is sprawled out at the foot of your mount." );
            else
              strcat (buf, " is sprawled out here." );
        }
      break;
    case POS_SITTING:
      if (victim->on != NULL)
        {
          if (victim->on->value[2] == SIT_AT)
            {
              sprintf(message," is sitting at %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
          else if (victim->on->value[2] == SIT_ON)
            {
              sprintf(message," is sitting on %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
	      strcat(message, ".");
              strcat(buf,message);
            }
          else
            {
              sprintf(message, " is sitting in %s",
                      victim->on->short_descr);
              if( (ch->position == POS_SITTING)
                  && ch->on && (ch->on == victim->on ) )
                strcat(message, " with you");
              strcat(message, ".");
              strcat(buf,message);
            }
        }
      else
        {
          if (ch->position == POS_SITTING)
            strcat( buf, " sits here with you." );
          else
            if (ch->position == POS_RESTING)
              strcat( buf, " sits nearby as you lie around." );
            else
              strcat( buf, " sits upright here." );
        }
      break;
    case POS_STANDING:
      if ( is_immortal(victim) )
        strcat( buf, " is here before you." );
      else
        if ( ( victim->in_room->sector_type == SECT_UNDERWATER )
             && !is_affected_by(victim, AFF_AQUA_BREATH) && !is_npc(victim) )
          strcat( buf, " is drowning here." );
        else
          if ( victim->in_room->sector_type == SECT_UNDERWATER )
            strcat( buf, " is here in the water." );
          else
            if ( ( victim->in_room->sector_type == SECT_OCEANFLOOR )
                 && !is_affected_by(victim, AFF_AQUA_BREATH) && !is_npc(victim) )
              strcat( buf, " is drowning here." );
            else
              if ( victim->in_room->sector_type == SECT_OCEANFLOOR )
                strcat( buf, " is standing here in the water." );
              else
                if ( is_affected_by(victim, AFF_FLOATING)
                     || is_affected_by(victim, AFF_FLYING) )
		  strcat( buf, " is hovering here." );
                else
                  strcat( buf, " is standing here." );
      break;
    case POS_SHOVE:    strcat( buf, " is being shoved around." );       break;
    case POS_DRAG:     strcat( buf, " is being dragged around." );      break;
    case POS_MOUNTED:
      strcat( buf, " is here, upon " );
      if ( !victim->mount )
        strcat( buf, "thin air???" );
      else
        if ( victim->mount == ch )
          strcat( buf, "your back." );
        else
          if ( victim->in_room == victim->mount->in_room )
            {
              strcat( buf, PERS( victim->mount, ch ) );
              strcat( buf, "." );
            }
          else
            strcat( buf, "someone who left??" );
      break;
    case POS_FIGHTING:
      strcat( buf, " is here, fighting " );
      if ( !victim->fighting )
        strcat( buf, "thin air???" );
      else if ( who_fighting( victim ) == ch )
        strcat( buf, "YOU!" );
      else if ( victim->in_room == victim->fighting->who->in_room )
        {
          strcat( buf, PERS( victim->fighting->who, ch ) );
          strcat( buf, "." );
        }
      else
        strcat( buf, "someone who left??" );
      break;
    }

  strcat( buf, "\r\n" );
  buf[0] = UPPER(buf[0]);
  send_to_char( buf, ch );
  show_visible_affects_to_char( victim, ch );
}

static void show_char_to_char_1( Character *victim, Character *ch )
{
  OBJ_DATA *obj;
  int iWear;
  bool found;

  if ( can_see( victim, ch ) )
    {
      act( AT_ACTION, "$n looks at you.", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n looks at $N.",  ch, NULL, victim, TO_NOTVICT );
    }

  ch_printf( ch, "%s is a %s %s\r\n", victim->name, get_sex( victim ), npc_race[victim->race] );

  if ( victim->description[0] != '\0' )
    {
      send_to_char( victim->description, ch );
    }
  else
    {
      act( AT_PLAIN, "You see nothing special about $M.", ch, NULL, victim, TO_CHAR );
    }

  show_condition( ch, victim );

  found = FALSE;

  if( ( (obj = get_eq_char( victim, WEAR_OVER ) ) == NULL ) || obj->value[2] == 0 || is_god(ch) )
    {
      for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
        {
          if ( ( obj = get_eq_char( victim, iWear ) ) != NULL
               &&   can_see_obj( ch, obj ) &&
               ( ( obj->description && obj->description[0] != '\0' ) || ( IS_SET(ch->act, PLR_HOLYLIGHT) || is_npc(ch) ) ) )
            {
              if ( !found )
                {
                  send_to_char( "\r\n", ch );
		  act( AT_PLAIN, "$N is using:", ch, NULL, victim, TO_CHAR );
                  found = TRUE;
                }
              send_to_char( where_name[iWear], ch );
              send_to_char( format_obj_to_char( obj, ch, TRUE ), ch );
              send_to_char( "\r\n", ch );
            }
        }
    }
  else
    {
      send_to_char( where_name[WEAR_OVER], ch );
      send_to_char( format_obj_to_char( obj, ch, TRUE ), ch );
      send_to_char( "\r\n", ch );
    }

  if ( is_npc(ch) || victim == ch )
    return;

  if ( number_percent( ) < ch->pcdata->learned[gsn_peek] )
    {
      send_to_char( "\r\nYou peek at the inventory:\r\n", ch );
      show_list_to_char( victim->first_carrying, ch, TRUE, TRUE );
      learn_from_success( ch, gsn_peek );
    }
  else
    if ( ch->pcdata->learned[gsn_peek] )
      learn_from_failure( ch, gsn_peek );
}

static void show_ships_to_char( SHIP_DATA *ship, Character *ch )
{
  SHIP_DATA *rship;
  SHIP_DATA *nship=NULL;

  for ( rship = ship; rship; rship = nship )
    {
      ch_printf( ch , "&C%-35s     ", rship->name );
      if ( ( nship = rship->next_in_room ) !=NULL )
        {
          ch_printf( ch , "%-35s", nship->name );
          nship = nship->next_in_room;
        }
      ch_printf( ch, "\r\n&w");
    }
}

void show_char_to_char( Character *list, Character *ch )
{
  Character *rch;

  for ( rch = list; rch; rch = rch->next_in_room )
    {
      if ( rch == ch )
        continue;

      if ( can_see( ch, rch ) )
        {
          show_char_to_char_0( rch, ch );
        }
      else if ( rch->race == RACE_DEFEL )
        {
          set_char_color( AT_BLOOD, ch );
          send_to_char( "You see a pair of red eyes staring back at you.\r\n", ch );
        }
      else if ( room_is_dark( ch->in_room )
                &&        is_affected_by(rch, AFF_INFRARED ) )
        {
          set_char_color( AT_BLOOD, ch );
          send_to_char( "The red form of a living creature is here.\r\n", ch );
        }
    }
}

static void show_visible_affects_to_char( Character *victim, Character *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( is_affected_by(victim, AFF_CHARM)       )
    {
      set_char_color( AT_MAGIC, ch );
      ch_printf( ch, "%s looks ahead free of expression.\r\n",
                 is_npc( victim ) ? capitalize(victim->short_descr) : (victim->name) );
    }
  if ( !is_npc(victim) && !victim->desc
       &&    victim->switched && is_affected_by(victim->switched, AFF_POSSESS) )
    {
      set_char_color( AT_MAGIC, ch );
      strcpy( buf, PERS( victim, ch ) );
      strcat( buf, " appears to be in a deep trance...\r\n" );
    }
}

static char *get_sex( Character *ch )
{
  switch( ch->sex )
    {
    case 1:
      return "male";

    case 2:
      return "female";

    default:
      return "undistinguished";
    }
}

static void look_under( Character *ch, char *what, bool doexaprog )
{
  int count = 0;
  OBJ_DATA *obj = NULL;

  if ( what[0] == '\0' )
    {
      send_to_char( "Look beneath what?\r\n", ch );
      return;
    }

  obj = get_obj_here( ch, what );

  if ( !obj )
    {
      send_to_char( "You do not see that here.\r\n", ch );
      return;
    }

  if ( ch->carry_weight + obj->weight > can_carry_w( ch ) )
    {
      send_to_char( "It's too heavy for you to look under.\r\n", ch );
      return;
    }

  count = obj->count;
  obj->count = 1;
  act( AT_PLAIN, "You lift $p and look beneath it:", ch, obj, NULL, TO_CHAR );
  act( AT_PLAIN, "$n lifts $p and looks beneath it:", ch, obj, NULL, TO_ROOM );
  obj->count = count;

  if ( IS_OBJ_STAT( obj, ITEM_COVERING ) )
    {
      show_list_to_char( obj->first_content, ch, TRUE, TRUE );
    }
  else
    {
      send_to_char( "Nothing.\r\n", ch );
    }

  if ( doexaprog )
    {
      oprog_examine_trigger( ch, obj );
    }
}

static bool requirements_are_met( Character *ch )
{
  if( !ch->desc )
    {
      return FALSE;
    }

  if ( ch->position < POS_SLEEPING )
    {
      ch_printf( ch, "You can't see anything but stars!\r\n" );

      return FALSE;
    }

  if ( ch->position == POS_SLEEPING )
    {
      ch_printf( ch, "You can't see anything, you're sleeping!\r\n" );

      return FALSE;
    }

  if ( !check_blind( ch ) )
    {
      return FALSE;
    }

  if ( !is_npc(ch)
       && !IS_SET(ch->act, PLR_HOLYLIGHT)
       && !is_affected_by(ch, AFF_TRUESIGHT)
       && room_is_dark( ch->in_room ) )
    {
      set_char_color( AT_DGREY, ch );
      send_to_char( "It is pitch black...\r\n", ch );
      show_char_to_char( ch->in_room->first_person, ch );

      return FALSE;
    }

  return TRUE;
}

static void look_in( Character *ch, char *what, bool doexaprog )
{
  int count = 0;
  OBJ_DATA *obj = NULL;
  EXIT_DATA *pexit = NULL;

  if ( what[0] == '\0' )
    {
      send_to_char( "Look in what?\r\n", ch );
      return;
    }

  obj = get_obj_here( ch, what );

  if ( !obj )
    {
      send_to_char( "You do not see that here.\r\n", ch );
      return;
    }

  switch ( obj->item_type )
    {
    default:
      send_to_char( "That is not a container.\r\n", ch );
      break;

    case ITEM_DRINK_CON:
      if ( obj->value[1] <= 0 )
	{
	  send_to_char( "It is empty.\r\n", ch );

	  if ( doexaprog )
	    {
	      oprog_examine_trigger( ch, obj );
	    }

	  break;
	}

      ch_printf( ch, "It's %s full of a %s liquid.\r\n",
                     obj->value[1] <     obj->value[0] / 4
		 ? "less than" :
                     obj->value[1] < 3 * obj->value[0] / 4
		 ? "about"     : "more than",
                     liq_table[obj->value[2]].liq_color
		 );

      if ( doexaprog )
	{
	  oprog_examine_trigger( ch, obj );
	}
      break;

    case ITEM_PORTAL:
      for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
	{
	  if ( pexit->vdir == DIR_PORTAL
	       &&   IS_SET(pexit->exit_info, EX_PORTAL) )
	    {
	      ROOM_INDEX_DATA *original = NULL;

	      if ( room_is_private( ch, pexit->to_room )
		   && get_trust(ch) < sysdata.level_override_private )
		{
		  set_char_color( AT_WHITE, ch );
		  send_to_char( "That room is private buster!\r\n", ch );
		  return;
		}

	      original = ch->in_room;
	      char_from_room( ch );
	      char_to_room( ch, pexit->to_room );
	      do_look( ch, "auto" );
	      char_from_room( ch );
	      char_to_room( ch, original );
	      return;
	    }
	}

      send_to_char( "You see a swirling chaos...\r\n", ch );
      break;

    case ITEM_CONTAINER:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_DROID_CORPSE:
      if ( IS_SET(obj->value[1], CONT_CLOSED) )
	{
	  send_to_char( "It is closed.\r\n", ch );
	  break;
	}

      count = obj->count;
      obj->count = 1;
      act( AT_PLAIN, "$p contains:", ch, obj, NULL, TO_CHAR );
      obj->count = count;
      show_list_to_char( obj->first_content, ch, TRUE, TRUE );

      if ( doexaprog )
	{
	  oprog_examine_trigger( ch, obj );
	}

      break;
    }
}

static void show_exit_to_char( Character *ch, EXIT_DATA *pexit, short door )
{
  if ( pexit->keyword )
    {
      if ( IS_SET(pexit->exit_info, EX_CLOSED)
	   && !IS_SET(pexit->exit_info, EX_WINDOW) )
	{
	  if ( IS_SET(pexit->exit_info, EX_SECRET)
	       && door != DIR_INVALID )
	    {
	      send_to_char( "Nothing special there.\r\n", ch );
	    }
	  else
	    {
	      act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
	    }

	  return;
	}

      if ( IS_SET( pexit->exit_info, EX_BASHED ) )
	{
	  act(AT_RED, "The $d has been bashed from its hinges!",
	      ch, NULL, pexit->keyword, TO_CHAR);
	}
    }

  if ( pexit->description && pexit->description[0] != '\0' )
    {
      send_to_char( pexit->description, ch );
    }
  else
    {
      send_to_char( "Nothing special there.\r\n", ch );
    }

  /*
   * Ability to look into the next room                     -Thoric
   */
  if ( pexit->to_room
       && ( is_affected_by( ch, AFF_SCRYING )
	    || IS_SET( pexit->exit_info, EX_xLOOK )
	    || get_trust(ch) >= LEVEL_IMMORTAL ) )
    {
      ROOM_INDEX_DATA *original = NULL;

      if ( !IS_SET( pexit->exit_info, EX_xLOOK )
	   && get_trust( ch ) < LEVEL_IMMORTAL )
	{
	  set_char_color( AT_MAGIC, ch );
	  send_to_char( "You attempt to scry...\r\n", ch );

	  if (!is_npc(ch) )
	    {
	      int percent = 99;

	      if( number_percent() > percent )
		{
		  send_to_char( "You fail.\r\n", ch );
		  return;
		}
	    }
	}

      if ( room_is_private( ch, pexit->to_room )
	   && get_trust(ch) < sysdata.level_override_private )
	{
	  set_char_color( AT_WHITE, ch );
	  send_to_char( "That room is private buster!\r\n", ch );
	  return;
	}

      original = ch->in_room;

      if ( pexit->distance > 1 )
	{
	  ROOM_INDEX_DATA *to_room = generate_exit( ch->in_room, &pexit );

	  if ( to_room )
	    {
	      char_from_room( ch );
	      char_to_room( ch, to_room );
	    }
	  else
	    {
	      char_from_room( ch );
	      char_to_room( ch, pexit->to_room );
	    }
	}
      else
	{
	  char_from_room( ch );
	  char_to_room( ch, pexit->to_room );
	}

      do_look( ch, "auto" );
      char_from_room( ch );
      char_to_room( ch, original );
    }
}

/* 'look' or 'look auto' */
static void show_no_arg( Character *ch, bool is_auto )
{
  set_char_color( AT_RMNAME, ch);
  send_to_char( ch->in_room->name, ch);
  send_to_char(" ", ch);

  if ( !ch->desc->original )
    {
      if ((get_trust(ch) >= LEVEL_IMMORTAL) && (IS_SET(ch->pcdata->flags, PCFLAG_ROOM)))
	{
	  set_char_color(AT_PURPLE, ch);
	  ch_printf(ch, "{%d:%s}", ch->in_room->vnum, ch->in_room->area->filename);

	  set_char_color(AT_CYAN, ch);
	  ch_printf( ch, "[%s]", flag_string(ch->in_room->room_flags, room_flags ) );
	}
    }

  send_to_char( "\r\n", ch );
  set_char_color( AT_RMDESC, ch );

  if ( !is_npc(ch) && !IS_SET(ch->act, PLR_BRIEF ) )
    {
      send_to_char( ch->in_room->description, ch );
    }

  if ( !is_npc(ch) && IS_SET(ch->act, PLR_AUTOEXIT) )
    {
      do_exits( ch, "" );
    }

  show_ships_to_char( ch->in_room->first_ship, ch );
  show_shuttles_to_char( ch->in_room->first_shuttle, ch );
  show_list_to_char( ch->in_room->first_content, ch, FALSE, FALSE );
  show_char_to_char( ch->in_room->first_person,  ch );

  if ( !is_auto )
    {
      SHIP_DATA *ship = ship_from_cockpit(ch->in_room->vnum);

      if ( ship )
	{
	  set_char_color(  AT_WHITE, ch );
	  ch_printf( ch , "\r\nThrough the transparisteel windows you see:\r\n" );

	  if ( ship->location || ship->shipstate == SHIP_LANDED )
	    {
	      ROOM_INDEX_DATA *to_room = get_room_index( ship->location );

	      if ( to_room )
		{
		  ROOM_INDEX_DATA *original = ch->in_room;

		  ch_printf( ch, "\r\n" );
		  char_from_room( ch );
		  char_to_room( ch, to_room );
		  do_glance( ch, "" );
		  char_from_room( ch );
		  char_to_room( ch, original );
		}
	      else
		{
		  ch_printf( ch, "no room?\r\n" );
		}
	    }
	  else if (ship->spaceobject )
	    {
	      SHIP_DATA *target = NULL;
	      SPACE_DATA *spaceobject = NULL;

	      set_char_color(  AT_GREEN, ch );

	      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
		{
		  if ( space_in_range( ship, spaceobject)
		       && spaceobject->name
		       && str_cmp(spaceobject->name,"") )
		    {
		      ch_printf(ch, "%s\r\n", spaceobject->name);
		    }
		}

	      for ( target = first_ship; target; target = target->next )
		{
		  if ( target != ship && target->spaceobject )
		    {
		      if( ship_distance_to_ship( target, ship ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 1 ) )
			{
			  ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
				    target->name,
				    (target->pos.x - ship->pos.x),
				    (target->pos.y - ship->pos.y),
				    (target->pos.z - ship->pos.z));
			}
		      else if ( ship_distance_to_ship( target, ship ) < 100 * ( ship->sensor + 10 ) * ( ( target->sclass == SHIP_DEBRIS ? 2 : target->sclass ) + 3 ) )
			{
			  if ( target->sclass == FIGHTER_SHIP )
			    {
			      ch_printf(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }

			  if ( target->sclass == MIDSIZE_SHIP )
			    {
			      ch_printf(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }

			  if ( target->sclass == SHIP_DEBRIS )
			    {
			      ch_printf(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }
			  else if ( target->sclass >= CAPITAL_SHIP )
			    {
			      ch_printf(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
					(target->pos.x - ship->pos.x),
					(target->pos.y - ship->pos.y),
					(target->pos.z - ship->pos.z));
			    }
			}
		    }
		}

	      ch_printf(ch,"\r\n");
	    }
	}
    }
}
