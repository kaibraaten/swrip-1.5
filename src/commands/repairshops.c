#include "mud.h"

void do_repairshops( CHAR_DATA *ch, char *argument )
{
  REPAIR_DATA *repair;

  if ( !first_repair )
    {
      send_to_char( "There are no repair shops.\r\n", ch );
      return;
    }

  set_char_color( AT_NOTE, ch );
  for ( repair = first_repair; repair; repair = repair->next )
    ch_printf( ch, "Keeper: %5d Profit: %3d Type: %d Open: %2d Close: %2d Fix: %2d %2d %2d\r\n",
               repair->keeper,       repair->profit_fix, repair->shop_type,
               repair->business_hours.open,   repair->business_hours.close,
               repair->fix_type[0], repair->fix_type[1], repair->fix_type[2] );
}
