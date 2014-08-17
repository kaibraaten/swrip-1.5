#include "mud.h"
#include "ships.h"
#include "character.h"

void do_addpilot(Character *ch, char *argument )
{
  Ship *ship;
  int the_chance;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  the_chance = GetRandomPercent( );

  if ( IsNpc(ch) || the_chance >= ch->pcdata->learned[gsn_slicing] )
    {
      if ( !CheckPilot( ch , ship ) )
        {
          send_to_char( "&RThat isn't your ship!" ,ch );
          return;
        }
    }

  if (argument[0] == '\0')
    {
      send_to_char( "&RAdd which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    learn_from_success( ch, gsn_slicing );

  if ( StrCmp( ship->pilot , "" ) )
    {
      if ( StrCmp( ship->copilot , "" ) )
        {
          send_to_char( "&RYou already have a pilot and copilot..\r\n" ,ch );
          send_to_char( "&RTry rempilot first.\r\n" ,ch );
          return;
        }

      FreeMemory( ship->copilot );
      ship->copilot = CopyString( argument );
      send_to_char( "Copilot Added.\r\n", ch );
      SaveShip( ship );
      return;

      return;
    }

  FreeMemory( ship->pilot );
  ship->pilot = CopyString( argument );
  send_to_char( "Pilot Added.\r\n", ch );
  SaveShip( ship );
}
