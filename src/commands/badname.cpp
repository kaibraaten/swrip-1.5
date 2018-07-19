#include "types.hpp"
#include "badname.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_badname( Character *ch, char *argument )
{
  char command[MAX_STRING_LENGTH] = { '\0' };

  if( !StrCmp( argument, "list" ) )
    {
      int currentColumn = 0;
      const int numberOfColumns = 4;

      for(const BadName *badname : BadNames->Entities())
        {
          Echo( ch, "%-19s", badname->Name.c_str() );

          if( ++currentColumn % numberOfColumns == 0 )
            {
              Echo( ch, "\r\n" );
            }
        }

      if( currentColumn % numberOfColumns != 0 )
        {
          Echo( ch, "\r\n" );
        }

      if( currentColumn == 0)
        {
          Echo( ch, "No badnames registered.\r\n" );
        }

      return;
    }
  
  argument = OneArgument( argument, command );
  
  if( IsNullOrEmpty( argument ) || IsNullOrEmpty( command ) )
    {
      Echo( ch, "Usage: badname <command> <name>\r\n" );
      Echo( ch, "Commands:\r\n" );
      Echo( ch, "\tadd remove list\r\n" );
      return;
    }

  if( !StrCmp( command, "add" ) )
    {
      if( IsBadName( argument ) )
	{
	  SendToCharacter("That name is already in the badname list.\r\n",ch);
	}
      else
	{
	  AddBadName( argument );
          BadNames->Save();
	  SendToCharacter("Name successfully added to the badname list.\r\n",ch);
	}

      return;
    }
  else if( !StrCmp( command, "remove" ) || !StrCmp( command, "rm" ) )
    {
      if( !IsBadName( argument ) )
        {
          SendToCharacter("That name isn't in the badname list.\r\n",ch);
        }
      else
        {
          RemoveBadName( argument );
          BadNames->Save();
          SendToCharacter("Name successfully removed from the badname list.\r\n",ch);
        }

      return;
    }
}
