#include "mud.h"

/*
 * Shows installed areas, sorted. Mark unloaded areas with an X.
 */
void do_zones( CHAR_DATA *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int low = MIN_VNUM;
  int high = MAX_VNUM;

  do_vnums( ch, argument);

  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] != '\0' )
    {
      low = atoi(arg1);

      if ( arg2[0] != '\0' )
        high = atoi(arg2);
    }

  show_vnums( ch, low, high, FALSE, TRUE, "", " X" );
}
