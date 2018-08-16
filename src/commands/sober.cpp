#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

/*
 * Simple function to let any imm make any player instantly sober.
 * Saw no need for level restrictions on this.
 * Written by Narn, Apr/96
 */
void do_sober( Character *ch, char *argument )
{
  Character *victim = NULL;
  char arg1 [MAX_INPUT_LENGTH];

  SmashTilde( argument );
  argument = OneArgument( argument, arg1 );

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc( victim ) )
    {
      ch->Echo("Not on mobs.\r\n");
      return;
    }

  if ( victim->PCData )
    victim->PCData->Condition[COND_DRUNK] = 0;

  ch->Echo("Ok.\r\n");
  victim->Echo("You feel sober again.\r\n");
}
