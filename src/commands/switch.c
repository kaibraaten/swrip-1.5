#include "character.h"
#include "mud.h"

void do_switch( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Switch into whom?\r\n", ch );
      return;
    }

  if ( !ch->Desc )
    return;

  if ( ch->Desc->original )
    {
      SendToCharacter( "You are already switched.\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Ok.\r\n", ch );
      return;
    }

  if ( victim->Desc )
    {
      SendToCharacter( "Character in use.\r\n", ch );
      return;
    }

  if ( !IsNpc(victim) && GetTrustLevel(ch) < LEVEL_GREATER )
    {
      SendToCharacter( "You cannot switch into a player!\r\n", ch );
      return;
    }

  ch->Desc->character = victim;
  ch->Desc->original  = ch;
  victim->Desc        = ch->desc;
  ch->Desc            = NULL;
  ch->Switched  = victim;
  SendToCharacter( "Ok.\r\n", victim );
}
