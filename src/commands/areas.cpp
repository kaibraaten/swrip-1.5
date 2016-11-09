#include "mud.hpp"
#include "area.hpp"

static bool ShowArea( const Area *area, const Character *ch );

void do_areas( Character *ch, std::string argument )
{
  SetPagerColor( AT_PLAIN, ch );
  SendToPager("\r\n   Author    |             Area                     | Recommended |  Enforced\r\n", ch);
  SendToPager("-------------+--------------------------------------+-------------+-----------\r\n", ch);

  ForEach( Area, FirstArea, Next, ShowArea, ch );
}

static bool ShowArea( const Area *area, const Character *ch )
{
  PagerPrintf( ch, "%-12s | %-36s | %4d - %-4d | %3d - %-3d \r\n",
	      area->Author, area->Name, area->LevelRanges.Soft.Low,
	      area->LevelRanges.Soft.High, area->LevelRanges.Hard.Low,
	      area->LevelRanges.Hard.High);
  return true;
}
