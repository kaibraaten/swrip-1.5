#include "character.hpp"
#include "mud.hpp"

void do_forceclose( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo( "Usage: forceclose <descriptor#>\r\n" );
      return;
    }

  int desc = atoi( arg );

  for ( Descriptor *d = FirstDescriptor; d; d = d->Next )
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

