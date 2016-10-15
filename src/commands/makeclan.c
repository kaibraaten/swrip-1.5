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
  clan->Description        = CopyString( "" );
  clan->Leadership.Leader  = CopyString( "" );
  clan->Leadership.Number1 = CopyString( "" );
  clan->Leadership.Number2 = CopyString( "" );
  clan->tmpstr             = CopyString( "" );

  memberList->Name = CopyString( clan->Name );
  LINK( memberList, first_ClanMemberList, last_ClanMemberList, Next, Previous );

  SaveClan( clan );
}
