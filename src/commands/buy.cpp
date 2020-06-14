#include <cstring>
#include <utility/algorithms.hpp>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "act.hpp"

void do_buy(Character *ch, std::string argument)
{
    std::string arg;
    argument = OneArgument(argument, arg);

    if(arg.empty())
    {
        ch->Echo("Buy what?\r\n");
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::PetShop))
    {
        if(IsNpc(ch))
            return;

        auto pRoomIndexNext = GetRoom(ch->InRoom->Vnum + 1);

        if(pRoomIndexNext == nullptr)
        {
            Log->Bug("Do_buy: bad pet shop at vnum %ld.", ch->InRoom->Vnum);
            ch->Echo("Sorry, you can't buy that here.\r\n");
            return;
        }

        auto in_room = ch->InRoom;
        ch->InRoom = pRoomIndexNext;
        Character *pet = GetCharacterInRoom(ch, arg);
        ch->InRoom = in_room;

        if(pet == nullptr || !IsNpc(pet) || !pet->Flags.test(Flag::Mob::Pet))
        {
            ch->Echo("Sorry, you can't buy that here.\r\n");
            return;
        }

        if(ch->Flags.test(Flag::Plr::BoughtPet))
        {
            ch->Echo("You already bought one pet this level.\r\n");
            return;
        }

        if(ch->Gold < 10 * pet->TopLevel * pet->TopLevel)
        {
            ch->Echo("You can't afford it.\r\n");
            return;
        }

        if(ch->TopLevel < pet->TopLevel)
        {
            ch->Echo("You're not ready for this pet.\r\n");
            return;
        }

        int maxgold = 10 * pet->TopLevel * pet->TopLevel;
        ch->Gold -= maxgold;
        BoostEconomy(ch->InRoom->Area, maxgold);
        pet = CreateMobile(pet->Prototype);
        pet->Flags.set(Flag::Mob::Pet);
        pet->Flags.reset(Flag::Mob::Prototype);
        pet->AffectedBy.set(Flag::Affect::Charm);

        argument = OneArgument(argument, arg);

        if(!arg.empty())
        {
            pet->Name += " " + arg;
        }

        std::string buf = FormatString("%sA neck tag says 'I belong to %s'.\r\n",
                                       pet->Description.c_str(), ch->Name.c_str());
        pet->Description = buf;

        if(ch->PCData)
            ch->PCData->Pet = pet;

        CharacterToRoom(pet, ch->InRoom);
        StartFollowing(pet, ch);
        ch->Echo("Enjoy your pet.\r\n");
        Act(AT_ACTION, "$n bought $N as a pet.", ch, NULL, pet, ActTarget::Room);
        return;
    }
    else
    {
        auto keeper = FindKeeper(ch);
        int noi = 1;              /* Number of items */
        constexpr short mnoi = 20;  /* Max number of items to be bought at once */

        if(keeper == nullptr)
            return;

        int maxgold = keeper->TopLevel * 10;

        if(IsNumber(arg))
        {
            noi = ToLong(arg);
            argument = OneArgument(argument, arg);

            if(noi > mnoi)
            {
                Act(AT_TELL, "$n tells you 'I don't sell that many items at"
                    " once.'", keeper, NULL, ch, ActTarget::Vict);
                ch->Reply = keeper;
                return;
            }
        }

        auto obj = GetCarriedObject(keeper, arg);

        if(!obj && arg[0] == '#')
        {
            int onum = 0;
            bool ofound = false;
            const int oref = strtol(arg.substr(1).c_str(), nullptr, 10);

            for(auto iter : Reverse(keeper->Objects()))
            {
                if(iter->WearLoc == WEAR_NONE
                   && CanSeeObject(ch, iter))
                    onum++;

                if(onum == oref)
                {
                    obj = iter;
                    ofound = true;
                    break;
                }
                else if(onum > oref)
                {
                    break;
                }
            }

            if(!ofound)
                obj = nullptr;
        }

        if(obj == nullptr)
        {
            ch->Echo("Buy what?\r\n");
            return;
        }

        int cost = GetObjectCost(ch, keeper, obj, true) * noi;

        if(keeper->Home != nullptr && obj->Cost > 0)
            cost = obj->Cost;

        if(cost <= 0 || !CanSeeObject(ch, obj))
        {
            Act(AT_TELL, "$n tells you 'I don't sell that -- try 'list'.'",
                keeper, nullptr, ch, ActTarget::Vict);
            ch->Reply = keeper;
            return;
        }

        if(!obj->Flags.test(Flag::Obj::Inventory) && noi > 1)
        {
            Interpret(keeper, "laugh");
            Act(AT_TELL, "$n tells you 'I don't have enough of those in stock"
                " to sell more than one at a time.'", keeper, nullptr, ch, ActTarget::Vict);
            ch->Reply = keeper;
            return;
        }

        if(ch->Gold < cost)
        {
            Act(AT_TELL, "$n tells you 'You can't afford to buy $p.'",
                keeper, obj, ch, ActTarget::Vict);
            ch->Reply = keeper;
            return;
        }

        if(obj->Flags.test(Flag::Obj::Prototype)
           && GetTrustLevel(ch) < LEVEL_IMMORTAL)
        {
            Act(AT_TELL, "$n tells you 'This is a only a prototype!  I can't sell you that...'",
                keeper, nullptr, ch, ActTarget::Vict);
            ch->Reply = keeper;
            return;
        }

        if(ch->CarryNumber + GetObjectCount(obj) > GetCarryCapacityNumber(ch))
        {
            ch->Echo("You can't carry that many items.\r\n");
            return;
        }

        if(ch->CarryWeight + (GetObjectWeight(obj) * noi)
           + (noi > 1 ? 2 : 0) > GetCarryCapacityWeight(ch))
        {
            ch->Echo("You can't carry that much weight.\r\n");
            return;
        }

        if(noi == 1)
        {
            if(!obj->Flags.test(Flag::Obj::Inventory)
               || keeper->Home != nullptr)
                SeparateOneObjectFromGroup(obj);

            Act(AT_ACTION, "$n buys $p.", ch, obj, nullptr, ActTarget::Room);
            Act(AT_ACTION, "You buy $p.", ch, obj, nullptr, ActTarget::Char);
        }
        else
        {
            std::string buf = FormatString("$n buys %d $p%s.", noi,
                                           (obj->ShortDescr[obj->ShortDescr.size() - 1] == 's'
                                            ? "" : "s"));
            Act(AT_ACTION, buf, ch, obj, nullptr, ActTarget::Room);
            buf = FormatString("You buy %d $p%s.", noi,
                               (obj->ShortDescr[obj->ShortDescr.size() - 1] == 's'
                                ? "" : "s"));
            Act(AT_ACTION, buf, ch, obj, nullptr, ActTarget::Char);
            Act(AT_ACTION, "$N puts them into a bag and hands it to you.",
                ch, nullptr, keeper, ActTarget::Char);
        }

        ch->Gold -= cost;
        keeper->Gold += cost;

        if(keeper->Gold > maxgold && keeper->Owner.empty())
        {
            BoostEconomy(keeper->InRoom->Area, keeper->Gold - maxgold / 2);
            keeper->Gold = maxgold / 2;
            Act(AT_ACTION, "$n puts some credits into a large safe.", keeper, nullptr, nullptr, ActTarget::Room);
        }

        if(obj->Flags.test(Flag::Obj::Inventory)
           && keeper->Home == nullptr)
        {
            auto buy_obj = CreateObject(obj->Prototype, obj->Level);

            /*
             * Due to grouped objects and carry limitations in SMAUG
             * The shopkeeper gives you a bag with multiple-buy,
             * and also, only one object needs be created with a count
             * set to the number bought.          -Thoric
             */
            if(noi > 1)
            {
                auto bag = CreateObject(GetProtoObject(OBJ_VNUM_SHOPPING_BAG), 1);
                /* perfect size bag ;) */
                bag->Value[0] = bag->Weight + (buy_obj->Weight * noi);
                buy_obj->Count = noi;
                obj->Prototype->Count += (noi - 1);
                numobjsloaded += (noi - 1);
                ObjectToObject(buy_obj, bag);
                ObjectToCharacter(bag, ch);
            }
            else
            {
                ObjectToCharacter(buy_obj, ch);
            }
        }
        else
        {
            ObjectFromCharacter(obj);
            ObjectToCharacter(obj, ch);

            /* vendor snippet. Forces vendor to save after anyone buys anything*/
            if(keeper->Home != nullptr)
            {
                SaveVendor(keeper);
                obj->Cost = 0;
            }
        }
    }
}
