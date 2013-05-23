#include "mud.h"
#include "ships.h"
#include "character.h"

void do_addpilot(CHAR_DATA *ch, char *argument )
{
  SHIP_DATA *ship;
  int the_chance;

  if (  (ship = ship_from_cockpit(ch->in_room->vnum))  == NULL )
    {
      send_to_char("&RYou must be in the cockpit of a ship to do that!\r\n",ch);
      return;
    }

  the_chance = number_percent( );

  if ( is_npc(ch) || the_chance >= ch->pcdata->learned[gsn_slicing] )
    {
      if ( !check_pilot( ch , ship ) )
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

  if ( str_cmp( ship->pilot , "" ) )
    {
      if ( str_cmp( ship->copilot , "" ) )
        {
          send_to_char( "&RYou already have a pilot and copilot..\r\n" ,ch );
          send_to_char( "&RTry rempilot first.\r\n" ,ch );
          return;
        }

      STRFREE( ship->copilot );
      ship->copilot = STRALLOC( argument );
      send_to_char( "Copilot Added.\r\n", ch );
      save_ship( ship );
      return;

      return;
    }

  STRFREE( ship->pilot );
  ship->pilot = STRALLOC( argument );
  send_to_char( "Pilot Added.\r\n", ch );
  save_ship( ship );
}
