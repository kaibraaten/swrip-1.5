#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "systemdata.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_auction(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Object> obj;
    std::string arg1;
    std::string arg2;
    char buf[MAX_STRING_LENGTH];

    argument = OneArgument(argument, arg1);

    if(IsNpc(ch)) /* NPC can be extracted at any time and thus can't auction! */
        return;

    if(!CheckRoomFlag(ch->InRoom, Flag::Room::Hotel)
       && !CheckRoomFlag(ch->InRoom, Flag::Room::Auction))
    {
        SetCharacterColor(AT_LBLUE, ch);
        ch->Echo("\r\nYou must go to an auction hall to do that!\r\n");
        return;
    }

    if((time_info.Hour > 18 || time_info.Hour < 9) && OngoingAuction->Item.expired())
    {
        SetCharacterColor(AT_LBLUE, ch);
        ch->Echo("\r\nThe auctioneer has retired for the evening.\r\n");
        return;
    }

    if(arg1.empty())
    {
        if(!OngoingAuction->Item.expired())
        {
            obj = OngoingAuction->Item.lock();
            SetCharacterColor(AT_BLUE, ch);

            /* show item data here */
            if(OngoingAuction->Bet > 0)
                ch->Echo("Current bid on this item is %d credits.\r\n", OngoingAuction->Bet);
            else
                ch->Echo("No bids on this item have been received.\r\n");

            SetCharacterColor(AT_LBLUE, ch);
            ch->Echo("Object '%s' is %s, special properties: %s\r\nIts weight is %d, value is %d.\r\n",
                     obj->Name.c_str(),
                     AOrAn(GetItemTypeName(obj)).c_str(),
                     FlagString(obj->Flags, ObjectFlags).c_str(),
                     obj->Weight,
                     obj->Cost);

            SetCharacterColor(AT_BLUE, ch);
            ch->Echo("Worn on: %s\r\n",
                     FlagString(obj->WearFlags, WearFlags).c_str());

            switch(obj->ItemType)
            {
            case ITEM_ARMOR:
                ch->Echo("Current armor class is %d (based on current condition).\r\n",
                         obj->Value[OVAL_ARMOR_CONDITION]);
                ch->Echo("Maximum armor class is %d (based on top condition).\r\n",
                         obj->Value[OVAL_ARMOR_AC]);
                break;

            default:
                break;
            }

            for(auto paf : obj->Prototype->Affects())
            {
                ShowAffectToCharacter(ch, paf);
            }

            for(auto paf : obj->Affects())
            {
                ShowAffectToCharacter(ch, paf);
            }

            if(obj->ItemType == ITEM_CONTAINER && !obj->Objects().empty())
            {
                SetCharacterColor(AT_OBJECT, ch);
                ch->Echo("Contents:\r\n");
                ShowObjectListToCharacter(obj->Objects(), ch, true, false);
            }

            if(IsImmortal(ch))
            {
                ch->Echo("Seller: %s.  Bidder: %s.  Round: %d.\r\n",
                         OngoingAuction->Seller->Name.c_str(), OngoingAuction->Buyer->Name.c_str(),
                         (OngoingAuction->Going + 1));
                ch->Echo("Time left in round: %d.\r\n", OngoingAuction->Pulse);
            }

            return;
        }
        else
        {
            SetCharacterColor(AT_LBLUE, ch);
            ch->Echo("\r\nThere is nothing being auctioned right now. What would you like to auction?\r\n");
            return;
        }
    }

    if(IsImmortal(ch) && !StrCmp(arg1, "stop"))
    {
        if(OngoingAuction->Item.expired())
        {
            ch->Echo("There is no auction to stop.\r\n");
            return;
        }
        else /* stop the auction */
        {
            auto auctionItem = OngoingAuction->Item.lock();
            SetCharacterColor(AT_LBLUE, ch);
            sprintf(buf, "Sale of %s has been stopped by an Immortal.",
                    auctionItem->ShortDescr.c_str());
            TalkAuction(buf);
            ObjectToCharacter(auctionItem, OngoingAuction->Seller);

            if(SysData.SaveFlags.test(Flag::AutoSave::Auction))
            {
                PlayerCharacters->Save(OngoingAuction->Seller);
            }

            OngoingAuction->Item.reset();

            if(OngoingAuction->Buyer != NULL && OngoingAuction->Buyer != OngoingAuction->Seller) /* return money to the buyer */
            {
                OngoingAuction->Buyer->Gold += OngoingAuction->Bet;
                OngoingAuction->Buyer->Echo("Your money has been returned.\r\n");
            }

            return;
        }
    }

    if(!StrCmp(arg1, "bid"))
    {
        if(!OngoingAuction->Item.expired())
        {
            int newbet = 0;

            if(ch == OngoingAuction->Seller)
            {
                ch->Echo("You can't bid on your own item!\r\n");
                return;
            }

            if(argument.empty())
            {
                ch->Echo("Bid how much?\r\n");
                return;
            }

            newbet = ParseBet(OngoingAuction->Bet, argument);

            if(newbet < OngoingAuction->Starting)
            {
                ch->Echo("You must place a bid that is higher than the starting bid.\r\n");
                return;
            }

            /* to avoid slow auction, use a bigger amount than 100 if the bet
               is higher up - changed to 100 for our high economy
        */
            if(newbet < (OngoingAuction->Bet + 100))
            {
                ch->Echo("You must at least bid 100 credits over the current bid.\r\n");
                return;
            }

            if(newbet > ch->Gold)
            {
                ch->Echo("You don't have that much money!\r\n");
                return;
            }

            if(newbet > 2000000000)
            {
                ch->Echo("You can't bid over 2 billion credits.\r\n");
                return;
            }

            /* the actual bet is OK! */

            /* return the gold to the last buyer, if one exists */
            if(OngoingAuction->Buyer != NULL && OngoingAuction->Buyer != OngoingAuction->Seller)
                OngoingAuction->Buyer->Gold += OngoingAuction->Bet;

            ch->Gold -= newbet; /* substract the gold - important :) */

            if(SysData.SaveFlags.test(Flag::AutoSave::Auction))
            {
                PlayerCharacters->Save(ch);
            }

            OngoingAuction->Buyer = ch;
            OngoingAuction->Bet = newbet;
            OngoingAuction->Going = 0;
            OngoingAuction->Pulse = PULSE_AUCTION; /* start the auction over again */

            auto auctionItem = OngoingAuction->Item.lock();
            sprintf(buf, "A bid of %d credits has been received on %s.\r\n", newbet, auctionItem->ShortDescr.c_str());
            TalkAuction(buf);
            return;
        }
        else
        {
            ch->Echo("There isn't anything being auctioned right now.\r\n");
            return;
        }
    }

    /* finally... */
    if(HasMentalStateToFindObject(ch))
        return;

    obj = GetCarriedObject(ch, arg1); /* does char have the item ? */

    if(obj == NULL)
    {
        ch->Echo("You aren't carrying that.\r\n");
        return;
    }

    if(obj->Timer > 0)
    {
        ch->Echo("You can't auction objects that are decaying.\r\n");
        return;
    }

    argument = OneArgument(argument, arg2);

    if(arg2.empty())
    {
        OngoingAuction->Starting = 0;
        arg2 = "0";
    }

    if(!IsNumber(arg2))
    {
        ch->Echo("You must input a number at which to start the auction.\r\n");
        return;
    }

    if(ToLong(arg2) < 0)
    {
        ch->Echo("You can't auction something for less than 0 credits!\r\n");
        return;
    }

    if(OngoingAuction->Item.expired())
    {
        switch(obj->ItemType)
        {
        default:
            Act(AT_TELL, "You cannot auction $Ts.", ch, nullptr,
                ActArg(GetItemTypeName(obj)), ActTarget::Char);
            return;

            /* insert any more item types.here... items with a timer MAY NOT BE
               AUCTIONED!
            */
        case ITEM_LIGHT:
        case ITEM_TREASURE:
        case ITEM_RARE_METAL:
        case ITEM_CRYSTAL:
        case ITEM_BOOK:
        case ITEM_FABRIC:
        case ITEM_ARMOR:
        case ITEM_CONTAINER:
            SeparateOneObjectFromGroup(obj);
            ObjectFromCharacter(obj);

            if(SysData.SaveFlags.test(Flag::AutoSave::Auction))
            {
                PlayerCharacters->Save(ch);
            }

            OngoingAuction->Item = obj;
            OngoingAuction->Bet = 0;
            OngoingAuction->Buyer = ch;
            OngoingAuction->Seller = ch;
            OngoingAuction->Pulse = PULSE_AUCTION;
            OngoingAuction->Going = 0;
            OngoingAuction->Starting = ToLong(arg2);

            if(OngoingAuction->Starting > 0)
                OngoingAuction->Bet = OngoingAuction->Starting;

            sprintf(buf, "A new item is being auctioned: %s at %d credits.", obj->ShortDescr.c_str(), OngoingAuction->Starting);
            TalkAuction(buf);
        }
    }
    else
    {
        auto auctionItem = OngoingAuction->Item.lock();
        Act(AT_TELL, "Try again later - $p is being auctioned right now!", ch, auctionItem, NULL, ActTarget::Char);
        SetWaitState(ch, 1.5 * PULSE_VIOLENCE);
    }
}
