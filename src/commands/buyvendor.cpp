#include "repos/vendorrepository.hpp"
#include "character.hpp"
#include "shop.hpp"
#include "mud.hpp"
#include "log.hpp"

void do_buyvendor (Character *ch, std::string argument)
{
    if (IsNpc(ch))
    {
        return;
    }
    
    if (StrCmp( argument, "yes") == 0)
    {
        Vendors->RemoveVendor(ch);
    }

    if (Vendors->HasVendor(ch))
    {
        ch->Echo("You already have a shop!\r\n");
        ch->Echo("If you want to buy one anyway, type BUYVENDOR YES.\r\n");
        ch->Echo("Your old one will be deleted.\r\n");
        return;
    }

    auto keeper =  FindKeeperQ(ch, false);

    if (keeper == nullptr)
    {
        ch->Echo("There is no one to buy that from!\r\n");
        return;
    }

    if (ch->Gold < COST_BUY_VENDOR)
    {
        ch->Echo("%s says, \"You are too poor!\"\r\n", Capitalize(keeper->ShortDescr).c_str());
        return;
    }

    if (ch->TopLevel < LEVEL_BUY_VENDOR)
    {
        ch->Echo("You must be at least level %d.\r\n", LEVEL_BUY_VENDOR);
        return;
    }

    if ((GetProtoObject(OBJ_VNUM_DEED) ) == nullptr)
    {
        Log->Bug("BUYVENDOR: Deed is missing!");
        return;
    }

    auto deed = CreateObject(GetProtoObject(OBJ_VNUM_DEED), 0);
    ObjectToCharacter(deed, ch);
    ch->Echo("&bVery well, you may have a contract for a vendor.\r\n");
    ch->Gold = ch->Gold - COST_BUY_VENDOR;
}
