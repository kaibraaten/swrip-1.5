#include "character.h"
#include "mud.h"

void do_forceclose( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  int desc;

  OneArgument( argument, arg );

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Usage: forceclose <descriptor#>\r\n", ch );
      return;
    }

  desc = atoi( arg );

  for ( d = FirstDescriptor; d; d = d->Next )
    {
      if ( d->Socket == desc )
        {
          if ( d->Character && GetTrustLevel(d->Character) >= GetTrustLevel(ch) )
            {
              SendToCharacter( "They might not like that...\r\n", ch );
              return;
            }

          CloseSocket( d, false );
          SendToCharacter( "Ok.\r\n", ch );
          return;
        }
    }

  SendToCharacter( "Not found!\r\n", ch );
}
