#include "mud.h"
#include "character.h"

void do_at( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  ROOM_INDEX_DATA *location = NULL;
  ROOM_INDEX_DATA *original = NULL;
  Character *wch = NULL;

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      send_to_char( "At where what?\r\n", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      send_to_char( "No such location.\r\n", ch );
      return;
    }

  if ( get_trust( ch ) < LEVEL_GREATER )
    {
      if ( room_is_private( ch, location ) )
        {
          send_to_char( "That room is private right now.\r\n", ch );
          return;
        }
    }

  if ( room_is_private( ch, location ) )
    {
      send_to_char( "Overriding private flag!\r\n", ch );
    }

  original = ch->in_room;
  char_from_room( ch );
  char_to_room( ch, location );
  interpret( ch, argument );

  /*
   * See if 'ch' still exists before continuing!
   * Handles 'at XXXX quit' case.
   */
  for ( wch = first_char; wch; wch = wch->next )
    {
      if ( wch == ch )
        {
          char_from_room( ch );
          char_to_room( ch, original );
          break;
        }
    }
}
