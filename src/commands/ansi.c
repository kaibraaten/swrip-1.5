#include "character.h"
#include "mud.h"

void do_ansi( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "ANSI ON or OFF?\r\n", ch );
      return;
    }

  if ( !StrCmp(arg,"on") )
    {
      SetBit(ch->act,PLR_ANSI);
      set_char_color( AT_WHITE + AT_BLINK, ch);
      send_to_char( "ANSI ON!!!\r\n", ch);
      return;
    }

  if ( !StrCmp(arg,"off") )
    {
      RemoveBit(ch->act,PLR_ANSI);
      send_to_char( "Okay... ANSI support is now off\r\n", ch );
      return;
    }
}
