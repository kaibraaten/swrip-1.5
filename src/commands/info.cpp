#include "character.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"

void do_info(Character *ch, char *argument )
{
  Ship *ship;
  Ship *target;
  bool fromafar = true;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          Act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = GetShipInRoom( ch->InRoom , argument );
      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }
      target = ship;
    }
  else if ( ship->Rooms.Hangar == ch->InRoom->Vnum )
    {
      if ( IsNullOrEmpty( argument ) )
        {
          Act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = GetShipInRoom( ch->InRoom , argument );
      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
          return;
        }

      target = ship;
    }
  else if ( IsNullOrEmpty( argument ) )
    {
      target = ship;
      fromafar = false;
    }
  else
    target = GetShipInRange( argument , ship );

  if ( target == NULL )
    {
      ch->Echo("&RI don't see that here.\r\nTry the radar, or type info by itself for info on this ship.\r\n");
      return;
    }

  if ( CheckPilot( ch , target ) )
    fromafar = false;

  if( GetShipDistanceToShip( ship, target ) > 500 + ship->Instruments.Sensor * 2 )
    {
      ch->Echo("&RThat ship is to far away to scan.\r\n");
      return;
    }

  ch->Echo("&Y%s %s : %s (%s)\r\n&B",
	ShipTypes[target->Type],
	ShipClasses[target->Class],
	target->Name,
	target->PersonalName );
  ch->Echo("Description: %s\r\nOwner: %s",
	target->Description,
	target->Owner );
  if( fromafar == false )
    ch->Echo("   Pilot: %s   Copilot: %s", target->Pilot,  target->CoPilot );

  ch->Echo("\r\nLaser cannons: %d  Ion cannons: %d\r\n",
	target->WeaponSystems.Laser.Count,
	target->WeaponSystems.IonCannon.Count );
  ch->Echo("Max Hull: %d  ", target->Defenses.Hull.Max );
  ch->Echo("Max Shields: %d   Max Energy(fuel): %d\r\n",
             target->Defenses.Shield.Max, target->Thrusters.Energy.Max );
  ch->Echo("Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
             target->Thrusters.Speed.Max, target->Hyperdrive.Speed, GetShipValue( target ));

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument , TO_ROOM );
}


