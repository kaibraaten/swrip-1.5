#include "mud.hpp"
#include "area.hpp"

/*
 * Shows installed areas, sorted. Mark unloaded areas with an X.
 */
void do_zones( Character *ch, char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];
  vnum_t low = MIN_VNUM;
  vnum_t high = MAX_VNUM;

  do_vnums( ch, argument);

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !IsNullOrEmpty(arg1))
    {
      low = atoi(arg1);

      if ( !IsNullOrEmpty( arg2 ) )
        high = atoi(arg2);
    }

  ShowVnums( ch, low, high, false, true, "", " X" );
}

