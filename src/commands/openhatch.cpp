#include "ship.hpp"
#include "mud.hpp"
#include "character.hpp"

void do_openhatch(Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( IsNullOrEmpty( argument ) || !StrCmp(argument,"hatch") )
    {
      ship = GetShipFromEntrance( ch->InRoom->Vnum );

      if( ship == NULL)
        {
          SendToCharacter( "&ROpen what?\r\n", ch );
          return;
        }
      else
        {
          if ( !ship->HatchOpen)
            {

              if  ( ship->Class == SHIP_PLATFORM )
                {
                  SendToCharacter( "&RTry one of the docking bays!\r\n" , ch );
                  return;
                }
              if ( ship->Location != ship->LastDock ||
		   ( ship->State != SHIP_LANDED && !IsShipDisabled( ship ) ) )
                {
                  SendToCharacter("&RPlease wait till the ship lands!\r\n",ch);
                  return;
                }
              ship->HatchOpen = true;
              SendToCharacter("&GYou open the hatch.\r\n",ch);
              Act( AT_PLAIN, "$n opens the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s opens." , ship->Name);
              EchoToRoom( AT_YELLOW , GetRoom(ship->Location) , buf );
              return;
            }
          else
            {
              SendToCharacter("&RIt's already open.\r\n",ch);
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

  if ( ! CheckPilot(ch,ship) )
    {
      SendToCharacter("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( !ship->HatchOpen)
    {
      ship->HatchOpen = true;
      Act( AT_PLAIN, "You open the hatch on $T.", ch, NULL, ship->Name, TO_CHAR );
      Act( AT_PLAIN, "$n opens the hatch on $T.", ch, NULL, ship->Name, TO_ROOM );
      EchoToRoom( AT_YELLOW , GetRoom(ship->Rooms.Entrance), "The hatch opens from the outside." );
      return;
    }

  SendToCharacter("&GIt's already open!\r\n",ch);
}
