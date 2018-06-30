#include "types.h"
#include "badname.h"
#include "mud.h"

void do_badname( Character *ch, char *argument )
{
  char command[MAX_STRING_LENGTH];

  if( !StrCmp( argument, "list" ) )
    {
      int currentColumn = 0;
      const int numberOfColumns = 4;
      const List *badnames = GetEntities(BadNameRepository);
      ListIterator *iterator = AllocateIterator(badnames);

      while(HasMoreElements(iterator))
        {
          const BadName *badname = (const BadName*)GetData(iterator);
          MoveToNextElement(iterator);

          Echo( ch, "%-19s", badname->Name );

          if( ++currentColumn % numberOfColumns == 0 )
            {
              Echo( ch, "\r\n" );
            }
        }

      FreeIterator(iterator);

      if( currentColumn % numberOfColumns != 0 )
        {
          Echo( ch, "\r\n" );
        }

      if( !currentColumn )
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
	  SaveBadNames();
	  SendToCharacter("Name successfully added to the badname list.\r\n",ch);
	}

      return;
    }

  if( !StrCmp( command, "remove" ) || !StrCmp( command, "rm" ) )
    {
      if( !IsBadName( argument ) )
        {
          SendToCharacter("That name isn't in the badname list.\r\n",ch);
        }
      else
        {
          RemoveBadName( argument );
          SaveBadNames();
          SendToCharacter("Name successfully removed from the badname list.\r\n",ch);
        }

      return;
    }
}
