#include "character.h"
#include "mud.h"

void do_echo( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;
  int target;
  char *parg;

  if ( IsBitSet(ch->act, PLR_NO_EMOTE) )
    {
      send_to_char( "You are noemoted and can not echo.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Echo what?\r\n", ch );
      return;
    }

  if ( (color = get_color(argument)) )
    {
      argument = one_argument(argument, arg);
    }

  parg = argument;
  argument = one_argument(argument, arg);

  if ( !str_cmp( arg, "PC" ) || !str_cmp( arg, "player" ) )
    {
      target = ECHOTAR_PC;
    }
  else if ( !str_cmp( arg, "imm" ) )
    {
      target = ECHOTAR_IMM;
    }
  else
    {
      target = ECHOTAR_ALL;
      argument = parg;
    }

  if ( !color && (color = get_color(argument)) )
    argument = one_argument(argument, arg);

  if ( !color )
    color = AT_IMMORT;

  one_argument(argument, arg);

  if ( !str_cmp( arg, "Merth" )
       || !str_cmp( arg, "Durga" ))
    {
      ch_printf( ch, "I don't think %s would like that!\r\n", arg );
      return;
    }

  echo_to_all ( color, argument, target );
}
