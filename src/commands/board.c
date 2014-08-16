#include "character.h"
#include "shuttle.h"
#include "ships.h"
#include "mud.h"

void do_board( Character *ch, char *argument )
{
  ROOM_INDEX_DATA *toroom;
  SHIP_DATA *ship;
  char * name = NULL;
  SHUTTLE_DATA *shuttle;

  if ( !argument || argument[0] == '\0')
    {
      send_to_char( "Board what?\r\n", ch );
      return;
    }

  if ( IS_SET( ch->act, ACT_MOUNTED ) && IsNpc(ch))
    {
      act( AT_PLAIN, "You can't go in there riding THAT.", ch, NULL, argument, TO_CHAR );
      return;
    }

  if ( ( ship = ship_in_room( ch->in_room , argument ) ) != NULL )
    {

      if ( ( toroom = get_room_index( ship->room.entrance ) ) == NULL )
        {
          send_to_char("That ship has no entrance!\r\n", ch);
          return;
        }

      if ( ! ship->hatchopen )
        {
          send_to_char( "&RThe hatch is closed!\r\n", ch);
	  return;
        }

      if ( ship->shipstate == SHIP_LAUNCH || ship->shipstate == SHIP_LAUNCH_2 )
        {
          send_to_char("&rThat ship has already started launching!\r\n",ch);
          return;
        }

      name = ship->name;

    }
  else if ( ( shuttle = shuttle_in_room( ch->in_room , argument ) ) != NULL )
    {
      name = shuttle->name;
      if ( ( toroom = get_room_index( shuttle->room.entrance ) ) == NULL )
        {
          send_to_char("That ship has no entrance!\r\n", ch);
          return;
        }
    }
  else
    {
      act( AT_PLAIN, "I see no $T here.", ch, NULL, argument, TO_CHAR );
      return;
    }
  if ( toroom == NULL )
    {
      send_to_char ("Error", ch);
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
              send_to_char( "There is no room for you in there.\r\n", ch );
              return;
            }
        }
    }

  act( AT_PLAIN, "$n enters $T.", ch, NULL, name , TO_ROOM );
  act( AT_PLAIN, "You enter $T.", ch, NULL, name , TO_CHAR );
  char_from_room( ch );
  char_to_room( ch , toroom );
  act( AT_PLAIN, "$n enters the ship.", ch, NULL, NULL , TO_ROOM );
  do_look( ch , "auto" );
}
