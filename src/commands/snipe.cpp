#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "exit.hpp"
#include "act.hpp"

void do_snipe(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg2;
    DirectionType dir = DIR_INVALID;
    short dist = 0;
    short max_dist = 1;
    std::shared_ptr<Exit> pexit;
    std::shared_ptr<Character> victim;
    int the_chance = 0;
    char buf[MAX_STRING_LENGTH];
    bool pfound = false;

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("You'll have to do that elsewhere.\r\n");
        return;
    }

    if(GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD) != NULL)
    {
        ch->Echo("You can't do that while wielding two weapons.");
        return;
    }

    auto wield = GetEquipmentOnCharacter(ch, WEAR_WIELD);

    if(wield == nullptr
       || wield->ItemType != ITEM_WEAPON
       || wield->Value[OVAL_WEAPON_TYPE] != WEAPON_BLASTER)
    {
        ch->Echo("You don't seem to be holding a blaster");
        return;
    }

    if(!IsNpc(ch) && GetSkillLevel(ch, gsn_snipe) > 100)
        max_dist += GetSkillLevel(ch, gsn_snipe) / 15;

    argument = OneArgument(argument, arg);
    argument = OneArgument(argument, arg2);

    if((dir = GetDirection(arg)) == -1 || arg2.empty())
    {
        ch->Echo("Usage: snipe <dir> <target>\r\n");
        return;
    }

    if((pexit = GetExit(ch->InRoom, dir)) == NULL)
    {
        ch->Echo("Are you expecting to fire through a wall?\r\n");
        return;
    }

    if(pexit->Flags.test(Flag::Exit::Closed))
    {
        ch->Echo("Are you expecting to fire through a door?\r\n");
        return;
    }

    auto was_in_room = ch->InRoom;

    for(dist = 0; dist <= max_dist; dist++)
    {
        if(pexit->Flags.test(Flag::Exit::Closed))
            break;

        if(!pexit->ToRoom)
            break;

        std::shared_ptr<Room> to_room;

        if(pexit->Distance > 1)
            to_room = GenerateExit(ch->InRoom, pexit);

        if(to_room == NULL)
            to_room = pexit->ToRoom;

        CharacterFromRoom(ch);
        CharacterToRoom(ch, to_room);

        if(IsNpc(ch) && (victim = GetCharacterInRoomMudProg(ch, arg2)) != NULL)
        {
            pfound = true;
            break;
        }
        else if(!IsNpc(ch) && (victim = GetCharacterInRoom(ch, arg2)) != NULL)
        {
            pfound = true;
            break;
        }

        if((pexit = GetExit(ch->InRoom, dir)) == NULL)
            break;
    }

    CharacterFromRoom(ch);
    CharacterToRoom(ch, was_in_room);

    if(!pfound)
    {
        ch->Echo("You don't see that person to the %s!\r\n",
                 GetDirectionName(dir));
        CharacterFromRoom(ch);
        CharacterToRoom(ch, was_in_room);
        return;
    }

    if(victim == ch)
    {
        ch->Echo("Shoot yourself... really?\r\n");
        return;
    }

    if(victim->InRoom->Flags.test(Flag::Room::Safe))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("You can't shoot them there.\r\n");
        return;
    }

    if(IsSafe(ch, victim))
        return;

    if(IsAffectedBy(ch, Flag::Affect::Charm) && ch->Master == victim)
    {
        Act(AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, ActTarget::Char);
        return;
    }

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("You do the best you can!\r\n");
        return;
    }

    if(!IsNpc(victim) && ch->Flags.test(Flag::Plr::Nice))
    {
        ch->Echo("You feel too nice to do that!\r\n");
        return;
    }

    the_chance = IsNpc(ch) ? 100 : GetSkillLevel(ch, gsn_snipe);

    switch(dir)
    {
    case DIR_NORTH:
    case DIR_EAST:
        dir = (DirectionType)(dir + 2);
        break;

    case DIR_SOUTH:
    case DIR_WEST:
        dir = (DirectionType)(dir - 2);
        break;

    case DIR_UP:
    case DIR_NORTHWEST:
        dir = (DirectionType)(dir + 1);
        break;

    case DIR_DOWN:
    case DIR_SOUTHEAST:
        dir = (DirectionType)(dir - 1);
        break;

    case DIR_NORTHEAST:
        dir = (DirectionType)(dir + 3);
        break;

    case DIR_SOUTHWEST:
        dir = (DirectionType)(dir - 3);
        break;

    default:
        break;
    }

    CharacterFromRoom(ch);
    CharacterToRoom(ch, victim->InRoom);

    if(GetRandomPercent() < the_chance)
    {
        sprintf(buf, "A blaster shot fires at you from the %s.", GetDirectionName(dir));
        Act(AT_ACTION, buf, victim, NULL, ch, ActTarget::Char);
        Act(AT_ACTION, "You fire at $N.", ch, NULL, victim, ActTarget::Char);
        sprintf(buf, "A blaster shot fires at $N from the %s.", GetDirectionName(dir));
        Act(AT_ACTION, buf, ch, NULL, victim, ActTarget::NotVict);

        HitOnce(ch, victim, TYPE_UNDEFINED);

        if(CharacterDiedRecently(ch))
            return;

        StopFighting(ch, true);
        LearnFromSuccess(ch, gsn_snipe);
    }
    else
    {
        Act(AT_ACTION, "You fire at $N but don't even come close.", ch, NULL, victim, ActTarget::Char);
        sprintf(buf, "A blaster shot fired from the %s barely misses you.", GetDirectionName(dir));
        Act(AT_ACTION, buf, ch, NULL, victim, ActTarget::Room);
        LearnFromFailure(ch, gsn_snipe);
    }

    CharacterFromRoom(ch);
    CharacterToRoom(ch, was_in_room);

    if(IsNpc(ch))
    {
        SetWaitState(ch, 1 * PULSE_VIOLENCE);
    }
    else
    {
        if(GetRandomPercent() < GetSkillLevel(ch, gsn_third_attack))
            SetWaitState(ch, 1 * PULSE_PER_SECOND);
        else if(GetRandomPercent() < GetSkillLevel(ch, gsn_second_attack))
            SetWaitState(ch, 2 * PULSE_PER_SECOND);
        else
            SetWaitState(ch, 3 * PULSE_PER_SECOND);
    }

    if(IsNpc(victim) && !CharacterDiedRecently(victim))
    {
        if(victim->Flags.test(Flag::Mob::Sentinel))
        {
            victim->WasSentinel = victim->InRoom;
            victim->Flags.reset(Flag::Mob::Sentinel);
        }

        StartHating(victim, ch);
        StartHunting(victim, ch);
    }
}
