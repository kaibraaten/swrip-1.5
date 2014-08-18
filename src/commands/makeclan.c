#include "mud.h"

void do_makeclan( Character *ch, char *argument )
{
  char filename[256];
  Clan *clan;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, StringToLowercase(argument) );

  AllocateMemory( clan, Clan, 1 );
  LINK( clan, first_clan, last_clan, next, prev );
  clan->next_subclan = NULL;
  clan->prev_subclan = NULL;
  clan->last_subclan = NULL;
  clan->first_subclan = NULL;
  clan->mainclan     = NULL;
  clan->name            = CopyString( argument );
  clan->description     = CopyString( "" );
  clan->leadership.leader  = CopyString( "" );
  clan->leadership.number1 = CopyString( "" );
  clan->leadership.number2 = CopyString( "" );
  clan->tmpstr  = CopyString( "" );
}
