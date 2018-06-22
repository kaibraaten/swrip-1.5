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

  if( GetClan( argument ) )
    {
      Echo( ch, "&RThere's already another clan with that name.&d\r\n" );
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

  AllocateMemory( memberList, ClanMemberList, 1 );
  memberList->Name = CopyString( clan->Name );
  LINK( memberList, FirstClanMemberList, LastClanMemberList, Next, Previous );

  SaveClan( clan );
}
