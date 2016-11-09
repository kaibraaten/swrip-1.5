#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_addpilot(Character *ch, std::string argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->InRoom->Vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  the_chance = GetRandomPercent();

  if ( IsNpc(ch) || the_chance >= ch->PCData->Learned[gsn_slicing] )
    {
      if ( !CheckPilot( ch , ship ) )
        {
          SendToCharacter( "&RThat isn't your ship!" ,ch );
          return;
        }
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "&RAdd which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->PCData->Learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( StrCmp( ship->Pilot , "" ) )
    {
      if ( StrCmp( ship->CoPilot , "" ) )
        {
          SendToCharacter( "&RYou already have a pilot and copilot..\r\n" ,ch );
          SendToCharacter( "&RTry rempilot first.\r\n" ,ch );
          return;
        }

      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( argument );
      SendToCharacter( "Copilot Added.\r\n", ch );
      SaveShip( ship );
      return;

      return;
    }

  FreeMemory( ship->Pilot );
  ship->Pilot = CopyString( argument );
  SendToCharacter( "Pilot Added.\r\n", ch );
  SaveShip( ship );
}
