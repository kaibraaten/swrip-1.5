#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "spaceobject.hpp"
#include "room.hpp"

void do_shiptrack( Character *ch, char *argument)
{
  Ship *ship = nullptr;
  Spaceobject *spaceobject = nullptr;
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument , arg);
  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);
  argument = OneArgument( argument , arg3);

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!");
      return;
    }

  if ( !ship->Spaceobject )
    {
      ch->Echo("&RYou can only do that in space!\r\n");
      return;
    }

  if( !StrCmp( arg, "dist" ) )
    {
      ship->tcount = atoi(arg1);
      ch->Echo("&RJump distance set!\r\n");
      return;
    }

  if( !StrCmp( arg, "set" ) )
    {
      Vector3 head;

      if ( IsShipInHyperspace( ship ) )
        {
          ch->Echo("&RYou can only do that in realspace!\r\n");
          return;
        }

      if( !IsNumber(arg1) || !IsNumber(arg2) || !IsNumber(arg3) )
        {
          ch->Echo("Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n");
          return;
        }

      SetVector( &head, atoi(arg1), atoi(arg2), atoi(arg3) );
      sprintf( buf, "%.0f %.0f %.0f", ship->Position.x + head.x,
               ship->Position.y + head.y, ship->Position.z + head.z );

      if( head.x < 1000 )
        head.x *= 10000;

      if( head.y < 1000 )
        head.y *= 10000;

      if( head.z < 1000 )
        head.z *= 10000;

      ship->TrackVector.x = head.x;
      ship->TrackVector.y = head.y;
      ship->TrackVector.z = head.z;

      ship->Tracking = true;
      ship->Ch = ch;
      do_trajectory( ch, buf);

      SetVector( &ship->Jump, ship->Position.x + head.x,
                  ship->Position.y + head.y, ship->Position.z + head.z );

      
      for(Spaceobject *so : Spaceobjects->Entities())
        {
          if( IsSpaceobjectInRange( ship, so))
            {
              ship->CurrentJump = so;
              spaceobject = so;
              break;
            }
        }

      if( !spaceobject )
        {
          ship->CurrentJump = ship->Spaceobject;
        }

      if( ship->Jump.x > MAX_COORD || ship->Jump.y > MAX_COORD || ship->Jump.z > MAX_COORD
          || ship->Jump.x < -MAX_COORD || ship->Jump.y < -MAX_COORD || ship->Jump.z < -MAX_COORD
          || ship->Position.x > MAX_COORD || ship->Position.y > MAX_COORD || ship->Position.z > MAX_COORD
          || ship->Position.x < -MAX_COORD || ship->Position.y < -MAX_COORD || ship->Position.z < -MAX_COORD
          || ship->Heading.x > MAX_COORD || ship->Heading.y > MAX_COORD || ship->Heading.z > MAX_COORD
          || ship->Heading.x < -MAX_COORD || ship->Heading.y < -MAX_COORD || ship->Heading.z < -MAX_COORD )
        {
          EchoToCockpit( AT_RED, ship, "WARNING... Jump coordinates outside of the known galaxy.");
          EchoToCockpit( AT_RED, ship, "WARNING... Hyperjump NOT set.");
          ship->CurrentJump = NULL;
          ship->Tracking = false;
          return;
        }

      ship->Hyperdistance = GetDistanceBetweenVectors( &ship->Position, &ship->Jump ) / 50;
      ship->OriginalHyperdistance = ship->Hyperdistance;

      ch->Echo("Course laid in. Beginning tracking program.\r\n");
      return;
    }

  if( !StrCmp( arg, "stop" ) || !StrCmp( arg, "halt" ))
    {
      ship->Tracking = false;
      ch->Echo("Tracking program cancelled.\r\n");

      if( IsShipInHyperspace( ship ) )
        do_hyperspace( ch, "off" );
    }
}

