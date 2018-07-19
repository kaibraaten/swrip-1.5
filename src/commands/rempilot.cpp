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
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if  ( ship->Class == SHIP_PLATFORM )
    {
      SendToCharacter( "&RYou can't do that here.\r\n" , ch );
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
      SendToCharacter( "&RRemove which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->PCData->Learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( !StrCmp( ship->Pilot , argument ) )
    {
      FreeMemory( ship->Pilot );
      ship->Pilot = CopyString( "" );
      SendToCharacter( "Pilot Removed.\r\n", ch );
      Ships->Save(ship);
      return;
    }

  if ( !StrCmp( ship->CoPilot , argument ) )
    {
      FreeMemory( ship->CoPilot );
      ship->CoPilot = CopyString( "" );
      SendToCharacter( "Copilot Removed.\r\n", ch );
      Ships->Save(ship);
      return;
    }

  SendToCharacter( "&RThat person isn't listed as one of the ships pilots.\r\n" ,ch );
}
