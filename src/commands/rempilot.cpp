#include "character.hpp"
#include "mud.hpp"
#include "ship.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_rempilot(Character *ch, char *argument )
{
  int the_chance = 0;
  Ship *ship = NULL;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      ch->Echo("&RYou can't do that here.\r\n" );
      return;
    }
  the_chance = GetRandomPercent();
  if ( IsNpc(ch) || the_chance >= ch->PCData->Learned[gsn_slicing] )
    {
      if ( !CheckPilot( ch , ship ) )
        {
          ch->Echo("&RThat isn't your ship!" );
          return;
        }
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("&RRemove which pilot?\r\n" );
      return;
    }

  if ( the_chance < ch->PCData->Learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( !StrCmp( ship->Pilot , argument ) )
    {
      FreeMemory( ship->Pilot );
      ship->Pilot = CopyString( "" );
      ch->Echo("Pilot Removed.\r\n");
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( ship->CoPilot , argument ) )
    {
      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( "" );
      ch->Echo("Copilot Removed.\r\n");
      Ships->Save(ship);
      return;
    }

  ch->Echo("&RThat person isn't listed as one of the ships pilots.\r\n" );
}

