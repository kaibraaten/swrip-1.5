#include "types.h"
#include "badname.h"
#include "mud.h"

void do_badname( Character *ch, char *argument )
{
  if( IsNullOrEmpty( argument ) )
    {
      SendToCharacter("Usage: badname <name>\r\n",ch);
      return;
    }

  if( !StrCmp( argument, "list" ) )
    {
      const BadName *badname = NULL;
      int currentColumn = 0;
      const int numberOfColumns = 4;
      
      for( badname = FirstBadName; badname; badname = badname->Next )
	{
	  Echo( ch, "%-19s", badname->Name );

	  if( ++currentColumn % numberOfColumns == 0 )
	    {
	      Echo( ch, "\r\n" );
	    }
	}

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
}
