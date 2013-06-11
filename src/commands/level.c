#include "character.h"
#include "mud.h"

void do_level( Character *ch, char *argument )
{
  int ability;

  for ( ability = 0 ; ability < MAX_RL_ABILITY ; ability++ )
    {
      if ( ability != FORCE_ABILITY || IsForcer( ch ) )
	{
	  ch_printf( ch, "%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
		     ability_name[ability], GetLevel( ch, ability ), max_level(ch, ability),
		     GetExperience( ch, ability ),
		     exp_level( GetLevel( ch, ability ) + 1 ) );
	}
      else
	{
	  ch_printf( ch, "%-15s   Level: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
		     ability_name[ability], GetLevel( ch, ability ), GetExperience( ch, ability ) );
	}
    }
}
