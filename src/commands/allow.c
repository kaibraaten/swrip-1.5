#include "mud.h"

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Ban *pban;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Remove which site from the ban list?\r\n", ch );
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( !StrCmp( arg, pban->name ) )
        {
          UNLINK( pban, first_ban, last_ban, next, prev );
          if ( pban->ban_time )
            FreeMemory(pban->ban_time);
          FreeMemory( pban->name );
          FreeMemory( pban );
          SaveBanlist( );
          send_to_char( "Site no longer banned.\r\n", ch );
          return;
        }
    }

  send_to_char( "Site is not banned.\r\n", ch );
}
