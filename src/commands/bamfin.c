#include "character.hpp"
#include "mud.h"

void do_bamfin( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfIn );
      ch->PCData->BamfIn = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
    }
}
