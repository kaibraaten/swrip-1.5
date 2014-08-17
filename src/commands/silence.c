#include "character.h"
#include "mud.h"

void do_silence( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Silence whom?", ch );
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
      send_to_char( "Player already silenced, use unsilence to remove.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_SILENCE);
      send_to_char( "You can't use channels!\r\n", victim );
      send_to_char( "SILENCE set.\r\n", ch );
    }
}
