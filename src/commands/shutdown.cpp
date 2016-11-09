#include <string.h>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"

void do_shutdown( Character *ch, std::string argument )
{
  char buf[MAX_STRING_LENGTH];
  Character *vch;
  Ship *ship;

  if ( StrCmp( argument, "mud now" ) && StrCmp(argument, "nosave") )
    {
      SendToCharacter( "Syntax: 'shutdown mud now' or 'shutdown nosave'\r\n", ch );
      return;
    }

  if ( auction->Item )
    do_auction( ch, "stop");

  sprintf( buf, "Shutdown by %s.", ch->Name );
  AppendFile( ch, SHUTDOWN_FILE, buf );
  strcat( buf, "\r\n" );
  do_echo( ch, buf );

  /* Save all characters before booting. */
  if ( StrCmp(argument, "nosave") )
    {
      for ( vch = FirstCharacter; vch; vch = vch->Next )
        if ( !IsNpc( vch ) )
          SaveCharacter( vch );
      for ( ship = FirstShip; ship; ship = ship->Next )
        SaveShip( ship );
    }

  mud_down = true;
}
