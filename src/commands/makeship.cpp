#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"
#include "character.hpp"

void do_makeship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( argument ) || IsNullOrEmpty( arg ) )
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
  Ships->Add(ship);

  ship->Name            = CopyString( arg );
  ship->PersonalName            = CopyString( argument );
  ship->Description     = CopyString( "" );
  ship->Owner   = CopyString( "" );
  ship->CoPilot       = CopyString( "" );
  ship->Pilot         = CopyString( "" );
  ship->Home          = CopyString( "" );
  ship->Type          = SHIP_CIVILIAN;

  Ships->Save(ship);
}

