#include "mud.h"
#include "character.h"

void do_unsilence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Unsilence whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->act, PLR_SILENCE) )
    {
      RemoveBit(victim->act, PLR_SILENCE);
      send_to_char( "You can use channels again.\r\n", victim );
      send_to_char( "SILENCE removed.\r\n", ch );
    }
  else
    {
      send_to_char( "That player is not silenced.\r\n", ch );
    }
}
