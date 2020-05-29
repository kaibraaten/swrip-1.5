#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "repos/vendorrepository.hpp"

void do_placevendor(Character *ch, std::string argument)
{
    if (FindKeeperQ(ch, false))
    {
        ch->Echo("A vendor is already here!\r\n");;
        return;
    }

    if (IsNpc(ch))
    {
        return;
    }

    auto obj = GetCarriedObject(ch, "deed");
    
    if (obj == nullptr || obj->Prototype->Vnum != OBJ_VNUM_DEED)
    {
        ch->Echo("You do not have a deed!\r\n");
        return;
    }

    if (!ch->InRoom->Flags.test(Flag::Room::PlayerShop))
    {
        ch->Echo("You need to find a free shop.\r\n");
        return;
    }

    if (Vendors->HasVendor(ch))
    {
        ch->Echo("You already have a shop!\r\n");
        return;
    }

    auto vendorPrototype = GetProtoMobile(MOB_VNUM_VENDOR);
    
    if (vendorPrototype == nullptr)
    {
        Log->Bug("do_placevendor: no vendor vnum");
        return;
    }

    auto vendor = CreateMobile(vendorPrototype);
    CharacterToRoom(vendor, ch->InRoom);

    char buf[MAX_INPUT_LENGTH];
    sprintf(buf, vendor->LongDescr.c_str(), ch->Name.c_str());
    vendor->LongDescr = buf;

    vendor->Owner = ch->Name;
    vendor->Home = ch->InRoom;

    SaveVendor(vendor);

    SeparateOneObjectFromGroup(obj);
    ExtractObject(obj);

    Act(AT_ACTION, "$n appears in a swirl of smoke.",
        vendor, nullptr, nullptr, TO_ROOM);

    char vnum1[MAX_INPUT_LENGTH];
    sprintf(vnum1, "%ld", vendor->Prototype->Vnum);
    
    do_makeshop(vendor, vnum1); /*makes the vendor a shop.. there has to be a
                                    better way to do it but hell if i know what it is!*/
}

