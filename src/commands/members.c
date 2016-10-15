#include "mud.h"
#include "clan.h"

void do_members( Character *ch, char *argument )
{
  if( IsNullOrEmpty( argument ) )
    {
      Echo( ch, "Usage: members <clan name>\r\n" );
      return;
    }

  if( !StrCmp( argument, "all" ) )
    {
      ClanMemberList *members_list;

      for( members_list = first_ClanMemberList; members_list; members_list = members_list->Next )
	{
	  ShowClanMembers( ch, members_list->Name, NULL );
	}

      return;
    }

  if( !GetMemberList( GetClan( argument ) ) )
    {
      Echo( ch, "&RNo such member list.\r\n" );
    }
  else
    {
      ShowClanMembers( ch, argument, NULL );
    }

  do_members( ch, "" );
}
