#include "character.hpp"
#include "ship.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "pcdata.hpp"

void do_calculate_diff(Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  int the_chance = 0, distance = 0;
  Ship *ship = nullptr;
  bool found = false;

  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);
  argument = OneArgument( argument , arg3);

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!\r\n");
      return;
    }

  if (  (ship = GetShipFromNavSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be at a nav computer to calculate jumps.\r\n");
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      ch->Echo("&RYou'll have to turn off the ships autopilot first....\r\n");
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo( "&RAnd what exactly are you going to calculate...?\r\n" );
      return;
    }

  if (ship->Hyperdrive.Speed == 0)
    {
      ch->Echo("&RThis ship is not equipped with a hyperdrive!\r\n");
      return;
    }

  if (ship->State == SHIP_LANDED)
    {
      ch->Echo("&RYou can't do that until after you've launched!\r\n");
      return;
    }

  if (ship->Spaceobject == NULL)
    {
      ch->Echo("&RYou can only do that in realspace.\r\n");
      return;
    }
  
  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("&WFormat: Calculate <spaceobject> <entry x> <entry y> <entry z>\r\n&wPossible destinations:\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_navigation]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou cant seem to figure the charts out today.\r\n");
      LearnFromFailure( ch, gsn_navigation );
      return;
    }

  if( !IsNullOrEmpty( arg2 ) && !IsNullOrEmpty( arg3 ) )
    {
      ship->Jump.x = ship->Position.x + atoi(arg1);
      ship->Jump.y = ship->Position.y + atoi(arg2);
      ship->Jump.z = ship->Position.z + atoi(arg3);
      found = true;
    }
  else
    {
      ch->Echo("&WFormat: Calculate x y z&R&w\r\n");
      return;
    }

  Spaceobject *spaceobject = ship->CurrentJump;

  if ( !found )
    {
      ch->Echo( "&RYou can't seem to find that spacial object on your charts.\r\n");
      ship->CurrentJump = NULL;
      return;
    }

  RandomizeVector( &ship->Jump, ship->Instruments.AstroArray - 300, 300 - ship->Instruments.AstroArray );
  ship->Jump.x += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0 ) );
  ship->Jump.y += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0 ) );
  ship->Jump.z += (distance ? distance : (spaceobject && spaceobject->Gravity ? spaceobject->Gravity : 0 ) );

  for(const Spaceobject *spaceobj : Spaceobjects->Entities())
    {
      if ( !spaceobj->IsSimulator && distance && StrCmp(spaceobj->Name,"")
           && GetDistanceBetweenVectors( &ship->Jump, &spaceobj->Position ) < spaceobj->Gravity * 4 )
        {
          EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates too close to stellar object.");
          EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
          ship->CurrentJump = NULL;
          return;
        }
    }

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

  if( ship->Jump.x > MAX_COORD_S || ship->Jump.y > MAX_COORD_S || ship->Jump.z > MAX_COORD_S ||
      ship->Jump.x < -MAX_COORD_S || ship->Jump.y < -MAX_COORD_S || ship->Jump.z < -MAX_COORD_S )
    {
      EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates outside of the known galaxy.");
      EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
      ship->CurrentJump = NULL;
      return;
    }

  ship->Hyperdistance = GetDistanceBetweenVectors( &ship->Position, &ship->Jump ) / 200;

  if( ship->Hyperdistance < 100 )
    ship->Hyperdistance = 100;

  ship->OriginalHyperdistance = ship->Hyperdistance;

  ch->Echo("&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->Hyperdistance );
  EchoToDockedShip( AT_YELLOW , ship, "The docking port link shows a new course being calculated." );

  Act( AT_PLAIN, "$n does some calculations using the ships computer.", ch,
       NULL, argument , TO_ROOM );

  LearnFromSuccess( ch, gsn_navigation );

  SetWaitState( ch , 2*PULSE_VIOLENCE );
}

