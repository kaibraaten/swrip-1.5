#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_guard( Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if (  (ship = GetShipFromPilotSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the pilots seat!\r\n",ch);
      return;
    }

  if ( ship->Class != CAPITAL_SHIP  && ship->Class != SHIP_PLATFORM )
    {
      SendToCharacter("&ROnly capital-class vessels and platforms have this feature.\r\n",ch);
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
      ship->Guard = true;
      SendToCharacter( "&GYou activate the guard system.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
      ship->Thrusters.Speed.Current = 0;
    }
  else if ( !StrCmp(argument,"off" ) )
    {
      ship->Guard = false;
      SendToCharacter( "&GYou shutdown the guard system.\r\n", ch);
      EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
    }
  else
    {
      if (ship->Guard == true)
        {
          ship->Guard = false;
          SendToCharacter( "&GYou shutdown the guard system.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Guard System: DEACTIVATED.");
        }
      else
        {
          ship->Guard = true;
          SendToCharacter( "&GYou activate the guard system.\r\n", ch);
          EchoToCockpit( AT_YELLOW , ship , "Guard System: ACTIVATED.");
          ship->Thrusters.Speed.Current = 0;
        }
    }

  LearnFromSuccess( ch, gsn_shipsystems );
}
