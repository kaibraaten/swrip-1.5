#include "character.h"
#include "mud.h"

/* Allow mobiles to go wizinvis with programs -- SB */

void do_mpinvis( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( !IsNpc(ch))
    {
      SendToCharacter( "Huh?\r\n", ch);
      return;
    }

  argument = OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      short level = 0;

      if ( !IsNumber( arg ) )
        {
          ProgBug( "Mpinvis - Non numeric argument ", ch );
          return;
        }

      level = atoi( arg );

      if ( level < 2 || level > MAX_LEVEL )
        {
          ProgBug( "MPinvis - Invalid level ", ch );
          return;
	}

      ch->mobinvis = level;
      Echo( ch, "Mobinvis level set to %d.\r\n", level );
      return;
    }

  if ( ch->mobinvis < 2 )
    ch->mobinvis = ch->top_level;

  if ( IsBitSet(ch->Flags, ACT_MOBINVIS) )
    {
      RemoveBit(ch->Flags, ACT_MOBINVIS);
      Act(AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL,TO_ROOM );
      SendToCharacter( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SetBit(ch->Flags, ACT_MOBINVIS);
      Act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      SendToCharacter( "You slowly vanish into thin air.\r\n", ch );
    }
}
