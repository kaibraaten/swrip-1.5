#include "mud.h"
#include "clan.h"

void do_makeclan( Character *ch, char *argument )
{
  char filename[256];
  Clan *clan = NULL;

  if ( !argument || argument[0] == '\0' )
    {
      SendToCharacter( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  sprintf( filename, "%s%s", CLAN_DIR, StringToLowercase(argument) );

  clan = AllocateClan();
  AddClan( clan );
  clan->name               = CopyString( argument );
  clan->description        = CopyString( "" );
  clan->filename           = CopyString( filename );
  clan->leadership.leader  = CopyString( "" );
  clan->leadership.number1 = CopyString( "" );
  clan->leadership.number2 = CopyString( "" );
  clan->tmpstr             = CopyString( "" );
}
