#include "character.h"
#include "mud.h"

void do_forceclose( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Descriptor *d;
  int desc;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Usage: forceclose <descriptor#>\r\n", ch );
      return;
    }

  desc = atoi( arg );

  for ( d = first_descriptor; d; d = d->next )
    {
      if ( d->descriptor == desc )
        {
          if ( d->character && get_trust(d->character) >= get_trust(ch) )
            {
              send_to_char( "They might not like that...\r\n", ch );
              return;
            }

          close_socket( d, FALSE );
          send_to_char( "Ok.\r\n", ch );
          return;
        }
    }

  send_to_char( "Not found!\r\n", ch );
}
