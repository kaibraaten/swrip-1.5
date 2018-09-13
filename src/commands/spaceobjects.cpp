#include "character.hpp"
#include "mud.hpp"
#include "spaceobject.hpp"
#include "repos/spaceobjectrepository.hpp"

void do_spaceobjects( Character *ch, std::string argument )
{
  int count = 0;

  SetCharacterColor( AT_RED, ch );

  for(const Spaceobject *spaceobject : Spaceobjects->Entities())
    {
      if( spaceobject->Type > SPACE_SUN )
        continue;

      if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
        ch->Echo("%s\r\n", spaceobject->Name.c_str() );

      count++;
    }

  ch->Echo("\r\n" );
  SetCharacterColor( AT_NOTE, ch );

  for(const Spaceobject *spaceobject : Spaceobjects->Entities())
    {
      if( spaceobject->Type != SPACE_PLANET )
	continue;

      if ( !(spaceobject->IsSimulator && (!IsGreater(ch))) )
        ch->Echo("%s\r\n", spaceobject->Name.c_str() );

      count++;
    }

  if ( !count )
    {
      ch->Echo("There are no spaceobjects currently formed.\r\n");
      return;
    }
}

