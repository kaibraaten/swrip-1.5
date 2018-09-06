#include "types.hpp"
#include "badname.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "character.hpp"

void do_badname( Character *ch, std::string argument )
{
  std::string command;

  if( !StrCmp( argument, "list" ) )
    {
      int currentColumn = 0;
      const int numberOfColumns = 4;

      for(const BadName *badname : BadNames->Entities())
        {
          ch->Echo( "%-19s", badname->Name.c_str() );

          if( ++currentColumn % numberOfColumns == 0 )
            {
              ch->Echo( "\r\n" );
            }
        }

      if( currentColumn % numberOfColumns != 0 )
        {
          ch->Echo( "\r\n" );
        }

      if( currentColumn == 0)
        {
          ch->Echo( "No badnames registered.\r\n" );
        }

      return;
    }
  
  argument = OneArgument( argument, command );
  
  if( argument.empty() || command.empty() )
    {
      ch->Echo( "Usage: badname <command> <name>\r\n" );
      ch->Echo( "Commands:\r\n" );
      ch->Echo( "\tadd remove list\r\n" );
      return;
    }

  if( !StrCmp( command, "add" ) )
    {
      if( IsBadName( argument ) )
	{
	  ch->Echo("That name is already in the badname list.\r\n");
	}
      else
	{
	  AddBadName( argument );
          BadNames->Save();
	  ch->Echo("Name successfully added to the badname list.\r\n");
	}

      return;
    }
  else if( !StrCmp( command, "remove" ) || !StrCmp( command, "rm" ) )
    {
      if( !IsBadName( argument ) )
        {
          ch->Echo("That name isn't in the badname list.\r\n");
        }
      else
        {
          RemoveBadName( argument );
          BadNames->Save();
          ch->Echo("Name successfully removed from the badname list.\r\n");
        }

      return;
    }
}

