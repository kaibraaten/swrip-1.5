/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <utility/random.hpp>
#include "object.hpp"
#include "character.hpp"
#include "mud.hpp"
#include "log.hpp"
#include "room.hpp"
#include "exit.hpp"
#include "act.hpp"

 /*
  * how resistant an object is to damage                         -Thoric
  */
short GetObjectResistance(std::shared_ptr<Object> obj)
{
    short resist = NumberFuzzy(MAX_ITEM_IMPACT);

    /* magical items are more resistant */
    if(obj->Flags.test(Flag::Obj::Magic))
        resist += NumberFuzzy(12);

    /* blessed objects should have a little bonus */
    if(obj->Flags.test(Flag::Obj::Bless))
        resist += NumberFuzzy(5);

    /* lets make store inventory pretty tough */
    if(obj->Flags.test(Flag::Obj::Inventory))
        resist += 20;

    /* okay... let's add some bonus/penalty for item level... */
    resist += (obj->Level / 10);

    /* and lasty... take armor or weapon's condition into consideration */
    if(obj->ItemType == ITEM_ARMOR)
    {
        resist += (obj->Value[OVAL_ARMOR_CONDITION]);
    }
    else if(obj->ItemType == ITEM_WEAPON)
    {
        resist += (obj->Value[OVAL_WEAPON_CONDITION]);
    }

    return urange(10, resist, 99);
}

/*
 * Damage an object.                                            -Thoric
 * Affect player's AC if necessary.
 * Make object into scraps if necessary.
 * Send message about damaged object.
 */
obj_ret DamageObject(std::shared_ptr<Object> obj)
{
    Character *ch = obj->CarriedBy;
    obj_ret objcode = rNONE;

    if(ch != nullptr && IsInArena(ch))
    {
        return objcode;
    }

    SeparateOneObjectFromGroup(obj);

    if(ch)
    {
        Act(AT_OBJECT, "($p gets damaged)", ch, obj, nullptr, ActTarget::Char);
    }
    else if(obj->InRoom && !obj->InRoom->Characters().empty())
    {
        ch = obj->InRoom->Characters().front();
        Act(AT_OBJECT, "($p gets damaged)", ch, obj, NULL, ActTarget::Room);
        Act(AT_OBJECT, "($p gets damaged)", ch, obj, NULL, ActTarget::Char);
        ch = NULL;
    }

    ObjProgDamageTrigger(ch, obj);

    if(IsObjectExtracted(obj))
        return global_objcode;

    switch(obj->ItemType)
    {
    default:
        MakeScraps(obj);
        objcode = rOBJ_SCRAPPED;
        break;

    case ITEM_CONTAINER:
        if(--obj->Value[OVAL_CONTAINER_CONDITION] <= 0)
        {
            MakeScraps(obj);
            objcode = rOBJ_SCRAPPED;
        }
        break;

    case ITEM_ARMOR:
        if(ch && obj->Value[OVAL_ARMOR_CONDITION] >= 1)
            ch->ArmorClass += GetObjectArmorClass(obj, obj->WearLoc);

        if(--obj->Value[OVAL_ARMOR_CONDITION] <= 0)
        {
            MakeScraps(obj);
            objcode = rOBJ_SCRAPPED;
        }
        else
            if(ch && obj->Value[OVAL_ARMOR_CONDITION] >= 1)
                ch->ArmorClass -= GetObjectArmorClass(obj, obj->WearLoc);

        break;

    case ITEM_WEAPON:
        if(--obj->Value[OVAL_WEAPON_CONDITION] <= 0)
        {
            MakeScraps(obj);
            objcode = rOBJ_SCRAPPED;
        }
        break;
    }

    return objcode;
}

/* Make objects in rooms that are nofloor fall - Scryn 1/23/96 */
void ObjectFallIfNoFloor(std::shared_ptr<Object> obj, bool through)
{
    static int fall_count;
    static bool is_falling; /* Stop loops from the call to ObjectToRoom()  -- Altrag */

    if(!obj->InRoom || is_falling)
        return;

    if(fall_count > 30)
    {
        Log->Bug("object falling in loop more than 30 times");
        ExtractObject(obj);
        fall_count = 0;
        return;
    }

    if(obj->InRoom->Flags.test(Flag::Room::NoFloor)
       && CAN_GO(obj, DIR_DOWN)
       && !obj->Flags.test(Flag::Obj::Magic))
    {
        auto pexit = GetExit(obj->InRoom, DIR_DOWN);
        auto to_room = pexit->ToRoom;

        if(through)
            fall_count++;
        else
            fall_count = 0;

        if(obj->InRoom == to_room)
        {
            Log->Bug("Object falling into same room, room %ld", to_room->Vnum);
            ExtractObject(obj);
            return;
        }

        if(!obj->InRoom->Characters().empty())
        {
            Character *ch = obj->InRoom->Characters().front();
            Act(AT_PLAIN, "$p falls far below...", ch, obj, NULL, ActTarget::Room);
            Act(AT_PLAIN, "$p falls far below...", ch, obj, NULL, ActTarget::Char);
        }

        ObjectFromRoom(obj);
        is_falling = true;
        obj = ObjectToRoom(obj, to_room);
        is_falling = false;

        if(!obj->InRoom->Characters().empty())
        {
            Character *ch = obj->InRoom->Characters().front();
            Act(AT_PLAIN, "$p falls from above...", ch, obj, NULL, ActTarget::Room);
            Act(AT_PLAIN, "$p falls from above...", ch, obj, NULL, ActTarget::Char);
        }

        if(!obj->InRoom->Flags.test(Flag::Room::NoFloor)
           && through)
        {
            int dam = fall_count * obj->Weight / 2;

            /* Damage players */
            if(!obj->InRoom->Characters().empty() && GetRandomPercent() > 15)
            {
                Character *vch = NULL;
                int chcnt = 0;

                for(Character *rch : obj->InRoom->Characters())
                {
                    if(GetRandomNumberFromRange(0, chcnt) == 0)
                    {
                        vch = rch;
                    }

                    chcnt++;
                }

                Act(AT_WHITE, "$p falls on $n!", vch, obj, NULL, ActTarget::Room);
                Act(AT_WHITE, "$p falls on you!", vch, obj, NULL, ActTarget::Char);
                InflictDamage(vch, vch, dam * vch->TopLevel, TYPE_UNDEFINED);
            }
            /* Damage objects */
            switch(obj->ItemType)
            {
            case ITEM_WEAPON:
            case ITEM_ARMOR:
                if((obj->Value[OVAL_ARMOR_CONDITION] - dam) <= 0)
                {
                    if(!obj->InRoom->Characters().empty())
                    {
                        Character *ch = obj->InRoom->Characters().front();
                        Act(AT_PLAIN, "$p is destroyed by the fall!", ch, obj, NULL, ActTarget::Room);
                        Act(AT_PLAIN, "$p is destroyed by the fall!", ch, obj, NULL, ActTarget::Char);
                    }
                    MakeScraps(obj);
                }
                else
                    obj->Value[OVAL_ARMOR_CONDITION] -= dam;
                break;
            default:
                if((dam * 15) > GetObjectResistance(obj))
                {
                    if(!obj->InRoom->Characters().empty())
                    {
                        Character *ch = obj->InRoom->Characters().front();
                        Act(AT_PLAIN, "$p is destroyed by the fall!", ch, obj, NULL, ActTarget::Room);
                        Act(AT_PLAIN, "$p is destroyed by the fall!", ch, obj, NULL, ActTarget::Char);
                    }

                    MakeScraps(obj);
                }
                break;
            }
        }

        ObjectFallIfNoFloor(obj, true);
    }
}

bool RemoveObject(Character *ch, WearLocation iWear, bool fReplace)
{
    std::shared_ptr<Object> obj, tmpobj;

    if((obj = GetEquipmentOnCharacter(ch, iWear)) == NULL)
        return true;

    if(!fReplace
       && ch->CarryNumber + GetObjectCount(obj) > GetCarryCapacityNumber(ch))
    {
        Act(AT_PLAIN, "$d: you can't carry that many items.",
            ch, NULL, obj->Name, ActTarget::Char);
        return false;
    }

    if(!fReplace)
        return false;

    if(obj->Flags.test(Flag::Obj::NoRemove))
    {
        Act(AT_PLAIN, "You can't remove $p.", ch, obj, NULL, ActTarget::Char);
        return false;
    }

    if(obj == GetEquipmentOnCharacter(ch, WEAR_WIELD)
       && (tmpobj = GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD)) != NULL)
        tmpobj->WearLoc = WEAR_WIELD;

    UnequipCharacter(ch, obj);

    Act(AT_ACTION, "$n stops using $p.", ch, obj, NULL, ActTarget::Room);
    Act(AT_ACTION, "You stop using $p.", ch, obj, NULL, ActTarget::Char);
    ObjProgRemoveTrigger(ch, obj);
    return true;
}

std::string GetObjectShortDescription(std::shared_ptr<Object> obj)
{
    if(obj->Count > 1)
    {
        return FormatString("%s (%d)", obj->ShortDescr.c_str(), obj->Count);
    }

    return obj->ShortDescr;
}
