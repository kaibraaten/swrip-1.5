#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_bamfin( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) )
    {
      SmashTilde( argument );
      ch->PCData->BamfIn = argument;
      ch->Echo( "Ok.\r\n" );
    }
}

