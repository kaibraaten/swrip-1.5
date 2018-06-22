#include "character.h"
#include "ship.h"
#include "mud.h"
#include "skill.h"

void do_autorecharge(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;
  int recharge;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the co-pilots seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship)  )
    {
      SendToCharacter("&RYou'll have to turn off the ships autopilot first.\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument , TO_ROOM );

  if ( !StrCmp(argument,"on" ) )
    {
      ship->AutoRecharge=true;
      SendToCharacter( "&GYou power up the shields.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON.");
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->AutoRecharge=false;
      SendToCharacter( "&GYou shutdown the shields.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Shields OFF. Shield strength set to 0. Autorecharge OFF.");
      ship->Defenses.Shield.Current = 0;
    }
  else if ( !StrCmp(argument,"idle" ) )
    {
      ship->AutoRecharge=false;
      SendToCharacter( "&GYou let the shields idle.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
    }
  else
    {
      if (ship->AutoRecharge == true)
        {
          ship->AutoRecharge=false;
          SendToCharacter( "&GYou toggle the shields.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLEING.");
        }
      else
        {
          ship->AutoRecharge=true;
          SendToCharacter( "&GYou toggle the shields.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON");
        }
    }

  if (ship->AutoRecharge)
    {
      recharge  = urange( 1, ship->Defenses.Shield.Max - ship->Defenses.Shield.Current, 25+ship->Class*25 );
      recharge  = umin( recharge, ship->Thrusters.Energy.Current*5 + 100 );
      ship->Defenses.Shield.Current += recharge;
      ship->Thrusters.Energy.Current -= ( recharge*2 + recharge * ship->Class );
    }

  LearnFromSuccess( ch, gsn_shipsystems );
}
