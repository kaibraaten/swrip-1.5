#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_shopstat( Character *ch, std::string argument )
{
  Shop *shop = nullptr;
  ProtoMobile *mob = nullptr;
  vnum_t vnum = INVALID_VNUM;

  if ( argument.empty() )
    {
      ch->Echo("Usage: shopstat <keeper vnum>\r\n");
      return;
    }

  vnum = std::stoi( argument );

  if ( (mob = GetProtoMobile(vnum)) == NULL )
    {
      ch->Echo("Mobile not found.\r\n");
      return;
    }

  if ( !mob->Shop )
    {
      ch->Echo("This mobile doesn't keep a shop.\r\n");
      return;
    }

  shop = mob->Shop;

  ch->Echo("Keeper: %d  %s\r\n", shop->Keeper, mob->ShortDescr.c_str() );
  ch->Echo("buy0 [%s]  buy1 [%s]  buy2 [%s]  buy3 [%s]  buy4 [%s]\r\n",
           ObjectTypes[shop->BuyType[0]],
           ObjectTypes[shop->BuyType[1]],
           ObjectTypes[shop->BuyType[2]],
           ObjectTypes[shop->BuyType[3]],
           ObjectTypes[shop->BuyType[4]] );
  ch->Echo("Profit:  buy %3d%%  sell %3d%%\r\n",
           shop->ProfitBuy,
           shop->ProfitSell );
  ch->Echo("Hours:   open %2d  close %2d\r\n",
           shop->BusinessHours.Open,
           shop->BusinessHours.Close );
}
