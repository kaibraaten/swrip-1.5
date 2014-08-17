#include "character.h"
#include "mud.h"

void do_retire( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Retire whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_world( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( IsNpc(victim) )
    {
      send_to_char( "Not on NPC's.\r\n", ch );
      return;
    }

  if ( GetTrustLevel( victim ) >= GetTrustLevel( ch ) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( victim->top_level < LEVEL_CREATOR )
    {
      send_to_char( "The minimum level for retirement is savior.\r\n", ch );
      return;
    }

  if ( IsRetiredImmortal( victim ) )
    {
      RemoveBit( victim->pcdata->flags, PCFLAG_RETIRED );
      ch_printf( ch, "%s returns from retirement.\r\n", victim->name );
      ch_printf( victim, "%s brings you back from retirement.\r\n", ch->name );
    }
  else
    {
      SetBit( victim->pcdata->flags, PCFLAG_RETIRED );
      ch_printf( ch, "%s is now a retired immortal.\r\n", victim->name );
      ch_printf( victim, "Courtesy of %s, you are now a retired immortal.\r\n",
		 ch->name );
    }
}
