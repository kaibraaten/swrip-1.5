#include "mud.h"
#include "ship.h"
#include "character.h"

void do_addpilot(Character *ch, char *argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      SendToCharacter("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
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

  if (argument[0] == '\0')
    {
      SendToCharacter( "&RAdd which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    LearnFromSuccess( ch, gsn_slicing );

  if ( StrCmp( ship->pilot , "" ) )
    {
      if ( StrCmp( ship->copilot , "" ) )
        {
          SendToCharacter( "&RYou already have a pilot and copilot..\r\n" ,ch );
          SendToCharacter( "&RTry rempilot first.\r\n" ,ch );
          return;
        }

      FreeMemory( ship->copilot );
      ship->copilot = CopyString( argument );
      SendToCharacter( "Copilot Added.\r\n", ch );
      SaveShip( ship );
      return;

      return;
    }

  FreeMemory( ship->pilot );
  ship->pilot = CopyString( argument );
  SendToCharacter( "Pilot Added.\r\n", ch );
  SaveShip( ship );
}
