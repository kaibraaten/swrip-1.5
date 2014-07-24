#include "mud.h"

/*
 * Show the boot log file                                       -Thoric
 */
void do_dmesg( Character *ch, char *argument )
{
  set_pager_color( AT_LOG, ch );
  show_file( ch, BOOTLOG_FILE );
}
