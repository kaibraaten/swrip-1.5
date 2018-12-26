#include "mud.hpp"
#include "spaceobject.hpp"
#include "character.hpp"
#include "repos/spaceobjectrepository.hpp"

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

  std::shared_ptr<Spaceobject> spaceobject = std::make_shared<Spaceobject>();
  spaceobject->Name = argument;
  Spaceobjects->Add(spaceobject);
  Spaceobjects->Save(spaceobject);
}

