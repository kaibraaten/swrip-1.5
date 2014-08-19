#include "mud.h"
#include "character.h"

/* lets the mobile do a command at another location. Very useful */

void do_mpat( Character *ch, char *argument )
{
  char             arg[ MAX_INPUT_LENGTH ];
  Room *location;
  Room *original;
  Character       *wch;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) )
    {
      SendToCharacter( "Huh?\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      ProgBug( "Mpat - Bad argument", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      ProgBug( "Mpat - No such location", ch );
      return;
    }

  original = ch->in_room;
  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
  interpret( ch, argument );

  /*
   * See if 'ch' still exists before continuing!
   * Handles 'at XXXX quit' case.
   */
  for ( wch = first_char; wch; wch = wch->next )
    if ( wch == ch )
      {
        CharacterFromRoom( ch );
        CharacterToRoom( ch, original );
        break;
      }
}
