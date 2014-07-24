#include "ships.h"
#include "mud.h"
#include "character.h"

void do_openhatch(Character *ch, char *argument )
{
  SHIP_DATA *ship;
  char buf[MAX_STRING_LENGTH];

  if ( !argument || argument[0] == '\0' || !str_cmp(argument,"hatch") )
    {
      ship = ship_from_entrance( ch->in_room->vnum );
      if( ship == NULL)
        {
          send_to_char( "&ROpen what?\r\n", ch );
          return;
        }
      else
        {
          if ( !ship->hatchopen)
            {

              if  ( ship->sclass == SHIP_PLATFORM )
                {
                  send_to_char( "&RTry one of the docking bays!\r\n" , ch );
                  return;
                }
              if ( ship->location != ship->lastdoc ||
		   ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) ) )
                {
                  send_to_char("&RPlease wait till the ship lands!\r\n",ch);
                  return;
                }
              ship->hatchopen = TRUE;
              send_to_char("&GYou open the hatch.\r\n",ch);
              act( AT_PLAIN, "$n opens the hatch.", ch, NULL, argument, TO_ROOM );
              sprintf( buf , "The hatch on %s opens." , ship->name);
              echo_to_room( AT_YELLOW , get_room_index(ship->location) , buf );
              sound_to_room( get_room_index(ship->room.entrance) , "!!SOUND(door)" );
              sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
              return;
            }
          else
            {
              send_to_char("&RIt's already open.\r\n",ch);
              return;
            }
        }
    }

  ship = ship_in_room( ch->in_room , argument );
  if ( !ship )
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ship->shipstate != SHIP_LANDED && !ship_is_disabled( ship ) )
    {
      send_to_char( "&RThat ship has already started to launch",ch);
      return;
    }

  if ( ! check_pilot(ch,ship) )
    {
      send_to_char("&RHey! Thats not your ship!\r\n",ch);
      return;
    }

  if ( !ship->hatchopen)
    {
      ship->hatchopen = TRUE;
      act( AT_PLAIN, "You open the hatch on $T.", ch, NULL, ship->name, TO_CHAR );
      act( AT_PLAIN, "$n opens the hatch on $T.", ch, NULL, ship->name, TO_ROOM );
      echo_to_room( AT_YELLOW , get_room_index(ship->room.entrance) , "The hatch opens from the outside." );
      sound_to_room( get_room_index(ship->room.entrance) , "!!SOUND(door)" );
      sound_to_room( get_room_index(ship->location) , "!!SOUND(door)" );
      return;
    }

  send_to_char("&GIts already open!\r\n",ch);
}
