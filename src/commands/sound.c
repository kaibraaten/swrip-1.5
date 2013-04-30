#include "mud.h"

void do_sound( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "SOUND ON or OFF?\r\n", ch );
      return;
    }

  if ( !str_cmp(arg,"on") )
    {
      SET_BIT(ch->act,PLR_SOUND);
      set_char_color( AT_WHITE + AT_BLINK, ch);
      send_to_char( "SOUND ON!!!\r\n", ch);
      send_to_char( "!!SOUND(hopeknow)", ch);
      return;
    }

  if ( !str_cmp(arg,"off") )
    {
      REMOVE_BIT(ch->act,PLR_SOUND);
      send_to_char( "Okay... SOUND support is now off\r\n", ch );
      return;
    }
}
