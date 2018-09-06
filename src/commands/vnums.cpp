#include "mud.hpp"

/*
 * Shows prototype vnums ranges, and if loaded
 */
void do_vnums( Character *ch, std::string argument )
{
  std::string arg1;
  std::string arg2;
  vnum_t low = MIN_VNUM;
  vnum_t high = MAX_VNUM;

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( !arg1.empty() )
    {
      low = std::stoi(arg1);

      if ( !arg2.empty() )
        high = std::stoi(arg2);
    }

  ShowVnums( ch, low, high, true, true, " *", "" );
}
