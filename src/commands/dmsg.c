#include "mud.h"

/*
 * Show the boot log file                                       -Thoric
 */
void do_dmesg( CHAR_DATA *ch, char *argument )
{
  set_pager_color( AT_LOG, ch );
  show_file( ch, BOOTLOG_FILE );
}