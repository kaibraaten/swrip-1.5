#include "mud.h"
#include "character.h"

void do_recho( CHAR_DATA *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IS_SET(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You are noemoted and can not recho.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Recho what?\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( !str_cmp( arg, "Thoric" )
       || !str_cmp( arg, "Dominus" )
       || !str_cmp( arg, "Circe" )
       || !str_cmp( arg, "Haus" )
       || !str_cmp( arg, "Narn" )
       || !str_cmp( arg, "Scryn" )
       || !str_cmp( arg, "Blodkai" )
       || !str_cmp( arg, "Damian" ) )
    {
      ch_printf( ch, "I don't think %s would like that!\r\n", arg );
      return;
    }

  if ( (color = get_color ( argument )) )
    {
      argument = one_argument ( argument, arg );
      echo_to_room ( color, ch->in_room, argument );
    }
  else
    {
      echo_to_room ( AT_IMMORT, ch->in_room, argument );
    }
}
