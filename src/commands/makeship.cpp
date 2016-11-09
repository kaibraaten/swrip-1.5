#include "ship.hpp"
#include "mud.hpp"
#include "turret.hpp"

void do_makeship( Character *ch, std::string argument )
{
  Ship *ship = NULL;
  char arg[MAX_INPUT_LENGTH];
  int turret_num = 0;

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
  
  AllocateMemory( ship, Ship, 1 );
  LINK( ship, FirstShip, LastShip, Next, Previous );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->WeaponSystems.Turret[turret_num] = AllocateTurret( ship );
    }

  ship->Name            = CopyString( arg );
  ship->PersonalName            = CopyString( argument );
  ship->Description     = CopyString( "" );
  ship->Owner   = CopyString( "" );
  ship->CoPilot       = CopyString( "" );
  ship->Pilot         = CopyString( "" );
  ship->Home          = CopyString( "" );
  ship->Type          = SHIP_CIVILIAN;

  SaveShip( ship );
}
