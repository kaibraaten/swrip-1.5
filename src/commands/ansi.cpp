#include "character.hpp"
#include "mud.hpp"

void do_ansi( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "ANSI ON or OFF?\r\n", ch );
      return;
    }

  if ( !StrCmp(arg,"on") )
    {
      SetBit(ch->Flags, PLR_ANSI);
      SetCharacterColor( AT_WHITE + AT_BLINK, ch);
      SendToCharacter( "ANSI ON!!!\r\n", ch);
      return;
    }

  if ( !StrCmp(arg,"off") )
    {
      RemoveBit(ch->Flags, PLR_ANSI);
      SendToCharacter( "Okay... ANSI support is now off\r\n", ch );
      return;
    }
}
