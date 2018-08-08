#include "character.hpp"
#include "mud.hpp"

void do_ansi( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "ANSI ON or OFF?\r\n" );
      return;
    }

  if ( !StrCmp(arg,"on") )
    {
      SetBit(ch->Flags, PLR_ANSI);
      SetCharacterColor( AT_WHITE + AT_BLINK, ch);
      ch->Echo( "ANSI ON!!!\r\n" );
      return;
    }

  if ( !StrCmp(arg,"off") )
    {
      RemoveBit(ch->Flags, PLR_ANSI);
      ch->Echo( "Okay... ANSI support is now off\r\n" );
      return;
    }
}

