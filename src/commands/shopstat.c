#include "mud.h"

void do_shopstat( Character *ch, char *argument )
{
  Shop *shop;
  ProtoMobile *mob;
  vnum_t vnum;

  if ( IsNullOrEmpty( argument ) )
    {
      SendToCharacter( "Usage: shopstat <keeper vnum>\r\n", ch );
      return;
    }

  vnum = atoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      SendToCharacter( "Mobile not found.\r\n", ch );
      return;
    }

  if ( !mob->pShop )
    {
      SendToCharacter( "This mobile doesn't keep a shop.\r\n", ch );
      return;
    }

  shop = mob->pShop;

  Echo( ch, "Keeper: %d  %s\r\n", shop->Keeper, mob->ShortDescr );
  Echo( ch, "buy0 [%s]  buy1 [%s]  buy2 [%s]  buy3 [%s]  buy4 [%s]\r\n",
             ObjectTypes[shop->BuyType[0]],
             ObjectTypes[shop->BuyType[1]],
             ObjectTypes[shop->BuyType[2]],
             ObjectTypes[shop->BuyType[3]],
             ObjectTypes[shop->BuyType[4]] );
  Echo( ch, "Profit:  buy %3d%%  sell %3d%%\r\n",
             shop->ProfitBuy,
             shop->ProfitSell );
  Echo( ch, "Hours:   open %2d  close %2d\r\n",
             shop->BusinessHours.Open,
             shop->BusinessHours.Close );
}
