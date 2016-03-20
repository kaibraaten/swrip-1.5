#include "mud.h"

void do_makerepair( Character *ch, char *argument )
{
  RepairShop *repair;
  short vnum;
  ProtoMobile *mob;

  if ( !argument || argument[0] == '\0' )
    {
      SendToCharacter( "Usage: makerepair <mobvnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !CanMedit(ch, mob) )
    return;

  if ( mob->rShop )
    {
      SendToCharacter( "This mobile already has a repair shop.\r\n", ch );
      return;
    }

  AllocateMemory( repair, RepairShop, 1 );

  LINK( repair, first_repair, last_repair, next, prev );
  repair->keeper        = vnum;
  repair->profit_fix    = 100;
  repair->shop_type     = SHOP_FIX;
  repair->business_hours.open     = 0;
  repair->business_hours.close    = 23;
  mob->rShop            = repair;
  SendToCharacter( "Done.\r\n", ch );
}
