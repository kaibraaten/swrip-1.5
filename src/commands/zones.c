#include "mud.h"

/*
 * Shows installed areas, sorted. Mark unloaded areas with an X.
 */
void do_zones( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int low = MIN_VNUM;
  int high = MAX_VNUM;

  do_vnums( ch, argument);

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( arg1[0] != '\0' )
    {
      low = atoi(arg1);

      if ( arg2[0] != '\0' )
        high = atoi(arg2);
    }

  ShowVnums( ch, low, high, false, true, "", " X" );
}
