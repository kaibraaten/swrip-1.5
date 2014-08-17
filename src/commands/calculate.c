#include "character.h"
#include "vector3_aux.h"
#include "ships.h"
#include "mud.h"

void do_calculate(Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance , distance = 0;
  Ship *ship;
  Spaceobject *spaceobj, *spaceobject;
  bool found = false;

  argument = OneArgument( argument , arg1);
  argument = OneArgument( argument , arg2);
  argument = OneArgument( argument , arg3);


  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromNavSeat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be at a nav computer to calculate jumps.\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first....\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RAnd what exactly are you going to calculate...?\r\n" , ch );
      return;
    }
  if (ship->hyperspeed == 0)
    {
      send_to_char("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->spaceobject == NULL)
    {
      send_to_char("&RYou can only do that in realspace.\r\n",ch);
      return;
    }
  if (arg1[0] == '\0')
    {
      send_to_char("&WFormat: Calculate <spaceobject> <entry x> <entry y> <entry z>\r\n&wPossible destinations:\r\n",ch);
      return;
    }
  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( GetRandomPercent( ) > the_chance )
    {
      send_to_char("&RYou cant seem to figure the charts out today.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }

  if( !IsNumber(arg1) && arg1[0] != '-')
    {
      ship->currjump = spaceobject_from_name( arg1 );
      if ( arg2[0] != '\0' )
        distance = atoi(arg2);
      if( ship->currjump )
        {
          CopyVector( &ship->jump, &ship->currjump->pos );
          found = true;
        }
    }
  else if( arg2[0] != '\0' && arg2[0] != '\0' )
    {
      SetVector( &ship->jump, atoi(arg1), atoi(arg2), atoi(arg3) );
      found = true;
    }
  else
    {
      send_to_char("&WFormat: Calculate <spaceobject> \r\n        Calculate <entry x> <entry y> <entry z>&R&w\r\n",ch);
      return;
    }

  spaceobject = ship->currjump;

  if ( !found )
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }
  if (spaceobject && spaceobject->trainer && (ship->sclass != SHIP_TRAINER))
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }
  if (ship->sclass == SHIP_TRAINER && spaceobject && !spaceobject->trainer )
    {
      send_to_char( "&RYou can't seem to find that starsytem on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }

  RandomizeVector( &ship->jump, ship->astro_array - 300, 300 - ship->astro_array );

  ship->jump.x += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );
  ship->jump.y += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );
  ship->jump.z += distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity*5 : 0 );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if ( !spaceobj->trainer && distance && StrCmp(spaceobj->name,"")
         && GetDistanceBetweenVectors( &ship->jump, &spaceobj->pos ) <  spaceobj->gravity * 4 )
      {
        EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates too close to stellar object.");
        EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
        ship->currjump = NULL;
        return;
      }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    if( IsSpaceobjectInRange( ship, spaceobject ) )
      {
        ship->currjump = spaceobject;
        break;
      }
  if( !spaceobject )
    ship->currjump = ship->spaceobject;

  if( ship->jump.x > MAX_COORD_S || ship->jump.y > MAX_COORD_S || ship->jump.z > MAX_COORD_S ||
      ship->jump.x < -MAX_COORD_S || ship->jump.y < -MAX_COORD_S || ship->jump.z < -MAX_COORD_S )
    {
      EchoToCockpit( AT_RED, ship, "WARNING.. Jump coordinates outside of the known galaxy.");
      EchoToCockpit( AT_RED, ship, "WARNING.. Hyperjump NOT set.");
      ship->currjump = NULL;
      return;
    }

  ship->hyperdistance = GetDistanceBetweenVectors( &ship->pos, &ship->jump ) / 200;

  if (ship->hyperdistance<100)
    ship->hyperdistance = 100;

  ship->orighyperdistance = ship->hyperdistance;

  sprintf(buf, "&GHyperspace course set. Estimated distance: %d\r\nReady for the jump to lightspeed.\r\n", ship->hyperdistance );
  send_to_char( buf, ch);
  EchoToDockedShip( AT_YELLOW , ship, "The docking port link shows a new course being calculated." );

  act( AT_PLAIN, "$n does some calculations using the ships computer.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_navigation );

  SetWaitState( ch , 2*PULSE_VIOLENCE );
}
