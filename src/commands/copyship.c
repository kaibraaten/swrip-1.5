#include "turret.h"
#include "ship.h"
#include "mud.h"

void do_copyship( Character *ch, char *argument )
{
  Ship *ship = NULL;
  Ship *old = NULL;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int turret_num = 0;

  argument = OneArgument( argument, arg );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: copyship <oldshipname> <filename> <newshipname>\r\n", ch );
      return;
    }

  old = GetShipAnywhere ( arg );

  if (!old)
    {
      SendToCharacter( "Thats not a ship!\r\n", ch );
      return;
    }

  AllocateMemory( ship, Ship, 1 );
  LINK( ship, first_ship, last_ship, next, prev );

  for( turret_num = 0; turret_num < MAX_NUMBER_OF_TURRETS_IN_SHIP; ++turret_num )
    {
      ship->turret[turret_num] = AllocateTurret( ship );
    }

  ship->Name            = CopyString( argument );
  ship->Description     = CopyString( "" );
  ship->owner   = CopyString( "" );
  ship->copilot       = CopyString( "" );
  ship->pilot         = CopyString( "" );
  ship->home          = CopyString( "" );
  ship->type          = old->type;
  ship->sclass         = old->sclass;
  ship->lasers        = old->lasers;
  ship->maxshield        = old->maxshield;
  ship->maxhull        = old->maxhull;
  ship->maxenergy        = old->maxenergy  ;
  ship->hyperspeed        = old->hyperspeed  ;
  ship->realspeed        = old->realspeed  ;
  ship->manuever        = old->manuever  ;

  ship->filename         = CopyString(arg2);
  SaveShip( ship );
  WriteShipList();
}
