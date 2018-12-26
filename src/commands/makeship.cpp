#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"
#include "character.hpp"
#include "repos/shiprepository.hpp"

void do_makeship( Character *ch, std::string argument )
{
  std::string arg;

  argument = OneArgument( argument, arg );

  if ( argument.empty() || arg.empty() )
    {
      ch->Echo("Usage: makeship <ship name> <personalname>\r\n");
      return;
    }

  if( !ShipNameAndPersonalnameComboIsUnique( arg, argument ) )
    {
      ch->Echo("&RThere's already another ship with that combination of name and personalname.&d\r\n" );
      return;
    }
  
  std::shared_ptr<Ship> ship = std::make_shared<Ship>();

  ship->Name = arg;
  ship->PersonalName = argument;

  Ships->Add( ship );
  Ships->Save( ship );
}

