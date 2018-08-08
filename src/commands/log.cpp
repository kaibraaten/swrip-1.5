#include "character.hpp"
#include "mud.hpp"

void do_log( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Log whom?\r\n");
      return;
    }

  if ( !StrCmp( arg, "all" ) )
    {
      if ( fLogAll )
        {
          fLogAll = false;
          ch->Echo("Log ALL off.\r\n");
        }
      else
        {
          fLogAll = true;
          ch->Echo("Log ALL on.\r\n");
        }
      return;
    }

  if ( ( victim = GetCharacterAnywhere( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( IsNpc(victim) )
    {
      ch->Echo("Not on NPC's.\r\n");
      return;
    }

  /*
   * No level check, gods can log anyone.
   */
  if ( IsBitSet(victim->Flags, PLR_LOG) )
    {
      RemoveBit(victim->Flags, PLR_LOG);
      ch->Echo("LOG removed.\r\n");
    }
  else
    {
      SetBit(victim->Flags, PLR_LOG);
      ch->Echo("LOG set.\r\n");
    }
}


