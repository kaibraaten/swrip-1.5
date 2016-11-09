#include "mud.h"
#include "ban.h"

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

  for ( pban = FirstBan; pban; pban = pban->Next )
    {
      if ( !StrCmp( arg, pban->Site ) )
        {
          UNLINK( pban, FirstBan, LastBan, Next, Previous );

	  if ( pban->BanTime )
            FreeMemory(pban->BanTime);

	  FreeMemory( pban->Site );
          FreeMemory( pban );
          SaveBans();
          SendToCharacter( "Site no longer banned.\r\n", ch );
          return;
        }
    }

  SendToCharacter( "Site is not banned.\r\n", ch );
}
