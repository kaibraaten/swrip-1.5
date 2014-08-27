#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_adjusttractorbeam(Character *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  Ship *ship, *eShip;

  strcpy( arg, argument );

  if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->tractored || ship->tractored->tractoredby != ship )
    {
      if ( ship->tractored && ship->tractored->tractoredby != ship )
        ship->tractored = NULL;
      SendToCharacter("&RYour tractor beam is not trained on a ship.\r\n",ch);
      return;
    }

  if (arg[0] == '\0')
    {
      sprintf( buf, "&RCurrent tractor beam settings: ");
      if( ship->statettractor == SHIP_DISABLED )
        strcat( buf, "Disabled.\r\n" );
      if( ship->tractored == NULL )
        strcat( buf, "Deactivated.\r\n" );
      if( ship->tractored && ship->tractored->shipstate == SHIP_TRACTORED )
        strcat( buf, "Pulling Target.\r\n" );
      if( ship->tractored && ship->tractored->shipstate >= SHIP_DOCKED )
        strcat( buf, "Docking Port Approach.\r\n" );
      if( ship->tractored && ( ship->tractored->shipstate == SHIP_LAND_2 || ship->tractored->shipstate == SHIP_LAND ) )
        strcat( buf, "Hanger Approach.\r\n" );
      Echo(ch, "&RCurrent tractor beam settings: %s\r\n", buf);
      return;
    }

  eShip = ship->tractored;

  Act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if( StrCmp( arg, "undock" ) && eShip->docked && eShip->docked != ship)
    {
      EchoToCockpit( AT_YELLOW, ship, "Tractor Beam set on docked ship. Undock it first.\r\n" );
      return;
    }

  if( eShip->sclass >= ship->sclass )
    {
      EchoToCockpit( AT_YELLOW, ship, "Tractor Beam set on ship of a greater or equal mass as our own. It will not move.\r\n" );
      return;
    }

  if ( !eShip->spaceobject )
    {
      EchoToCockpit( AT_YELLOW, ship, "Target is on the ground. There is no need to adjust the tractor beam.\r\n" );
      return;
    }

  if ( !StrCmp( arg, "pull") || !StrCmp( arg, "none" ) )
    {
      EchoToCockpit( AT_YELLOW, ship, "Tractor Beam set to pull target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      FreeMemory(eShip->dest);
      return;
    }
  if ( !StrCmp( arg, "abort" ) )
    {
      EchoToCockpit( AT_YELLOW, ship, "Manuever aborted. Tractor beam returned to default setting.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      FreeMemory(eShip->dest);
      return;
    }

  if ( !StrCmp( arg, "dock") )
    {
      if ( GetShipDistanceToShip(ship, eShip) > 100 )
	{
          SendToCharacter("&RYou aren't close enough to dock target.\r\n",ch);
          return;
        }

      if ( !CanDock( eShip ) || !CanDock( ship ) )
        {
          SendToCharacter("&RYou have no empty docking port.\r\n",ch);
          return;
        }

      EchoToCockpit( AT_YELLOW, ship, "Tractor Beam set to dock target.\r\n" );
      eShip->docking = SHIP_DOCK;
      eShip->docked = ship;
      return;
    }

  if ( !StrCmp( arg, "land") )
    {
      if ( GetShipDistanceToShip(ship, eShip) > 100 )
        {
          SendToCharacter("&RYou aren't close enough to the target to pull it into your hanger.\r\n",ch);
          return;
        }

      if ( !ship->room.hanger )
        {
          SendToCharacter("&RYou have no hanger!\r\n",ch);
          return;
        }

      if( !ship->bayopen )
        {
          SendToCharacter("&RThe bay is not open.\r\n",ch);
          return;
        }

      if( ship->sclass < eShip->sclass || eShip->sclass == SHIP_PLATFORM || eShip->sclass == CAPITAL_SHIP )
        {
          SendToCharacter("&RThat ship can not land in your bay.\r\n",ch);
          return;
        }

      EchoToCockpit( AT_YELLOW, ship, "Tractor Beam set to land target.\r\n" );
      eShip->shipstate = SHIP_LAND;
      eShip->dest = CopyString(ship->name);
      return;
    }

  if ( !StrCmp( arg, "undock" ) )
    {
      if ( GetShipDistanceToShip(ship, eShip) > 100 )
        {
          SendToCharacter("&RYou aren't close enough to the target to pull it off its position.\r\n",ch);
          return;
        }

      if ( !eShip->docked )
        {
          SendToCharacter("&RYour target is not docked.\r\n",ch);
          return;
        }
      EchoToCockpit( AT_YELLOW, ship, "Tractor beam set to undock target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked->statettractor = SHIP_DISABLED;
      eShip->statettractor = SHIP_DISABLED;
      EchoToCockpit( AT_RED, eShip, "As a ship is torn from your docking bay, the clamps are damaged!." );
      EchoToCockpit( AT_RED, ship, "As your ship is torn from the docking bay, the clamps are damaged!." );
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      return;
    }
}
