#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"

void do_drag( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  DirectionType exit_dir;
  Character *victim;
  Exit *pexit;
  Room *to_room;
  bool nogo;
  int drag_chance;
  Room *fromroom;
  Ship *ship;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Drag whom?\r\n", ch);
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
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

  if ( victim->Fighting )
    {
      SendToCharacter( "You try, but can't get close enough.\r\n", ch);
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Drag them in which direction?\r\n", ch);
      return;
    }

  exit_dir = GetDirection( arg2 );

  if ( IsBitSet(victim->InRoom->Flags, ROOM_SAFE)
       &&   GetTimer( victim, TIMER_SHOVEDRAG ) <= 0)
    {
      SendToCharacter("That character cannot be dragged right now.\r\n", ch);
      return;
    }

  nogo = false;
  if ((pexit = GetExit(ch->InRoom, exit_dir)) == NULL )
    {
      if (!StrCmp( arg2, "in" ))
        {
          if ( IsNullOrEmpty( argument ) )
            {
              SendToCharacter( "Drag them into what?\r\n", ch );
              return;
            }

          if ( ( ship = GetShipInRoom( ch->InRoom, argument ) ) == NULL )
            {
              Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( IsBitSet( ch->Flags, ACT_MOUNTED ) )
            {
	      Act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          fromroom = ch->InRoom;

          if ( ( to_room = GetRoom( ship->Rooms.Entrance ) ) != NULL )
            {
              if ( ! ship->HatchOpen )
                {
                  SendToCharacter( "&RThe hatch is closed!\r\n", ch);
                  return;
                }

              if ( to_room->Tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->FirstPerson; ctmp; ctmp = ctmp->NextInRoom )
                    if ( count+2 >= to_room->Tunnel )
                      {
                        SendToCharacter( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2 )
                {
                  SendToCharacter("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              Act( AT_PLAIN, "$n enters $T.", ch,
                   NULL, ship->Name , TO_ROOM );
              Act( AT_PLAIN, "You enter $T.", ch,
                   NULL, ship->Name , TO_CHAR );
              CharacterFromRoom( ch );
              CharacterToRoom( ch , to_room );
              Act( AT_PLAIN, "$n enters the ship.", ch,
                   NULL, argument , TO_ROOM );
              do_look( ch , "auto" );

              Act( AT_PLAIN, "$n enters $T.", victim,
                   NULL, ship->Name , TO_ROOM );
              Act( AT_PLAIN, "You enter $T.", victim,
		   NULL, ship->Name , TO_CHAR );
              CharacterFromRoom( victim );
              CharacterToRoom( victim , to_room );
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
          fromroom = ch->InRoom;

          if  ( (ship = GetShipFromEntrance(fromroom->Vnum)) == NULL )
            {
              SendToCharacter( "I see no exit here.\r\n" , ch );
              return;
            }

          if ( IsBitSet( ch->Flags, ACT_MOUNTED ) )
            {
              Act( AT_PLAIN, "You can't go out there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( ship->LastDock != ship->Location )
            {
              SendToCharacter("&rMaybe you should wait until the ship lands.\r\n",ch);
              return;
            }

          if ( ship->State != SHIP_LANDED && !IsShipDisabled( ship ) )
            {
              SendToCharacter("&rPlease wait till the ship is properly docked.\r\n",ch);
              return;
            }

          if ( ! ship->HatchOpen )
            {
              SendToCharacter("&RYou need to open the hatch first" , ch );
	      return;
            }

          if ( ( to_room = GetRoom( ship->Location ) ) != NULL )
            {

              if ( to_room->Tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->FirstPerson; ctmp; ctmp = ctmp->NextInRoom )
                    if ( count+2 >= to_room->Tunnel )
                      {
                        SendToCharacter( "There is no room for you both in there.\r\n", ch );
                        return;
                      }
                }
              if ( ship->State == SHIP_LAUNCH || ship->State == SHIP_LAUNCH_2 )
                {
                  SendToCharacter("&rThat ship has already started launching!\r\n",ch);
                  return;
                }

              Act( AT_PLAIN, "$n exits the ship.", ch,
                   NULL, ship->Name , TO_ROOM );
              Act( AT_PLAIN, "You exits the ship.", ch,
                   NULL, ship->Name , TO_CHAR );
              CharacterFromRoom( ch );
              CharacterToRoom( ch , to_room );
              Act( AT_PLAIN, "$n exits $T.", ch,
                   NULL, ship->Name , TO_ROOM );
              do_look( ch , "auto" );

              Act( AT_PLAIN, "$n exits the ship.", victim,
                   NULL, ship->Name , TO_ROOM );
              Act( AT_PLAIN, "You exits the ship.", victim,
                   NULL, ship->Name , TO_CHAR );
              CharacterFromRoom( victim );
              CharacterToRoom( victim , to_room );
              Act( AT_PLAIN, "$n exits $T.", victim,
                   NULL, ship->Name , TO_ROOM );
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
    if ( IsBitSet(pexit->Flags, EX_CLOSED)
         && (!IsAffectedBy(victim, AFF_PASS_DOOR)
             ||   IsBitSet(pexit->Flags, EX_NOPASSDOOR)) )
      nogo = true;
  if ( nogo )
    {
      SendToCharacter( "There's no exit in that direction.\r\n", ch );
      return;
    }

  to_room = pexit->ToRoom;

  if (ch->InRoom->Area != to_room->Area
      && !InHardRange( victim, to_room->Area ) )
    {
      SendToCharacter("That character cannot enter that area.\r\n", ch);
      return;
    }

  drag_chance = 50;


  /*
    sprintf(buf, "Drag percentage of %s = %d", ch->Name, drag_chance);
    Act( AT_ACTION, buf, ch, NULL, NULL, TO_ROOM );
  */
  if (drag_chance < GetRandomPercent())
    {
      SendToCharacter("You failed.\r\n", ch);
      return;
    }
  if ( victim->Position < POS_STANDING )
    {
      PositionType temp = victim->Position;
      victim->Position = POS_DRAG;
      Act( AT_ACTION, "You drag $M into the next room.", ch, NULL, victim, TO_CHAR );
      Act( AT_ACTION, "$n grabs your hair and drags you.", ch, NULL, victim, TO_VICT );
      MoveCharacter( victim, GetExit(ch->InRoom,exit_dir), 0);
      if ( !CharacterDiedRecently(victim) )
        victim->Position = temp;
      /* Move ch to the room too.. they are doing dragging - Scryn */
      MoveCharacter( ch, GetExit(ch->InRoom,exit_dir), 0);
      SetWaitState(ch, 12);
      return;
    }
  SendToCharacter("You cannot do that to someone who is standing.\r\n", ch);
  return;
}
