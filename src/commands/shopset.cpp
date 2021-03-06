#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "protomob.hpp"

void do_shopset(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Shop> shop;
    std::shared_ptr<ProtoMobile> mob, mob2;
    std::string arg1;
    std::string arg2;
    vnum_t vnum = INVALID_VNUM;
    int value = 0;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if (arg1.empty() || arg2.empty())
    {
        ch->Echo("Usage: shopset <mob vnum> <field> value\r\n");
        ch->Echo("\r\nField being one of:\r\n");
        ch->Echo("  buy0 buy1 buy2 buy3 buy4 buy sell open close keeper\r\n");
        return;
    }

    vnum = ToLong(arg1);

    if ((mob = GetProtoMobile(vnum)) == NULL)
    {
        ch->Echo("Mobile not found.\r\n");
        return;
    }

    if (!CanMedit(ch, mob))
        return;

    if (!mob->Shop)
    {
        ch->Echo("This mobile doesn't keep a shop.\r\n");
        return;
    }

    shop = mob->Shop;
    value = ToLong(argument);

    if (!StrCmp(arg2, "buy0"))
    {
        if (!IsNumber(argument))
            value = GetObjectType(argument);

        if (value < 0 || value > MAX_ITEM_TYPE)
        {
            ch->Echo("Invalid item type!\r\n");
            return;
        }

        shop->BuyType[0] = (ItemTypes)value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "buy1"))
    {
        if (!IsNumber(argument))
            value = GetObjectType(argument);

        if (value < 0 || value > MAX_ITEM_TYPE)
        {
            ch->Echo("Invalid item type!\r\n");
            return;
        }

        shop->BuyType[1] = (ItemTypes)value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "buy2"))
    {
        if (!IsNumber(argument))
            value = GetObjectType(argument);

        if (value < 0 || value > MAX_ITEM_TYPE)
        {
            ch->Echo("Invalid item type!\r\n");
            return;
        }

        shop->BuyType[2] = (ItemTypes)value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "buy3"))
    {
        if (!IsNumber(argument))
            value = GetObjectType(argument);

        if (value < 0 || value > MAX_ITEM_TYPE)
        {
            ch->Echo("Invalid item type!\r\n");
            return;
        }

        shop->BuyType[3] = (ItemTypes)value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "buy4"))
    {
        if (!IsNumber(argument))
            value = GetObjectType(argument);

        if (value < 0 || value > MAX_ITEM_TYPE)
        {
            ch->Echo("Invalid item type!\r\n");
            return;
        }

        shop->BuyType[4] = (ItemTypes)value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "buy"))
    {
        if (value <= (shop->ProfitSell + 5) || value > 1000)
        {
            ch->Echo("Out of range.\r\n");
            return;
        }

        shop->ProfitBuy = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "sell"))
    {
        if (value < 0 || value >= (shop->ProfitBuy - 5))
        {
            ch->Echo("Out of range.\r\n");
            return;
        }

        shop->ProfitSell = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "open"))
    {
        if (value < 0 || value > 23)
        {
            ch->Echo("Out of range.\r\n");
            return;
        }

        shop->BusinessHours.Open = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "close"))
    {
        if (value < 0 || value > 23)
        {
            ch->Echo("Out of range.\r\n");
            return;
        }

        shop->BusinessHours.Close = value;
        ch->Echo("Done.\r\n");
        return;
    }

    if (!StrCmp(arg2, "keeper"))
    {
        if ((mob2 = GetProtoMobile(vnum)) == NULL)
        {
            ch->Echo("Mobile not found.\r\n");
            return;
        }

        if (!CanMedit(ch, mob))
            return;

        if (mob2->Shop)
        {
            ch->Echo("That mobile already has a shop.\r\n");
            return;
        }

        mob->Shop = NULL;
        mob2->Shop = shop;
        shop->Keeper = value;
        ch->Echo("Done.\r\n");
        return;
    }

    do_shopset(ch, "");
}
