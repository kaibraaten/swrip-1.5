#include "mud.h"
#include "clan.h"

void do_makeclan( CHAR_DATA *ch, char *argument )
{
  /*char filename[256];*/
  Clan *clan;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  /*sprintf( filename, "%s%s", CLAN_DIR, strlower(argument) );*/

  CREATE( clan, Clan, 1 );
  List_AddTail( ClanList, clan );
  clan->SubClans = CreateList();
  clan->name            = STRALLOC( argument );
  clan->description     = STRALLOC( "" );
  clan->leadership.leader  = STRALLOC( "" );
  clan->leadership.number1 = STRALLOC( "" );
  clan->leadership.number2 = STRALLOC( "" );
  clan->tmpstr  = STRALLOC( "" );
}
