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
  else if ( ship->room.hanger == ch->InRoom->Vnum )
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

  if( GetShipDistanceToShip( ship, target ) > 500 + ship->sensor * 2 )
    {
      SendToCharacter("&RThat ship is to far away to scan.\r\n",ch);
      return;
    }

  Echo( ch, "&Y%s %s : %s (%s)\r\n&B",
             target->type == SHIP_REBEL ? "Rebel" :
             (target->type == SHIP_IMPERIAL ? "Imperial" : "Civilian" ),
             target->sclass == FIGHTER_SHIP ? "Starfighter" :
             (target->sclass == MIDSIZE_SHIP ? "Midtarget" :
              (target->sclass == CAPITAL_SHIP ? "Capital Ship" :
               (ship->sclass == SHIP_PLATFORM ? "Platform" :
                (ship->sclass == CLOUD_CAR ? "Cloudcar" :
                 (ship->sclass == OCEAN_SHIP ? "Boat" :
                  (ship->sclass == LAND_SPEEDER ? "Speeder" :
                   (ship->sclass == WHEELED ? "Wheeled Transport" :
                    (ship->sclass == LAND_CRAWLER ? "Crawler" :
                     (ship->sclass == WALKER ? "Walker" : "Unknown" ) ) ) ) ) ) ) ) ),
             target->Name,
             target->personalname,
             target->filename);
  Echo( ch, "Description: %s\r\nOwner: %s",
             target->description,
             target->owner );
  if( fromafar == false )
    Echo( ch, "   Pilot: %s   Copilot: %s", target->pilot,  target->copilot );

  Echo( ch, "\r\nLaser cannons: %d  Ion cannons: %d\r\n",
             target->lasers, target->ions);
  Echo( ch, "Max Hull: %d  ", target->maxhull);
  Echo( ch, "Max Shields: %d   Max Energy(fuel): %d\r\n",
             target->maxshield, target->maxenergy);
  Echo( ch, "Maximum Speed: %d   Hyperspeed: %d  Value: %d\r\n",
             target->realspeed, target->hyperspeed, GetShipValue( target ));

  Act( AT_PLAIN, "$n checks various gages and displays on the control panel.",
       ch, NULL, argument , TO_ROOM );
}
