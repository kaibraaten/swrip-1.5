#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"
#include "repos/shoprepository.hpp"

void do_makeshop(Character *ch, std::string argument)
{
    if (argument.empty())
    {
        ch->Echo("Usage: makeshop <mobvnum>\r\n");
        return;
    }

    vnum_t vnum = ToLong(argument);
    auto mob = GetProtoMobile(vnum);

    if (mob == nullptr)
    {
        ch->Echo("Mobile not found.\r\n");
        return;
    }

    if (!CanMedit(ch, mob))
        return;

    if (mob->Shop)
    {
        ch->Echo("This mobile already has a shop.\r\n");
        return;
    }

    std::shared_ptr<Shop> shop = std::make_shared<Shop>();

    shop->Keeper = vnum;
    shop->ProfitBuy = 120;
    shop->ProfitSell = 90;
    shop->BusinessHours.Open = 0;
    shop->BusinessHours.Close = 23;
    mob->Shop = shop;

    Shops->Add(shop);
    ch->Echo("Done.\r\n");
}

