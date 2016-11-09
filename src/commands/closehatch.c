#include "character.hpp"
#include "ship.h"
#include "mud.h"

void do_closehatch(Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( IsNullOrEmpty( argument ) || !StrCmp(argument,"hatch") )
    {
      ship = GetShipFromEntrance( ch->InRoom->Vnum );

      if( ship == NULL)
        {
          SendToCharacter( "&RClose what?\r\n", ch );
          return;
        }
      else
        {

          if  ( ship->Class == SHIP_PLATFORM )
            {
              SendToCharacter( "&RTry one of the docking bays!\r\n" , ch );
              return;
            }

	  if ( ship->HatchOpen)
            {
              ship->HatchOpen = false;
	      SendToCharacter("&GYou close the hatch.\r\n",ch);
              Act( AT_PLAIN, "$n closes the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s closes." , ship->Name);
              EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
              return;
            }
          else
            {
              SendToCharacter("&RIt's already closed.\r\n",ch);
              return;
            }
        }
    }

  ship = GetShipInRoom( ch->InRoom , argument );

  if ( !ship )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->State != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      SendToCharacter( "&RThat ship has already started to launch",ch);
      return;
    }
  else
    {
      if(ship->HatchOpen)
        {
          ship->HatchOpen = false;
          Act( AT_PLAIN, "You close the hatch on $T.", ch, NULL, ship->Name, TO_CHAR );
          Act( AT_PLAIN, "$n closes the hatch on $T.", ch, NULL, ship->Name, TO_ROOM );
          EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Entrance) , "The hatch is closed from outside.");
          return;
        }
      else
        {
          SendToCharacter("&RIts already closed.\r\n",ch);
	  return;
        }
    }
}
