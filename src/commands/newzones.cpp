#include "mud.hpp"

/*
 * Show prototype areas, sorted.  Only show loaded areas
 */
void do_newzones( Character *ch, char *argument )
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

  ShowVnums( ch, low, high, true, false, "", " X" );
}
