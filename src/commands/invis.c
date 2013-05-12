#include "mud.h"

void do_invis( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short level = 0;

  argument = one_argument( argument, arg );
  if ( arg[0] != '\0' )
    {
      if ( !is_number( arg ) )
        {
          send_to_char( "Usage: invis | invis <level>\r\n", ch );
          return;
        }
      level = atoi( arg );
      if ( level < 2 || level > ch->top_level)
        {
          send_to_char( "Invalid level.\r\n", ch );
          return;
        }

      if (!IS_NPC(ch))
        {
          ch->pcdata->wizinvis = level;
          ch_printf( ch, "Wizinvis level set to %d.\r\n", level );
        }

      if (IS_NPC(ch))
        {
          ch->mobinvis = level;
          ch_printf( ch, "Mobinvis level set to %d.\r\n", level );
        }
      return;
    }

  if (!IS_NPC(ch))
    {
      if ( ch->pcdata->wizinvis < 2 )
        ch->pcdata->wizinvis = ch->top_level;
    }

  if (IS_NPC(ch))
    {
      if ( ch->mobinvis < 2 )
        ch->mobinvis = ch->top_level;
    }

  if ( IS_SET(ch->act, PLR_WIZINVIS) )
    {
      REMOVE_BIT(ch->act, PLR_WIZINVIS);
      act( AT_IMMORT, "$n slowly fades into existence.", ch, NULL, NULL, TO_ROOM );
      send_to_char( "You slowly fade back into existence.\r\n", ch );
    }
  else
    {
      SET_BIT(ch->act, PLR_WIZINVIS);
      act( AT_IMMORT, "$n slowly fades into thin air.", ch, NULL, NULL, TO_ROOM );
      send_to_char( "You slowly vanish into thin air.\r\n", ch );
    }
}