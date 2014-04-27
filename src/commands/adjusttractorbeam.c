#include <string.h>
#include "vector3_aux.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_adjusttractorbeam(CHAR_DATA *ch, char *argument )
{
  char buf[MAX_INPUT_LENGTH];
  char arg[MAX_INPUT_LENGTH];
  SHIP_DATA *ship, *eShip;

  strcpy( arg, argument );

  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the copilot's seat of a ship to do that!\r\n",ch);
      return;
    }

  if ( !ship->tractored || ship->tractored->tractoredby != ship )
    {
      if ( ship->tractored && ship->tractored->tractoredby != ship )
        ship->tractored = NULL;
      send_to_char("&RYour tractor beam is not trained on a ship.\r\n",ch);
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
      ch_printf(ch, "&RCurrent tractor beam settings: %s\r\n", buf);
      return;
    }

  eShip = ship->tractored;

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if( str_cmp( arg, "undock" ) && eShip->docked && eShip->docked != ship)
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on docked ship. Undock it first.\r\n" );
      return;
    }

  if( eShip->sclass >= ship->sclass )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set on ship of a greater or equal mass as our own. It will not move.\r\n" );
      return;
    }

  if ( !eShip->spaceobject )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Target is on the ground. There is no need to adjust the tractor beam.\r\n" );
      return;
    }

  if ( !str_cmp( arg, "pull") || !str_cmp( arg, "none" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to pull target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }
  if ( !str_cmp( arg, "abort" ) )
    {
      echo_to_cockpit( AT_YELLOW, ship, "Manuever aborted. Tractor beam returned to default setting.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      STRFREE(eShip->dest);
      return;
    }

  if ( !str_cmp( arg, "dock") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
	{
          send_to_char("&RYou aren't close enough to dock target.\r\n",ch);
          return;
        }

      if ( !candock( eShip ) || !candock( ship ) )
        {
          send_to_char("&RYou have no empty docking port.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to dock target.\r\n" );
      eShip->docking = SHIP_DOCK;
      eShip->docked = ship;
      return;
    }

  if ( !str_cmp( arg, "land") )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it into your hanger.\r\n",ch);
          return;
        }

      if ( !ship->room.hanger )
        {
          send_to_char("&RYou have no hanger!\r\n",ch);
          return;
        }

      if( !ship->bayopen )
        {
          send_to_char("&RThe bay is not open.\r\n",ch);
          return;
        }

      if( ship->sclass < eShip->sclass || eShip->sclass == SHIP_PLATFORM || eShip->sclass == CAPITAL_SHIP )
        {
          send_to_char("&RThat ship can not land in your bay.\r\n",ch);
          return;
        }

      echo_to_cockpit( AT_YELLOW, ship, "Tractor Beam set to land target.\r\n" );
      eShip->shipstate = SHIP_LAND;
      eShip->dest = STRALLOC(ship->name);
      return;
    }

  if ( !str_cmp( arg, "undock" ) )
    {
      if ( ship_distance_to_ship(ship, eShip) > 100 )
        {
          send_to_char("&RYou aren't close enough to the target to pull it off its position.\r\n",ch);
          return;
        }

      if ( !eShip->docked )
        {
          send_to_char("&RYour target is not docked.\r\n",ch);
          return;
        }
      echo_to_cockpit( AT_YELLOW, ship, "Tractor beam set to undock target.\r\n" );
      eShip->shipstate = SHIP_TRACTORED;
      eShip->docked->statettractor = SHIP_DISABLED;
      eShip->statettractor = SHIP_DISABLED;
      echo_to_cockpit( AT_RED, eShip, "As a ship is torn from your docking bay, the clamps are damaged!." );
      echo_to_cockpit( AT_RED, ship, "As your ship is torn from the docking bay, the clamps are damaged!." );
      eShip->docked = NULL;
      eShip->docking = SHIP_READY;
      return;
    }
}
