#include "character.hpp"
#include "mud.hpp"
#include "spaceobject.hpp"

void do_spaceobjects( Character *ch, std::string argument )
{
  const Spaceobject *spaceobject;
  int count = 0;

  SetCharacterColor( AT_RED, ch );

  for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
    {
      if( spaceobject->Type > SPACE_SUN )
        continue;

      if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
        Echo( ch, "%s\r\n", spaceobject->Name );

      count++;
    }

  Echo( ch, "\r\n" );
  SetCharacterColor( AT_NOTE, ch );

  for ( spaceobject = FirstSpaceobject; spaceobject; spaceobject = spaceobject->Next )
    {
      if( spaceobject->Type != SPACE_PLANET )
	continue;

      if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
        Echo( ch, "%s\r\n", spaceobject->Name );

      count++;
    }

  if ( !count )
    {
      SendToCharacter( "There are no spaceobjects currently formed.\r\n", ch );
      return;
    }
}
