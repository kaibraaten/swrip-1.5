#include <string.h>
#include <ctype.h>
#include "mud.h"
#include "vector3_aux.h"

/* Locals */
void show_char_to_char( CHAR_DATA *list, CHAR_DATA *ch );

static void show_char_to_char_0( CHAR_DATA *victim, CHAR_DATA *ch );
static void show_char_to_char_1( CHAR_DATA *victim, CHAR_DATA *ch );
static void show_ships_to_char( SHIP_DATA *ship, CHAR_DATA *ch );
static void show_visible_affects_to_char( CHAR_DATA *victim, CHAR_DATA *ch );
static char *get_sex( CHAR_DATA *ch );

void do_look( CHAR_DATA *ch, char *argument )
{
  char arg  [MAX_INPUT_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  char arg2 [MAX_INPUT_LENGTH];
  char arg3 [MAX_INPUT_LENGTH];
  EXIT_DATA *pexit;
  CHAR_DATA *victim;
  OBJ_DATA *obj;
  ROOM_INDEX_DATA *original;
  char *pdesc;
  bool doexaprog;
  short door;
  int number, cnt;
  SPACE_DATA *spaceobject;

  if ( !ch->desc )
    return;

  if ( ch->position < POS_SLEEPING )
    {
      send_to_char( "You can't see anything but stars!\r\n", ch );
      return;
    }

  if ( ch->position == POS_SLEEPING )
    {
      send_to_char( "You can't see anything, you're sleeping!\r\n", ch );
      return;
    }

  if ( !check_blind( ch ) )
    return;

  if ( !IS_NPC(ch)
       &&   !IS_SET(ch->act, PLR_HOLYLIGHT)
       &&   !IS_AFFECTED(ch, AFF_TRUESIGHT)
       &&   room_is_dark( ch->in_room ) )
    {
      set_char_color( AT_DGREY, ch );
      send_to_char( "It is pitch black ... \r\n", ch );
      show_char_to_char( ch->in_room->first_person, ch );
      return;
    }

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );
  argument = one_argument( argument, arg3 );

  doexaprog = str_cmp( "noprog", arg2 ) && str_cmp( "noprog", arg3 );

  if ( arg1[0] == '\0' || !str_cmp( arg1, "auto" ) )
    {
      SHIP_DATA * ship;

      /* 'look' or 'look auto' */
      set_char_color( AT_RMNAME, ch);
      send_to_char( ch->in_room->name, ch);
      send_to_char(" ", ch);

      if ( ! ch->desc->original )
        {

          if ((get_trust(ch) >= LEVEL_IMMORTAL) && (IS_SET(ch->pcdata->flags, PCFLAG_ROOM)))
            {
              set_char_color(AT_PURPLE, ch);      /* Added 10/17 by Kuran of */
              send_to_char("{", ch);                     /* SWReality */
              ch_printf(ch, "%d:", ch->in_room->vnum);
              ch_printf(ch, "%s", ch->in_room->area->filename);
	      send_to_char("}", ch);
              set_char_color(AT_CYAN, ch);
              send_to_char("[", ch);
              send_to_char(flag_string(ch->in_room->room_flags, room_flags),
                           ch);
              send_to_char("]", ch);
            }

        }

      send_to_char( "\r\n", ch );
      set_char_color( AT_RMDESC, ch );

      if ( arg1[0] == '\0'
           || ( !IS_NPC(ch) && !IS_SET(ch->act, PLR_BRIEF) ) )
        send_to_char( ch->in_room->description, ch );


      if ( !IS_NPC(ch) && IS_SET(ch->act, PLR_AUTOEXIT) )
        do_exits( ch, "" );

      show_ships_to_char( ch->in_room->first_ship, ch );
      show_shuttles_to_char( ch->in_room->first_shuttle, ch );
      show_list_to_char( ch->in_room->first_content, ch, FALSE, FALSE );
      show_char_to_char( ch->in_room->first_person,  ch );

      if ( str_cmp( arg1, "auto" ) )
        if (   (ship = ship_from_cockpit(ch->in_room->vnum))  != NULL )
          {
            set_char_color(  AT_WHITE, ch );
            ch_printf( ch , "\r\nThrough the transparisteel windows you see:\r\n" );

            if ( ship->location || ship->shipstate == SHIP_LANDED )
              {
                ROOM_INDEX_DATA *to_room;

                if ( (to_room = get_room_index( ship->location ) ) != NULL )
                  {
                    ch_printf( ch, "\r\n" );
                    original = ch->in_room;
                    char_from_room( ch );
                    char_to_room( ch, to_room );
                    do_glance( ch, "" );
                    char_from_room( ch );
                    char_to_room( ch, original );
		  }
                else
                  ch_printf( ch, "no room?\r\n" );
              }
            else if (ship->spaceobject )
              {
                SHIP_DATA *target;

                set_char_color(  AT_GREEN, ch );
                for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
                  if ( space_in_range( ship, spaceobject) && spaceobject->name && str_cmp(spaceobject->name,"") )
                    ch_printf(ch, "%s\r\n" ,
                              spaceobject->name);
                for ( target = first_ship; target; target = target->next )
                  {
                    if ( target != ship && target->spaceobject )
                      {
                        if( ship_distance_to_ship( target, ship ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+1 ) )
                          {
                            ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
                                      target->name,
                                      (target->pos.x - ship->pos.x),
                                      (target->pos.y - ship->pos.y),
                                      (target->pos.z - ship->pos.z));
                          }
                        else if ( ship_distance_to_ship( target, ship ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3))
                          {
                            if ( target->sclass == FIGHTER_SHIP )
                              ch_printf(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                                        (target->pos.x - ship->pos.x),
                                        (target->pos.y - ship->pos.y),
                                        (target->pos.z - ship->pos.z));
                            if ( target->sclass == MIDSIZE_SHIP )
                              ch_printf(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                                        (target->pos.x - ship->pos.x),
                                        (target->pos.y - ship->pos.y),
                                        (target->pos.z - ship->pos.z));
                            if ( target->sclass == SHIP_DEBRIS )
                              ch_printf(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                                        (target->pos.x - ship->pos.x),
                                        (target->pos.y - ship->pos.y),
                                        (target->pos.z - ship->pos.z));
                            else if ( target->sclass >= CAPITAL_SHIP )
			      ch_printf(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                                        (target->pos.x - ship->pos.x),
                                        (target->pos.y - ship->pos.y),
                                        (target->pos.z - ship->pos.z));
                          }

                      }

                  }
                ch_printf(ch,"\r\n");
              }
          }

      return;
    }

  if ( !str_cmp( arg1, "under" ) )
    {
      int count;

      if ( arg2[0] == '\0' )
        {
          send_to_char( "Look beneath what?\r\n", ch );
          return;
        }

      if ( ( obj = get_obj_here( ch, arg2 ) ) == NULL )
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
        show_list_to_char( obj->first_content, ch, TRUE, TRUE );
      else
	send_to_char( "Nothing.\r\n", ch );

      if ( doexaprog )
        oprog_examine_trigger( ch, obj );
      return;
    }

  if ( !str_cmp( arg1, "i" ) || !str_cmp( arg1, "in" ) )
    {
      int count;

      if ( arg2[0] == '\0' )
        {
          send_to_char( "Look in what?\r\n", ch );
          return;
        }

      if ( ( obj = get_obj_here( ch, arg2 ) ) == NULL )
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
                oprog_examine_trigger( ch, obj );
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
            oprog_examine_trigger( ch, obj );
          break;

        case ITEM_PORTAL:
          for ( pexit = ch->in_room->first_exit; pexit; pexit = pexit->next )
            {
              if ( pexit->vdir == DIR_PORTAL
                   &&   IS_SET(pexit->exit_info, EX_PORTAL) )
                {
                  if ( room_is_private( ch, pexit->to_room )
                       &&   get_trust(ch) < sysdata.level_override_private )
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
            oprog_examine_trigger( ch, obj );

          break;
        }

      return;
    }

  if ( (pdesc=get_extra_descr(arg1, ch->in_room->first_extradesc)) != NULL )
    {
      send_to_char( "\r\n", ch );
      send_to_char( pdesc, ch );
      return;
    }

  door = get_dir( arg1 );

  if ( ( pexit = find_door( ch, arg1, TRUE ) ) != NULL )
    {
      if ( pexit->keyword )
        {
          if ( IS_SET(pexit->exit_info, EX_CLOSED)
               &&  !IS_SET(pexit->exit_info, EX_WINDOW) )
            {
              if ( IS_SET(pexit->exit_info, EX_SECRET)
                   &&   door != -1 )
                send_to_char( "Nothing special there.\r\n", ch );
              else
                act( AT_PLAIN, "The $d is closed.", ch, NULL, pexit->keyword, TO_CHAR );
              return;
            }
          if ( IS_SET( pexit->exit_info, EX_BASHED ) )
            act(AT_RED, "The $d has been bashed from its hinges!",ch, NULL, pexit->keyword, TO_CHAR);
        }

      if ( pexit->description && pexit->description[0] != '\0' )
        send_to_char( pexit->description, ch );
      else
        send_to_char( "Nothing special there.\r\n", ch );

      /*
       * Ability to look into the next room                     -Thoric
       */
      if ( pexit->to_room
	   && ( IS_AFFECTED( ch, AFF_SCRYING )
                ||   IS_SET( pexit->exit_info, EX_xLOOK )
                ||   get_trust(ch) >= LEVEL_IMMORTAL ) )
        {
          if ( !IS_SET( pexit->exit_info, EX_xLOOK )
               &&    get_trust( ch ) < LEVEL_IMMORTAL )
            {
              set_char_color( AT_MAGIC, ch );
              send_to_char( "You attempt to scry...\r\n", ch );

              if (!IS_NPC(ch) )
                {
                  int percent = 99;

                  if(  number_percent( ) > percent )
                    {
                      send_to_char( "You fail.\r\n", ch );
                      return;
                    }
                }
            }

          if ( room_is_private( ch, pexit->to_room )
               &&   get_trust(ch) < sysdata.level_override_private )
            {
              set_char_color( AT_WHITE, ch );
              send_to_char( "That room is private buster!\r\n", ch );
              return;
            }

          original = ch->in_room;

          if ( pexit->distance > 1 )
            {
              ROOM_INDEX_DATA * to_room;

              if ( (to_room=generate_exit(ch->in_room, &pexit)) != NULL )
                {
                  char_from_room( ch );
                  char_to_room( ch, to_room );
                }
              else
                {
                  char_from_room( ch );
                  char_to_room( ch, pexit->to_room );
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
      return;
    }
  else
    if ( door != -1 )
      {
        send_to_char( "Nothing special there.\r\n", ch );
        return;
      }

  if ( ( victim = get_char_room( ch, arg1 ) ) != NULL )
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

static void show_char_to_char_0( CHAR_DATA *victim, CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];
  char buf1[MAX_STRING_LENGTH];
  char message[MAX_STRING_LENGTH];

  buf[0] = '\0';

  if ( IS_NPC(victim) )
    strcat( buf, " "  );

  if ( !IS_NPC(victim) && !victim->desc )
    {
      if ( !victim->switched )          strcat( buf, "(Link Dead) "  );
      else
        if ( !IS_AFFECTED(victim->switched, AFF_POSSESS) )
          strcat( buf, "(Switched) " );
    }
  if ( !IS_NPC(victim)
       && IS_SET(victim->act, PLR_AFK) )                strcat( buf, "[AFK] ");

  if ( (!IS_NPC(victim) && IS_SET(victim->act, PLR_WIZINVIS))
       || (IS_NPC(victim) && IS_SET(victim->act, ACT_MOBINVIS)) )
    {
      if (!IS_NPC(victim))
        sprintf( buf1,"(Invis %d) ", victim->pcdata->wizinvis );
      else sprintf( buf1,"(Mobinvis %d) ", victim->mobinvis);
      strcat( buf, buf1 );
    }
  if ( IS_AFFECTED(victim, AFF_INVISIBLE)   ) strcat( buf, "(Invis) "      );
  if ( IS_AFFECTED(victim, AFF_HIDE)        ) strcat( buf, "(Stealth) "       );
  if ( IS_AFFECTED(victim, AFF_PASS_DOOR)   ) strcat( buf, "(Translucent) ");
  if ( IS_AFFECTED(victim, AFF_FAERIE_FIRE) ) strcat( buf, "&P(Pink Aura)&w "  );
  if ( IS_EVIL(victim)
       &&   IS_AFFECTED(ch, AFF_DETECT_EVIL)     ) strcat( buf, "&R(Red Aura)&w "   );
  if ( ( victim->mana > 10 )
       &&   ( IS_AFFECTED( ch , AFF_DETECT_MAGIC ) || IS_IMMORTAL( ch ) ) )
    strcat( buf, "&B(Blue Aura)&w "  );
  if ( !IS_NPC(victim) && IS_SET(victim->act, PLR_LITTERBUG  ) )
    strcat( buf, "(LITTERBUG) "  );
  if ( IS_NPC(victim) && IS_IMMORTAL(ch)
       && IS_SET(victim->act, ACT_PROTOTYPE) ) strcat( buf, "(PROTO) " );
  if ( victim->desc && victim->desc->connected == CON_EDITING )
    strcat( buf, "(Writing) " );

  set_char_color( AT_PERSON, ch );
  if ( victim->position == victim->defposition && victim->long_descr[0] != '\0' )
    {
      strcat( buf, victim->long_descr );
      send_to_char( buf, ch );
      show_visible_affects_to_char( victim, ch );
      return;
    }

  if ( !IS_NPC(victim) && !IS_SET(ch->act, PLR_BRIEF) )
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
      if ( IS_IMMORTAL(victim) )
        strcat( buf, " is here before you." );
      else
        if ( ( victim->in_room->sector_type == SECT_UNDERWATER )
             && !IS_AFFECTED(victim, AFF_AQUA_BREATH) && !IS_NPC(victim) )
          strcat( buf, " is drowning here." );
        else
          if ( victim->in_room->sector_type == SECT_UNDERWATER )
            strcat( buf, " is here in the water." );
          else
            if ( ( victim->in_room->sector_type == SECT_OCEANFLOOR )
                 && !IS_AFFECTED(victim, AFF_AQUA_BREATH) && !IS_NPC(victim) )
              strcat( buf, " is drowning here." );
            else
              if ( victim->in_room->sector_type == SECT_OCEANFLOOR )
                strcat( buf, " is standing here in the water." );
              else
                if ( IS_AFFECTED(victim, AFF_FLOATING)
                     || IS_AFFECTED(victim, AFF_FLYING) )
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

static void show_char_to_char_1( CHAR_DATA *victim, CHAR_DATA *ch )
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

  if( ( (obj = get_eq_char( victim, WEAR_OVER ) ) == NULL ) || obj->value[2] == 0 || IS_GOD(ch) )
    {
      for ( iWear = 0; iWear < MAX_WEAR; iWear++ )
        {
          if ( ( obj = get_eq_char( victim, iWear ) ) != NULL
               &&   can_see_obj( ch, obj ) &&
               ( ( obj->description && obj->description[0] != '\0' ) || ( IS_SET(ch->act, PLR_HOLYLIGHT) || IS_NPC(ch) ) ) )
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

  if ( IS_NPC(ch) || victim == ch )
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

static void show_ships_to_char( SHIP_DATA *ship, CHAR_DATA *ch )
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

void show_char_to_char( CHAR_DATA *list, CHAR_DATA *ch )
{
  CHAR_DATA *rch;

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
                &&        IS_AFFECTED(rch, AFF_INFRARED ) )
        {
          set_char_color( AT_BLOOD, ch );
          send_to_char( "The red form of a living creature is here.\r\n", ch );
        }
    }
}

static void show_visible_affects_to_char( CHAR_DATA *victim, CHAR_DATA *ch )
{
  char buf[MAX_STRING_LENGTH];

  if ( IS_AFFECTED(victim, AFF_CHARM)       )
    {
      set_char_color( AT_MAGIC, ch );
      ch_printf( ch, "%s looks ahead free of expression.\r\n",
                 IS_NPC( victim ) ? capitalize(victim->short_descr) : (victim->name) );
    }
  if ( !IS_NPC(victim) && !victim->desc
       &&    victim->switched && IS_AFFECTED(victim->switched, AFF_POSSESS) )
    {
      set_char_color( AT_MAGIC, ch );
      strcpy( buf, PERS( victim, ch ) );
      strcat( buf, " appears to be in a deep trance...\r\n" );
    }
}

static char * get_sex( CHAR_DATA *ch )
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