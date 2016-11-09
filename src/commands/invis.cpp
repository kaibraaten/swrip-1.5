#include "character.hpp"
#include "mud.hpp"

void do_invis( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  short level = 0;

  argument = OneArgument( argument, arg );

  if ( !IsNullOrEmpty( arg ) )
    {
      if ( !IsNumber( arg ) )
        {
          SendToCharacter( "Usage: invis | invis <level>\r\n", ch );
          return;
        }
      level = atoi( arg );
      if ( level < 2 || level > ch->TopLevel)
        {
          SendToCharacter( "Invalid level.\r\n", ch );
          return;
        }

      if (!IsNpc(ch))
        {
          ch->PCData->WizInvis = level;
          Echo( ch, "Wizinvis level set to %d.\r\n", level );
        }

      if (IsNpc(ch))
        {
          ch->MobInvis = level;
          Echo( ch, "Mobinvis level set to %d.\r\n", level );
        }
      return;
    }

  if (!IsNpc(ch))
    {
      if ( ch->PCData->WizInvis < 2 )
        ch->PCData->WizInvis = ch->TopLevel;
    }

  if (IsNpc(ch))
    {
      if ( ch->MobInvis < 2 )
        ch->MobInvis = ch->TopLevel;
    }

  if ( IsBitSet(ch->Flags, PLR_WIZINVIS) )
    {
      RemoveBit(ch->Flags, PLR_WIZINVIS);
      Act( AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, TO_ROOM );
      SendToCharacter( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SetBit(ch->Flags, PLR_WIZINVIS);
      Act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      SendToCharacter( "You slowly vanish into thin air.\r\n", ch );
    }
}
