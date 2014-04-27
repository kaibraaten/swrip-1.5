#include "mud.h"

void do_makerepair( CHAR_DATA *ch, char *argument )
{
  REPAIR_DATA *repair;
  short vnum;
  MOB_INDEX_DATA *mob;

  if ( !argument || argument[0] == '\0' )
    {
      send_to_char( "Usage: makerepair <mobvnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = get_mob_index(vnum)) == NULL )
    {
      send_to_char( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !can_medit(ch, mob) )
    return;

  if ( mob->rShop )
    {
      send_to_char( "This mobile already has a repair shop.\r\n", ch );
      return;
    }

  CREATE( repair, REPAIR_DATA, 1 );

  LINK( repair, first_repair, last_repair, next, prev );
  repair->keeper        = vnum;
  repair->profit_fix    = 100;
  repair->shop_type     = SHOP_FIX;
  repair->business_hours.open     = 0;
  repair->business_hours.close    = 23;
  mob->rShop            = repair;
  send_to_char( "Done.\r\n", ch );
}
