#include "mud.h"

void do_areas( Character *ch, char *argument )
{
  Area *pArea;

  SetPagerColor( AT_PLAIN, ch );
  SendToPager("\r\n   Author    |             Area                     | Recommended |  Enforced\r\n", ch);
  SendToPager("-------------+--------------------------------------+-------------+-----------\r\n", ch);

  for ( pArea = first_area; pArea; pArea = pArea->Next )
    PagerPrintf(ch, "%-12s | %-36s | %4d - %-4d | %3d - %-3d \r\n",
                 pArea->Author, pArea->Name, pArea->LevelRanges.LowSoft,
                 pArea->LevelRanges.HighSoft, pArea->LevelRanges.LowHard,
                 pArea->LevelRanges.HighHard);
}
