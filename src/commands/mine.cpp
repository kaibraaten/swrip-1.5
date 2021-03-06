#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "object.hpp"
#include "act.hpp"

void do_mine(std::shared_ptr<Character> ch, std::string arg)
{
    if(GetSkillLevel(ch, gsn_mine) <= 0)
    {
        ch->Echo("You have no idea how to do that.\r\n");
        return;
    }

    if(arg.empty())
    {
        ch->Echo("And what will you mine the room with?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
        return;

    bool shovel = GetFirstObjectOfType(ch, ITEM_SHOVEL) != nullptr;
    auto obj = GetObjectInListReverse(ch, arg, ch->InRoom->Objects());

    if(!obj)
    {
        ch->Echo("You don't see on here.\r\n");
        return;
    }

    SeparateOneObjectFromGroup(obj);

    if(obj->ItemType != ITEM_LANDMINE)
    {
        Act(AT_PLAIN, "That's not a landmine!", ch, obj, nullptr, ActTarget::Char);
        return;
    }

    if(!obj->WearFlags.test(Flag::Wear::Take))
    {
        Act(AT_PLAIN, "You cannot bury $p.", ch, obj, nullptr, ActTarget::Char);
        return;
    }

    switch(ch->InRoom->Sector)
    {
    case SectorType::City:
    case SectorType::Inside:
        ch->Echo("The floor is too hard to dig through.\r\n");
        return;

    case SectorType::WaterSwimmable:
    case SectorType::WaterNotSwimmable:
    case SectorType::Underwater:
        ch->Echo("You cannot bury a mine in the water.\r\n");
        return;

    case SectorType::Air:
        ch->Echo("What? Bury a mine in the air?!\r\n");
        return;

    default:
        break;
    }

    if(obj->Weight > (umax(5, (GetCarryCapacityWeight(ch) / 10)))
       && !shovel)
    {
        ch->Echo("You'd need a shovel to bury something that big.\r\n");
        return;
    }

    int move = (obj->Weight * 50 * (shovel ? 1 : 5)) / umax(1, GetCarryCapacityWeight(ch));
    move = urange(2, move, 1000);

    if(move > ch->Fatigue.Current)
    {
        ch->Echo("You don't have the energy to bury something of that size.\r\n");
        return;
    }

    ch->Fatigue.Current -= move;

    obj->Flags.set(Flag::Obj::Burried);
    SetWaitState(ch, urange(10, move / 2, 100));

    obj->ArmedBy = ch->Name;

    ch->Echo("You arm and bury %s.\r\n", obj->ShortDescr.c_str());
    Act(AT_PLAIN, "$n arms and buries $p.", ch, obj, NULL, ActTarget::Room);

    LearnFromSuccess(ch, gsn_mine);
}

