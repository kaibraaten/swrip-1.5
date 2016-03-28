#include "ship.h"
#include "mud.h"
#include "character.h"
#include "spaceobject.h"

void do_shiptrack( Character *ch, char *argument)
{
  Ship *ship;
  Spaceobject *spaceobject;
  char arg[MAX_INPUT_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_STRING_LENGTH];

  argument = OneArgument( argument , arg);
  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);
  argument = OneArgument( argument , arg3);

  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      SendToCharacter("&RYou can only do that in space!\r\n",ch);
      return;
    }

  if( !StrCmp( arg, "dist" ) )
    {
      ship->tcount = atoi(arg1);
      SendToCharacter("&RJump distance set!\r\n",ch);
      return;
    }

  if( !StrCmp( arg, "set" ) )
    {
      Vector3 head;

      if ( IsShipInHyperspace( ship ) )
        {
          SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
          return;
        }

      if( !IsNumber(arg1) || !IsNumber(arg2) || !IsNumber(arg3) )
        {
          SendToCharacter( "Syntax: shiptrack set <X Heading> <Y Heading> <Z Heading>.\r\n", ch);
          return;
        }

      SetVector( &head, atoi(arg1), atoi(arg2), atoi(arg3) );
      sprintf( buf, "%.0f %.0f %.0f", ship->pos.x + head.x,
               ship->pos.y + head.y, ship->pos.z + head.z );

      if( head.x < 1000 )
        head.x *= 10000;

      if( head.y < 1000 )
        head.y *= 10000;

      if( head.z < 1000 )
        head.z *= 10000;

      ship->trackvector.x = head.x;
      ship->trackvector.y = head.y;
      ship->trackvector.z = head.z;

      ship->tracking = true;
      ship->ch = ch;
      do_trajectory( ch, buf);

      SetVector( &ship->jump, ship->pos.x + head.x,
                  ship->pos.y + head.y, ship->pos.z + head.z );

      for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
        if( IsSpaceobjectInRange( ship, spaceobject ) )
          {
            ship->currjump = spaceobject;
	    break;
          }
      if( !spaceobject )
        ship->currjump = ship->spaceobject;

      if( ship->jump.x > MAX_COORD || ship->jump.y > MAX_COORD || ship->jump.z > MAX_COORD
          || ship->jump.x < -MAX_COORD || ship->jump.y < -MAX_COORD || ship->jump.z < -MAX_COORD
          || ship->pos.x > MAX_COORD || ship->pos.y > MAX_COORD || ship->pos.z > MAX_COORD
          || ship->pos.x < -MAX_COORD || ship->pos.y < -MAX_COORD || ship->pos.z < -MAX_COORD
          || ship->head.x > MAX_COORD || ship->head.y > MAX_COORD || ship->head.z > MAX_COORD
          || ship->head.x < -MAX_COORD || ship->head.y < -MAX_COORD || ship->head.z < -MAX_COORD )
        {
          EchoToCockpit( AT_RED, ship, "WARNING... Jump coordinates outside of the known galaxy.");
          EchoToCockpit( AT_RED, ship, "WARNING... Hyperjump NOT set.");
          ship->currjump = NULL;
          ship->tracking = false;
          return;
        }

      ship->hyperdistance = GetDistanceBetweenVectors( &ship->pos, &ship->jump ) / 50;
      ship->orighyperdistance = ship->hyperdistance;

      SendToCharacter( "Course laid in. Beginning tracking program.\r\n", ch);
      return;
    }

  if( !StrCmp( arg, "stop" ) || !StrCmp( arg, "halt" ))
    {
      ship->tracking = false;
      SendToCharacter( "Tracking program cancelled.\r\n", ch);

      if( IsShipInHyperspace( ship ) )
        do_hyperspace( ch, "off" );
    }
}
