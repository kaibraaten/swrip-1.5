#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_hijack( Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  Character *p = NULL, *p_prev = NULL, *victim = NULL;


  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!\r\n");
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou don't seem to be in the pilot seat!\r\n");
      return;
    }

  if ( CheckPilot( ch , ship ) )
    {
      ch->Echo("&RWhat would be the point of that?\r\n");
      return;
    }

  if ( ship->Type == MOB_SHIP && GetTrustLevel(ch) < LEVEL_CREATOR )
    {
      ch->Echo("&RThis ship isn't pilotable by mortals at this point in time...\r\n");
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo( "You can't do that here.\r\n" );
      return;
    }

  if ( ship->LastDock != ship->Location )
    {
      ch->Echo("&rYou don't seem to be docked right now.\r\n");
      return;
    }

  if ( ship->State != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      ch->Echo("The ship is not docked right now.\r\n");
      return;
    }

  if ( IsShipDisabled( ship ) )
    {
      ch->Echo("The ship's drive is disabled .\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_hijack]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("You fail to figure out the correct launch code.\r\n");
      LearnFromFailure( ch, gsn_hijack );
      return;
    }

  if ( ship->Class == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;
  if ( ship->Class == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;
  if ( ship->Class == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int) (ch->PCData->Learned[gsn_capitalships]);
  if ( GetRandomPercent() < the_chance )
    {

      if (ship->HatchOpen)
        {
          ship->HatchOpen = false;
          sprintf( buf , "The hatch on %s closes." , ship->Name);
          EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
          EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Entrance) , "The hatch slides shut." );
        }
      SetCharacterColor( AT_GREEN, ch );
      ch->Echo( "Launch sequence initiated.\r\n" );
      Act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      EchoToShip( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->Name );
      EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
      ship->State = SHIP_LAUNCH;
      ship->Thrusters.Speed.Current = ship->Thrusters.Speed.Max;

      if ( ship->Class == FIGHTER_SHIP )
        LearnFromSuccess( ch, gsn_starfighters );

      if ( ship->Class == MIDSIZE_SHIP )
        LearnFromSuccess( ch, gsn_midships );

      if ( ship->Class == CAPITAL_SHIP )
        LearnFromSuccess( ch, gsn_capitalships );

      LearnFromSuccess( ch, gsn_hijack );

      for (p = LastCharacter; p ; p = p_prev )

        {
          p_prev = p->Previous;  /* TRI */

          if (!IsNpc(p) && GetTrustLevel(p) >= LEVEL_GREATER)
            {
              sprintf( buf2, "%s(%s)", ship->Name, ship->PersonalName );
              p->Echo( "&R[Alarm] %s has been hijacked by %s!\r\n", buf2, ch->Name);
            }
        }

      if ( !ship->Alarm )
	return;
      
      if ( !StrCmp("Public",ship->Owner) )
        return;
      
      for ( victim = FirstCharacter; victim; victim = victim->Next )
        {
          if ( !CheckPilot(victim,ship) )
            continue;

          if ( !HasComlink( victim ) )
            continue;

          if ( !IsNpc( victim ) && victim->Switched )
            continue;

          if ( !IsAwake(victim) || IsBitSet(victim->InRoom->Flags,ROOM_SILENCE) )
            continue;

          victim->Echo("&R[Alarm] %s has been hijacked!\r\n", ship->Name);
        }

      return;
    }

  SetCharacterColor( AT_RED, ch );
  ch->Echo("You fail to work the controls properly!\r\n");

  if ( ship->Class == FIGHTER_SHIP )
    LearnFromFailure( ch, gsn_starfighters );

  if ( ship->Class == MIDSIZE_SHIP )
    LearnFromFailure( ch, gsn_midships );

  if ( ship->Class == CAPITAL_SHIP )
    LearnFromFailure( ch, gsn_capitalships );
}
