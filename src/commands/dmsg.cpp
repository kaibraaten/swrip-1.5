#include "mud.hpp"

/*
 * Show the boot log file                                       -Thoric
 */
void do_dmesg( Character *ch, std::string argument )
{
  SetPagerColor( AT_LOG, ch );
  ShowFile( ch, BOOTLOG_FILE );
}
