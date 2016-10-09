#include "mud.h"

void do_allow( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Ban *pban;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Remove which site from the ban list?\r\n", ch );
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
          SaveBanlist();
          SendToCharacter( "Site no longer banned.\r\n", ch );
          return;
        }
    }

  SendToCharacter( "Site is not banned.\r\n", ch );
}
