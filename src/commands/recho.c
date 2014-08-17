#include "mud.h"
#include "character.h"

void do_recho( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IsBitSet(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You are noemoted and can not recho.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Recho what?\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( !StrCmp( arg, "Thoric" )
       || !StrCmp( arg, "Dominus" )
       || !StrCmp( arg, "Circe" )
       || !StrCmp( arg, "Haus" )
       || !StrCmp( arg, "Narn" )
       || !StrCmp( arg, "Scryn" )
       || !StrCmp( arg, "Blodkai" )
       || !StrCmp( arg, "Damian" ) )
    {
      ch_printf( ch, "I don't think %s would like that!\r\n", arg );
      return;
    }

  if ( (color = get_color ( argument )) )
    {
      argument = OneArgument ( argument, arg );
      echo_to_room ( color, ch->in_room, argument );
    }
  else
    {
      echo_to_room ( AT_IMMORT, ch->in_room, argument );
    }
}
