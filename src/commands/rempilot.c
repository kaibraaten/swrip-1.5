#include "character.h"
#include "mud.h"
#include "ships.h"

void do_rempilot(Character *ch, char *argument )
{
  int the_chance;
  Ship *ship;

  if (  (ship = GetShipFromCockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  if  ( ship->sclass == SHIP_PLATFORM )
    {
      send_to_char( "&RYou can't do that here.\r\n" , ch );
      return;
    }
  the_chance = number_percent( );
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
      send_to_char( "&RRemove which pilot?\r\n" ,ch );
      return;
    }

  if ( the_chance < ch->pcdata->learned[gsn_slicing] )
    learn_from_success( ch, gsn_slicing );

  if ( !str_cmp( ship->pilot , argument ) )
    {
      STRFREE( ship->pilot );
      ship->pilot = STRALLOC( "" );
      send_to_char( "Pilot Removed.\r\n", ch );
      SaveShip( ship );
      return;
    }

  if ( !str_cmp( ship->copilot , argument ) )
    {
      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( "" );
      send_to_char( "Copilot Removed.\r\n", ch );
      SaveShip( ship );
      return;
    }

  send_to_char( "&RThat person isn't listed as one of the ships pilots.\r\n" ,ch );
}
