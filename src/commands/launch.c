#include "ships.h"
#include "mud.h"

void do_launch( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  int the_chance, sclass;
  long price = 0;
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  ROOM_INDEX_DATA *room;

  argument = one_argument( argument , arg1);
  argument = one_argument( argument , arg2);

  if( arg1[0] != '\0' )
    {
      sclass = atoi(arg2);
    }


  if ( (ship = ship_from_cockpit(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if ( (ship = ship_from_pilotseat(ch->in_room->vnum)) == NULL )
    {
      send_to_char("&RYou don't seem to be in the pilot seat!\r\n",ch);
      return;
    }

  if ( autofly(ship) )
    {
      send_to_char("&RThe ship is set on autopilot, you'll have to turn it off first.\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( !check_pilot( ch , ship ) )
    {
      send_to_char("&RHey, thats not your ship! Try renting a public one.\r\n",ch);
      return;
    }

  if ( ship->lastdoc != ship->location )
    {
      send_to_char("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->tractoredby )
    {
      send_to_char("&rYou are still locked in a tractor beam!\r\n",ch);
      return;
    }

  if (ship->docking != SHIP_READY)
    {
      send_to_char("&RYou can't do that while docked to another ship!\r\n",ch);
      return;
    }
  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char("The ship is not docked right now.\r\n",ch);
      return;
    }

  if (ship->energy == 0)
    {
      send_to_char("&RThis ship has no fuel.\r\n",ch);
      return;
    }

  if ( ship->sclass <= FIGHTER_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = IS_NPC(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) < the_chance )
    {
      if ( is_rental(ch,ship) )
        if( !rent_ship(ch,ship) )
          return;

      if ( !is_rental(ch,ship) )
        {
          if ( ship->sclass == FIGHTER_SHIP )
            price=2000;
          if ( ship->sclass == MIDSIZE_SHIP )
            price=5000;
          if ( ship->sclass == CAPITAL_SHIP )
            price=50000;

          price += ( ship->maxhull-ship->hull );

          if (ship_is_disabled( ship ) )
            price += 10000;
          if ( ship->missilestate == MISSILE_DAMAGED )
	    price += 5000;
          if ( ship->statet0 == LASER_DAMAGED )
            price += 2500;
          if ( ship->statet1 == LASER_DAMAGED )
            price += 2500;
          if ( ship->statet2 == LASER_DAMAGED )
            price += 2500;
        }

      if( IS_SET( ch->act, PLR_DONTAUTOFUEL ) )
        {
          if( ship_is_disabled( ship ) )
            {
              ch_printf(ch, "Your ship is disabled. You must repair it.\r\n");
              return;
            }

          price = 100;
        }

      if ( ch->pcdata && ch->pcdata->clan && !str_cmp(ch->pcdata->clan->name,ship->owner) )
        {
          if ( ch->pcdata->clan->funds < price )
            {
              ch_printf(ch, "&R%s doesn't have enough funds to prepare this ship for launch.\r\n", ch->pcdata->clan->name );
              return;
            }

          ch->pcdata->clan->funds -= price;
          room = get_room_index( ship->location );
          if( room != NULL && room->area )
            boost_economy( room->area, price );
          ch_printf(ch, "&GIt costs %s %ld credits to ready this ship for launch.\r\n", ch->pcdata->clan->name, price );
        }
      else if ( str_cmp( ship->owner , "Public" ) )
        {
          if ( ch->gold < price )
            {
              ch_printf(ch, "&RYou don't have enough funds to prepare this ship for launch.\r\n");
              return;
            }

          ch->gold -= price;
          room = get_room_index( ship->location );
          if( room != NULL && room->area )
	    boost_economy( room->area, price );
          ch_printf(ch, "&GYou pay %ld credits to ready the ship for launch.\r\n", price );

        }

      if( !IS_SET( ch->act, PLR_DONTAUTOFUEL ) )
        {
          if(  ship_from_hanger(ship->in_room->vnum) == NULL || ship->sclass == SHIP_PLATFORM )
            ship->energy = ship->maxenergy;
          ship->shield = 0;
          ship->autorecharge = FALSE;
          ship->autotrack = FALSE;
          ship->autospeed = FALSE;
          ship->hull = ship->maxhull;

          ship->missilestate = MISSILE_READY;
          ship->statet0 = LASER_READY;
          ship->statet1 = LASER_READY;
          ship->statet2 = LASER_READY;
          ship->shipstate = SHIP_LANDED;
        }

      if (ship->hatchopen)
        {
          ship->hatchopen = FALSE;
          sprintf( buf , "The hatch on %s closes." , ship->name);
          echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
          echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch slides shut." );
          sound_to_room( get_room_index(ship->entrance) , "!!SOUND(door)" );
          sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
        }
      set_char_color( AT_GREEN, ch );
      send_to_char( "Launch sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      echo_to_ship( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->name );
      echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
      echo_to_docked( AT_YELLOW , ship, "The ship shudders as it lifts off the ground." );
      ship->shipstate = SHIP_LAUNCH;
      ship->currspeed = ship->realspeed;
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_success( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_success( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_success( ch, gsn_capitalships );
      sound_to_ship(ship , "!!SOUND(xwing)" );
      return;
    }
  set_char_color( AT_RED, ch );
  send_to_char("You fail to work the controls properly!\r\n",ch);
  if ( ship->sclass == FIGHTER_SHIP )
    learn_from_failure( ch, gsn_starfighters );
  if ( ship->sclass == MIDSIZE_SHIP )
    learn_from_failure( ch, gsn_midships );
  if ( ship->sclass == CAPITAL_SHIP )
    learn_from_failure( ch, gsn_capitalships );
}
