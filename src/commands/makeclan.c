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
  clan->name            = str_dup( argument );
  clan->description     = str_dup( "" );
  clan->leadership.leader  = str_dup( "" );
  clan->leadership.number1 = str_dup( "" );
  clan->leadership.number2 = str_dup( "" );
  clan->tmpstr  = str_dup( "" );
}
