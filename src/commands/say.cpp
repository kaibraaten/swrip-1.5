#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "act.hpp"

void do_say(Character *ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    auto mobflags = ch->Flags;

    if(argument.empty())
    {
        ch->Echo("Say what?\r\n");
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Silence))
    {
        ch->Echo("You can't do that here.\r\n");
        return;
    }

    if(IsNpc(ch))
    {
        ch->Flags.reset(Flag::Mob::Secretive);
    }

    for(auto vch : ch->InRoom->Characters())
    {
        std::string sbuf = argument;

        if(vch == ch)
            continue;

        if(!CharacterKnowsLanguage(vch, ch->Speaking, ch)
           && (!IsNpc(ch) || ch->Speaking != 0))
            sbuf = Scramble(argument, ch->Speaking);

        std::string speech = DrunkSpeech(sbuf, ch);

        MOBtrigger = false;
        Act(AT_SAY, "$n says '$t'", ch, speech.c_str(), vch, TO_VICT);
    }

    ch->Flags = mobflags;
    MOBtrigger = false;
    Act(AT_SAY, "You say '$T'", ch, NULL, DrunkSpeech(argument, ch).c_str(), TO_CHAR);

    if(ch->InRoom->Flags.test(Flag::Room::LogSpeech))
    {
        sprintf(buf, "%s: %s", IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str(),
                argument.c_str());
        AppendToFile(LOG_FILE, buf);
    }

    MobProgSpeechTrigger(argument, ch);

    if(CharacterDiedRecently(ch))
        return;

    ObjProgSpeechTrigger(argument, ch);

    if(CharacterDiedRecently(ch))
        return;

    RoomProgSpeechTrigger(argument, ch);
}
