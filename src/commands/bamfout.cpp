#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bamfout( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfOut );
      ch->PCData->BamfOut = CopyString( argument );
      ch->Echo( "Ok.\r\n" );
    }
}

