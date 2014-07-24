#include "mud.h"

void do_makeclan( Character *ch, char *argument )
{
  char filename[256];
  CLAN_DATA *clan;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, strlower(argument) );

  CREATE( clan, CLAN_DATA, 1 );
  LINK( clan, first_clan, last_clan, next, prev );
  clan->next_subclan = NULL;
  clan->prev_subclan = NULL;
  clan->last_subclan = NULL;
  clan->first_subclan = NULL;
  clan->mainclan     = NULL;
  clan->name            = STRALLOC( argument );
  clan->description     = STRALLOC( "" );
  clan->leadership.leader  = STRALLOC( "" );
  clan->leadership.number1 = STRALLOC( "" );
  clan->leadership.number2 = STRALLOC( "" );
  clan->tmpstr  = STRALLOC( "" );
}
