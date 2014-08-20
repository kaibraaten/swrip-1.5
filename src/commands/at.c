#include "mud.h"
#include "character.h"

void do_at( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Room *original = NULL;
  Character *wch = NULL;

  argument = OneArgument( argument, arg );

  if ( arg[0] == '\0' || argument[0] == '\0' )
    {
      SendToCharacter( "At where what?\r\n", ch );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      SendToCharacter( "No such location.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      if ( IsRoomPrivate( ch, location ) )
        {
          SendToCharacter( "That room is private right now.\r\n", ch );
          return;
        }
    }

  if ( IsRoomPrivate( ch, location ) )
    {
      SendToCharacter( "Overriding private flag!\r\n", ch );
    }

  original = ch->in_room;
  CharacterFromRoom( ch );
  CharacterToRoom( ch, location );
  Interpret( ch, argument );

  /*
   * See if 'ch' still exists before continuing!
   * Handles 'at XXXX quit' case.
   */
  for ( wch = first_char; wch; wch = wch->next )
    {
      if ( wch == ch )
        {
          CharacterFromRoom( ch );
          CharacterToRoom( ch, original );
          break;
        }
    }
}
