#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"

void do_makeship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( argument ) || IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: makeship <ship name> <personalname>\r\n", ch );
      return;
    }

  if( !ShipNameAndPersonalnameComboIsUnique( arg, argument ) )
    {
      Echo( ch, "&RThere's already another ship with that combination of name and personalname.&d\r\n" );
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
