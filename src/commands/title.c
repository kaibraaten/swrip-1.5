#include <string.h>
#include "mud.h"
#include "character.h"

void do_title( Character *ch, char *argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IS_SET( ch->pcdata->flags, PCFLAG_NOTITLE ))
    {
      send_to_char( "You try but the Force resists you.\r\n", ch );
      return;
    }


  if ( argument[0] == '\0' )
    {
      send_to_char( "Change your title to what?\r\n", ch );
      return;
    }

  if ((GetTrustedLevel(ch) <= LEVEL_IMMORTAL) && (!nifty_is_name(ch->name, argument)))
    {
      send_to_char("You must include your name somewhere in your title!", ch);
      return;
    }
  if (strlen(argument) >40)
    {
      send_to_char("40 characters is maximum allowed for titles now.\r\n", ch);
      return;
    }
  smash_tilde( argument );
  strcat(argument, " &R&W^x");

  set_title( ch, argument );
  send_to_char( "Ok.\r\n", ch );
}
