#include <ctime>
#include "mud.hpp"
#include "shop.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "character.hpp"
#include "room.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_collectgold(Character *ch, std::string argument)
{
    Character *vendor = NULL;
    Character *ch1 = NULL;
    long gold = 0;
    std::string name;
    struct tm *tms = NULL;

    if((vendor = FindKeeper(ch)) == NULL)
    {
        return;
    }

    if(vendor->Owner.empty())
    {
        ch->Echo("That's not a vendor!\r\n");
        return;
    }

    name = vendor->Owner;

    if((ch1 = GetCharacterInRoom(ch, vendor->Owner)) == NULL)
    {
        ch->Echo("Trying to steal, huh?\r\n");
        return;
    }

    // Given the call to GetCharacterInRoom() above, how could
    // this expression ever evaluate to true? Need to
    // investigate this further.
    if(StrCmp(ch1->Name, vendor->Owner))
    {
        ch->Echo("Trying to steal, huh?\r\n");
        tms = localtime(&current_time);
        tms->tm_hour += 24;
        ch->PCData->ReleaseDate = mktime(tms);
        ch->PCData->HelledBy = "VendorCheat";
        Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
        CharacterFromRoom(ch);
        CharacterToRoom(ch, GetRoom(ROOM_VNUM_HELL));
        Act(AT_MAGIC, "$n appears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
        do_look(ch, "auto");
        ch->Echo("The immortals are not pleased with your actions.\r\n"
                 "You shall remain in hell for 24 Hours.\r\n");
        PlayerCharacters->Save(ch);
        Log->Info("%s just tried to abuse the vendor bug!", ch->Name.c_str());
        return;
    }


    if(ch != ch1)
    {
        Log->Info("collectgold: %s and ch1 = %s\r\n", name.c_str(), ch1->Name.c_str());
        ch->Echo("This isn't your vendor!\r\n");
        return;
    }

    if(ch->Fighting)
    {
        ch->Echo("Not while you're fighting!\r\n");
        return;
    }

    gold = vendor->Gold;
    gold -= (gold * VENDOR_FEE);

    if(vendor->InRoom && vendor->InRoom->Area)
        BoostEconomy(vendor->InRoom->Area, vendor->Gold);

    vendor->Gold = 0;
    ch->Gold += gold;

    ch->Echo("&GYour vendor gladly hands over his earnings minus a small fee of course.\r\n");
    Act(AT_ACTION, "$n hands over some money.\r\n", vendor, NULL, NULL, TO_ROOM);
}

