#include "character.h"
#include "ships.h"
#include "mud.h"

void do_shove( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int exit_dir = 0;
  Exit *pexit = NULL;
  Character *victim = NULL;
  bool nogo = false;
  int shove_chance = 0;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Shove whom?\r\n", ch);
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch);
      return;
    }

  if (victim == ch)
    {
      send_to_char("You shove yourself around, to no avail.\r\n", ch);
      return;
    }

  if ( (victim->position) != POS_STANDING )
    {
      act( AT_PLAIN, "$N isn't standing up.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      send_to_char( "Shove them in which direction?\r\n", ch);
      return;
    }

  exit_dir = get_dir( arg2 );

  if ( IsBitSet(victim->in_room->room_flags, ROOM_SAFE)
       &&  get_timer(victim, TIMER_SHOVEDRAG) <= 0)
    {
      send_to_char("That character cannot be shoved right now.\r\n", ch);
      return;
    }

  victim->position = POS_SHOVE;

  if ((pexit = get_exit(ch->in_room, exit_dir)) == NULL )
    {
      if (!StrCmp( arg2, "in" ))
        {
	  Room *to_room = NULL;
	  Ship *ship = NULL;

          if ( !argument || argument[0] == '\0')
            {
              send_to_char( "Shove them into what?\r\n", ch );
              return;
            }

	  ship = GetShipInRoom( ch->in_room , argument );

          if ( !ship )
            {
              act( AT_PLAIN, "I see no $T here.",
		   ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( IsBitSet( ch->act, ACT_MOUNTED ) )
            {
              act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

	  to_room = get_room_index( ship->room.entrance );

          if ( to_room )
            {
              if ( !ship->hatchopen )
                {
                  send_to_char( "&RThe hatch is closed!\r\n", ch);
                  return;
                }

              if ( to_room->tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
		    {
		      if ( count+2 >= to_room->tunnel )
			{
			  send_to_char( "There is no room for you both in there.\r\n", ch );
			  return;
			}
		    }
                }

              if ( ship->shipstate == SHIP_LAUNCH
		   || ship->shipstate == SHIP_LAUNCH_2 )
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
              victim->position = POS_STANDING;
              return;
            }
          else
            {
              send_to_char("That ship has no entrance!\r\n", ch);
              return;
            }
        }

      if (!StrCmp( arg2, "out" ))
        {
	  Room *to_room = NULL;
          Room *fromroom = ch->in_room;
	  Ship *ship = GetShipFromEntrance(fromroom->vnum);

          if ( !ship )
            {
              send_to_char( "I see no exit here.\r\n" , ch );
              return;
            }

          if ( IsBitSet( ch->act, ACT_MOUNTED ) )
            {
	      act( AT_PLAIN, "You can't go out there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( ship->lastdoc != ship->location )
            {
              send_to_char("&rMaybe you should wait until the ship lands.\r\n",ch);
              return;
            }

          if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
            {
              send_to_char("&rPlease wait till the ship is properly docked.\r\n",ch);
              return;
            }

          if ( ! ship->hatchopen )
            {
              send_to_char("&RYou need to open the hatch first" , ch );
              return;
            }

	  to_room = get_room_index( ship->location );

          if ( to_room )
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
              victim->position = POS_STANDING;
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
  else if ( IsBitSet(pexit->exit_info, EX_CLOSED)
	    && (!IsAffectedBy(victim, AFF_PASS_DOOR)
		|| IsBitSet(pexit->exit_info, EX_NOPASSDOOR)) )
    {
      nogo = true;
    }

  if ( nogo )
    {
      send_to_char( "There's no exit in that direction.\r\n", ch );
      victim->position = POS_STANDING;
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char("You can only shove player characters.\r\n", ch);
      return;
    }

  if (ch->in_room->area != pexit->to_room->area
      &&  !in_hard_range( victim, pexit->to_room->area ) )
    {
      send_to_char("That character cannot enter that area.\r\n", ch);
      victim->position = POS_STANDING;
      return;
    }

  shove_chance = 50;
  shove_chance += ((GetCurrentStrength(ch) - 15) * 3);
  shove_chance += (ch->top_level - victim->top_level);

  if (shove_chance < GetRandomPercent( ))
    {
      send_to_char("You failed.\r\n", ch);
      victim->position = POS_STANDING;
      return;
    }

  act( AT_ACTION, "You shove $M.", ch, NULL, victim, TO_CHAR );
  act( AT_ACTION, "$n shoves you.", ch, NULL, victim, TO_VICT );
  move_char( victim, get_exit(ch->in_room,exit_dir), 0);

  if ( !char_died(victim) )
    {
      victim->position = POS_STANDING;
    }

  SetWaitState(ch, 12);

  if ( IsBitSet(ch->in_room->room_flags, ROOM_SAFE)
       && get_timer(ch, TIMER_SHOVEDRAG) <= 0 )
    {
      add_timer( ch, TIMER_SHOVEDRAG, 10, NULL, SUB_PAUSE );
    }
}
