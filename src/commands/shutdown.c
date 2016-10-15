#include <string.h>
#include "mud.h"
#include "ship.h"
#include "character.h"

void do_shutdown( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch;
  Ship *ship;

  if ( StrCmp( argument, "mud now" ) && StrCmp(argument, "nosave") )
    {
      SendToCharacter( "Syntax: 'shutdown mud now' or 'shutdown nosave'\r\n", ch );
      return;
    }

  if ( auction->item )
    do_auction( ch, "stop");

  sprintf( buf, "Shutdown by %s.", ch->Name );
  AppendFile( ch, SHUTDOWN_FILE, buf );
  strcat( buf, "\r\n" );
  do_echo( ch, buf );

  /* Save all characters before booting. */
  if ( StrCmp(argument, "nosave") )
    {
      for ( vch = first_char; vch; vch = vch->Next )
        if ( !IsNpc( vch ) )
          SaveCharacter( vch );
      for ( ship = first_ship; ship; ship = ship->Next )
        SaveShip( ship );
    }

  mud_down = true;
}
