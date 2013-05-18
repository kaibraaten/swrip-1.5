#include "mud.h"
#include "vector3_aux.h"

void do_radar( CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *target;
  int the_chance;
  SHIP_DATA *ship;
  MISSILE_DATA *missile;
  SPACE_DATA *spaceobj;
  if (   (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit or turret of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }

  if (ship->shipstate == SHIP_LANDED)
    {
      if (ship->docked == NULL) {
        send_to_char("&RWait until after you launch!\r\n",ch);
        return;
      }
    }

  if ( ship_is_in_hyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }

  if (ship->spaceobject == NULL)
    {
      send_to_char("&RYou can't do that unless the ship is flying in realspace!\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_navigation]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_navigation );
      return;
    }


  act( AT_PLAIN, "$n checks the radar.", ch,
       NULL, argument , TO_ROOM );

  set_char_color(  AT_RED, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj )
	   && spaceobj->type == SPACE_SUN
	   && str_cmp(spaceobj->name,"") )
        ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }

  set_char_color(  AT_LBLUE, ch );

  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj )
	   && spaceobj->type == SPACE_PLANET
	   && str_cmp(spaceobj->name,"") )
	ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z,
                  "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z));
    }

  ch_printf(ch,"\r\n");
  set_char_color(  AT_WHITE, ch );
  for ( spaceobj = first_spaceobject; spaceobj; spaceobj = spaceobj->next )
    {
      if ( space_in_range( ship, spaceobj ) && spaceobj->type > SPACE_PLANET && str_cmp(spaceobj->name,"") )
        ch_printf(ch, "%-15s%.0f %.0f %.0f\r\n%-15s%.0f %.0f %.0f\r\n" ,
                  spaceobj->name,
                  spaceobj->pos.x,
                  spaceobj->pos.y,
                  spaceobj->pos.z, "",
                  (spaceobj->pos.x - ship->pos.x),
                  (spaceobj->pos.y - ship->pos.y),
                  (spaceobj->pos.z - ship->pos.z) );
    }
  ch_printf(ch,"\r\n");

  for ( target = first_ship; target; target = target->next )
    {
      if ( target != ship && target->spaceobject )
        {
          if( ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass) +1))
            ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
                      target->name,
                      (target->pos.x - ship->pos.x),
                      (target->pos.y - ship->pos.y),
                      (target->pos.z - ship->pos.z));
          else if ( ship_distance_to_ship( ship, target ) < 100*(ship->sensor+10)*((target->sclass == SHIP_DEBRIS ? 2 : target->sclass)+3))
            {
              if ( target->sclass == FIGHTER_SHIP )
                ch_printf(ch, "A small metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
	      else if ( target->sclass == MIDSIZE_SHIP )
                ch_printf(ch, "A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass == SHIP_DEBRIS )
                ch_printf(ch, "scattered metallic reflections    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
              else if ( target->sclass >= CAPITAL_SHIP )
                ch_printf(ch, "A huge metallic mass    %.0f %.0f %.0f\r\n",
                          (target->pos.x - ship->pos.x),
                          (target->pos.y - ship->pos.y),
                          (target->pos.z - ship->pos.z));
            }
        }

    }
  ch_printf(ch,"\r\n");
  for ( missile = first_missile; missile; missile = missile->next )
    {

      if( missile_distance_to_ship( missile, ship ) < 50*(ship->sensor+10)*2)
        {
          ch_printf(ch, "%s    %.0f %.0f %.0f\r\n",
                    missile->missiletype == CONCUSSION_MISSILE ? "A Concusion missile" :
                    ( missile->missiletype ==  PROTON_TORPEDO ? "A Torpedo" :
                      ( missile->missiletype ==  HEAVY_ROCKET ? "A Heavy Rocket" : "A Heavy Bomb" ) ),
                    (missile->pos.x - ship->pos.x),
                    (missile->pos.y - ship->pos.y),
                    (missile->pos.z - ship->pos.z));
        }
    }

  ch_printf(ch, "\r\n&WYour Coordinates: %.0f %.0f %.0f\r\n" ,
            ship->pos.x , ship->pos.y, ship->pos.z);

  learn_from_success( ch, gsn_navigation );
}
