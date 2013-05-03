#include <string.h>
#include "mud.h"

extern bool mud_down;

void do_shutdown( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  CHAR_DATA *vch;
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
        if ( !IS_NPC( vch ) )
          save_char_obj( vch );
      for ( ship = first_ship; ship; ship = ship->next )
        save_ship( ship );
    }

  mud_down = TRUE;
}
