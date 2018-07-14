#include "mud.hpp"
#include "character.hpp"

void do_recho( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IsBitSet(ch->Flags, PLR_NO_EMOTE) )
    {
      SendToCharacter( "You are noemoted and can not recho.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Recho what?\r\n", ch );
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
      Echo( ch, "I don't think %s would like that!\r\n", arg );
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
