#include "ships.h"
#include "mud.h"
#include "character.h"

void do_hijack( CHAR_DATA *ch, char *argument )
{
  int the_chance;
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];
  char buf2[MAX_STRING_LENGTH];
  CHAR_DATA *p, *p_prev, *victim;


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

  if ( check_pilot( ch , ship ) )
    {
      send_to_char("&RWhat would be the point of that!\r\n",ch);
      return;
    }

  if ( ship->type == MOB_SHIP && get_trust(ch) < 102 )
    {
      send_to_char("&RThis ship isn't pilotable by mortals at this point in time...\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "You can't do that here.\r\n" , ch );
      return;
    }

  if ( ship->lastdoc != ship->location )
    {
      send_to_char("&rYou don't seem to be docked right now.\r\n",ch);
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char("The ship is not docked right now.\r\n",ch);
      return;
    }

  if ( ship_is_disabled( ship ) )
    {
      send_to_char("The ship's drive is disabled .\r\n",ch);
      return;
    }

  the_chance = is_npc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_hijack]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("You fail to figure out the correct launch code.\r\n",ch);
      learn_from_failure( ch, gsn_hijack );
      return;
    }

  if ( ship->sclass == FIGHTER_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_starfighters]) ;
  if ( ship->sclass == MIDSIZE_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int)  (ch->pcdata->learned[gsn_midships]) ;
  if ( ship->sclass == CAPITAL_SHIP )
    the_chance = is_npc(ch) ? ch->top_level
      : (int) (ch->pcdata->learned[gsn_capitalships]);
  if ( number_percent( ) < the_chance )
    {

      if (ship->hatchopen)
        {
          ship->hatchopen = FALSE;
          sprintf( buf , "The hatch on %s closes." , ship->name);
          echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
          echo_to_room( AT_YELLOW , get_room_index(ship->entrance) , "The hatch slides shut." );
        }
      set_char_color( AT_GREEN, ch );
      send_to_char( "Launch sequence initiated.\r\n", ch);
      act( AT_PLAIN, "$n starts up the ship and begins the launch sequence.", ch,
           NULL, argument , TO_ROOM );
      echo_to_ship( AT_YELLOW , ship , "The ship hums as it lifts off the ground.");
      sprintf( buf, "%s begins to launch.", ship->name );
      echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
      ship->shipstate = SHIP_LAUNCH;
      ship->currspeed = ship->realspeed;
      if ( ship->sclass == FIGHTER_SHIP )
        learn_from_success( ch, gsn_starfighters );
      if ( ship->sclass == MIDSIZE_SHIP )
        learn_from_success( ch, gsn_midships );
      if ( ship->sclass == CAPITAL_SHIP )
        learn_from_success( ch, gsn_capitalships );

      learn_from_success( ch, gsn_hijack );

      for (p = last_char; p ; p = p_prev )

        {
          p_prev = p->prev;  /* TRI */
          if (!is_npc(p) && get_trust(p) >= LEVEL_GOD)
            {
              sprintf( buf2, "%s(%s)", ship->name, ship->personalname );
              ch_printf(p, "&R[alarm] %s has been hijacked by %s!\r\n", buf2, ch->name);
            }
        }

      if ( ship->alarm == 0 )
	return;
      if ( !str_cmp("Public",ship->owner) )
        return;
      for ( victim = first_char; victim; victim = victim->next )
        {
          if ( !check_pilot(victim,ship) )
            continue;

          if ( !has_comlink( victim ) )
            continue;

          if ( !is_npc( victim ) && victim->switched )
            continue;

          if ( !IS_AWAKE(victim) || IS_SET(victim->in_room->room_flags,ROOM_SILENCE) )
            continue;

          ch_printf(victim,"&R[alarm] %s has been hijacked!\r\n",ship->name);

        }

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
