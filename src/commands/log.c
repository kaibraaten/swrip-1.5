#include "character.h"
#include "mud.h"

void do_log( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Log whom?\r\n", ch );
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      if ( fLogAll )
        {
          fLogAll = false;
          SendToCharacter( "Log ALL off.\r\n", ch );
        }
      else
        {
          fLogAll = true;
          SendToCharacter( "Log ALL on.\r\n", ch );
        }
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      SendToCharacter( "Not on NPC's.\r\n", ch );
      return;
    }

  /*
   * No level check, gods can log anyone.
   */
  if ( IsBitSet(victim->act, PLR_LOG) )
    {
      RemoveBit(victim->act, PLR_LOG);
      SendToCharacter( "LOG removed.\r\n", ch );
    }
  else
    {
      SetBit(victim->act, PLR_LOG);
      SendToCharacter( "LOG set.\r\n", ch );
    }
}
