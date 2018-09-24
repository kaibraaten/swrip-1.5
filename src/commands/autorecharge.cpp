#include <utility/random.hpp>
#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_autorecharge(Character *ch, std::string argument )
{
  int the_chance = 0;
  Ship *ship = nullptr;
  int recharge = 0;

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( (ship = GetShipFromCoSeat(ch->InRoom->Vnum)) == NULL )
    {
      ch->Echo("&RYou must be in the co-pilots seat!\r\n");
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      ch->Echo("&RYou'll have to turn off the ships autopilot first.\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_shipsystems]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou fail to work the controls properly.\r\n");
      LearnFromFailure( ch, gsn_shipsystems );
      return;
    }

  Act( AT_PLAIN, "$n flips a switch on the control panel.", ch,
       NULL, argument.c_str(), TO_ROOM );

  if ( !StrCmp(argument,"on" ) )
    {
      ship->AutoRecharge = true;
      ch->Echo( "&GYou power up the shields.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "Shields ON. Autorecharge ON.");
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->AutoRecharge = false;
      ch->Echo( "&GYou shutdown the shields.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "Shields OFF. Shield strength set to 0. Autorecharge OFF.");
      ship->Defenses.Shield.Current = 0;
    }
  else if ( !StrCmp(argument,"idle" ) )
    {
      ship->AutoRecharge=false;
      ch->Echo( "&GYou let the shields idle.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLING.");
    }
  else
    {
      if (ship->AutoRecharge == true)
        {
          ship->AutoRecharge=false;
          ch->Echo( "&GYou toggle the shields.\r\n" );
          EchoToCockpit( AT_YELLOW , ship , "Autorecharge OFF. Shields IDLING.");
        }
      else
        {
          ship->AutoRecharge = true;
          ch->Echo( "&GYou toggle the shields.\r\n" );
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

