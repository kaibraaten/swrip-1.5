#include "mud.h"
#include "ships.h"

void do_recharge(CHAR_DATA *ch, char *argument )
{
  int recharge;
  int the_chance;
  SHIP_DATA *ship;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }
  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RThe controls must be at the co-pilot station.\r\n",ch);
      return;
    }

  if (ship_is_disabled( ship ))
    {
      send_to_char("&RThe ships drive is disabled. Unable to power a recharge order.\r\n",ch);
      return;
    }

  if ( ship->energy < 100 )
    {
      send_to_char("&RTheres not enough energy!\r\n",ch);
      return;
    }

  the_chance = IS_NPC(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_shipsystems]);
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  send_to_char( "&GRecharging shields..\r\n", ch);
  act( AT_PLAIN, "$n pulls back a lever on the control panel.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_shipsystems );

  recharge  = 25+ship->sclass*25;
  recharge  = UMIN(  ship->maxshield-ship->shield , recharge );
  ship->shield += recharge;
  ship->energy -= ( recharge*2 + recharge * ship->sclass );
}
