#include "character.h"
#include "mud.h"

void do_rank( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: rank <string>.\r\n", ch );
      send_to_char( "   or: rank none.\r\n", ch );
      return;
    }

  SmashTilde( argument );
  FreeMemory( ch->pcdata->rank );

  if ( !StrCmp( argument, "none" ) )
    ch->pcdata->rank = CopyString( "" );
  else
    ch->pcdata->rank = CopyString( argument );

  send_to_char( "Ok.\r\n", ch );
}
