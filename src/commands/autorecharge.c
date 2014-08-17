#include "character.h"
#include "ships.h"
#include "mud.h"

void do_autorecharge(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;
  int recharge;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = ship_from_coseat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the co-pilots seat!\r\n",ch);
      return;
    }

  if ( is_autoflying(ship)  )
    {
      send_to_char("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( number_percent( ) > the_chance )
    {
      send_to_char("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if ( !str_cmp(argument,"on" ) )
    {
      ship->autorecharge=true;
      send_to_char( "&GYou power up the shields.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON.");
    }
  else if ( !str_cmp(argument,"off" ) )
    {
      ship->autorecharge=false;
      send_to_char( "&GYou shutdown the shields.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Shields OFF. Shield strength set to 0. Autorecharge OFF.");
      ship->shield = 0;
    }
  else if ( !str_cmp(argument,"idle" ) )
    {
      ship->autorecharge=false;
      send_to_char( "&GYou let the shields idle.\r\n", ch);
      echo_to_cockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
    }
  else
    {
      if (ship->autorecharge == true)
        {
          ship->autorecharge=false;
          send_to_char( "&GYou toggle the shields.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
        }
      else
        {
          ship->autorecharge=true;
          send_to_char( "&GYou toggle the shields.\r\n", ch);
          echo_to_cockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON");
        }
    }

  if (ship->autorecharge)
    {
      recharge  = urange( 1, ship->maxshield-ship->shield, 25+ship->sclass*25 );
      recharge  = umin( recharge, ship->energy*5 + 100 );
      ship->shield += recharge;
      ship->energy -= ( recharge*2 + recharge * ship->sclass );
    }

  learn_from_success( ch, gsn_shipsystems );
}
