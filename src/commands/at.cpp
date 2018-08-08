#include "mud.hpp"
#include "character.hpp"

void do_at( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Room *location = NULL;
  Room *original = NULL;
  Character *wch = NULL;

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) || IsNullOrEmpty( argument ) )
    {
      ch->Echo( "At where what?\r\n" );
      return;
    }

  if ( ( location = FindLocation( ch, arg ) ) == NULL )
    {
      ch->Echo( "No such location.\r\n" );
      return;
    }

  if ( GetTrustLevel( ch ) < LEVEL_GREATER )
    {
      if ( IsRoomPrivate( ch, location ) )
        {
          ch->Echo( "That room is private right now.\r\n" );
          return;
        }
    }

  if ( IsRoomPrivate( ch, location ) )
    {
      ch->Echo( "Overriding private flag!\r\n" );
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
    {
      if ( wch == ch )
        {
          CharacterFromRoom( ch );
          CharacterToRoom( ch, original );
          break;
        }
    }
}

