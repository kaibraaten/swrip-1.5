#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "repos/playerrepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"

static bool CanQuitHere(const std::shared_ptr<Character> ch, std::shared_ptr<Room> room)
{
    return CheckRoomFlag(ch->InRoom, Flag::Room::Hotel);
}

void do_quit(std::shared_ptr<Character> ch, std::string argument)
{
    int level = 0;
    char qbuf[MAX_INPUT_LENGTH] = { '\0' };

    if(IsNpc(ch) && ch->Flags.test(Flag::Mob::Polymorphed))
    {
        ch->Echo("You can't quit while polymorphed.\r\n");
        return;
    }

    if(IsNpc(ch))
        return;

    if(ch->Position == POS_FIGHTING)
    {
        SetCharacterColor(AT_RED, ch);
        ch->Echo("No way! You are fighting.\r\n");
        return;
    }

    if(ch->Position < POS_STUNNED)
    {
        SetCharacterColor(AT_BLOOD, ch);
        ch->Echo("You're not DEAD yet.\r\n");
        return;
    }

    if(!OngoingAuction->Item.expired() && (ch == OngoingAuction->Buyer || ch == OngoingAuction->Seller))
    {
        ch->Echo("Wait until you have bought/sold the item on auction.\r\n");
        return;
    }

    if(!IsImmortal(ch) && ch->InRoom
       && !CanQuitHere(ch, ch->InRoom)
       && IsAuthed(ch))
    {
        ch->Echo("You may not quit here.\r\n");
        ch->Echo("You will have to find a safer resting place such as a hotel...\r\n");
        ch->Echo("Maybe you could HAIL a speeder.\r\n");
        return;
    }

    if(!ch->Challenged.expired())
    {
        sprintf(qbuf, "%s has quit! Challenge is void. WHAT A WUSS!", ch->Name.c_str());
        ch->Challenged.reset();
        ToChannel(qbuf, CHANNEL_ARENA, "&RArena&W", 5);
    }

    SetCharacterColor(AT_WHITE, ch);
    ch->Echo("Your surroundings begin to fade as a mystical swirling vortex of colors\r\nenvelops your body... When you come to, things are not as they were.\r\n\r\n");
    Act(AT_SAY, "A strange voice says, 'We await your return, $n...'",
        ch, NULL, NULL, ActTarget::Char);
    Act(AT_BYE, "$n has left the game.", ch, NULL, NULL, ActTarget::Room);
    SetCharacterColor(AT_GREY, ch);

    auto logBuf = FormatString("%s has quit.", ch->Name.c_str());
    quitting_char = ch;
    PlayerCharacters->Save(ch);
    SaveHome(ch);

    if(ch->PCData->Pet)
    {
        Act(AT_BYE, "$N follows $S master out of the game.", ch, NULL,
            ch->PCData->Pet, ActTarget::Room);
        ExtractCharacter(ch->PCData->Pet, true);
    }

    saving_char.reset();
    level = GetTrustLevel(ch);
    ExtractCharacter(ch, true);

    for(int x = 0; x < MAX_WEAR; x++)
    {
        for(int y = 0; y < MAX_LAYERS; y++)
        {
            save_equipment[x][y].reset();
        }
    }

    Log->LogStringPlus(logBuf, LOG_COMM, level);
}
