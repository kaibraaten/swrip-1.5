#include <string.h>
#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"

void do_land( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int the_chance;
  Ship *ship;
  Ship *target;
  char buf[MAX_STRING_LENGTH];
  Spaceobject *spaceobj;
  bool found = false;

  strcpy( arg, argument );

  if ( (ship = GetShipFromCockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou need to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RYou can't land platforms\r\n" , ch );
      return;
    }

  if (ship->sclass == CAPITAL_SHIP)
    {
      send_to_char("&RCapital ships are to big to land. You'll have to take a shuttle.\r\n",ch);
      return;
    }
  if (IsShipDisabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to land.\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      if ( ship->docked == NULL )
        {
          send_to_char("&RThe ship is already docked!\r\n",ch);
          return;
        }
    }
  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if ( ship->tractoredby && ship->tractoredby->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }
  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not move while a tractorbeam is locked on to such a large mass.\r\n",ch);
      return;
    }
  if (ship->shipstate != SHIP_READY)
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( ship->energy < (25 + 25 * ((int)ship->sclass) ) )
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( argument[0] == '\0' )
    {
      set_char_color(  AT_CYAN, ch );
      ch_printf(ch, "%s" , "Land where?\r\n\r\nChoices: ");
      for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
        {
          if( IsSpaceobjectInRange( ship, spaceobj ) )
            {
              if ( spaceobj->landing_site.doca && !spaceobj->landing_site.seca)
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->landing_site.locationa,
                          spaceobj->name,
                          spaceobj->pos.x,
                          spaceobj->pos.y,
                          spaceobj->pos.z );
              if ( spaceobj->landing_site.docb && !spaceobj->landing_site.secb )
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->landing_site.locationb,
                          spaceobj->name,
                          spaceobj->pos.x,
			  spaceobj->pos.y,
                          spaceobj->pos.z );
              if ( spaceobj->landing_site.docc && !spaceobj->landing_site.secc )
                ch_printf(ch, "%s (%s)  %.0f %.0f %.0f\r\n         " ,
                          spaceobj->landing_site.locationc,
                          spaceobj->name,
                          spaceobj->pos.x,
                          spaceobj->pos.y,
                          spaceobj->pos.z );
            }
        }
      ch_printf(ch, "\r\nYour Coordinates: %.0f %.0f %.0f\r\n" ,
                ship->pos.x , ship->pos.y, ship->pos.z);
      return;
    }

  for( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    if( IsSpaceobjectInRange( ship, spaceobj ) )
      if ( !str_prefix(argument,spaceobj->landing_site.locationa) ||
           !str_prefix(argument,spaceobj->landing_site.locationb) ||
           !str_prefix(argument,spaceobj->landing_site.locationc))
        {
          found = true;
          break;
        }

  if( !found )
    {
      target = GetShipInRange( argument , ship );
      if ( target == NULL )
        {
          send_to_char("&RI don't see that here. Type land by itself for a list\r\n",ch);
          return;
        }
      if ( target == ship )
        {
          send_to_char("&RYou can't land your ship inside itself!\r\n",ch);
          return;
        }
      if ( ! target->room.hanger )
        {
          send_to_char("&RThat ship has no hanger for you to land in!\r\n",ch);
          return;
        }
      if ( ship->sclass == MIDSIZE_SHIP && target->sclass == MIDSIZE_SHIP )
	{
          send_to_char("&RThat ship is not big enough for your ship to land in!\r\n",ch);
          return;
        }
      if ( ! target->bayopen )
        {
          send_to_char("&RTheir hanger is closed. You'll have to ask them to open it for you\r\n",ch);
          return;
        }

      if( ship_distance_to_ship( ship, target ) > 200 )
        {
          send_to_char("&R That ship is too far away! You'll have to fly a litlle closer.\r\n",ch);
          return;
        }
    }
  else
    {
      ship->spaceobject = spaceobj;

      if( ship_distance_to_spaceobject( ship, spaceobj ) > 500 )
        {
          send_to_char("&R That platform is too far away! You'll have to fly a little closer.\r\n",ch);
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IsNpc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( number_percent( ) < the_chance )
    {
      set_char_color( AT_GREEN, ch );
      send_to_char( "Landing sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n begins the landing sequence.", ch,
           NULL, argument , TO_ROOM );
      sprintf( buf ,"%s begins its landing sequence." , ship->name );
      EchoToNearbyShips( AT_YELLOW, ship, buf , NULL );
      EchoToDockedShip( AT_YELLOW , ship, "The ship begins to enter the atmosphere." );

      EchoToShip( AT_YELLOW , ship , "The ship slowly begins its landing approach.");
      ship->dest = STRALLOC(arg);
      ship->shipstate = SHIP_LAND;
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_success( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_success( ch, gsn_midships );
      if ( spaceobject_from_vnum(ship->lastdoc) != ship->spaceobject )
        {
          ship->ch = ch;
        }

      return;
    }

  send_to_char("You fail to work the controls properly.\r\n",ch);

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_failure( ch, gsn_starfighters );
  else
    learn_from_failure( ch, gsn_midships );
}
