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

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ProgBug( "Mpat - Bad argument", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      ProgBug( "Mpat - No such location", ch );
      return;
    }

  original = ch->InRoom;
  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
  Interpret( ch, argument );

  /*
   * See if 'ch' still exists before continuing!
   * Handles 'at XXXX quit' case.
   */
  for ( wch = FirstCharacter; wch; wch = wch->Next )
    if ( wch == ch )
      {
        CharacterFromRoom( ch );
        CharacterToRoom( ch, original );
        break;
      }
}
