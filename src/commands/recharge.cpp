#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"

void do_recharge(Character *ch, std::string argument )
{
  int recharge;
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }
  if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RThe controls must be at the co-pilot station.\r\n",ch);
      return;
    }

  if (IsShipDisabled( ship ))
    {
      SendToCharacter("&RThe ship's drive is disabled. Unable to power a recharge order.\r\n",ch);
      return;
    }

  if ( ship->Thrusters.Energy.Current < 100 )
    {
      SendToCharacter("&RThere isn't enough energy!\r\n",ch);
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int) (ch->PCData->Learned[gsn_shipsystems]);
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou fail to work the controls properly.\r\n",ch);
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  SendToCharacter( "&GRecharging shields..\r\n", ch);
  Act( AT_PLAIN, "$n pulls back a lever on the control panel.", ch,
       NULL, argument , TO_ROOM );

  LearnFromSuccess( ch, gsn_shipsystems );

  recharge  = 25+ship->Class*25;
  recharge  = umin(  ship->Defenses.Shield.Max - ship->Defenses.Shield.Current, recharge );
  ship->Defenses.Shield.Current += recharge;
  ship->Thrusters.Energy.Current -= ( recharge*2 + recharge * ship->Class );
}
