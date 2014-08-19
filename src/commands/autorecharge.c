#include "character.h"
#include "ships.h"
#include "mud.h"

void do_autorecharge(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;
  int recharge;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the co-pilots seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int)  (ch->pcdata->learned[gsn_shipsystems]) ;
  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  act( AT_PLAIN, "$n flips a switch on the control panell.", ch,
       NULL, argument , TO_ROOM );

  if ( !StrCmp(argument,"on" ) )
    {
      ship->autorecharge=true;
      SendToCharacter( "&GYou power up the shields.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON.");
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->autorecharge=false;
      SendToCharacter( "&GYou shutdown the shields.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Shields OFF. Shield strength set to 0. Autorecharge OFF.");
      ship->shield = 0;
    }
  else if ( !StrCmp(argument,"idle" ) )
    {
      ship->autorecharge=false;
      SendToCharacter( "&GYou let the shields idle.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
    }
  else
    {
      if (ship->autorecharge == true)
        {
          ship->autorecharge=false;
          SendToCharacter( "&GYou toggle the shields.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
        }
      else
        {
          ship->autorecharge=true;
          SendToCharacter( "&GYou toggle the shields.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON");
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
