#include "mud.h"
#include "character.h"

/* lets the mobile do a command at another location. Very useful */

void do_mpat( Character *ch, char *argument )
{
  char             arg[ MAX_INPUT_LENGTH ];
  ROOM_INDEX_DATA *location;
  ROOM_INDEX_DATA *original;
  Character       *wch;

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }

  argument = one_argument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      progbug( "Mpat - Bad argument", ch );
      return;
    }

  if ( ( location = find_location( ch, arg ) ) == NULL )
    {
      progbug( "Mpat - No such location", ch );
      return;
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
    if ( wch == ch )
      {
        char_from_room( ch );
        char_to_room( ch, original );
        break;
      }
}
