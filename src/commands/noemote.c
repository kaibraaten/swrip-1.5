#include "mud.h"
#include "character.h"

void do_noemote( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Noemote whom?\r\n", ch );
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

  if ( IsBitSet(victim->act, PLR_NO_EMOTE) )
    {
      RemoveBit(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can emote again.\r\n", victim );
      send_to_char( "NO_EMOTE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_NO_EMOTE);
      send_to_char( "You can't emote!\r\n", victim );
      send_to_char( "NO_EMOTE set.\r\n", ch );
    }
}
