#include "mud.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "repos/shuttlerepository.hpp"

void do_makeshuttle (std::shared_ptr<Character> ch, std::string argument)
{
  std::shared_ptr<Shuttle> shuttle;

  if ( argument.empty() )
    {
      ch->Echo("Usage: makeshuttle <shuttle name>\r\n");
      return;
    }

  if( Shuttles->FindByName( argument ) )
    {
      ch->Echo("&RThere's already another shuttle with that name.\r\n" );
      return;
    }
  
  shuttle = NewShuttle(argument);

  if (shuttle)
    ch->Echo("&GShuttle created.&d\r\n" );
  else
    ch->Echo("&GShuttle failed to create.&d\r\n" );
}
