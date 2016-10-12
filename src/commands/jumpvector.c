#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "character.h"
#include "skill.h"

static bool ship_was_in_range( Ship *ship, Ship *target );

void do_jumpvector( Character *ch, char *argument )
{
  int the_chance, num;
  float randnum;
  Vector3 projected;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];

  num = GetRandomNumberFromRange( 1, 16 );
  randnum = 1.0/(float) num;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->spaceobject )
    {
      SendToCharacter("&RYou have to be in realspace to do that!\r\n", ch);
      return;
    }

  target = GetShipAnywhere( argument );

  if ( !target )
    {
      SendToCharacter( "No such ship.\r\n", ch );
      return;
    }

  if ( target == ship )
    {
      SendToCharacter( "You can figure out where you are going on your own.\r\n", ch );
      return;
    }

  if (!ship_was_in_range( ship, target ))
    {
      SendToCharacter( "No log for that ship.\r\n", ch);
      return;
    }
  if (target->shipstate == SHIP_LANDED)
    {
      SendToCharacter( "No log for that ship.\r\n", ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->learned[gsn_jumpvector]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou cant figure out the course vectors correctly.\r\n",ch);
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  if( IsShipInHyperspace( ship ) )
    {
      projected.x = (target->pos.x - target->originpos.x)*randnum;
      projected.y = (target->pos.y - target->originpos.y)*randnum;
      projected.z = (target->pos.z - target->originpos.z)*randnum;

      SendToCharacter("After some deliberation, you figure out its projected course.\r\n", ch);
      sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
              target->Name, projected.x, projected.y, projected.z );
      EchoToCockpit( AT_BLOOD, ship , buf );
      LearnFromSuccess( ch, gsn_jumpvector );
      return;
    }

  projected.x = (target->hyperpos.x - target->originpos.x)*randnum;
  projected.y = (target->hyperpos.y - target->originpos.y)*randnum;
  projected.z = (target->hyperpos.z - target->originpos.z)*randnum;

  SendToCharacter("After some deliberation, you figure out its projected course.\r\n", ch);
  sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
          target->Name, projected.x, projected.y, projected.z  );
  EchoToCockpit( AT_BLOOD, ship , buf );
  LearnFromSuccess( ch, gsn_jumpvector );
}

static bool ship_was_in_range( Ship *ship, Ship *target )
{
  return target && ship && target != ship
    && GetShipDistanceToShip( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3);
}
