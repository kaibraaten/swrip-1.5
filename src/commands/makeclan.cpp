#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"

void do_makeclan( Character *ch, char *argument )
{
  Clan *clan = NULL;
  ClanMemberList *memberList = NULL;

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: makeclan <clan name>\r\n");
      return;
    }

  if( GetClan( argument ) )
    {
      ch->Echo("&RThere's already another clan with that name.&d\r\n" );
      return;
    }

  clan = AllocateClan();
  Clans->Add(clan);

  clan->Name               = CopyString( argument );
  clan->Description        = CopyString( "" );
  clan->Leadership.Leader  = CopyString( "" );
  clan->Leadership.Number1 = CopyString( "" );
  clan->Leadership.Number2 = CopyString( "" );
  clan->tmpstr             = CopyString( "" );

  AllocateMemory( memberList, ClanMemberList, 1 );
  memberList->Name = CopyString( clan->Name );
  LINK( memberList, FirstClanMemberList, LastClanMemberList, Next, Previous );

  Clans->Save( clan );
}


