#include "mud.h"

/*
 * Shows prototype vnums ranges, and if loaded
 */
void do_vnums( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  int low = MIN_VNUM;
  int high = MAX_VNUM;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !IsNullOrEmpty( arg1 ) )
    {
      low = atoi(arg1);

      if ( !IsNullOrEmpty( arg2 ) )
        high = atoi(arg2);
    }

  ShowVnums( ch, low, high, true, true, " *", "" );
}
