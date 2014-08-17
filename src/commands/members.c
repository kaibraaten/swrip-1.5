#include "mud.h"

void do_members( Character *ch, char *argument )
{
  char arg1[MAX_STRING_LENGTH];
  argument = OneArgument( argument, arg1 );

  if( argument[0] == '\0' || arg1[0] == '\0' )
    {
      send_to_char( "Do what?\r\n", ch );
      return;
    }

  if( !StrCmp( arg1, "show" ) )
    {
      if( !StrCmp( argument, "all" ) )
        {
          MEMBER_LIST *members_list;
          for( members_list = first_member_list; members_list; members_list = members_list->next )
            show_members( ch, members_list->name, NULL );
          return;
        }

      show_members( ch, argument, NULL );
      return;
    }

  if( !StrCmp( arg1, "create" ) )
    {
      MEMBER_LIST *members_list;

      CREATE( members_list, MEMBER_LIST, 1 );
      members_list->name = CopyString( argument );
      LINK( members_list, first_member_list, last_member_list, next, prev );
      save_member_list( members_list );
      ch_printf( ch, "Member lists \"%s\" created.\r\n", argument );
      return;
    }

  if( !StrCmp( arg1, "delete" ) )
    {
      MEMBER_LIST *members_list;
      MEMBER_DATA *member;

      for( members_list = first_member_list; members_list; members_list = members_list->next )
        if( !StrCmp( argument, members_list->name ) )
          {
	    while( members_list->first_member )
              {
                member = members_list->first_member;
                DISPOSE( member->name );
                DISPOSE( member->since );
                UNLINK( member, members_list->first_member, members_list->last_member, next, prev);
                DISPOSE( member );
              }

            DISPOSE( members_list->name );
            UNLINK( members_list, first_member_list, last_member_list, next, prev );
            DISPOSE( members_list );
            ch_printf( ch, "Member list \"%s\" destroyed.\r\n", argument );
            return;
          }
      send_to_char( "No such list.\r\n", ch );
      return;
    }
}
