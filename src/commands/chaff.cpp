#include "character.hpp"
#include "ship.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_chaff( Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if ( ship->Class > SHIP_PLATFORM )
    {
      ch->Echo("&RThis isn't a spacecraft!\r\n");
      return;
    }

  if (  (ship = GetShipFromCoSeat(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RThe controls are at the copilots seat!\r\n");
      return;
    }

  if ( IsShipAutoflying(ship) )
    {
      ch->Echo("&RYou'll have to turn the autopilot off first...\r\n");
      return;
    }

  if ( IsShipInHyperspace( ship ) )
    {
      ch->Echo("&RYou can only do that in realspace!\r\n");
      return;
    }
  
  if (ship->State == SHIP_LANDED)
    {
      ch->Echo("&RYou can't do that until after you've launched!\r\n");
      return;
    }

  if (ship->Defenses.Chaff.Current <= 0 )
    {
      ch->Echo("&RYou don't have any chaff to release!\r\n");
      return;
    }

  the_chance = IsNpc(ch) ? ch->TopLevel
    : (int)  (ch->PCData->Learned[gsn_weaponsystems]) ;

  if ( GetRandomPercent() > the_chance )
    {
      ch->Echo("&RYou can't figure out which switch it is.\r\n");
      LearnFromFailure( ch, gsn_weaponsystems );
      return;
    }

  ship->Defenses.Chaff.Current--;
  ship->Defenses.ChaffReleased++;

  ch->Echo( "You flip the chaff release switch.\r\n");
  Act( AT_PLAIN, "$n flips a switch on the control pannel", ch,
       NULL, argument , TO_ROOM );
  EchoToCockpit( AT_YELLOW , ship , "A burst of chaff is released from the ship.");
  LearnFromSuccess( ch, gsn_weaponsystems );
}

