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

  if( IsBadName( argument ) )
    {
      AddBadName( argument );
      SendToCharacter("Name successfully added to the badname list.\r\n",ch);
    }
  else
    {
      SendToCharacter("That name is already in the badname list.\r\n",ch);
    }
}
