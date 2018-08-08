#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_guard( Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;

  if ( (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the pilots seat!\r\n");
      return;
    }

  if ( ship->Class != CAPITAL_SHIP  && ship->Class != SHIP_PLATFORM )
    {
      ch->Echo("&ROnly capital-class vessels and platforms have this feature.\r\n");
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
       NULL, argument , TO_ROOM );

  if ( !StrCmp(argument,"on" ) )
    {
      ship->Guard = true;
      ch->Echo( "&GYou activate the guard system.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->Thrusters.Speed.Current = 0;
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->Guard = false;
      ch->Echo( "&GYou shutdown the guard system.\r\n" );
      EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->Guard == true)
        {
          ship->Guard = false;
          ch->Echo( "&GYou shutdown the guard system.\r\n" );
          EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->Guard = true;
          ch->Echo( "&GYou activate the guard system.\r\n" );
          EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->Thrusters.Speed.Current = 0;
        }
    }

  LearnFromSuccess( ch, gsn_shipsystems );
}

