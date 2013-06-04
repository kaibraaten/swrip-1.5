#include "mud.h"

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  BAN_DATA *pban;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Remove which site from the ban list?\r\n", ch );
      return;
    }

  for ( pban = first_ban; pban; pban = pban->next )
    {
      if ( !str_cmp( arg, pban->name ) )
        {
          UNLINK( pban, first_ban, last_ban, next, prev );
          if ( pban->ban_time )
            DISPOSE(pban->ban_time);
          DISPOSE( pban->name );
          DISPOSE( pban );
          save_banlist( );
          send_to_char( "Site no longer banned.\r\n", ch );
          return;
        }
    }

  send_to_char( "Site is not banned.\r\n", ch );
}
