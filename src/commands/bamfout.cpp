#include "character.hpp"
#include "mud.hpp"

void do_bamfout( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfOut );
      ch->PCData->BamfOut = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
    }
}
