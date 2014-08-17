#include "character.h"
#include "mud.h"

/* Allow mobiles to go wizinvis with programs -- SB */

void do_mpinvis( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( !IsNpc(ch))
    {
      send_to_char( "Huh?\r\n", ch);
      return;
    }

  argument = OneArgument( argument, arg );

  if ( arg[0] != '\0' )
    {
      short level = 0;

      if ( !IsNumber( arg ) )
        {
          progbug( "Mpinvis - Non numeric argument ", ch );
          return;
        }

      level = atoi( arg );

      if ( level < 2 || level > MAX_LEVEL )
        {
          progbug( "MPinvis - Invalid level ", ch );
          return;
	}

      ch->mobinvis = level;
      ch_printf( ch, "Mobinvis level set to %d.\r\n", level );
      return;
    }

  if ( ch->mobinvis < 2 )
    ch->mobinvis = ch->top_level;

  if ( IsBitSet(ch->act, ACT_MOBINVIS) )
    {
      RemoveBit(ch->act, ACT_MOBINVIS);
      act(AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL,TO_ROOM );
      send_to_char( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SetBit(ch->act, ACT_MOBINVIS);
      act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      send_to_char( "You slowly vanish into thin air.\r\n", ch );
    }
}
