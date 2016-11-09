#include "character.hpp"
#include "ship.h"
#include "mud.h"
#include "skill.h"

void do_chaff( Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      SendToCharacter("&RThis isn't a spacecraft!\r\n",ch);
      return;
    }


  if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RThe controls are at the copilots seat!\r\n",ch);
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      SendToCharacter("&RYou'll have to turn the autopilot off first...\r\n",ch);
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      SendToCharacter("&RYou can only do that in realspace!\r\n",ch);
      return;
    }
  if (ship->State == SHIP_LANDED)
    {
      SendToCharacter("&RYou can't do that until after you've launched!\r\n",ch);
      return;
    }
  if (ship->Defenses.Chaff.Current <= 0 )
    {
      SendToCharacter("&RYou don't have any chaff to release!\r\n",ch);
      return;
    }
  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_weaponsystems]) ;
  if ( GetRandomPercent() > the_chance )
    {
      SendToCharacter("&RYou can't figure out which switch it is.\r\n",ch);
      LearnFromFailure( ch, gsn_weaponsystems );
      return;
    }

  ship->Defenses.Chaff.Current--;

  ship->Defenses.ChaffReleased++;

  SendToCharacter( "You flip the chaff release switch.\r\n", ch);
  Act( AT_PLAIN, "$n flips a switch on the control pannel", ch,
       NULL, argument , TO_ROOM );
  EchoToCockpit( AT_YELLOW , ship , "A burst of chaff is released from the ship.");

  LearnFromSuccess( ch, gsn_weaponsystems );
}
