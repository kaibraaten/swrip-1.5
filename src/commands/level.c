#include "character.h"
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
	      sprintf(maxbuf, "%d", max_level(ch, ability));
	    }

	  ch_printf( ch, "%-15s   Level: %-3d   Max: %-3s   Exp: %-10ld   Next: %-10ld\r\n",
		     capitalize(ability_name[ability]),
		     GetAbilityLevel( ch, ability ), maxbuf,
		     GetExperience( ch, ability ),
		     exp_level( GetAbilityLevel( ch, ability ) + 1 ) );
	}
      else
	{
	  ch_printf( ch, "%-15s   Level: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
		     capitalize(ability_name[ability]),
		     GetAbilityLevel( ch, ability ), GetExperience( ch, ability ) );
	}
    }
}
