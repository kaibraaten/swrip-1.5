#include "character.h"
#include "mud.h"

void do_spaceobjects( Character *ch, char *argument )
{
  Spaceobject *spaceobject;
  int count = 0;

  SetCharacterColor( AT_RED, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type > SPACE_SUN )
        continue;

      if ( !(spaceobject->trainer && (!IsGreater(ch))) )
        ChPrintf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  ChPrintf( ch, "\r\n" );
  SetCharacterColor( AT_NOTE, ch );

  for ( spaceobject = first_spaceobject; spaceobject; spaceobject = spaceobject->next )
    {
      if( spaceobject->type != SPACE_PLANET )
	continue;

      if ( !(spaceobject->trainer && (!IsGreater(ch))) )
        ChPrintf( ch, "%s\r\n", spaceobject->name );

      count++;
    }

  if ( !count )
    {
      SendToCharacter( "There are no spaceobjects currently formed.\r\n", ch );
      return;
    }
}
