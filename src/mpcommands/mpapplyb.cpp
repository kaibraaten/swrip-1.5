#include "character.hpp"
#include "mud.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "descriptor.hpp"
#include "race.hpp"
#include "act.hpp"

void do_mpapplyb(Character *ch, std::string argument)
{
    Character *victim = NULL;

    if(!IsNpc(ch))
    {
        ch->Echo("Huh?\r\n");
        return;
    }

    if(argument.empty())
    {
        ProgBug("Mpapplyb - bad syntax", ch);
        return;
    }

    if((victim = GetCharacterInRoomMudProg(ch, argument)) == NULL)
    {
        ProgBug("Mpapplyb - no such player in room.", ch);
        return;
    }

    if(!victim->Desc)
    {
        ch->Echo("Not on linkdeads.\r\n");
        return;
    }

    if(IsAuthed(victim))
        return;

    if(GetTimer(victim, TIMER_APPLIED) >= 1)
        return;

    std::string logBuf;

    switch(victim->PCData->AuthState)
    {
    case 0:
    case 1:
    default:
        victim->Echo("You attempt to regain the gods' attention.\r\n");
        logBuf = FormatString("%s@%s new %s applying for authorization...",
                              victim->Name.c_str(), victim->Desc->Remote.Hostname.c_str(),
                              RaceTable[victim->Race].Name);
        Log->Info("%s", logBuf.c_str());
        ToChannel(logBuf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL);
        AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
        victim->PCData->AuthState = 1;
        break;

    case 2:
        victim->Echo("Your name has been deemed unsuitable by the gods. Please choose a more apropriate name with the 'name' command.\r\n");
        AddTimerToCharacter(victim, TIMER_APPLIED, 10, NULL, SUB_NONE);
        break;

    case 3:
        victim->Echo("The gods permit you to enter the Star Wars Reality.\r\n");
        victim->PCData->Flags.reset(Flag::PCData::Unauthed);

        if(victim->Fighting)
            StopFighting(victim, true);

        CharacterFromRoom(victim);
        CharacterToRoom(victim, GetRoom(ROOM_VNUM_SCHOOL));
        Act(AT_WHITE, "$n enters this world from within a column of blinding light!",
            victim, NULL, NULL, ActTarget::Room);
        do_look(victim, "auto");
        break;
    }
}
