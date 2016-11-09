#include "mud.hpp"
#include "clan.hpp"

void do_members( Character *ch, std::string argument )
{
  if( IsNullOrEmpty( argument ) )
    {
      Echo( ch, "Usage: members <clan name>\r\n" );
      return;
    }

  if( !StrCmp( argument, "all" ) )
    {
      ClanMemberList *members_list;

      for( members_list = FirstClanMemberList; members_list; members_list = members_list->Next )
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
}
