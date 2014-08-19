#include "character.h"
#include "shuttle.h"
#include "ships.h"
#include "mud.h"

void do_board( Character *ch, char *argument )
{
  Room *toroom;
  Ship *ship;
  char * name = NULL;
  Shuttle *shuttle;

  if ( !argument || argument[0] == '\0')
    {
      SendToCharacter( "Board what?\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->act, ACT_MOUNTED ) && IsNpc(ch))
    {
      Act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ( ship = GetShipInRoom( ch->in_room , argument ) ) != NULL )
    {

      if ( ( toroom = get_room_index( ship->room.entrance ) ) == NULL )
        {
          SendToCharacter("That ship has no entrance!\r\n", ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          SendToCharacter( "&RThe hatch is closed!\r\n", ch);
	  return;
        }

      if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
        {
          SendToCharacter("&rThat ship has already started launching!\r\n",ch);
          return;
        }

      name = ship->name;

    }
  else if ( ( shuttle = GetShuttleInRoom( ch->in_room , argument ) ) != NULL )
    {
      name = shuttle->name;
      if ( ( toroom = get_room_index( shuttle->room.entrance ) ) == NULL )
        {
          SendToCharacter("That ship has no entrance!\r\n", ch);
          return;
        }
    }
  else
    {
      Act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }
  if ( toroom == NULL )
    {
      SendToCharacter ("Error", ch);
      return;
    }

  if ( toroom->tunnel > 0 )
    {
      Character *ctmp;
      int count = 0;

      for ( ctmp = toroom->first_person; ctmp; ctmp = ctmp->next_in_room )
        {
          if ( ++count >= toroom->tunnel )
            {
              SendToCharacter( "There is no room for you in there.\r\n", ch );
              return;
            }
        }
    }

  Act( AT_PLAIN, "$n enters $T.", ch, NULL, name , TO_ROOM );
  Act( AT_PLAIN, "You enter $T.", ch, NULL, name , TO_CHAR );
  char_from_room( ch );
  char_to_room( ch , toroom );
  Act( AT_PLAIN, "$n enters the ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
