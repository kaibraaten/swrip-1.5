#include "ships.h"
#include "vector3_aux.h"
#include "mud.h"
#include "character.h"

void do_hyperspace(CHAR_DATA *ch, char *argument )
{
  int the_chance;
  Vector3 tmp;
  SHIP_DATA *ship;
  SHIP_DATA *dship;
  SPACE_DATA *spaceobject;
  char buf[MAX_STRING_LENGTH];

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (  (ship = ship_from_pilotseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou aren't in the pilots seat.\r\n",ch);
      return;
    }

  if ( is_autoflying(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RPlatforms can't move!\r\n" , ch );
      return;
    }

  if (ship->hyperspeed == 0)
    {
      send_to_char("&RThis ship is not equipped with a hyperdrive!\r\n",ch);
      return;
    }

  if (( !argument || argument[0] == '\0' ) && ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou are already travelling lightspeed!\r\n",ch);
      return;
    }

  if ( argument && !str_cmp( argument, "off" )
       && !ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RHyperdrive not active.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to manuever.\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY )
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }

  if (ship->tractoredby || ship->tractored )
    {
      send_to_char("&RYou can not move in a tractorbeam!\r\n",ch);
      return;
    }

  if (ship->tractored && ship->tractored->sclass > ship->sclass )
    {
      send_to_char("&RYou can not enter hyperspace with your tractor beam locked on.\r\n",ch);
      return;
    }

  if (ship->shipstate != SHIP_READY && !ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RPlease wait until the ship has finished its current manouver.\r\n",ch);
      return;
    }

  if ( argument && !str_cmp( argument, "off" )
       && ship_is_in_hyperspace( ship ) )
    {
      ship_to_spaceobject (ship, ship->currjump);

      if (ship->spaceobject == NULL)
        {
          echo_to_cockpit( AT_RED, ship, "Ship lost in Hyperspace. Make new calculations.");
          return;
        }
      else
        {
          for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
            if( space_in_range( ship, spaceobject ) )
              {
                ship->currjump = spaceobject;
                break;
              }
          if( !spaceobject )
	    ship->currjump = ship->spaceobject;

          vector_copy( &tmp, &ship->pos );
          vector_copy( &ship->pos, &ship->hyperpos );
          vector_copy( &ship->hyperpos, &tmp );
          ship->currjump = NULL;

          echo_to_room( AT_YELLOW, get_room_index(ship->pilotseat), "Hyperjump complete.");
          echo_to_ship( AT_YELLOW, ship, "The ship lurches slightly as it comes out of hyperspace.");
          sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , ship->name, ship->pos.x, ship->pos.y, ship->pos.z );
          echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );
          ship->shipstate = SHIP_READY;
          STRFREE( ship->home );
          ship->home = STRALLOC( ship->spaceobject->name );

          if ( str_cmp("Public",ship->owner) )
            save_ship(ship);

          for( dship = first_ship; dship; dship = dship->next )
            if ( dship->docked && dship->docked == ship )
              {
                echo_to_room( AT_YELLOW, get_room_index(dship->pilotseat), "Hyperjump complete.");
                echo_to_ship( AT_YELLOW, dship, "The ship lurches slightly as it comes out of hyperspace.");
                sprintf( buf ,"%s enters the starsystem at %.0f %.0f %.0f" , dship->name, dship->pos.x, dship->pos.y, dship->pos.\
                         z );
                echo_to_nearby_ships( AT_YELLOW, dship, buf , NULL );
                STRFREE( dship->home );
                dship->home = STRALLOC( ship->home );

                if ( str_cmp("Public",dship->owner) )
                  save_ship(dship);
              }


          return;

        }
    }


  if (!ship->currjump)
    {
      send_to_char("&RYou need to calculate your jump first!\r\n",ch);
      return;
    }

  if ( ship->energy < 100)
    {
      send_to_char("&RTheres not enough fuel!\r\n",ch);
      return;
    }

  if ( ship->currspeed <= 0 )
    {
      send_to_char("&RYou need to speed up a little first!\r\n",ch);
      return;
    }

  for( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( ship_distance_to_spaceobject( ship,  spaceobject ) < 100 + ( spaceobject->gravity * 5 ) )
        {
          ch_printf(ch, "&RYou are too close to %s to make the jump to lightspeed.\r\n", spaceobject->name );
          return;
        }
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;

  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;

  /* changed mobs so they can not fly capital ships. Forcers could possess mobs
     and fly them - Darrik Vequir */
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = is_npc(ch) ? 0
      : (int) (ch->pcdata->learned[gsn_capitalships]);

  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which lever to use.\r\n",ch);
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_failure( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_failure( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_failure( ch, gsn_capitalships );
      return;
    }
  sprintf( buf ,"%s enters hyperspace." , ship->name );
  echo_to_nearby_ships( AT_YELLOW, ship, buf , NULL );

  ship->lastsystem = ship->spaceobject;
  ship_from_spaceobject( ship , ship->spaceobject );
  ship->shipstate = SHIP_HYPERSPACE;

  send_to_char( "&GYou push forward the hyperspeed lever.\r\n", ch);
  act( AT_PLAIN, "$n pushes a lever forward on the control panel.", ch,
       NULL, argument , TO_ROOM );
  echo_to_ship( AT_YELLOW , ship , "The ship lurches slightly as it makes the jump to lightspeed." );
  echo_to_cockpit( AT_YELLOW , ship , "The stars become streaks of light as you enter hyperspace.");
  echo_to_docked( AT_YELLOW , ship, "The stars become streaks of light as you enter hyperspace." );

  ship->energy -= 100;

  vector_copy( &tmp, &ship->pos );
  vector_copy( &ship->pos, &ship->jump );
  vector_copy( &ship->hyperpos, &tmp );
  vector_copy( &ship->jump, &tmp );
  vector_copy( &ship->originpos, &tmp );

  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_success( ch, gsn_starfighters );

  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_success( ch, gsn_midships );

  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_success( ch, gsn_capitalships );
}
