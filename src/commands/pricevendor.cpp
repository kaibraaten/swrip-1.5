#include <ctime>
#include "shop.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"
#include "repos/playerrepository.hpp"
#include "act.hpp"

void do_pricevendor(Character *ch, std::string argument)
{
    Character *vendor = NULL;
    Character *ch1 = NULL;
    std::string arg1;
    std::string arg2;
    Object *obj = NULL;
    struct tm *tms = NULL;

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);

    if(arg1.empty() || arg2.empty())
    {
        ch->Echo("Syntax: pricevendor <item> <cost>\r\n");
        return;
    }

    if((vendor = FindKeeper(ch)) == NULL)
    {
        return;
    }

    if(vendor->Owner.empty())
    {
        return;
    }

    if((ch1 = GetCharacterInRoom(ch, vendor->Owner)) == NULL)
    {
        ch->Echo("This isn't your vendor!\r\n");
        return;
    }

    if(StrCmp(ch1->Name, vendor->Owner))
    {
        ch->Echo("Trying to steal huh?\r\n");
        tms = localtime(&current_time);
        tms->tm_hour += 24;
        ch->PCData->ReleaseDate = mktime(tms);
        ch->PCData->HelledBy = "VendorCheat";
        Act(AT_MAGIC, "$n disappears in a cloud of hellish light.", ch, NULL, ch, TO_NOTVICT);
        CharacterFromRoom(ch);
        CharacterToRoom(ch, GetRoom(ROOM_VNUM_HELL));
        Act(AT_MAGIC, "$n appears in a could of hellish light.", ch, NULL, ch, TO_NOTVICT);
        do_look(ch, "auto");
        ch->Echo("The immortals are not pleased with your actions.\r\n"
                 "You shall remain in hell for 24 Hours.\r\n");
        PlayerCharacters->Save(ch);
        Log->Info("%s just tried to abuse the vendor bug!", ch->Name.c_str());
        return;
    }

    if(ch->Fighting)
    {
        ch->Echo("Not while you're fighting!\r\n");
        return;
    }

    if((obj = GetCarriedObject(vendor, arg1)) != NULL)
    {
        obj->Cost = ToLong(arg2);
        ch->Echo("The price has been changed.\r\n");
        SaveVendor(vendor);
        return;
    }

    ch->Echo("He doesn't have that item!\r\n");
    SaveVendor(vendor);
}
