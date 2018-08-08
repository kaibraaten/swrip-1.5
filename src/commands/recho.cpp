#include "mud.hpp"
#include "character.hpp"

void do_recho( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      ch->Echo("You are noemoted and can not recho.\r\n");
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      ch->Echo("Recho what?\r\n");
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
      ch->Echo("I don't think %s would like that!\r\n", arg );
      return;
    }

  if ( (color = GetColor ( argument )) )
    {
      argument = OneArgument ( argument, arg );
      EchoToRoom ( color, ch->InRoom, argument );
    }
  else
    {
      EchoToRoom ( AT_IMMORT, ch->InRoom, argument );
    }
}

