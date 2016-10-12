#include "character.h"
#include "mud.h"

void do_rank( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: rank <string>.\r\n", ch );
      SendToCharacter( "   or: rank none.\r\n", ch );
      return;
    }

  SmashTilde( argument );
  FreeMemory( ch->PCData->rank );

  if ( !StrCmp( argument, "none" ) )
    ch->PCData->rank = CopyString( "" );
  else
    ch->PCData->rank = CopyString( argument );

  SendToCharacter( "Ok.\r\n", ch );
}
