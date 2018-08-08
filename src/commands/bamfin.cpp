#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bamfin( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfIn );
      ch->PCData->BamfIn = CopyString( argument );
      ch->Echo( "Ok.\r\n" );
    }
}

