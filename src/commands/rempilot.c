#include "character.h"
#include "mud.h"
#include "ship.h"
#include "skill.h"

void do_rempilot(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      SendToCharacter( "&RYou can't do that here.\r\n" , ch );
      return;
    }
  the_chance = GetRandomPercent();
  if ( IsNpc(ch) || the_chance >= ch->pcdata->learned[gsn_slicing] )
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

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( !StrCmp( ship->pilot , argument ) )
    {
      FreeMemory( ship->pilot );
      ship->pilot = CopyString( "" );
      SendToCharacter( "Pilot Removed.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !StrCmp( ship->copilot , argument ) )
    {
      FreeMemory( ship->copilot );
      ship->copilot = CopyString( "" );
      SendToCharacter( "Copilot Removed.\r\n", ch );
      SaveShip( ship );
      return;
    }

  SendToCharacter( "&RThat person isn't listed as one of the ships pilots.\r\n" ,ch );
}
