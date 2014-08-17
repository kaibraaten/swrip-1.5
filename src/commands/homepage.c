#include <string.h>
#include "mud.h"
#include "character.h"

void do_homepage( Character *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  if ( IsNpc(ch) )
    return;

  if ( argument[0] == '\0' )
    {
      if ( !ch->pcdata->homepage )
        ch->pcdata->homepage = CopyString( "" );

      ch_printf( ch, "Your homepage is: %s\r\n",
                 ShowTilde( ch->pcdata->homepage ) );
      return;
    }

  if ( !StrCmp( argument, "clear" ) )
    {
      if ( ch->pcdata->homepage )
        FreeMemory(ch->pcdata->homepage);
      ch->pcdata->homepage = CopyString("");
      send_to_char( "Homepage cleared.\r\n", ch );
      return;
    }

  if ( strstr( argument, "://" ) )
    strcpy( buf, argument );
  else
    sprintf( buf, "http://%s", argument );

  if ( strlen(buf) > 70 )
    buf[70] = '\0';

  HideTilde( buf );

  if ( ch->pcdata->homepage )
    FreeMemory(ch->pcdata->homepage);

  ch->pcdata->homepage = CopyString(buf);
  send_to_char( "Homepage set.\r\n", ch );
}
