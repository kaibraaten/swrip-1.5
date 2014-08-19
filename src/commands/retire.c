#include "character.h"
#include "mud.h"

void do_retire( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Retire whom?\r\n", ch );
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

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      SendToCharacter( "You failed.\r\n", ch );
      return;
    }

  if ( victim->top_level < LEVEL_CREATOR )
    {
      SendToCharacter( "The minimum level for retirement is savior.\r\n", ch );
      return;
    }

  if ( IsRetiredImmortal( victim ) )
    {
      RemoveBit( victim->pcdata->flags, PCFLAG_RETIRED );
      ChPrintf( ch, "%s returns from retirement.\r\n", victim->name );
      ChPrintf( victim, "%s brings you back from retirement.\r\n", ch->name );
    }
  else
    {
      SetBit( victim->pcdata->flags, PCFLAG_RETIRED );
      ChPrintf( ch, "%s is now a retired immortal.\r\n", victim->name );
      ChPrintf( victim, "Courtesy of %s, you are now a retired immortal.\r\n",
		 ch->name );
    }
}
