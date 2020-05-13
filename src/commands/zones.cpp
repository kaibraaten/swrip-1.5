#include "mud.hpp"
#include "area.hpp"

/*
 * Shows installed areas, sorted. Mark unloaded areas with an X.
 */
void do_zones( Character *ch, std::string argument )
{
    std::string arg1;
    std::string arg2;
    vnum_t low = MIN_VNUM;
    vnum_t high = MAX_VNUM;

    do_vnums( ch, argument);

    argument = OneArgument( argument, arg1 );
    argument = OneArgument( argument, arg2 );

    if ( !arg1.empty() )
    {
        low = ToLong(arg1);

        if ( !arg2.empty() )
            high = ToLong(arg2);
    }

    ShowVnums( ch, low, high, false, true);
}
