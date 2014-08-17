#include "shuttle.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_leaveship( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *fromroom = NULL;
  ROOM_INDEX_DATA *toroom = NULL;
  Ship *ship = NULL;
  SHUTTLE_DATA * shuttle = NULL;

  fromroom = ch->in_room;

  if  ( (ship = ship_from_entrance(fromroom->vnum)) != NULL )
    {
      if  ( ship->sclass == SHIP_PLATFORM )
        {
          send_to_char( "You can't do that here.\r\n" , ch );
          return;
        }

      if ( ship->lastdoc != ship->location )
        {
          send_to_char("&rMaybe you should wait until the ship lands.\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_LANDED
	   && ship->shipstate != SHIP_DOCKED
	   && !ship_is_disabled( ship ) )
        {
          send_to_char("&rPlease wait till the ship is properly docked.\r\n",ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          send_to_char("&RYou need to open the hatch first" , ch );
          return;
        }

      if ( ( toroom = get_room_index( ship->location ) ) == NULL )
	{
          send_to_char ( "The exit doesn't seem to be working properly.\r\n", ch );
          return;
        }
    }
  else if  ( (shuttle = shuttle_from_entrance(fromroom->vnum)) != NULL )
    {
      if ( !shuttle->in_room || ( toroom = get_room_index( shuttle->in_room->vnum ) ) == NULL )
        {
          send_to_char ( "The ship hasn't landed yet. Do you want to kill yourself?\r\n", ch );
          return;
        }
    }
  else
    {
      send_to_char( "I see no exit here.\r\n" , ch );
      return;
    }

  act( AT_PLAIN, "$n exits the ship.", ch, NULL, NULL, TO_ROOM );
  act( AT_PLAIN, "You exit the ship.", ch, NULL, NULL, TO_CHAR );
  char_from_room( ch );
  char_to_room( ch , toroom );
  act( AT_PLAIN, "$n steps out of a ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
