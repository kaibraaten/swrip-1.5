#include "character.h"
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"

void do_calculate_diff(Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  char arg3[MAX_INPUT_LENGTH];
  char buf[MAX_INPUT_LENGTH];
  int the_chance , distance = 0;
  Ship *ship;
  Spaceobject *spaceobj, *spaceobject;
  bool found = false;

  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);
  argument = one_argument( argument , arg3);


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
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou cant seem to figure the charts out today.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }

  if( arg2[0] != '\0' && arg3[0] != '\0')
    {
      ship->jump.x = ship->pos.x + atoi(arg1);
      ship->jump.y = ship->pos.y + atoi(arg2);
      ship->jump.z = ship->pos.z + atoi(arg3);
      found = true;
    }
  else
    {
      send_to_char("&WFormat: Calculate x y z&R&w\r\n",ch);
      return;
    }

  spaceobject = ship->currjump;

  if ( !found )
    {
      send_to_char( "&RYou can't seem to find that spacial object on your charts.\r\n", ch);
      ship->currjump = NULL;
      return;
    }

  vector_randomize( &ship->jump, ship->astro_array - 300, 300 - ship->astro_array );
  ship->jump.x += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );
  ship->jump.y += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );
  ship->jump.z += (distance ? distance : (spaceobject && spaceobject->gravity ? spaceobject->gravity : 0 ) );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if ( !spaceobj->trainer && distance && str_cmp(spaceobj->name,"")
         && vector_distance( &ship->jump, &spaceobj->pos ) < spaceobj->gravity * 4 )
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

  ship->hyperdistance = vector_distance( &ship->pos, &ship->jump ) / 200;

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
