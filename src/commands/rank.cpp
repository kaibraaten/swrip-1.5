#include "character.hpp"
#include "mud.hpp"

void do_rank( Character *ch, std::string argument )
{
  if ( IsNpc(ch) )
    return;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: rank <string>.\r\n", ch );
      SendToCharacter( "   or: rank none.\r\n", ch );
      return;
    }

  SmashTilde( argument );
  FreeMemory( ch->PCData->Rank );

  if ( !StrCmp( argument, "none" ) )
    ch->PCData->Rank = CopyString( "" );
  else
    ch->PCData->Rank = CopyString( argument );

  SendToCharacter( "Ok.\r\n", ch );
}
