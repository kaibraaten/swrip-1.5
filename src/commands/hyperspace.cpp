#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"

static bool LeaveHyperspaceIfDocked(Ship *dockedShip, void *userData);

void do_hyperspace(Character *ch, char *argument )
{
  int the_chance = 0;
  Vector3 tmp;
  Ship *ship = NULL;
  Spaceobject *spaceobject = NULL;
  char buf[MAX_STRING_LENGTH] = { '\0' };

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if (ship->Hyperdrive.Speed == 0)
    {
      SendToCharacter("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }

  if( IsNullOrEmpty( argument ) && IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou are already travelling lightspeed!\r\n",ch);
      return;
    }

    if ( !IsNullOrEmpty( argument ) && !StrCmp( argument, "off" )
       && !IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RHyperdrive not active.\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }

  if (ship->State == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->Docking != SHIP_READY )
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if (ship->TractoredBy || ship->WeaponSystems.TractorBeam.Tractoring )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }

  if (ship->WeaponSystems.TractorBeam.Tractoring && ship->WeaponSystems.TractorBeam.Tractoring->Class > ship->Class )
    {
      SendToCharacter("&RYou can not enter hyperspace with your tractor beam locked on.\r\n",ch);
      return;
    }

  if (ship->State != SHIP_READY && !IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RPlease wait until the ship.hppas finished its current manouver.\r\n",ch);
      return;
    }

  if ( argument && !StrCmp( argument, "off" )
       && IsShipInHyperspace( ship ) )
    {
      ShipToSpaceobject (ship, ship->CurrentJump);

      if (ship->Spaceobject == NULL)
        {
          EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
          return;
        }
      else
        {
          for(Spaceobject *spaceobj : Spaceobjects->Entities())
            {
              if( IsSpaceobjectInRange( ship, spaceobj ) )
                {
                  ship->CurrentJump = spaceobj;
                  spaceobject = spaceobj;
                  break;
                }
            }

          if( !spaceobject )
	    ship->CurrentJump = ship->Spaceobject;

          CopyVector( &tmp, &ship->Position );
          CopyVector( &ship->Position, &ship->HyperPosition );
          CopyVector( &ship->HyperPosition, &tmp );
          ship->CurrentJump = NULL;

          EchoToRoom( AT_YELLOW, GetRoom(ship->Rooms.Pilotseat), "Hyperjump complete.");
          EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
          sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->Name, ship->Position.x, ship->Position.y, ship->Position.z );
          EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
          ship->State = SHIP_READY;
          FreeMemory( ship->Home );
          ship->Home = CopyString( ship->Spaceobject->Name );

          if ( StrCmp("Public",ship->Owner) )
            {
              Ships->Save(ship);
            }

          ForEachShip(LeaveHyperspaceIfDocked, ship);
          return;
        }
    }

  if (!ship->CurrentJump)
    {
      SendToCharacter("&RYou need to calculate your jump first!\r\n",ch);
      return;
    }

  if ( ship->Thrusters.Energy.Current < 100)
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->Thrusters.Speed.Current <= 0 )
    {
      SendToCharacter("&RYou need to speed up a little first!\r\n",ch);
      return;
    }

  for(const Spaceobject *spaceobj : Spaceobjects->Entities())
    {
      if( GetShipDistanceToSpaceobject( ship,  spaceobj ) < 100 + ( spaceobj->Gravity * 5 ) )
        {
          Echo(ch, "&RYou are too close to %s to make the jump to lightspeed.\r\n",
               spaceobj->Name );
          return;
        }
    }

  if ( ship->Class == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_starfighters]) ;

  if ( ship->Class == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->TopLevel
      : (int)  (ch->PCData->Learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->Class == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0
      : (int) (ch->PCData->Learned[gsn_capitalships]);

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->Class == FIGHTER_SHIP )
        LearnFromFailure( ch, gsn_starfighters );
      if ( ship->Class == MIDSIZE_SHIP )
        LearnFromFailure( ch, gsn_midships );
      if ( ship->Class == CAPITAL_SHIP )
        LearnFromFailure( ch, gsn_capitalships );
      return;
    }
  sprintf( buf ,"%s enters hyperspace." , ship->Name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );

  ship->LastSystem = ship->Spaceobject;
  ShipFromSpaceobject( ship , ship->Spaceobject );
  ship->State = SHIP_HYPERSPACE;

  SendToCharacter( "&GYou push forward the hyperspeed lever.\r\n", ch);
  Act( AT_PLAIN, "$n pushes a lever forward on the control panel.", ch,
       NULL, argument , TO_ROOM );
  EchoToShip( AT_YELLOW , ship , "The ship lurches slightly as it makes the jump to lightspeed." );
  EchoToCockpit( AT_YELLOW , ship , "The stars become streaks of light as you enter hyperspace.");
  EchoToDockedShip( AT_YELLOW , ship, "The stars become streaks of light as you enter hyperspace." );

  ship->Thrusters.Energy.Current -= 100;

  CopyVector( &tmp, &ship->Position );
  CopyVector( &ship->Position, &ship->Jump );
  CopyVector( &ship->HyperPosition, &tmp );
  CopyVector( &ship->Jump, &tmp );
  CopyVector( &ship->OriginPosition, &tmp );

  if ( ship->Class == FIGHTER_SHIP )
    LearnFromSuccess( ch, gsn_starfighters );

  if ( ship->Class == MIDSIZE_SHIP )
    LearnFromSuccess( ch, gsn_midships );

  if ( ship->Class == CAPITAL_SHIP )
    LearnFromSuccess( ch, gsn_capitalships );
}

static bool LeaveHyperspaceIfDocked(Ship *dockedShip, void *userData)
{
  const Ship *ship = (Ship*)userData;

  if ( dockedShip->Docked == ship )
    {
      char buf[MAX_STRING_LENGTH] = { '\0' };
      EchoToRoom( AT_YELLOW, GetRoom(dockedShip->Rooms.Pilotseat),
                  "Hyperjump complete.");
      EchoToShip( AT_YELLOW, dockedShip,
                  "The ship lurches slightly as it comes out of hyperspace.");
      sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f",
               dockedShip->Name, dockedShip->Position.x,
               dockedShip->Position.y, dockedShip->Position.z );
      EchoToNearbyShips( AT_YELLOW, dockedShip, buf, NULL );
      FreeMemory( dockedShip->Home );
      dockedShip->Home = CopyString( ship->Home );

      if ( StrCmp("Public", dockedShip->Owner) )
        {
          Ships->Save(dockedShip);
        }
    }

  return true;
}
