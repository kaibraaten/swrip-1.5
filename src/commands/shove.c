#include "character.h"
#include "ship.h"
#include "mud.h"

void do_shove( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  DirectionType exit_dir = DIR_NORTH;
  Exit *pexit = NULL;
  Character *victim = NULL;
  bool nogo = false;
  int shove_chance = 0;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Shove whom?\r\n", ch);
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch);
      return;
    }

  if (victim == ch)
    {
      SendToCharacter("You shove yourself around, to no avail.\r\n", ch);
      return;
    }

  if ( (victim->Position) != POS_STANDING )
    {
      Act( AT_PLAIN, "$N isn't standing up.", ch, NULL, victim, TO_CHAR );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      SendToCharacter( "Shove them in which direction?\r\n", ch);
      return;
    }

  exit_dir = GetDirection( arg2 );

  if ( IsBitSet(victim->InRoom->Flags, ROOM_SAFE)
       &&  GetTimer(victim, TIMER_SHOVEDRAG) <= 0)
    {
      SendToCharacter("That character cannot be shoved right now.\r\n", ch);
      return;
    }

  victim->Position = POS_SHOVE;

  if ((pexit = GetExit(ch->InRoom, exit_dir)) == NULL )
    {
      if (!StrCmp( arg2, "in" ))
        {
	  Room *to_room = NULL;
	  Ship *ship = NULL;

          if ( IsNullOrEmpty( argument ) )
            {
              SendToCharacter( "Shove them into what?\r\n", ch );
              return;
            }

	  ship = GetShipInRoom( ch->InRoom , argument );

          if ( !ship )
            {
              Act( AT_PLAIN, "I see no $T here.",
		   ch, NULL, argument, TO_CHAR );
              return;
            }

          if ( IsBitSet( ch->Flags, ACT_MOUNTED ) )
            {
              Act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
              return;
            }

	  to_room = GetRoom( ship->Rooms.Entrance );

          if ( to_room )
            {
              if ( !ship->HatchOpen )
                {
                  SendToCharacter( "&RThe hatch is closed!\r\n", ch);
                  return;
                }

              if ( to_room->Tunnel > 0 )
                {
                  Character *ctmp;
                  int count = 0;

                  for ( ctmp = to_room->FirstPerson; ctmp; ctmp = ctmp->NextInRoom )
		    {
		      if ( count+2 >= to_room->Tunnel )
			{
			  SendToCharacter( "There is no room for you both in there.\r\n", ch );
			  return;
			}
		    }
                }

              if ( ship->ShipState == SHIP_LAUNCH
		   || ship->ShipState == SHIP_LAUNCH_2 )
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
              victim->Position = POS_STANDING;
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
	  Room *to_room = NULL;
          Room *fromroom = ch->InRoom;
	  Ship *ship = GetShipFromEntrance(fromroom->Vnum);

          if ( !ship )
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

          if ( ship->ShipState != SHIP_LANDED && !IsShipDisabled( ship ) )
            {
              SendToCharacter("&rPlease wait till the ship is properly docked.\r\n",ch);
              return;
            }

          if ( ! ship->HatchOpen )
            {
              SendToCharacter("&RYou need to open the hatch first" , ch );
              return;
            }

	  to_room = GetRoom( ship->Location );

          if ( to_room )
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

              if ( ship->ShipState == SHIP_LAUNCH || ship->ShipState == SHIP_LAUNCH_2 )
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
              victim->Position = POS_STANDING;
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
  else if ( IsBitSet(pexit->Flags, EX_CLOSED)
	    && (!IsAffectedBy(victim, AFF_PASS_DOOR)
		|| IsBitSet(pexit->Flags, EX_NOPASSDOOR)) )
    {
      nogo = true;
    }

  if ( nogo )
    {
      SendToCharacter( "There's no exit in that direction.\r\n", ch );
      victim->Position = POS_STANDING;
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter("You can only shove player characters.\r\n", ch);
      return;
    }

  if (ch->InRoom->Area != pexit->ToRoom->Area
      &&  !InHardRange( victim, pexit->ToRoom->Area ) )
    {
      SendToCharacter("That character cannot enter that area.\r\n", ch);
      victim->Position = POS_STANDING;
      return;
    }

  shove_chance = 50;
  shove_chance += ((GetCurrentStrength(ch) - 15) * 3);
  shove_chance += (ch->TopLevel - victim->TopLevel);

  if (shove_chance < GetRandomPercent())
    {
      SendToCharacter("You failed.\r\n", ch);
      victim->Position = POS_STANDING;
      return;
    }

  Act( AT_ACTION, "You shove $M.", ch, NULL, victim, TO_CHAR );
  Act( AT_ACTION, "$n shoves you.", ch, NULL, victim, TO_VICT );
  MoveCharacter( victim, GetExit(ch->InRoom,exit_dir), 0);

  if ( !CharacterDiedRecently(victim) )
    {
      victim->Position = POS_STANDING;
    }

  SetWaitState(ch, 12);

  if ( IsBitSet(ch->InRoom->Flags, ROOM_SAFE)
       && GetTimer(ch, TIMER_SHOVEDRAG) <= 0 )
    {
      AddTimerToCharacter( ch, TIMER_SHOVEDRAG, 10, NULL, SUB_PAUSE );
    }
}
