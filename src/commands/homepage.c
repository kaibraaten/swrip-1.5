#include <string.h>
#include "mud.h"

void do_homepage( CHAR_DATA *ch, char *argument )
{
  char buf[MAX_STRING_LENGTH];

  if ( IS_NPC(ch) )
    return;

  if ( argument[0] == '\0' )
    {
      if ( !ch->pcdata->homepage )
        ch->pcdata->homepage = str_dup( "" );

      ch_printf( ch, "Your homepage is: %s\r\n",
                 show_tilde( ch->pcdata->homepage ) );
      return;
    }

  if ( !str_cmp( argument, "clear" ) )
    {
      if ( ch->pcdata->homepage )
        DISPOSE(ch->pcdata->homepage);
      ch->pcdata->homepage = str_dup("");
      send_to_char( "Homepage cleared.\r\n", ch );
      return;
    }

  if ( strstr( argument, "://" ) )
    strcpy( buf, argument );
  else
    sprintf( buf, "http://%s", argument );

  if ( strlen(buf) > 70 )
    buf[70] = '\0';

  hide_tilde( buf );

  if ( ch->pcdata->homepage )
    DISPOSE(ch->pcdata->homepage);

  ch->pcdata->homepage = str_dup(buf);
  send_to_char( "Homepage set.\r\n", ch );
}
