#include "character.h"
#include "mud.h"

void do_wimpy( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  int wimpy;

  one_argument( argument, arg );

  if ( arg[0] == '\0' )
    wimpy = (int) ch->max_hit / 5;
  else
    wimpy = atoi( arg );

  if ( wimpy < 0 )
    {
      send_to_char( "Your courage exceeds your wisdom.\r\n", ch );
      return;
    }

  if ( wimpy > ch->max_hit )
    {
      send_to_char( "Such cowardice ill becomes you.\r\n", ch );
      return;
    }

  ch->wimpy = wimpy;
  ch_printf( ch, "Wimpy set to %d hit points.\r\n", wimpy );
}
