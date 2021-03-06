#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"
#include "systemdata.hpp"

void show_char_to_char(const std::list<std::shared_ptr<Character>> &list, std::shared_ptr<Character> ch);

void do_scan(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Exit> pexit;
    DirectionType dir = DIR_INVALID;
    short dist = 0;
    short max_dist = 5;

    if(argument.empty())
    {
        ch->Echo("Scan in a direction...\r\n");
        return;
    }

    if((dir = GetDirection(argument)) == -1)
    {
        ch->Echo("Scan in WHAT direction?\r\n");
        return;
    }

    auto was_in_room = ch->InRoom;
    Act(AT_GREY, "Scanning $t...", ch,
        ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
    Act(AT_GREY, "$n scans $t.", ch,
        ActArg(GetDirectionName(dir)), nullptr, ActTarget::Room);

    if(IsNpc(ch)
       || (GetRandomPercent() > GetSkillLevel(ch, gsn_scan)))
    {
        Act(AT_GREY, "You stop scanning $t as your vision blurs.", ch,
            ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
        LearnFromFailure(ch, gsn_scan);
        return;
    }

    if((pexit = GetExit(ch->InRoom, dir)) == NULL)
    {
        Act(AT_GREY, "You can't see $t.", ch,
            ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
        return;
    }

    int charLevel = 0;

    if(SysData.TopLevelFromAbility)
    {
        charLevel = GetAbilityLevel(ch, SkillTable[gsn_scan]->Class);
    }
    else
    {
        charLevel = ch->TopLevel();
    }
    
    if(charLevel < 50)
        max_dist--;

    if(charLevel < 20)
        max_dist--;

    for(dist = 1; dist <= max_dist; )
    {
        if(pexit->Flags.test(Flag::Exit::Closed))
        {
            if(pexit->Flags.test(Flag::Exit::Secret))
                Act(AT_GREY, "Your view $t is blocked by a wall.", ch,
                    ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
            else
                Act(AT_GREY, "Your view $t is blocked by a door.", ch,
                    ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
            break;
        }

        std::shared_ptr<Room> to_room;

        if(pexit->Distance > 1)
            to_room = GenerateExit(ch->InRoom, pexit);

        if(to_room == nullptr)
            to_room = pexit->ToRoom;

        if(IsRoomPrivate(ch, to_room)
           && GetTrustLevel(ch) < LEVEL_GREATER)
        {
            Act(AT_GREY, "Your view $t is blocked by a private room.", ch,
                ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
            break;
        }

        CharacterFromRoom(ch);
        CharacterToRoom(ch, to_room);
        SetCharacterColor(AT_RMNAME, ch);
        ch->Echo(ch->InRoom->Name);
        ch->Echo("\r\n");
        ShowObjectListToCharacter(ch->InRoom->Objects(), ch, false, false);
        show_char_to_char(ch->InRoom->Characters(), ch);

        switch(ch->InRoom->Sector)
        {
        default:
            dist++;
            break;

        case SectorType::Air:
            if(GetRandomPercent() < 80) dist++;
            break;

        case SectorType::Inside:
        case SectorType::Field:
        case SectorType::Underground:
            dist++;
            break;

        case SectorType::Forest:
        case SectorType::City:
        case SectorType::Desert:
        case SectorType::Hills:
            dist += 2;
            break;

        case SectorType::WaterSwimmable:
        case SectorType::WaterNotSwimmable:
            dist += 3;
            break;

        case SectorType::Mountain:
        case SectorType::Underwater:
        case SectorType::Oceanfloor:
            dist += 4;
            break;
        }

        if(dist >= max_dist)
        {
            Act(AT_GREY, "Your vision blurs with distance and you see no farther $t.",
                ch, ActArg(GetDirectionName(dir)), nullptr, ActTarget::Char);
            break;
        }

        if((pexit = GetExit(ch->InRoom, dir)) == NULL)
        {
            Act(AT_GREY, "Your view $t is blocked by a wall.", ch,
                ActArg(GetDirectionName(dir)), NULL, ActTarget::Char);
            break;
        }
    }

    CharacterFromRoom(ch);
    CharacterToRoom(ch, was_in_room);
    LearnFromSuccess(ch, gsn_scan);
}
