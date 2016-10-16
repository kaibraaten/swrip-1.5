#include "character.h"
#include "mud.h"

/*
 * Simple function to let any imm make any player instantly sober.
 * Saw no need for level restrictions on this.
 * Written by Narn, Apr/96
 */
void do_sober( Character *ch, char *argument )
{
  Character *victim;
  char arg1 [MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc( victim ) )
    {
      SendToCharacter( "Not on mobs.\r\n", ch );
      return;
    }

  if ( victim->PCData )
    victim->PCData->Condition[COND_DRUNK] = 0;

  SendToCharacter( "Ok.\r\n", ch );
  SendToCharacter( "You feel sober again.\r\n", victim );
}
