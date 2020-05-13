#include "mud.hpp"

/*
 * Show prototype areas, sorted.  Only show loaded areas
 */
void do_newzones( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  vnum_t low = MIN_VNUM;
  vnum_t high = MAX_VNUM;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !arg1.empty() )
    {
      low = ToLong(arg1);

      if ( !arg2.empty() )
        {
          high = ToLong(arg2);
        }
    }

  ShowVnums(ch, low, high, true, false);
}
