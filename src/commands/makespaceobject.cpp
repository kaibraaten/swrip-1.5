#include "mud.hpp"
#include "spaceobject.hpp"
#include "character.hpp"

void do_makespaceobject( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo("Usage: makespaceobject <spaceobject name>\r\n");
      return;
    }

  if( GetSpaceobject( argument ) )
    {
      ch->Echo("&RThere's already another spaceobject with that name.&d\r\n" );
      return;
    }

  Spaceobject *spaceobject = new Spaceobject();
  spaceobject->Name = argument;
  Spaceobjects->Add(spaceobject);
  Spaceobjects->Save(spaceobject);
}

