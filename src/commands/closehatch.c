#include "character.h"
#include "ships.h"
#include "mud.h"

void do_closehatch(Character *ch, char *argument )
{
  Ship *ship;
  char buf[MAX_STRING_LENGTH];

  if ( !argument || argument[0] == '\0' || !StrCmp(argument,"hatch") )
    {
      ship = GetShipFromEntrance( ch->in_room->vnum );
      if( ship == NULL)
        {
          send_to_char( "&RClose what?\r\n", ch );
          return;
        }
      else
        {

          if  ( ship->sclass == SHIP_PLATFORM )
            {
              send_to_char( "&RTry one of the docking bays!\r\n" , ch );
              return;
            }
          if ( ship->hatchopen)
            {
              ship->hatchopen = false;
	      send_to_char("&GYou close the hatch.\r\n",ch);
              act( AT_PLAIN, "$n closes the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s closes." , ship->name);
              EchoToRoom( AT_YELLOW , get_room_index(ship->location) , buf );
              return;
            }
          else
            {
              send_to_char("&RIt's already closed.\r\n",ch);
              return;
            }
        }
    }

  ship = GetShipInRoom( ch->in_room , argument );

  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !IsShipDisabled( ship ) )
    {
      send_to_char( "&RThat ship has already started to launch",ch);
      return;
    }
  else
    {
      if(ship->hatchopen)
        {
          ship->hatchopen = false;
          act( AT_PLAIN, "You close the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
          act( AT_PLAIN, "$n closes the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
          EchoToRoom( AT_YELLOW , get_room_index(ship->room.entrance) , "The hatch is closed from outside.");
          return;
        }
      else
        {
          send_to_char("&RIts already closed.\r\n",ch);
	  return;
        }
    }
}
