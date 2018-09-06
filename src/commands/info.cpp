#include "character.hpp"
#include "vector3_aux.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "room.hpp"

void do_info(Character *ch, std::string argument )
{
  Ship *ship = nullptr;
  Ship *target = nullptr;
  bool fromafar = true;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      if ( argument.empty() )
        {
          Act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = GetShipInRoom( ch->InRoom , argument );

      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument.c_str(), TO_CHAR );
          return;
        }

      target = ship;
    }
  else if ( ship->Rooms.Hangar == ch->InRoom->Vnum )
    {
      if ( argument.empty() )
        {
          Act( AT_PLAIN, "Which ship do you want info on?.", ch, NULL, NULL, TO_CHAR );
          return;
        }

      ship = GetShipInRoom( ch->InRoom, argument );

      if ( !ship )
        {
          Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument.c_str(), TO_CHAR );
          return;
        }

      target = ship;
    }
  else if ( argument.empty() )
    {
      target = ship;
      fromafar = false;
    }
  else
    target = GetShipInRange( argument , ship );

  if ( target == NULL )
    {
      ch->Echo("&RI don't see that here.\r\n"
               "Try the radar, or type info by itself for info on this ship.\r\n");
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
           target->Name.c_str(),
           target->PersonalName.c_str() );
  ch->Echo("Description: %s\r\nOwner: %s",
           target->Description.c_str(),
           target->Owner.c_str() );

  if( fromafar == false )
    ch->Echo("   Pilot: %s   Copilot: %s",
             target->Pilot.c_str(), target->CoPilot.c_str() );

  ch->Echo("\r\nLaser cannons: %d  Ion cannons: %d\r\n",
	target->WeaponSystems.Laser.Count,
           target->WeaponSystems.IonCannon.Count );
  ch->Echo("Max Hull: %d  ", target->Defenses.Hull.Max );
  ch->Echo("Max Shields: %d   Max Energy(fuel): %d\r\n",
           target->Defenses.Shield.Max, target->Thrusters.Energy.Max );
  ch->Echo("Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
           target->Thrusters.Speed.Max, target->Hyperdrive.Speed, GetShipValue( target ));

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument.c_str(), TO_ROOM );
}


