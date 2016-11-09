#include "character.hpp"
#include "mud.h"

void do_level( Character *ch, char *argument )
{
  int ability;

  for ( ability = 0 ; ability < MAX_RL_ABILITY ; ability++ )
    {
      if ( ability != FORCE_ABILITY || IsJedi( ch ) )
	{
	  char maxbuf[MAX_STRING_LENGTH];

	  if(ability == FORCE_ABILITY)
	    {
	      sprintf(maxbuf, "%s", "???");
	    }
	  else
	    {
	      sprintf(maxbuf, "%d", GetMaxAbilityLevel(ch, ability));
	    }

	  Echo( ch, "%-15s   Level: %-3d   Max: %-3s   Exp: %-10ld   Next: %-10ld\r\n",
		     Capitalize(AbilityName[ability]),
		     GetAbilityLevel( ch, ability ), maxbuf,
		     GetAbilityXP( ch, ability ),
		     GetRequiredXpForLevel( GetAbilityLevel( ch, ability ) + 1 ) );
	}
      else
	{
	  Echo( ch, "%-15s   Level: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
		     Capitalize(AbilityName[ability]),
		     GetAbilityLevel( ch, ability ), GetAbilityXP( ch, ability ) );
	}
    }
}
