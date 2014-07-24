#include "mud.h"

void do_areas( Character *ch, char *argument )
{
  Area *pArea;

  set_pager_color( AT_PLAIN, ch );
  send_to_pager("\r\n   Author    |             Area                     | Recommended |  Enforced\r\n", ch);
  send_to_pager("-------------+--------------------------------------+-------------+-----------\r\n", ch);

  for ( pArea = first_area; pArea; pArea = pArea->next )
    pager_printf(ch, "%-12s | %-36s | %4d - %-4d | %3d - %-3d \r\n",
                 pArea->author, pArea->name, pArea->low_soft_range,
                 pArea->hi_soft_range, pArea->low_hard_range,
                 pArea->hi_hard_range);
}
