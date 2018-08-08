#include "mud.hpp"
#include "clan.hpp"
#include "character.hpp"

void do_members( Character *ch, char *argument )
{
  if( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Usage: members <clan name>\r\n" );
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
      ch->Echo("&RNo such member list.\r\n" );
    }
  else
    {
      ShowClanMembers( ch, argument, NULL );
    }
}

