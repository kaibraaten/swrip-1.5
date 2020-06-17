#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "room.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "repos/clanrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/storeroomrepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"

static void SaveStoreroomForOwnerClan(const std::shared_ptr<Clan> &clan, Character *ch);
static void get_obj(Character *ch, std::shared_ptr<Object> obj, std::shared_ptr<Object> container);

void do_get(Character *ch, std::string argument)
{
    std::string arg1;
    std::string arg2;
    std::shared_ptr<Object> container;
    short number = 0;
    bool found = false;
    bool foundowner = false;
    Character *p = NULL, *p_prev = NULL;

    argument = OneArgument(argument, arg1);

    if(IsNumber(arg1))
    {
        number = ToLong(arg1);

        if(number < 1)
        {
            ch->Echo("That was easy...\r\n");
            return;
        }

        if((ch->CarryNumber + number) > GetCarryCapacityNumber(ch))
        {
            ch->Echo("You can't carry that many.\r\n");
            return;
        }

        argument = OneArgument(argument, arg1);
    }
    else
    {
        number = 0;
    }

    argument = OneArgument(argument, arg2);

    /* munch optional words */
    if(!StrCmp(arg2, "from") && !argument.empty())
    {
        argument = OneArgument(argument, arg2);
    }

    /* Get type. */
    if(arg1.empty())
    {
        ch->Echo("Get what?\r\n");
        return;
    }

    if(HasMentalStateToFindObject(ch))
    {
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::PlayerHome)
       && GetTrustLevel(ch) < LEVEL_SUB_IMPLEM)
    {
        if(!Homes->IsResidentOf(ch->Name, ch->InRoom->Vnum))
        {
            for(p = LastCharacter; p; p = p_prev)
            {
                p_prev = p->Previous;

                if(Homes->IsResidentOf(p->Name, ch->InRoom->Vnum))
                {
                    foundowner = true;
                }
            }

            if(!foundowner)
            {
                ch->Echo("You can not do that here.\r\n");
                return;
            }
        }
    }

    if(arg2.empty())
    {
        if(number <= 1 && StrCmp(arg1, "all")
           && StringPrefix("all.", arg1))
        {
            /* 'get obj' */
            auto obj = GetObjectInList(ch, arg1, ch->InRoom->Objects());

            if(!obj)
            {
                Act(AT_PLAIN, "I see no $T here.", ch, nullptr, arg1, ActTarget::Char);
                return;
            }

            SeparateOneObjectFromGroup(obj);
            get_obj(ch, obj, NULL);

            if(CharacterDiedRecently(ch))
                return;

            if(SysData.SaveFlags.test(Flag::AutoSave::Get))
            {
                PlayerCharacters->Save(ch);

                if(ch->InRoom->Flags.test(Flag::Room::PlayerHome))
                {
                    SaveHome(ch);
                }

                if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom))
                {
                    SaveStoreroom(ch->InRoom);
                }
            }
        }
        else
        {
            short cnt = 0;
            bool fAll = false;
            std::string chk;

            if(!StrCmp(arg1, "all"))
                fAll = true;
            else
                fAll = false;

            if(number > 1)
                chk = arg1;
            else
                chk = arg1.size() > 4 ? arg1.substr(4) : "";

            /* 'get all' or 'get all.obj' */
            auto objectsOnGround = ch->InRoom->Objects();

            for(auto obj : objectsOnGround)
            {
                if((fAll || NiftyIsName(chk, obj->Name))
                   && CanSeeObject(ch, obj))
                {
                    found = true;

                    if(number && (cnt + obj->Count) > number)
                        SplitGroupedObject(obj, number - cnt);

                    cnt += obj->Count;
                    get_obj(ch, obj, NULL);

                    if(CharacterDiedRecently(ch)
                       || ch->CarryNumber >= GetCarryCapacityNumber(ch)
                       || ch->CarryWeight >= GetCarryCapacityWeight(ch)
                       || (number && cnt >= number))
                    {
                        if(SysData.SaveFlags.test(Flag::AutoSave::Get)
                           && !CharacterDiedRecently(ch))
                        {
                            PlayerCharacters->Save(ch);

                            if(ch->InRoom->Flags.test(Flag::Room::PlayerHome))
                            {
                                SaveHome(ch);
                            }

                            if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom))
                            {
                                SaveStoreroom(ch->InRoom);
                            }
                        }

                        return;
                    }
                }
            }

            if(!found)
            {
                if(fAll)
                    ch->Echo("I see nothing here.\r\n");
                else
                    Act(AT_PLAIN, "I see no $T here.", ch, nullptr, chk, ActTarget::Char);
            }
            else if(SysData.SaveFlags.test(Flag::AutoSave::Get))
            {
                PlayerCharacters->Save(ch);

                if(ch->InRoom->Flags.test(Flag::Room::PlayerHome))
                {
                    SaveHome(ch);
                }

                if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom))
                {
                    SaveStoreroom(ch->InRoom);
                }
            }
        }
    }
    else
    {
        /* 'get ... container' */
        if(!StrCmp(arg2, "all") || !StringPrefix("all.", arg2))
        {
            ch->Echo("You can't do that.\r\n");
            return;
        }

        if((container = GetObjectHere(ch, arg2)) == nullptr)
        {
            Act(AT_PLAIN, "I see no $T here.", ch, nullptr, arg2, ActTarget::Char);
            return;
        }

        switch(container->ItemType)
        {
        default:
            if(!container->Flags.test(Flag::Obj::Covering))
            {
                ch->Echo("That's not a container.\r\n");
                return;
            }

            if(ch->CarryWeight + container->Weight > GetCarryCapacityWeight(ch))
            {
                ch->Echo("It's too heavy for you to lift.\r\n");
                return;
            }

            break;

        case ITEM_CONTAINER:
        case ITEM_DROID_CORPSE:
        case ITEM_CORPSE_PC:
        case ITEM_CORPSE_NPC:
            break;
        }

        if(!container->Flags.test(Flag::Obj::Covering)
           && IsBitSet(container->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            Act(AT_PLAIN, "The $d is closed.",
                ch, nullptr, container->Name, ActTarget::Char);
            return;
        }

        if(number <= 1 && StrCmp(arg1, "all")
           && StringPrefix("all.", arg1))
        {
            /* 'get obj container' */
            auto obj = GetObjectInList(ch, arg1, container->Objects());

            if(obj == nullptr)
            {
                Act(AT_PLAIN,
                    container->Flags.test(Flag::Obj::Covering)
                    ? "I see nothing like that beneath the $T."
                    : "I see nothing like that in the $T.",
                    ch, nullptr, arg2, ActTarget::Char);
                return;
            }

            SeparateOneObjectFromGroup(obj);
            get_obj(ch, obj, container);

            CheckObjectForTrap(ch, container, TRAP_GET);

            if(CharacterDiedRecently(ch))
                return;

            if(SysData.SaveFlags.test(Flag::AutoSave::Get))
            {
                PlayerCharacters->Save(ch);

                if(ch->InRoom->Flags.test(Flag::Room::PlayerHome))
                {
                    SaveHome(ch);
                }

                if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom))
                {
                    SaveStoreroom(ch->InRoom);
                }
            }
        }
        else
        {
            int cnt = 0;
            bool fAll = false;
            std::string chk;

            if(!StrCmp(arg1, "all"))
                fAll = true;
            else
                fAll = false;

            if(number > 1)
                chk = arg1;
            else
                chk = arg1.size() > 4 ? arg1.substr(4) : "";

            found = false;

            auto contents = container->Objects();

            for(auto obj : contents)
            {
                if((fAll || NiftyIsName(chk, obj->Name))
                   && CanSeeObject(ch, obj))
                {
                    found = true;

                    if(number && (cnt + obj->Count) > number)
                        SplitGroupedObject(obj, number - cnt);

                    cnt += obj->Count;
                    get_obj(ch, obj, container);

                    if(CharacterDiedRecently(ch)
                       || ch->CarryNumber >= GetCarryCapacityNumber(ch)
                       || ch->CarryWeight >= GetCarryCapacityWeight(ch)
                       || (number && cnt >= number))
                        return;
                }
            }

            if(!found)
            {
                if(fAll)
                    Act(AT_PLAIN,
                        container->Flags.test(Flag::Obj::Covering)
                        ? "I see nothing beneath the $T."
                        : "I see nothing in the $T.",
                        ch, nullptr, arg2, ActTarget::Char);
                else
                    Act(AT_PLAIN,
                        container->Flags.test(Flag::Obj::Covering)
                        ? "I see nothing like that beneath the $T."
                        : "I see nothing like that in the $T.",
                        ch, nullptr, arg2, ActTarget::Char);
            }
            else
            {
                CheckObjectForTrap(ch, container, TRAP_GET);
            }

            if(CharacterDiedRecently(ch))
            {
                return;
            }

            if(found && SysData.SaveFlags.test(Flag::AutoSave::Get))
            {
                PlayerCharacters->Save(ch);

                if(ch->InRoom->Flags.test(Flag::Room::PlayerHome))
                {
                    SaveHome(ch);
                }

                if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom))
                {
                    SaveStoreroom(ch->InRoom);
                }
            }
        }
    }
}

static void get_obj(Character *ch, std::shared_ptr<Object> obj, std::shared_ptr<Object> container)
{
    int weight = 0;

    if(!obj->WearFlags.test(Flag::Wear::Take)
       && (ch->TopLevel < SysData.LevelToGetObjectsWithoutTakeFlag))
    {
        ch->Echo("You can't take that.\r\n");
        return;
    }

    if(obj->Flags.test(Flag::Obj::Prototype)
       && !CharacterCanTakePrototype(ch))
    {
        ch->Echo("A godly force prevents you from getting close to it.\r\n");
        return;
    }

    if(ch->CarryNumber + GetObjectCount(obj) > GetCarryCapacityNumber(ch))
    {
        Act(AT_PLAIN, "$d: you can't carry that many items.",
            ch, nullptr, obj->Name, ActTarget::Char);
        return;
    }

    if(obj->Flags.test(Flag::Obj::Covering))
        weight = obj->Weight;
    else
        weight = GetObjectWeight(obj);

    if(ch->CarryWeight + weight > GetCarryCapacityWeight(ch))
    {
        Act(AT_PLAIN, "$d: you can't carry that much weight.",
            ch, nullptr, obj->Name, ActTarget::Char);
        return;
    }

    if(container)
    {
        Act(AT_ACTION,
            container->Flags.test(Flag::Obj::Covering)
            ? "You get $p from beneath $P." : "You get $p from $P",
            ch, obj, container, ActTarget::Char);
        Act(AT_ACTION,
            container->Flags.test(Flag::Obj::Covering)
            ? "$n gets $p from beneath $P." : "$n gets $p from $P",
            ch, obj, container, ActTarget::Room);
        ObjectFromObject(obj);
    }
    else
    {
        Act(AT_ACTION, "You get $p.", ch, obj, container, ActTarget::Char);
        Act(AT_ACTION, "$n gets $p.", ch, obj, container, ActTarget::Room);
        ObjectFromRoom(obj);
    }


    if(ch->InRoom->Flags.test(Flag::Room::ClanStoreroom)
       && (container == NULL || container->CarriedBy == NULL))
    {
        for(const auto &clan : Clans)
        {
            SaveStoreroomForOwnerClan(clan, ch);
        }
    }

    if(obj->ItemType != ITEM_CONTAINER)
        CheckObjectForTrap(ch, obj, TRAP_GET);

    if(CharacterDiedRecently(ch))
        return;

    if(obj->ItemType == ITEM_MONEY)
    {
        ch->Gold += obj->Value[0];
        ExtractObject(obj);
    }
    else
    {
        obj = ObjectToCharacter(obj, ch);
    }

    if(CharacterDiedRecently(ch) || IsObjectExtracted(obj))
        return;

    ObjProgGetTrigger(ch, obj);
}

static void SaveStoreroomForOwnerClan(const std::shared_ptr<Clan> &clan, Character *ch)
{
    if(clan->Storeroom == ch->InRoom->Vnum)
    {
        auto room = GetRoom(clan->Storeroom);
        Storerooms->Save(room);
    }
}
