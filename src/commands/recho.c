#include "mud.h"
#include "character.h"

void do_recho( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  short color;

  if ( IsBitSet(ch->act, PLR_NO_EMOTE) )
    {
      SendToCharacter( "You are noemoted and can not recho.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
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
      EchoToRoom ( color, ch->in_room, argument );
    }
  else
    {
      EchoToRoom ( AT_IMMORT, ch->in_room, argument );
    }
}
