#include "character.hpp"
#include "mud.hpp"

void do_bamfin( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfIn );
      ch->PCData->BamfIn = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
    }
}
