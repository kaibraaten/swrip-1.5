#include <utility/random.hpp>
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

static bool ship_was_in_range( std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target );

void do_jumpvector( Character *ch, std::string argument )
{
  int the_chance = 0;
  Vector3 projected;
  std::shared_ptr<Ship> ship;
  std::shared_ptr<Ship> target;
  char buf[MAX_STRING_LENGTH];
  int num = GetRandomNumberFromRange( 1, 16 );
  float randnum = 1.0/(float) num;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit, turret or engineroom of a ship to do that!\r\n");
      return;
    }

  if ( !ship->Spaceobject )
    {
      ch->Echo("&RYou have to be in realspace to do that!\r\n");
      return;
    }

  target = GetShipAnywhere( argument );

  if ( !target )
    {
      ch->Echo("No such ship.\r\n");
      return;
    }

  if ( target == ship )
    {
      ch->Echo("You can figure out where you are going on your own.\r\n");
      return;
    }

  if (!ship_was_in_range( ship, target ))
    {
      ch->Echo("No log for that ship.\r\n");
      return;
    }
  if (target->State == SHIP_LANDED)
    {
      ch->Echo("No log for that ship.\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_jumpvector]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou cant figure out the course vectors correctly.\r\n");
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  if( IsShipInHyperspace( ship ) )
    {
      projected.x = (target->Position.x - target->OriginPosition.x)*randnum;
      projected.y = (target->Position.y - target->OriginPosition.y)*randnum;
      projected.z = (target->Position.z - target->OriginPosition.z)*randnum;

      ch->Echo("After some deliberation, you figure out its projected course.\r\n");
      sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
              target->Name.c_str(), projected.x, projected.y, projected.z );
      EchoToCockpit( AT_BLOOD, ship , buf );
      LearnFromSuccess( ch, gsn_jumpvector );
      return;
    }

  projected.x = (target->HyperPosition.x - target->OriginPosition.x) * randnum;
  projected.y = (target->HyperPosition.y - target->OriginPosition.y) * randnum;
  projected.z = (target->HyperPosition.z - target->OriginPosition.z) * randnum;

  ch->Echo("After some deliberation, you figure out its projected course.\r\n");
  sprintf(buf, "%s Heading: %.0f, %.0f, %.0f",
          target->Name.c_str(), projected.x, projected.y, projected.z  );
  EchoToCockpit( AT_BLOOD, ship , buf );
  LearnFromSuccess( ch, gsn_jumpvector );
}

static bool ship_was_in_range( std::shared_ptr<Ship> ship, std::shared_ptr<Ship> target )
{
  return target && ship && target != ship
    && GetShipDistanceToShip( ship, target ) < 100*(ship->Instruments.Sensor+10)*((target->Class == SHIP_DEBRIS ? 2 : target->Class)+3);
}


