#include "character.h"
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"

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
      SendToCharacter("&RI don't see that here.\r\nTry the radar, or type info by itself for info on this ship.\r\n",ch);
      return;
    }

  if ( CheckPilot( ch , target ) )
    fromafar = false;

  if( GetShipDistanceToShip( ship, target ) > 500 + ship->Instruments.Sensor * 2 )
    {
      SendToCharacter("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  Echo( ch, "&Y%s %s : %s (%s)\r\n&B",
             target->Type == SHIP_REBEL ? "Rebel" :
             (target->Type == SHIP_IMPERIAL ? "Imperial" : "Civilian" ),
             target->Class == FIGHTER_SHIP ? "Starfighter" :
             (target->Class == MIDSIZE_SHIP ? "Midtarget" :
              (target->Class == CAPITAL_SHIP ? "Capital Ship" :
               (ship->Class == SHIP_PLATFORM ? "Platform" :
                (ship->Class == CLOUD_CAR ? "Cloudcar" :
                 (ship->Class == OCEAN_SHIP ? "Boat" :
                  (ship->Class == LAND_SPEEDER ? "Speeder" :
                   (ship->Class == WHEELED ? "Wheeled Transport" :
                    (ship->Class == LAND_CRAWLER ? "Crawler" :
                     (ship->Class == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             target->Name,
             target->PersonalName,
             target->Filename);
  Echo( ch, "Description: %s\r\nOwner: %s",
             target->Description,
             target->Owner );
  if( fromafar == false )
    Echo( ch, "   Pilot: %s   Copilot: %s", target->Pilot,  target->CoPilot );

  Echo( ch, "\r\nLaser cannons: %d  Ion cannons: %d\r\n",
	target->WeaponSystems.Laser.Count,
	target->WeaponSystems.IonCannon.Count );
  Echo( ch, "Max Hull: %d  ", target->Defenses.Hull.Max );
  Echo( ch, "Max Shields: %d   Max Energy(fuel): %d\r\n",
             target->Defenses.Shield.Max, target->Thrusters.Energy.Max );
  Echo( ch, "Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
             target->Thrusters.Speed.Max, target->Hyperdrive.Speed, GetShipValue( target ));

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument , TO_ROOM );
}
