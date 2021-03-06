#include "character.hpp"
#include "mud.hpp"
#include "room.hpp"
#include "descriptor.hpp"
#include "act.hpp"

void do_beep(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    std::string arg;
    bool ch_comlink = false, victim_comlink = false;

    argument = OneArgument(argument, arg);

    RemoveBit(ch->Deaf, CHANNEL_TELLS);

    if(ch->InRoom->Flags.test(Flag::Room::Silence))
    {
        ch->Echo("You can't do that here.\r\n");
        return;
    }

    if(!IsNpc(ch)
       && (ch->Flags.test(Flag::Plr::Silence)
           || ch->Flags.test(Flag::Plr::NoTell)))
    {
        ch->Echo("You can't do that.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("Beep whom?\r\n");
        return;
    }

    if((victim = GetCharacterAnywhere(ch, arg)) == NULL
       || (IsNpc(victim) && victim->InRoom != ch->InRoom)
       || (IsAuthed(ch) && !IsAuthed(victim) && !IsImmortal(ch)))
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(IsImmortal(ch))
    {
        ch_comlink = true;
        victim_comlink = true;
    }

    if(IsImmortal(victim))
        victim_comlink = true;

    ch_comlink = HasComlink(ch);

    if(!ch_comlink)
    {
        ch->Echo("You need a comlink to do that!\r\n");
        return;
    }

    if(!victim_comlink)
    {
        victim_comlink = HasComlink(ch);
    }

    if(!victim_comlink)
    {
        ch->Echo("They don't seem to have a comlink!\r\n");
        return;
    }

    if(!IsAuthed(ch) && IsAuthed(victim) && !IsImmortal(victim))
    {
        ch->Echo("They can't hear you because you are not authorized.\r\n");
        return;
    }

    if(!IsNpc(victim) && (victim->Switched)
       && (GetTrustLevel(ch) > LEVEL_AVATAR))
    {
        ch->Echo("That player is switched.\r\n");
        return;
    }
    else if(!IsNpc(victim) && (!victim->Desc))
    {
        ch->Echo("That player is link-dead.\r\n");
        return;
    }

    if(IsBitSet(victim->Deaf, CHANNEL_TELLS)
       && (!IsImmortal(ch) || (GetTrustLevel(ch) < GetTrustLevel(victim))))
    {
        Act(AT_PLAIN, "$E has $S tells turned off.", ch, NULL, victim,
            ActTarget::Char);
        return;
    }

    if(!IsNpc(victim) && victim->Flags.test(Flag::Plr::Silence))
    {
        ch->Echo("That player is silenced. They will receive your message but can not respond.\r\n");
    }

    if((!IsImmortal(ch) && !IsAwake(victim))
       || (!IsNpc(victim)
           && victim->InRoom->Flags.test(Flag::Room::Silence)))
    {
        Act(AT_PLAIN, "$E can't hear you.", ch, 0, victim, ActTarget::Char);
        return;
    }

    if(victim->Desc
       && IsInEditor(victim)
       && GetTrustLevel(ch) < LEVEL_GREATER)
    {
        Act(AT_PLAIN, "$E is currently in a writing buffer. Please try again in a few minutes.",
            ch, 0, victim, ActTarget::Char);
        return;
    }

    ch->Echo("&WYou beep %s: %s\r\n\a",
             victim->Name.c_str(), argument.c_str());
    victim->Echo("\a");

    if(CharacterKnowsLanguage(victim, ch->Speaking, ch)
       || (IsNpc(ch) && !ch->Speaking))
        Act(AT_WHITE, "$n beeps: '$t'", ch, argument, victim, ActTarget::Vict);
    else
        Act(AT_WHITE, "$n beeps: '$t'", ch,
            Scramble(argument, ch->Speaking), victim, ActTarget::Vict);
}
