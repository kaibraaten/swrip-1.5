#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "act.hpp"

void do_tell(Character *ch, std::string argument)
{
    std::string arg;
    char buf[MAX_INPUT_LENGTH];
    Character *victim = NULL;
    PositionType position = POS_STANDING;
    Character *switched_victim = NULL;
    bool sameroom = false;

    if(IsBitSet(ch->Deaf, CHANNEL_TELLS) && !IsImmortal(ch))
    {
        Act(AT_PLAIN, "You have tells turned off... try chan +tells first",
            ch, NULL, NULL, TO_CHAR);
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Silence))
    {
        ch->Echo("You can't do that here.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && (ch->Flags.test(Flag::Plr::Silence) || ch->Flags.test(Flag::Plr::NoTell)))
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    argument = OneArgument(argument, arg);

    if(arg.empty() || argument.empty())
    {
        ch->Echo("Tell whom what?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL
       || (IsNpc(victim) && victim->InRoom != ch->InRoom)
       || (IsAuthed(ch) && !IsAuthed(victim) && !IsImmortal(ch)))
    {
        ch->Echo("%s can't hear you.\r\n",
                 Capitalize(victim != NULL ? HeSheIt(victim) : "they").c_str());
        return;
    }

    if(ch == victim)
    {
        ch->Echo("You have a nice little chat with yourself.\r\n");
        return;
    }

    if(victim->InRoom == ch->InRoom)
    {
        sameroom = true;
    }
    else
    {
        bool ch_comlink = HasComlink(ch) || IsImmortal(ch);
        bool victim_comlink = HasComlink(victim) || IsImmortal(victim);

        if(!ch_comlink)
        {
            ch->Echo("You need a comlink to do that!\r\n");
            return;
        }

        if(!victim_comlink)
        {
            ch->Echo("%s doesn't seem to have a comlink!\r\n",
                     Capitalize(HeSheIt(victim)).c_str());
            return;
        }
    }

    if(!IsAuthed(ch) && IsAuthed(victim) && !IsImmortal(victim))
    {
        ch->Echo("%s can't hear you because you are not authorized.\r\n",
                 Capitalize(HeSheIt(victim)).c_str());
        return;
    }

    if(!IsNpc(victim) && (victim->Switched)
       && (GetTrustLevel(ch) > LEVEL_AVATAR)
       && !victim->Switched->Flags.test(Flag::Mob::Polymorphed)
       && !IsAffectedBy(victim->Switched, Flag::Affect::Possess))
    {
        ch->Echo("That player is switched.\r\n");
        return;
    }
    else if(!IsNpc(victim) && victim->Switched
            && (victim->Switched->Flags.test(Flag::Mob::Polymorphed)
                || IsAffectedBy(victim->Switched, Flag::Affect::Possess)))
    {
        switched_victim = victim->Switched;
    }
    else if(!IsNpc(victim) && (!victim->Desc))
    {
        ch->Echo("That player is link-dead.\r\n");
        return;
    }

    if(IsBitSet(victim->Deaf, CHANNEL_TELLS)
       && (!IsImmortal(ch) || (GetTrustLevel(ch) < GetTrustLevel(victim))))
    {
        Act(AT_PLAIN, "$E can't hear you.", ch, NULL, victim, TO_CHAR);
        return;
    }

    if(!IsNpc(victim) && (victim->Flags.test(Flag::Plr::Silence)))
    {
        ch->Echo("That player is silenced. %s will receive your message but can not respond.\r\n",
                 Capitalize(HeSheIt(victim)).c_str());
    }

    if((!IsImmortal(ch) && !IsAwake(victim))
       || (!IsNpc(victim) && victim->InRoom->Flags.test(Flag::Room::Silence)))
    {
        Act(AT_PLAIN, "$E can't hear you.", ch, nullptr, victim, TO_CHAR);
        return;
    }

    if(victim->Desc
       && victim->Desc->ConnectionState == CON_EDITING
       && GetTrustLevel(ch) < LEVEL_GREATER)
    {
        Act(AT_PLAIN, "$E is currently in a writing buffer. Please try again in a few minutes.",
            ch, nullptr, victim, TO_CHAR);
        return;
    }

    if(!IsNpc(victim) && victim->Flags.test(Flag::Plr::Afk))
    {
        ch->Echo("That player is afk so %s may not respond.\r\n",
                 Capitalize(HeSheIt(victim)).c_str());
    }

    if(switched_victim)
        victim = switched_victim;

    Act(AT_TELL, "(&COutgoing Message&B) $N: '$t'",
        ch, argument.c_str(), victim, TO_CHAR);
    position = victim->Position;
    victim->Position = POS_STANDING;

    if(CharacterKnowsLanguage(victim, ch->Speaking, ch)
       || (IsNpc(ch) && !ch->Speaking))
    {
        Act(AT_TELL, "(&CIncoming Message&B) $n: '$t'",
            ch, argument.c_str(), victim, TO_VICT);
    }
    else
    {
        Act(AT_TELL, "(&CIncoming Message&B) $n: '$t'",
            ch, Scramble(argument, ch->Speaking).c_str(), victim, TO_VICT);
    }

    victim->Position = position;
    victim->Reply = ch;

    if(ch->InRoom->Flags.test(Flag::Room::LogSpeech))
    {
        sprintf(buf, "%s: %s (tell to) %s.",
                IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str(),
                argument.c_str(),
                IsNpc(victim) ? victim->ShortDescr.c_str() : victim->Name.c_str());
        AppendToFile(LOG_FILE, buf);
    }

    if(!IsImmortal(ch) && !sameroom)
    {
        for(Character *vch : ch->InRoom->Characters())
        {
            std::string sbuf = argument;

            if(vch == ch)
                continue;

            if(!CharacterKnowsLanguage(vch, ch->Speaking, ch) &&
               (!IsNpc(ch) || ch->Speaking != 0))
                sbuf = Scramble(argument, ch->Speaking);

            std::string speech = DrunkSpeech(sbuf, ch);

            MOBtrigger = false;
            Act(AT_SAY, "$n says quietly into $s comlink '$t'",
                ch, speech.c_str(), vch, TO_VICT);
        }

        if(!IsImmortal(victim))
        {
            Act(AT_ACTION, "$n's comlink buzzes with a message.",
                victim, NULL, NULL, TO_ROOM);
        }
    }

    MobProgSpeechTrigger(argument, ch);
}
