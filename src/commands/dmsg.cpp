#include "mud.h"

/*
 * Show the boot log file                                       -Thoric
 */
void do_dmesg( Character *ch, char *argument )
{
  SetPagerColor( AT_LOG, ch );
  ShowFile( ch, BOOTLOG_FILE );
}
