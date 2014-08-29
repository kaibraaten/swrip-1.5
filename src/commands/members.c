#include "mud.h"
#include "clan.h"

void do_members( Character *ch, char *argument )
{
  char arg1[MAX_STRING_LENGTH];
  argument = OneArgument( argument, arg1 );

  if( IsNullOrEmpty( argument ) || IsNullOrEmpty( arg1 ) )
    {
      Echo( ch, "Usage: members <field> <clan name>\r\n" );
      Echo( ch, "\r\nField being one of:\r\n" );
      Echo( ch, " show create delete\r\n" );
      return;
    }

  if( !StrCmp( arg1, "show" ) )
    {
      if( !StrCmp( argument, "all" ) )
        {
          MEMBER_LIST *members_list;

          for( members_list = first_member_list; members_list; members_list = members_list->next )
	    {
	      ShowClanMembers( ch, members_list->name, NULL );
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

      return;
    }

  if( !StrCmp( arg1, "create" ) )
    {
      MEMBER_LIST *members_list;
      Clan *clan = GetClan( argument );

      if( !clan )
	{
	  Echo( ch, "&RNo such clan exists.\r\n" );
	  return;
	}

      if( GetMemberList( clan ) )
	{
	  Echo( ch, "&R&RThat member list already exists.&w\r\n" );
	}
      else
	{
	  AllocateMemory( members_list, MEMBER_LIST, 1 );
	  members_list->name = CopyString( argument );
	  LINK( members_list, first_member_list, last_member_list, next, prev );
	  SaveClanMemberList( members_list );
	  Echo( ch, "Member lists \"%s\" created.\r\n", argument );
	}

      return;
    }

  if( !StrCmp( arg1, "delete" ) )
    {
      Clan *clan = GetClan( argument );
      MEMBER_LIST *members_list = GetMemberList( clan );

      if( members_list )
	{
	  while( members_list->first_member )
	    {
	      MEMBER_DATA *member = members_list->first_member;
	      FreeMemory( member->name );
	      FreeMemory( member->since );
	      UNLINK( member, members_list->first_member, members_list->last_member, next, prev);
	      FreeMemory( member );
	    }

	  FreeMemory( members_list->name );
	  UNLINK( members_list, first_member_list, last_member_list, next, prev );
	  FreeMemory( members_list );
	  Echo( ch, "Member list \"%s\" destroyed.\r\n", argument );
	  return;
	}

      Echo( ch, "&RNo such list.&w\r\n" );
      return;
    }

  do_members( ch, "" );
}
