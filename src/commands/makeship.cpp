#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"
#include "character.hpp"

void do_makeship( Character *ch, std::string argument )
{
  Ship *ship = NULL;
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
  
  ship = new Ship();

  ship->Name = arg;
  ship->PersonalName = argument;

  Ships->Add( ship );
  Ships->Save( ship );
}

