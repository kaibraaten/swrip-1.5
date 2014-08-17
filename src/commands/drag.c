#include "ships.h"
#include "mud.h"
#include "character.h"

void do_drag( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int exit_dir;
  Character *victim;
  Exit *pexit;
  ROOM_INDEX_DATA *to_room;
  bool nogo;
  int drag_chance;
  ROOM_INDEX_DATA *fromroom;
  Ship *ship;

  argument = one_argument( argument, arg );
  argument = one_argument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Drag whom?\r\n", ch);
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch);
      return;
    }

  if ( victim == ch )
    {
      send_to_char("You take yourself by the scruff of your neck, but go nowhere.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char("You can only drag player characters.\r\n", ch);
      return;
    }

  if ( victim->fighting )
    {
      send_to_char( "You try, but can't get close enough.\r\n", ch);
      return;
    }

  if ( arg2[0] == '\0' )
    {
      send_to_char( "Drag them in which direction?\r\n", ch);
      return;
    }

  exit_dir = get_dir( arg2 );

  if ( IS_SET(victim->in_room->room_flags, ROOM_SAFE)
       &&   get_timer( victim, TIMER_SHOVEDRAG ) <= 0)
    {
      send_to_char("That character cannot be dragged right now.\r\n", ch);
      return;
    }

  nogo = false;
  if ((pexit = get_exit(ch->in_room, exit_dir)) == NULL )
    {
      if (!str_cmp( arg2, "in" ))
        {
          if ( !argument || argument[0] == '\0')
            {
              send_to_char( "Drag them into what?\r\n", ch );
              return;
            }

          if ( ( ship = ship_in_room( ch->in_room , argument ) ) == NULL )
            {
              act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( IS_SET( ch->act, ACT_MOUNTED ) )
            {
	      act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          fromroom = ch->in_room;

          if ( ( to_room = get_room_index( ship->room.entrance ) ) != NULL )
            {
              if ( ! ship->hatchopen )
                {
                  send_to_char( "&RThe hatch is closed!\r\n", ch);
                  return;
                }

              if ( to_room->tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
                    if ( count+2 >= to_room->tunnel )
                      {
                        send_to_char( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
                {
                  send_to_char("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              act( AT_PLAIN, "$n enters $T.", ch,
                   NULL, ship->name , TO_ROOM );
              act( AT_PLAIN, "You enter $T.", ch,
                   NULL, ship->name , TO_CHAR );
              char_from_room( ch );
              char_to_room( ch , to_room );
              act( AT_PLAIN, "$n enters the ship.", ch,
                   NULL, argument , TO_ROOM );
              do_look( ch , "auto" );

              act( AT_PLAIN, "$n enters $T.", victim,
                   NULL, ship->name , TO_ROOM );
              act( AT_PLAIN, "You enter $T.", victim,
		   NULL, ship->name , TO_CHAR );
              char_from_room( victim );
              char_to_room( victim , to_room );
              act( AT_PLAIN, "$n enters the ship.", victim,
                   NULL, argument , TO_ROOM );
              do_look( victim , "auto" );
              return;
            }
          else
            {
              send_to_char("That ship has no entrance!\r\n", ch);
              return;
            }
        }
      if (!str_cmp( arg2, "out" ))
        {
          fromroom = ch->in_room;

          if  ( (ship = ship_from_entrance(fromroom->vnum)) == NULL )
            {
              send_to_char( "I see no exit here.\r\n" , ch );
              return;
            }

          if ( IS_SET( ch->act, ACT_MOUNTED ) )
            {
              act( AT_PLAIN, "You can't go out there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( ship->lastdoc != ship->location )
            {
              send_to_char("&rMaybe you should wait until the ship lands.\r\n",ch);
              return;
            }

          if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
            {
              send_to_char("&rPlease wait till the ship is properly docked.\r\n",ch);
              return;
            }

          if ( ! ship->hatchopen )
            {
              send_to_char("&RYou need to open the hatch first" , ch );
	      return;
            }

          if ( ( to_room = get_room_index( ship->location ) ) != NULL )
            {

              if ( to_room->tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
                    if ( count+2 >= to_room->tunnel )
                      {
                        send_to_char( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
                {
                  send_to_char("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              act( AT_PLAIN, "$n exits the ship.", ch,
                   NULL, ship->name , TO_ROOM );
              act( AT_PLAIN, "You exits the ship.", ch,
                   NULL, ship->name , TO_CHAR );
              char_from_room( ch );
              char_to_room( ch , to_room );
              act( AT_PLAIN, "$n exits $T.", ch,
                   NULL, ship->name , TO_ROOM );
              do_look( ch , "auto" );

              act( AT_PLAIN, "$n exits the ship.", victim,
                   NULL, ship->name , TO_ROOM );
              act( AT_PLAIN, "You exits the ship.", victim,
                   NULL, ship->name , TO_CHAR );
              char_from_room( victim );
              char_to_room( victim , to_room );
              act( AT_PLAIN, "$n exits $T.", victim,
                   NULL, ship->name , TO_ROOM );
              do_look( victim , "auto" );
              return;
            }
	  else
            {
              send_to_char("That ship has no entrance!\r\n", ch);
              return;
            }
        }
      nogo = true;
    }
  else
    if ( IS_SET(pexit->exit_info, EX_CLOSED)
         && (!IsAffectedBy(victim, AFF_PASS_DOOR)
             ||   IS_SET(pexit->exit_info, EX_NOPASSDOOR)) )
      nogo = true;
  if ( nogo )
    {
      send_to_char( "There's no exit in that direction.\r\n", ch );
      return;
    }

  to_room = pexit->to_room;

  if (ch->in_room->area != to_room->area
      && !in_hard_range( victim, to_room->area ) )
    {
      send_to_char("That character cannot enter that area.\r\n", ch);
      return;
    }

  drag_chance = 50;


  /*
    sprintf(buf, "Drag percentage of %s = %d", ch->name, drag_chance);
    act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
  */
  if (drag_chance < number_percent( ))
    {
      send_to_char("You failed.\r\n", ch);
      return;
    }
  if ( victim->position < POS_STANDING )
    {
      short temp;

      temp = victim->position;
      victim->position = POS_DRAG;
      act( AT_ACTION, "You drag $M into the next room.", ch, NULL, victim, TO_CHAR );
      act( AT_ACTION, "$n grabs your hair and drags you.", ch, NULL, victim, TO_VICT );
      move_char( victim, get_exit(ch->in_room,exit_dir), 0);
      if ( !char_died(victim) )
        victim->position = temp;
      /* Move ch to the room too.. they are doing dragging - Scryn */
      move_char( ch, get_exit(ch->in_room,exit_dir), 0);
      SetWaitState(ch, 12);
      return;
    }
  send_to_char("You cannot do that to someone who is standing.\r\n", ch);
  return;
}
