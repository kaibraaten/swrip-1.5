#include <string.h>
#include "ship.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"
#include "skill.h"
#include "spaceobject.h"

void do_land( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];
  Spaceobject *spaceobj;
  bool found = false;

  strcpy( arg, argument );

  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->in_room->vnum)) == NULL )
    {
      SendToCharacter("&RYou need to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RYou can't land platforms\r\n" , ch );
      return;
    }

  if (ship->sclass == CAPITAL_SHIP)
    {
      SendToCharacter("&RCapital ships are to big to land. You'll have to take a shuttle.\r\n",ch);
      return;
    }
  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to land.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      if ( ship->docked == NULL )
        {
          SendToCharacter("&RThe ship is already docked!\r\n",ch);
          return;
        }
    }
  if (ship->docking != SHIP_READY)
    {
      SendToCharacter("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      SendToCharacter("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      SendToCharacter("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      SendToCharacter("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->energy < (25 + 25 * ((int)ship->sclass) ) )
    {
      SendToCharacter("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SetCharacterColor(  AT_CYAN, ch );
      Echo(ch, "%s" , "Land where?\r\n\r\nChoices: ");

      for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
        {
          if( IsSpaceobjectInRange( ship, spaceobj ) )
            {
	      size_t siteNum = 0;

	      for( siteNum = 0; siteNum < MAX_LANDINGSITE; ++siteNum )
		{
		  const LandingSite *site = &spaceobj->LandingSites[siteNum];

		  if ( site->Dock && !site->IsSecret )
		    {
		      Echo(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
			   site->LocationName,
			   spaceobj->Name,
			   spaceobj->Position.x,
			   spaceobj->Position.y,
			   spaceobj->Position.z );
		    }
		}
            }
        }

      Echo(ch, "\r\nYour Coordinates: %.0f %.0f %.0f\r\n" ,
	   ship->pos.x , ship->pos.y, ship->pos.z);
      return;
    }

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if( IsSpaceobjectInRange( ship, spaceobj )
	  && GetLandingSiteFromLocationName( spaceobj, argument ) )
	{
	  found = true;
	  break;
	}
    }

  if( !found )
    {
      target = GetShipInRange( argument , ship );

      if ( target == NULL )
        {
          SendToCharacter("&RI don't see that here. Type land by itself for a list\r\n",ch);
          return;
        }

      if ( target == ship )
        {
          SendToCharacter("&RYou can't land your ship inside itself!\r\n",ch);
          return;
        }

      if ( ! target->room.hanger )
        {
          SendToCharacter("&RThat ship has no hanger for you to land in!\r\n",ch);
          return;
        }

      if ( ship->sclass == MIDSIZE_SHIP && target->sclass == MIDSIZE_SHIP )
	{
          SendToCharacter("&RThat ship is not big enough for your ship to land in!\r\n",ch);
          return;
        }

      if ( ! target->bayopen )
        {
          SendToCharacter("&RTheir hanger is closed. You'll have to ask them to open it for you\r\n",ch);
          return;
        }

      if( GetShipDistanceToShip( ship, target ) > 200 )
        {
          SendToCharacter("&R That ship is too far away! You'll have to fly a litlle closer.\r\n",ch);
          return;
        }
    }
  else
    {
      ship->spaceobject = spaceobj;

      if( GetShipDistanceToSpaceobject( ship, spaceobj ) > 500 )
        {
          SendToCharacter("&R That platform is too far away! You'll have to fly a little closer.\r\n",ch);
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  if ( GetRandomPercent() < the_chance )
    {
      SetCharacterColor( AT_GREEN, ch );
      SendToCharacter( "Landing sequence initiated.\r\n", ch);
      Act( AT_PLAIN, "$n begins the landing sequence.", ch,
           NULL, argument , TO_ROOM );
      sprintf( buf ,"%s begins its landing sequence." , ship->name );
      EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
      EchoToDockedShip( AT_YELLOW , ship, "The ship begins to enter the atmosphere." );

      EchoToShip( AT_YELLOW , ship , "The ship slowly begins its landing approach.");
      ship->dest = CopyString(arg);
      ship->shipstate = SHIP_LAND;

      if ( ship->sclass == FIGHTER_SHIP )
        LearnFromSuccess( ch, gsn_starfighters );

      if ( ship->sclass == MIDSIZE_SHIP )
        LearnFromSuccess( ch, gsn_midships );

      if ( GetSpaceobjectFromDockVnum(ship->lastdoc) != ship->spaceobject )
        {
          ship->ch = ch;
        }

      return;
    }

  SendToCharacter("You fail to work the controls properly.\r\n",ch);

  if ( ship->sclass == FIGHTER_SHIP )
    LearnFromFailure( ch, gsn_starfighters );
  else
    LearnFromFailure( ch, gsn_midships );
}
