#include "character.h"
#include "vector3_aux.h"
#include "ship.h"
#include "mud.h"
#include "skill.h"
#include "spaceobject.h"

void do_calculate(Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance, distance = 0;
  Ship *ship = NULL;
  Spaceobject *spaceobj = NULL, *spaceobject = NULL;
  bool found = false;

  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);
  argument = OneArgument( argument , arg3);


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

  if (  (ship = GetShipFromNavSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be at a nav computer to calculate jumps.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter( "&RAnd what exactly are you going to calculate...?\r\n" , ch );
      return;
    }
  if (ship->Hyperdrive.Speed == 0)
    {
      SendToCharacter("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }
  if (ship->ShipState == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->Spaceobject == NULL)
    {
      SendToCharacter("&RYou can only do that in realspace.\r\n",ch);
      return;
    }
  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter("&WFormat: Calculate <spaceobject> <entry x> <entry y> <entry z>\r\n&wPossible destinations:\r\n",ch);
      SetCharacterColor( AT_RED, ch );
      
      for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
	{
	  if( spaceobject->Type > SPACE_SUN )
	    continue;

	  if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
	    Echo( ch, "%s\r\n", spaceobject->Name );
	}

      Echo( ch, "\r\n" );
      SetCharacterColor( AT_NOTE, ch );

      for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
	{
	  if( spaceobject->Type != SPACE_PLANET )
	    continue;

	  if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
	    Echo( ch, "%s\r\n", spaceobject->Name );
	}
      
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel : (int)  (ch->PCData->Learned[gsn_navigation]) ;

  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou cant seem to figure the charts out today.\r\n",ch);
      LearnFromFailure( ch, gsn_navigation );
      return;
    }

  if( !IsNumber(arg1) && arg1[0] != '-')
    {
      ship->CurrentJump = GetSpaceobjectFromName( arg1 );

      if ( !IsNullOrEmpty( arg2 ) )
        distance = atoi(arg2);

      if( ship->CurrentJump )
        {
          CopyVector( &ship->Jump, &ship->CurrentJump->Position );
          found = true;
        }
    }
  else if( !IsNullOrEmpty( arg2 ) && !IsNullOrEmpty( arg3 ) )
    {
      SetVector( &ship->Jump, atoi(arg1), atoi(arg2), atoi(arg3) );
      found = true;
    }
  else
    {
      SendToCharacter("&WFormat: Calculate <spaceobject> \r\n        Calculate <entry x> <entry y> <entry z>&R&w\r\n",ch);
      return;
    }

  spaceobject = ship->CurrentJump;

  if ( !found )
    {
      SendToCharacter( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->CurrentJump = NULL;
      return;
    }
  if (spaceobject && spaceobject->IsSimulator && (ship->Class != SHIP_TRAINER))
    {
      SendToCharacter( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->CurrentJump = NULL;
      return;
    }
  if (ship->Class == SHIP_TRAINER && spaceobject && !spaceobject->IsSimulator )
    {
      SendToCharacter( "&RYou can't seem to find that starsytem on your charts.\r\n", ch);
      ship->CurrentJump = NULL;
      return;
    }

  RandomizeVector( &ship->Jump, ship->Instruments.AstroArray - 300, 300 - ship->Instruments.AstroArray );

  ship->Jump.x += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity*5 : 0 );
  ship->Jump.y += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity*5 : 0 );
  ship->Jump.z += distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity*5 : 0 );

  for ( spaceobj = FirstSpaceobject; spaceobj; spaceobj = spaceobj->Next )
    if ( !spaceobj->IsSimulator && distance && StrCmp(spaceobj->Name,"")
         && GetDistanceBetweenVectors( &ship->Jump, &spaceobj->Position ) <  spaceobj->Gravity * 4 )
      {
        EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates too close to stellar object.");
        EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
        ship->CurrentJump = NULL;
        return;
      }

  for( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
    if( IsSpaceobjectInRange( ship, spaceobject ) )
      {
        ship->CurrentJump = spaceobject;
        break;
      }
  if( !spaceobject )
    ship->CurrentJump = ship->Spaceobject;

  if( ship->Jump.x > MAX_COORD_S || ship->Jump.y > MAX_COORD_S || ship->Jump.z > MAX_COORD_S ||
      ship->Jump.x < -MAX_COORD_S || ship->Jump.y < -MAX_COORD_S || ship->Jump.z < -MAX_COORD_S )
    {
      EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates outside of the known galaxy.");
      EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
      ship->CurrentJump = NULL;
      return;
    }

  ship->Hyperdistance = GetDistanceBetweenVectors( &ship->Position, &ship->Jump ) / 200;

  if ( ship->Hyperdistance < 100 )
    ship->Hyperdistance = 100;

  ship->OriginalHyperdistance = ship->Hyperdistance;

  sprintf(buf, "&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->Hyperdistance );
  SendToCharacter( buf, ch);
  EchoToDockedShip( AT_YELLOW , ship, "The docking port link shows a new course being calculated." );

  Act( AT_PLAIN, "$n does some calculations using the ships computer.", ch,
       NULL, argument , TO_ROOM );

  LearnFromSuccess( ch, gsn_navigation );

  SetWaitState( ch , 2*PULSE_VIOLENCE );
}
