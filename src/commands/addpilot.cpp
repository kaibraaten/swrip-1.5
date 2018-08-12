#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_addpilot(Character *ch, char *argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      ch->Echo("&RYou must be in the cockpit of a ship to do that!\r\n");
      return;
    }

  the_chance = GetRandomPercent();

  if ( IsNpc(ch) || the_chance >= ch->PCData->Learned[gsn_slicing] )
    {
      if ( !CheckPilot( ch , ship ) )
        {
          ch->Echo( "&RThat isn't your ship!" );
          return;
        }
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "&RAdd which pilot?\r\n" );
      return;
    }

  if ( the_chance < ch->PCData->Learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( StrCmp( ship->Pilot , "" ) )
    {
      if ( StrCmp( ship->CoPilot , "" ) )
        {
          ch->Echo( "&RYou already have a pilot and copilot.\r\n" );
          ch->Echo( "&RTry rempilot first.\r\n" );
          return;
        }

      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( argument );
      ch->Echo( "Copilot Added.\r\n" );
      Ships->Save(ship);
      return;
    }

  FreeMemory( ship->Pilot );
  ship->Pilot = CopyString( argument );
  ch->Echo( "Pilot Added.\r\n" );
  Ships->Save(ship);
}

