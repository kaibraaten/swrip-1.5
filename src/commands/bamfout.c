#include "character.h"
#include "mud.h"

void do_bamfout( Character *ch, char *argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      FreeMemory( ch->PCData->BamfOut );
      ch->PCData->BamfOut = CopyString( argument );
      SendToCharacter( "Ok.\r\n", ch );
    }
}
