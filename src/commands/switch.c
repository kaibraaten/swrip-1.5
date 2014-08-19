#include "character.h"
#include "mud.h"

void do_switch( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Switch into whom?\r\n", ch );
      return;
    }

  if ( !ch->desc )
    return;

  if ( ch->desc->original )
    {
      SendToCharacter( "You are already switched.\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( victim->desc )
    {
      SendToCharacter( "Character in use.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      SendToCharacter( "You cannot switch into a player!\r\n", ch );
      return;
    }

  ch->desc->character = victim;
  ch->desc->original  = ch;
  victim->desc        = ch->desc;
  ch->desc            = NULL;
  ch->switched  = victim;
  SendToCharacter( "Ok.\r\n", victim );
}
