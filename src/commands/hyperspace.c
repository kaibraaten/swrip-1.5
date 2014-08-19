#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"

void do_hyperspace(Character *ch, char *argument )
{
  int the_chance;
  Vector3 tmp;
  Ship *ship;
  Ship *dship;
  Spaceobject *spaceobject;
  char buf[MAX_STRING_LENGTH];

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (  (ship = GetShipFromPilotSeat(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if (ship->hyperspeed == 0)
    {
      SendToCharacter("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }

  if (( !argument || argument[0] == '\0' ) && IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou are already travelling lightspeed!\r\n",ch);
      return;
    }

  if ( argument && !StrCmp( argument, "off" )
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

  if (ship->shipstate == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY )
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if (ship->tractoredby || ship->tractored )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }

  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      SendToCharacter("&RYou can not enter hyperspace with your tractor beam locked on.\r\n",ch);
      return;
    }

  if (ship->shipstate != SHIP_READY && !IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( argument && !StrCmp( argument, "off" )
       && IsShipInHyperspace( ship ) )
    {
      ShipToSpaceobject (ship, ship->currjump);

      if (ship->spaceobject == NULL)
        {
          EchoToCockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
          return;
        }
      else
        {
          for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
            if( IsSpaceobjectInRange( ship, spaceobject ) )
              {
                ship->currjump = spaceobject;
                break;
              }
          if( !spaceobject )
	    ship->currjump = ship->spaceobject;

          CopyVector( &tmp, &ship->pos );
          CopyVector( &ship->pos, &ship->hyperpos );
          CopyVector( &ship->hyperpos, &tmp );
          ship->currjump = NULL;

          EchoToRoom( AT_YELLOW, GetRoom(ship->room.pilotseat), "Hyperjump complete.");
          EchoToShip( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
          sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
          EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
          ship->shipstate = SHIP_READY;
          FreeMemory( ship->home );
          ship->home = CopyString( ship->spaceobject->name );

          if ( StrCmp("Public",ship->owner) )
            SaveShip(ship);

          for( dship = first_ship; dship; dship = dship->next )
            if ( dship->docked && dship->docked == ship )
              {
                EchoToRoom( AT_YELLOW, GetRoom(dship->room.pilotseat), "Hyperjump complete.");
                EchoToShip( AT_YELLOW, dship, "The ship lurches slightly as it comes out of hyperspace.");
                sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , dship->name, dship->pos.x, dship->pos.y, dship->pos.\
                         z );
                EchoToNearbyShips( AT_YELLOW, dship, buf , NULL );
                FreeMemory( dship->home );
                dship->home = CopyString( ship->home );

                if ( StrCmp("Public",dship->owner) )
                  SaveShip(dship);
              }


          return;

        }
    }


  if (!ship->currjump)
    {
      SendToCharacter("&RYou need to calculate your jump first!\r\n",ch);
      return;
    }

  if ( ship->energy < 100)
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->currspeed <= 0 )
    {
      SendToCharacter("&RYou need to speed up a little first!\r\n",ch);
      return;
    }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( GetShipDistanceToSpaceobject( ship,  spaceobject ) < 100 + ( spaceobject->gravity * 5 ) )
        {
          ChPrintf(ch, "&RYou are too close to %s to make the jump to lightspeed.\r\n", spaceobject->name );
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IsNpc(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }
  sprintf( buf ,"%s enters hyperspace." , ship->name );
  EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );

  ship->lastsystem = ship->spaceobject;
  ShipFromSpaceobject( ship , ship->spaceobject );
  ship->shipstate = SHIP_HYPERSPACE;

  SendToCharacter( "&GYou push forward the hyperspeed lever.\r\n", ch);
  Act( AT_PLAIN, "$n pushes a lever forward on the control panel.", ch,
       NULL, argument , TO_ROOM );
  EchoToShip( AT_YELLOW , ship , "The ship lurches slightly as it makes the jump to lightspeed." );
  EchoToCockpit( AT_YELLOW , ship , "The stars become streaks of light as you enter hyperspace.");
  EchoToDockedShip( AT_YELLOW , ship, "The stars become streaks of light as you enter hyperspace." );

  ship->energy -= 100;

  CopyVector( &tmp, &ship->pos );
  CopyVector( &ship->pos, &ship->jump );
  CopyVector( &ship->hyperpos, &tmp );
  CopyVector( &ship->jump, &tmp );
  CopyVector( &ship->originpos, &tmp );

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );

  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );

  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}
