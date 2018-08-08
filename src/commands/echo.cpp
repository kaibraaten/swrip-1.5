#include "character.hpp"
#include "mud.hpp"

void do_echo( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color = AT_PLAIN;
  int target = 0;
  char *parg = nullptr;

  if ( IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      ch->Echo( "You are noemoted and can not echo.\r\n" );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo( "Echo what?\r\n" );
      return;
    }

  if ( (color = GetColor(argument)) )
    {
      argument = OneArgument(argument, arg);
    }

  parg = argument;
  argument = OneArgument(argument, arg);

  if ( !StrCmp( arg, "PC" ) || !StrCmp( arg, "player" ) )
    {
      target = ECHOTAR_PC;
    }
  else if ( !StrCmp( arg, "imm" ) )
    {
      target = ECHOTAR_IMM;
    }
  else
    {
      target = ECHOTAR_ALL;
      argument = parg;
    }

  if ( !color && (color = GetColor(argument)) )
    argument = OneArgument(argument, arg);

  if ( !color )
    color = AT_IMMORT;

  OneArgument(argument, arg);

  if ( !StrCmp( arg, "Merth" )
       || !StrCmp( arg, "Durga" ))
    {
      ch->Echo( "I don't think %s would like that!\r\n", arg );
      return;
    }

  EchoToAll ( color, argument, target );
}

