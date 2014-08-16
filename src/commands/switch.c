#include "character.h"
#include "mud.h"

void do_switch( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Switch into whom?\r\n", ch );
      return;
    }

  if ( !ch->desc )
    return;

  if ( ch->desc->original )
    {
      send_to_char( "You are already switched.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Ok.\r\n", ch );
      return;
    }

  if ( victim->desc )
    {
      send_to_char( "Character in use.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      send_to_char( "You cannot switch into a player!\r\n", ch );
      return;
    }

  ch->desc->character = victim;
  ch->desc->original  = ch;
  victim->desc        = ch->desc;
  ch->desc            = NULL;
  ch->switched  = victim;
  send_to_char( "Ok.\r\n", victim );
}
