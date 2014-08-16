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

  smash_tilde( argument );
  DISPOSE( ch->pcdata->rank );

  if ( !str_cmp( argument, "none" ) )
    ch->pcdata->rank = str_dup( "" );
  else
    ch->pcdata->rank = str_dup( argument );

  send_to_char( "Ok.\r\n", ch );
}
