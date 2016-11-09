#include "shuttle.h"
#include "mud.h"
#include "ship.h"
#include "character.hpp"

void do_leaveship( Character *ch, char *argument )
{
  Room *fromroom = NULL;
  Room *toroom = NULL;
  Ship *ship = NULL;
  Shuttle * shuttle = NULL;

  fromroom = ch->InRoom;

  if  ( (ship = GetShipFromEntrance(fromroom->Vnum)) != NULL )
    {
      if  ( ship->Class == SHIP_PLATFORM )
        {
          SendToCharacter( "You can't do that here.\r\n" , ch );
          return;
        }

      if ( ship->LastDock != ship->Location )
        {
          SendToCharacter("&rMaybe you should wait until the ship lands.\r\n",ch);
          return;
        }

      if ( ship->State != SHIP_LANDED
	   && ship->State != SHIP_DOCKED
	   && !IsShipDisabled( ship ) )
        {
          SendToCharacter("&rPlease wait till the ship is properly docked.\r\n",ch);
          return;
        }

      if ( !ship->HatchOpen )
        {
          SendToCharacter("&RYou need to open the hatch first" , ch );
          return;
        }

      if ( ( toroom = GetRoom( ship->Location ) ) == NULL )
	{
          SendToCharacter ( "The exit doesn't seem to be working properly.\r\n", ch );
          return;
        }
    }
  else if  ( (shuttle = GetShuttleFromEntrance(fromroom->Vnum)) != NULL )
    {
      if ( !shuttle->InRoom || ( toroom = GetRoom( shuttle->InRoom->Vnum ) ) == NULL )
        {
          SendToCharacter ( "The ship hasn't landed yet. Do you want to kill yourself?\r\n", ch );
          return;
        }
    }
  else
    {
      SendToCharacter( "I see no exit here.\r\n" , ch );
      return;
    }

  Act( AT_PLAIN, "$n exits the ship.", ch, NULL, NULL, TO_ROOM );
  Act( AT_PLAIN, "You exit the ship.", ch, NULL, NULL, TO_CHAR );
  CharacterFromRoom( ch );
  CharacterToRoom( ch , toroom );
  Act( AT_PLAIN, "$n steps out of a ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
