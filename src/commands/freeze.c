#include "character.h"
#include "mud.h"

void do_freeze( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Freeze whom?\r\n", ch );
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

  if ( IsBitSet(victim->act, PLR_FREEZE) )
    {
      RemoveBit(victim->act, PLR_FREEZE);
      send_to_char( "You can play again.\r\n", victim );
      send_to_char( "FREEZE removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_FREEZE);
      send_to_char( "You can't do ANYthing!\r\n", victim );
      send_to_char( "FREEZE set.\r\n", ch );
    }

  save_char_obj( victim );
}
