#include "character.hpp"
#include "mud.hpp"
#include "descriptor.hpp"

void do_forceclose( Character *ch, std::string arg )
{
  if ( arg.empty() )
    {
      ch->Echo( "Usage: forceclose <descriptor#>\r\n" );
      return;
    }

  int desc = std::stoi( arg );

  for ( Descriptor *d : Descriptors->Entities() )
    {
      if ( d->Socket == desc )
        {
          if ( d->Character && GetTrustLevel(d->Character) >= GetTrustLevel(ch) )
            {
              ch->Echo( "They might not like that...\r\n" );
              return;
            }

          CloseDescriptor( d, false );
          ch->Echo( "Ok.\r\n" );
          return;
        }
    }

  ch->Echo( "Not found!\r\n" );
}

