#include "mud.h"
#include "clan.h"

void do_makeclan( Character *ch, char *argument )
{
  Clan *clan = NULL;
  ClanMemberList *memberList = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: makeclan <clan name>\r\n", ch );
      return;
    }

  clan = AllocateClan();
  AddClan( clan );

  clan->Name               = CopyString( argument );
  clan->description        = CopyString( "" );
  clan->leadership.leader  = CopyString( "" );
  clan->leadership.number1 = CopyString( "" );
  clan->leadership.number2 = CopyString( "" );
  clan->tmpstr             = CopyString( "" );

  memberList->name = CopyString( clan->Name );
  LINK( memberList, first_ClanMemberList, last_ClanMemberList, next, prev );

  SaveClan( clan );
}
