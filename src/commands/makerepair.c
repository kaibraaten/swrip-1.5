#include "mud.h"

void do_makerepair( Character *ch, char *argument )
{
  REPAIR_DATA *repair;
  short vnum;
  ProtoMobile *mob;

  if ( !argument || argument[0] == '\0' )
    {
      SendToCharacter( "Usage: makerepair <mobvnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = get_mob_index(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !can_medit(ch, mob) )
    return;

  if ( mob->rShop )
    {
      SendToCharacter( "This mobile already has a repair shop.\r\n", ch );
      return;
    }

  AllocateMemory( repair, REPAIR_DATA, 1 );

  LINK( repair, first_repair, last_repair, next, prev );
  repair->keeper        = vnum;
  repair->profit_fix    = 100;
  repair->shop_type     = SHOP_FIX;
  repair->business_hours.open     = 0;
  repair->business_hours.close    = 23;
  mob->rShop            = repair;
  SendToCharacter( "Done.\r\n", ch );
}
