#include "character.hpp"
#include "mud.hpp"

/* Allow mobiles to go wizinvis with programs -- SB */

void do_mpinvis( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  if ( !IsNpc(ch))
    {
      ch->Echo("Huh?\r\n");
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

      ch->MobInvis = level;
      ch->Echo("Mobinvis level set to %d.\r\n", level );
      return;
    }

  if ( ch->MobInvis < 2 )
    ch->MobInvis = ch->TopLevel;

  if ( IsBitSet(ch->Flags, ACT_MOBINVIS) )
    {
      RemoveBit(ch->Flags, ACT_MOBINVIS);
      Act(AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL,TO_ROOM );
      ch->Echo("You slowly fade back into existence.\r\n");
    }
  else
    {
      SetBit(ch->Flags, ACT_MOBINVIS);
      Act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      ch->Echo("You slowly vanish into thin air.\r\n");
    }
}

