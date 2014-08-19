#include "shuttle.h"
#include "mud.h"
#include "ships.h"
#include "character.h"

void do_leaveship( Character *ch, char *argument )
{
  Room *fromroom = NULL;
  Room *toroom = NULL;
  Ship *ship = NULL;
  Shuttle * shuttle = NULL;

  fromroom = ch->in_room;

  if  ( (ship = GetShipFromEntrance(fromroom->vnum)) != NULL )
    {
      if  ( ship->sclass == SHIP_PLATFORM )
        {
          SendToCharacter( "You can't do that here.\r\n" , ch );
          return;
        }

      if ( ship->lastdoc != ship->location )
        {
          SendToCharacter("&rMaybe you should wait until the ship lands.\r\n",ch);
          return;
        }

      if ( ship->shipstate != SHIP_LANDED
	   && ship->shipstate != SHIP_DOCKED
	   && !IsShipDisabled( ship ) )
        {
          SendToCharacter("&rPlease wait till the ship is properly docked.\r\n",ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          SendToCharacter("&RYou need to open the hatch first" , ch );
          return;
        }

      if ( ( toroom = get_room_index( ship->location ) ) == NULL )
	{
          SendToCharacter ( "The exit doesn't seem to be working properly.\r\n", ch );
          return;
        }
    }
  else if  ( (shuttle = GetShuttleFromEntrance(fromroom->vnum)) != NULL )
    {
      if ( !shuttle->in_room || ( toroom = get_room_index( shuttle->in_room->vnum ) ) == NULL )
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
  char_from_room( ch );
  char_to_room( ch , toroom );
  Act( AT_PLAIN, "$n steps out of a ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
