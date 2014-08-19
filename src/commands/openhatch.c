#include "ships.h"
#include "mud.h"
#include "character.h"

void do_openhatch(Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( !argument || argument[0] == '\0' || !StrCmp(argument,"hatch") )
    {
      ship = GetShipFromEntrance( ch->in_room->vnum );
      if( ship == NULL)
        {
          SendToCharacter( "&ROpen what?\r\n", ch );
          return;
        }
      else
        {
          if ( !ship->hatchopen)
            {

              if  ( ship->sclass == SHIP_PLATFORM )
                {
                  SendToCharacter( "&RTry one of the docking bays!\r\n" , ch );
                  return;
                }
              if ( ship->location != ship->lastdoc ||
		   ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) ) )
                {
                  SendToCharacter("&RPlease wait till the ship lands!\r\n",ch);
                  return;
                }
              ship->hatchopen = true;
              SendToCharacter("&GYou open the hatch.\r\n",ch);
              Act( AT_PLAIN, "$n opens the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s opens." , ship->name);
              EchoToRoom( AT_YELLOW , GetRoom(ship->location) , buf );
              return;
            }
          else
            {
              SendToCharacter("&RIt's already open.\r\n",ch);
              return;
            }
        }
    }

  ship = GetShipInRoom( ch->in_room , argument );
  if ( !ship )
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      SendToCharacter( "&RThat ship has already started to launch",ch);
      return;
    }

  if ( ! CheckPilot(ch,ship) )
    {
      SendToCharacter("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( !ship->hatchopen)
    {
      ship->hatchopen = true;
      Act( AT_PLAIN, "You open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
      Act( AT_PLAIN, "$n opens the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
      EchoToRoom( AT_YELLOW , GetRoom(ship->room.entrance) , "The hatch opens from the outside." );
      return;
    }

  SendToCharacter("&GIt's already open!\r\n",ch);
}
