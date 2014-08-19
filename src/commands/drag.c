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
  Room *to_room;
  bool nogo;
  int drag_chance;
  Room *fromroom;
  Ship *ship;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Drag whom?\r\n", ch);
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch);
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter("You take yourself by the scruff of your neck, but go nowhere.\r\n", ch);
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter("You can only drag player characters.\r\n", ch);
      return;
    }

  if ( victim->fighting )
    {
      SendToCharacter( "You try, but can't get close enough.\r\n", ch);
      return;
    }

  if ( arg2[0] == '\0' )
    {
      SendToCharacter( "Drag them in which direction?\r\n", ch);
      return;
    }

  exit_dir = GetDirection( arg2 );

  if ( IsBitSet(victim->in_room->room_flags, ROOM_SAFE)
       &&   get_timer( victim, TIMER_SHOVEDRAG ) <= 0)
    {
      SendToCharacter("That character cannot be dragged right now.\r\n", ch);
      return;
    }

  nogo = false;
  if ((pexit = GetExit(ch->in_room, exit_dir)) == NULL )
    {
      if (!StrCmp( arg2, "in" ))
        {
          if ( !argument || argument[0] == '\0')
            {
              SendToCharacter( "Drag them into what?\r\n", ch );
              return;
            }

          if ( ( ship = GetShipInRoom( ch->in_room , argument ) ) == NULL )
            {
              Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( IsBitSet( ch->act, ACT_MOUNTED ) )
            {
	      Act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          fromroom = ch->in_room;

          if ( ( to_room = GetRoom( ship->room.entrance ) ) != NULL )
            {
              if ( ! ship->hatchopen )
                {
                  SendToCharacter( "&RThe hatch is closed!\r\n", ch);
                  return;
                }

              if ( to_room->tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
                    if ( count+2 >= to_room->tunnel )
                      {
                        SendToCharacter( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
                {
                  SendToCharacter("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              Act( AT_PLAIN, "$n enters $T.", ch,
                   NULL, ship->name , TO_ROOM );
              Act( AT_PLAIN, "You enter $T.", ch,
                   NULL, ship->name , TO_CHAR );
              char_from_room( ch );
              char_to_room( ch , to_room );
              Act( AT_PLAIN, "$n enters the ship.", ch,
                   NULL, argument , TO_ROOM );
              do_look( ch , "auto" );

              Act( AT_PLAIN, "$n enters $T.", victim,
                   NULL, ship->name , TO_ROOM );
              Act( AT_PLAIN, "You enter $T.", victim,
		   NULL, ship->name , TO_CHAR );
              char_from_room( victim );
              char_to_room( victim , to_room );
              Act( AT_PLAIN, "$n enters the ship.", victim,
                   NULL, argument , TO_ROOM );
              do_look( victim , "auto" );
              return;
            }
          else
            {
              SendToCharacter("That ship has no entrance!\r\n", ch);
              return;
            }
        }
      if (!StrCmp( arg2, "out" ))
        {
          fromroom = ch->in_room;

          if  ( (ship = GetShipFromEntrance(fromroom->vnum)) == NULL )
            {
              SendToCharacter( "I see no exit here.\r\n" , ch );
              return;
            }

          if ( IsBitSet( ch->act, ACT_MOUNTED ) )
            {
              Act( AT_PLAIN, "You can't go out there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( ship->lastdoc != ship->location )
            {
              SendToCharacter("&rMaybe you should wait until the ship lands.\r\n",ch);
              return;
            }

          if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
            {
              SendToCharacter("&rPlease wait till the ship is properly docked.\r\n",ch);
              return;
            }

          if ( ! ship->hatchopen )
            {
              SendToCharacter("&RYou need to open the hatch first" , ch );
	      return;
            }

          if ( ( to_room = GetRoom( ship->location ) ) != NULL )
            {

              if ( to_room->tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->first_person; ctmp; ctmp = ctmp->next_in_room )
                    if ( count+2 >= to_room->tunnel )
                      {
                        SendToCharacter( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
                {
                  SendToCharacter("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              Act( AT_PLAIN, "$n exits the ship.", ch,
                   NULL, ship->name , TO_ROOM );
              Act( AT_PLAIN, "You exits the ship.", ch,
                   NULL, ship->name , TO_CHAR );
              char_from_room( ch );
              char_to_room( ch , to_room );
              Act( AT_PLAIN, "$n exits $T.", ch,
                   NULL, ship->name , TO_ROOM );
              do_look( ch , "auto" );

              Act( AT_PLAIN, "$n exits the ship.", victim,
                   NULL, ship->name , TO_ROOM );
              Act( AT_PLAIN, "You exits the ship.", victim,
                   NULL, ship->name , TO_CHAR );
              char_from_room( victim );
              char_to_room( victim , to_room );
              Act( AT_PLAIN, "$n exits $T.", victim,
                   NULL, ship->name , TO_ROOM );
              do_look( victim , "auto" );
              return;
            }
	  else
            {
              SendToCharacter("That ship has no entrance!\r\n", ch);
              return;
            }
        }
      nogo = true;
    }
  else
    if ( IsBitSet(pexit->exit_info, EX_CLOSED)
         && (!IsAffectedBy(victim, AFF_PASS_DOOR)
             ||   IsBitSet(pexit->exit_info, EX_NOPASSDOOR)) )
      nogo = true;
  if ( nogo )
    {
      SendToCharacter( "There's no exit in that direction.\r\n", ch );
      return;
    }

  to_room = pexit->to_room;

  if (ch->in_room->area != to_room->area
      && !in_hard_range( victim, to_room->area ) )
    {
      SendToCharacter("That character cannot enter that area.\r\n", ch);
      return;
    }

  drag_chance = 50;


  /*
    sprintf(buf, "Drag percentage of %s = %d", ch->name, drag_chance);
    Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
  */
  if (drag_chance < GetRandomPercent( ))
    {
      SendToCharacter("You failed.\r\n", ch);
      return;
    }
  if ( victim->position < POS_STANDING )
    {
      short temp;

      temp = victim->position;
      victim->position = POS_DRAG;
      Act( AT_ACTION, "You drag $M into the next room.", ch, NULL, victim, TO_CHAR );
      Act( AT_ACTION, "$n grabs your hair and drags you.", ch, NULL, victim, TO_VICT );
      MoveCharacter( victim, GetExit(ch->in_room,exit_dir), 0);
      if ( !char_died(victim) )
        victim->position = temp;
      /* Move ch to the room too.. they are doing dragging - Scryn */
      MoveCharacter( ch, GetExit(ch->in_room,exit_dir), 0);
      SetWaitState(ch, 12);
      return;
    }
  SendToCharacter("You cannot do that to someone who is standing.\r\n", ch);
  return;
}
