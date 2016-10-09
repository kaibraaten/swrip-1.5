#include "character.h"
#include "mud.h"

void do_invis( Character *ch, char *argument )
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
      if ( level < 2 || level > ch->top_level)
        {
          SendToCharacter( "Invalid level.\r\n", ch );
          return;
        }

      if (!IsNpc(ch))
        {
          ch->pcdata->wizinvis = level;
          Echo( ch, "Wizinvis level set to %d.\r\n", level );
        }

      if (IsNpc(ch))
        {
          ch->mobinvis = level;
          Echo( ch, "Mobinvis level set to %d.\r\n", level );
        }
      return;
    }

  if (!IsNpc(ch))
    {
      if ( ch->pcdata->wizinvis < 2 )
        ch->pcdata->wizinvis = ch->top_level;
    }

  if (IsNpc(ch))
    {
      if ( ch->mobinvis < 2 )
        ch->mobinvis = ch->top_level;
    }

  if ( IsBitSet(ch->act, PLR_WIZINVIS) )
    {
      RemoveBit(ch->act, PLR_WIZINVIS);
      Act( AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, TO_ROOM );
      SendToCharacter( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SetBit(ch->act, PLR_WIZINVIS);
      Act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      SendToCharacter( "You slowly vanish into thin air.\r\n", ch );
    }
}
