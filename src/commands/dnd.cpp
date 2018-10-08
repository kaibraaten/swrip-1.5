#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"

void do_dnd( Character *ch, std::string argument )
{
  if ( !IsNpc(ch) && ch->PCData )
    {
      if ( ch->PCData->Flags.test( Flag::PCData::DoNotDisturb ) )
	{
          ch->PCData->Flags.reset( Flag::PCData::DoNotDisturb );
	  ch->Echo( "Your 'do not disturb' flag is now off.\r\n" );
	}
      else
	{
          ch->PCData->Flags.set( Flag::PCData::DoNotDisturb );
	  ch->Echo( "Your 'do not disturb' flag is now on.\r\n" );
	}
    }
  else
    {
      ch->Echo( "Huh?\r\n" );
    }
}

