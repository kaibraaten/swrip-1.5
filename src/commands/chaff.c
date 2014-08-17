#include "character.h"
#include "ships.h"
#include "mud.h"

void do_chaff( Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->sclass > SHIP_PLATFORM )
    {
      send_to_char("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RThe controls are at the copilots seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      send_to_char("&RYou'll have to turn the autopilot off first...\r\n",ch);
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      send_to_char("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->shipstate == SHIP_LANDED)
    {
      send_to_char("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->chaff <= 0 )
    {
      send_to_char("&RYou don't have any chaff to release!\r\n",ch);
      return;
    }
  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_weaponsystems]) ;
  if ( GetRandomPercent( ) > the_chance )
    {
      send_to_char("&RYou can't figure out which switch it is.\r\n",ch);
      learn_from_failure( ch, gsn_weaponsystems );
      return;
    }

  ship->chaff--;

  ship->chaff_released++;

  send_to_char( "You flip the chaff release switch.\r\n", ch);
  act( AT_PLAIN, "$n flips a switch on the control pannel", ch,
       NULL, argument , TO_ROOM );
  EchoToCockpit( AT_YELLOW , ship , "A burst of chaff is released from the ship.");

  learn_from_success( ch, gsn_weaponsystems );
}
