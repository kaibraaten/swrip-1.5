#include <string.h>
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_shutdown( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch;
  SHIP_DATA *ship;

  if ( str_cmp( argument, "mud now" ) && str_cmp(argument, "nosave") )
    {
      send_to_char( "Syntax: 'shutdown mud now' or 'shutdown nosave'\r\n", ch );
      return;
    }

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Shutdown by %s.", ch->name );
  append_file( ch, SHUTDOWN_FILE, buf );
  strcat( buf, "\r\n" );
  do_echo( ch, buf );

  /* Save all characters before booting. */
  if ( str_cmp(argument, "nosave") )
    {
      for ( vch = first_char; vch; vch = vch->next )
        if ( !IsNpc( vch ) )
          save_char_obj( vch );
      for ( ship = first_ship; ship; ship = ship->next )
        save_ship( ship );
    }

  mud_down = true;
}
