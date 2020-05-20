#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "room.hpp"
#include "exit.hpp"

void do_flee(Character *ch, std::string argument)
{
    DirectionType door = DIR_INVALID;

    if (!GetFightingOpponent(ch))
    {
        if (ch->Position == POS_FIGHTING)
        {
            if (ch->Mount)
                ch->Position = POS_MOUNTED;
            else
                ch->Position = POS_STANDING;
        }

        ch->Echo("You aren't fighting anyone.\r\n");
        return;
    }

    if (ch->Fatigue.Current <= 0)
    {
        ch->Echo("You're too exhausted to flee from combat!\r\n");
        return;
    }

    /* No fleeing while stunned. - Narn */
    if (ch->Position < POS_FIGHTING)
        return;

    auto was_in = ch->InRoom;

    for (int attempt = 0; attempt < 8; attempt++)
    {
        door = (DirectionType)GetRandomDoor();
        std::shared_ptr<Exit> pexit = GetExit(was_in, door);

        if (pexit == nullptr
            || pexit->ToRoom == nullptr
            || (pexit->Flags.test(Flag::Exit::Closed)
                && !IsAffectedBy(ch, Flag::Affect::PassDoor))
            || (IsNpc(ch)
                && pexit->ToRoom->Flags.test(Flag::Room::NoMob)))
            continue;

        if (!HasPermanentSneak(ch))
        {
            StripAffect(ch, gsn_sneak);
            ch->AffectedBy.reset(Flag::Affect::Sneak);
        }

        if (ch->Mount && ch->Mount->Fighting)
            StopFighting(ch->Mount, true);
        MoveCharacter(ch, pexit, 0);

        MobProgEntryTrigger(ch);

        if (CharacterDiedRecently(ch))
            return;

        RoomProgEnterTrigger(ch);

        if (CharacterDiedRecently(ch))
            return;

        MobProgGreetTrigger(ch);

        if (CharacterDiedRecently(ch))
            return;

        ObjProgGreetTrigger(ch);

        if (CharacterDiedRecently(ch))
            return;

        auto now_in = ch->InRoom;

        if (now_in == was_in)
            continue;

        ch->InRoom = was_in;
        Act(AT_FLEE, "$n runs for cover!", ch, NULL, NULL, TO_ROOM);
        ch->InRoom = now_in;
        Act(AT_FLEE, "$n glances around for signs of pursuit.", ch, NULL, NULL, TO_ROOM);
        ch->Echo("You run for cover!");

        StopFighting(ch, true);
        return;
    }

    ch->Echo("You attempt to run for cover!\r\n");
}
