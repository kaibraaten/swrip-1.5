#include "character.h"
#include "mud.h"
#include "ships.h"

void do_recharge(Character *ch, char *argument )
{
  int recharge;
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }
  if (  (ship = GetShipFromCoSeat(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RThe controls must be at the co-pilot station.\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ships drive is disabled. Unable to power a recharge order.\r\n",ch);
      return;
    }

  if ( ship->energy < 100 )
    {
      SendToCharacter("&RTheres not enough energy!\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->top_level
    : (int) (ch->pcdata->learned[gsn_shipsystems]);
  if ( GetRandomPercent( ) > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      learn_from_failure( ch, gsn_shipsystems );
      return;
    }

  SendToCharacter( "&GRecharging shields..\r\n", ch);
  Act( AT_PLAIN, "$n pulls back a lever on the control panel.", ch,
       NULL, argument , TO_ROOM );

  learn_from_success( ch, gsn_shipsystems );

  recharge  = 25+ship->sclass*25;
  recharge  = umin(  ship->maxshield-ship->shield , recharge );
  ship->shield += recharge;
  ship->energy -= ( recharge*2 + recharge * ship->sclass );
}
