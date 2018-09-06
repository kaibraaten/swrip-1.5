#include "character.hpp"
#include "mud.hpp"

void do_ansi( Character *ch, std::string argument )
{
  if ( argument.empty() )
    {
      ch->Echo( "ANSI ON or OFF?\r\n" );
      return;
    }

  if ( !StrCmp(argument, "on") )
    {
      SetBit(ch->Flags, PLR_ANSI);
      SetCharacterColor( AT_WHITE + AT_BLINK, ch);
      ch->Echo( "ANSI ON!!!\r\n" );
      return;
    }

  if ( !StrCmp(argument, "off") )
    {
      RemoveBit(ch->Flags, PLR_ANSI);
      ch->Echo( "Okay... ANSI support is now off\r\n" );
      return;
    }
}

