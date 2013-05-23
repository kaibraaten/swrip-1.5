#include "character.h"
#include "mud.h"

void do_spaceobjects( CHAR_DATA *ch, char *argument )
{
  SPACE_DATA *spaceobject;
  int count = 0;

  set_char_color( AT_RED, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type > SPACE_SUN )
        continue;

      if ( !(spaceobject->trainer && (!IS_GOD(ch))) )
        ch_printf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  ch_printf( ch, "\r\n" );
  set_char_color( AT_NOTE, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type != SPACE_PLANET )
	continue;

      if ( !(spaceobject->trainer && (!IS_GOD(ch))) )
        ch_printf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  if ( !count )
    {
      send_to_char( "There are no spaceobjects currently formed.\r\n", ch );
      return;
    }
}
