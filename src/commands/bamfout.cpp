#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bamfout( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      ch->PCData->BamfOut = argument;
      ch->Echo( "Ok.\r\n" );
    }
}

