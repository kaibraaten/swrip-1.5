#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_recharge( Character *ch, std::string argument )
{
  int recharge = 0;
  int the_chance = 0;
  Ship *ship = NULL;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RThe controls must be at the co-pilot station.\r\n");
      return;
    }

  if (IsShipDisabled( ship ))
    {
      ch->Echo("&RThe ship's drive is disabled. Unable to power a recharge order.\r\n");
      return;
    }

  if ( ship->Thrusters.Energy.Current < 100 )
    {
      ch->Echo("&RThere isn't enough energy!\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int) (ch->PCData->Learned[gsn_shipsystems]);

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou fail to work the controls properly.\r\n");
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  ch->Echo("&GRecharging shields.\r\n");
  Act( AT_PLAIN, "$n pulls back a lever on the control panel.",
       ch, NULL, argument.c_str(), TO_ROOM );

  LearnFromSuccess( ch, gsn_shipsystems );

  recharge  = 25+ship->Class*25;
  recharge  = umin(  ship->Defenses.Shield.Max - ship->Defenses.Shield.Current, recharge );
  ship->Defenses.Shield.Current += recharge;
  ship->Thrusters.Energy.Current -= ( recharge*2 + recharge * ship->Class );
}
