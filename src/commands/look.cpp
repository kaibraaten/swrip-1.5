#include <cstring>
#include <cctype>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "exit.hpp"
#include "repos/spaceobjectrepository.hpp"
#include "act.hpp"
#include "triggers.hpp"

struct UserData
{
    const std::shared_ptr<Character> ch = nullptr;
    std::shared_ptr<Ship> ship;
};

/* Locals */
void show_char_to_char(const std::list<Character *> &list, std::shared_ptr<Character> ch);

static void LookThroughShipWindow(std::shared_ptr<Character> ch, std::shared_ptr<Ship> ship);
static bool ShowShipIfInVincinity(std::shared_ptr<Ship> target, const UserData *data);
static void show_char_to_char_0(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch);
static void show_char_to_char_1(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch);
static void show_ships_to_char(std::shared_ptr<Room> room, const std::shared_ptr<Character> ch);
static void show_visible_affects_to_char(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch);
static void show_exit_to_char(std::shared_ptr<Character> ch, std::shared_ptr<Exit> pexit, short door);
static void show_no_arg(std::shared_ptr<Character> ch, bool is_auto);

static void look_under(std::shared_ptr<Character> ch, const std::string &what, bool doexaprog);
static void look_in(std::shared_ptr<Character> ch, const std::string &what, bool doexaprog);
static bool requirements_are_met(std::shared_ptr<Character> ch);

void do_look(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg;
    std::string arg1;
    std::string arg2;
    std::string arg3;
    std::shared_ptr<Character> victim;
    std::string pdesc;
    bool doexaprog = false;
    DirectionType door = DIR_INVALID;
    int number = 0, cnt = 0;
    bool is_auto = false;

    if(!requirements_are_met(ch))
    {
        return;
    }

    argument = OneArgument(argument, arg1);
    argument = OneArgument(argument, arg2);
    argument = OneArgument(argument, arg3);

    doexaprog = StrCmp("noprog", arg2) && StrCmp("noprog", arg3);
    is_auto = !StrCmp(arg1, "auto");

    if(arg1.empty() || is_auto)
    {
        show_no_arg(ch, is_auto);
        return;
    }

    if(!StrCmp(arg1, "under"))
    {
        look_under(ch, arg2, doexaprog);
        return;
    }

    if(!StrCmp(arg1, "i") || !StrCmp(arg1, "in"))
    {
        look_in(ch, arg2, doexaprog);
        return;
    }

    pdesc = GetExtraDescription(arg1, ch->InRoom->ExtraDescriptions());

    if(!pdesc.empty())
    {
        ch->Echo("\r\n%s", pdesc.c_str());
        return;
    }

    door = GetDirection(arg1);
    std::shared_ptr<Exit> pexit = FindDoor(ch, arg1, true);

    if(pexit)
    {
        show_exit_to_char(ch, pexit, door);
        return;
    }
    else if(door != DIR_INVALID)
    {
        Log->Bug("%s:%s:%d: door != DIR_INVALID", __FUNCTION__, __FILE__, __LINE__);
        ch->Echo("Nothing special there.\r\n");
        return;
    }

    victim = GetCharacterInRoom(ch, arg1);

    if(victim)
    {
        show_char_to_char_1(victim, ch);
        return;
    }

    number = NumberArgument(arg1, arg);

    for(auto obj : Reverse(ch->Objects()))
    {
        if(CanSeeObject(ch, obj))
        {
            const auto objExtraDescriptions(obj->ExtraDescriptions());
            pdesc = GetExtraDescription(arg, objExtraDescriptions);

            if(!pdesc.empty())
            {
                if((cnt += obj->Count) < number)
                    continue;

                ch->Echo(pdesc);

                if(doexaprog)
                    ObjProgExamineTrigger(ch, obj);

                return;
            }

            const auto protoExtraDescriptions(obj->Prototype->ExtraDescriptions());
            pdesc = GetExtraDescription(arg, protoExtraDescriptions);

            if(!pdesc.empty())
            {
                if((cnt += obj->Count) < number)
                    continue;

                ch->Echo(pdesc);

                if(doexaprog)
                    ObjProgExamineTrigger(ch, obj);
                return;
            }

            if(NiftyIsNamePrefix(arg, obj->Name))
            {
                if((cnt += obj->Count) < number)
                    continue;

                pdesc = GetExtraDescription(obj->Name, protoExtraDescriptions);

                if(pdesc.empty())
                    pdesc = GetExtraDescription(obj->Name, objExtraDescriptions);

                if(pdesc.empty())
                    ch->Echo("You see nothing special.\r\n");
                else
                    ch->Echo(pdesc);

                if(doexaprog)
                {
                    ObjProgExamineTrigger(ch, obj);
                }

                return;
            }
        }
    }

    for(auto obj : Reverse(ch->InRoom->Objects()))
    {
        if(CanSeeObject(ch, obj))
        {
            const auto objExtraDescriptions(obj->ExtraDescriptions());
            const auto protoExtraDescriptions(obj->Prototype->ExtraDescriptions());
            pdesc = GetExtraDescription(arg, objExtraDescriptions);

            if(!pdesc.empty())
            {
                if((cnt += obj->Count) < number)
                    continue;

                ch->Echo(pdesc);

                if(doexaprog)
                    ObjProgExamineTrigger(ch, obj);

                return;
            }

            pdesc = GetExtraDescription(arg, protoExtraDescriptions);

            if(!pdesc.empty())
            {
                if((cnt += obj->Count) < number)
                    continue;

                ch->Echo(pdesc);

                if(doexaprog)
                    ObjProgExamineTrigger(ch, obj);

                return;
            }

            if(NiftyIsNamePrefix(arg, obj->Name))
            {
                if((cnt += obj->Count) < number)
                    continue;

                pdesc = GetExtraDescription(obj->Name, protoExtraDescriptions);

                if(pdesc.empty())
                    pdesc = GetExtraDescription(obj->Name, objExtraDescriptions);

                if(pdesc.empty())
                    ch->Echo("You see nothing special.\r\n");
                else
                    ch->Echo(pdesc);

                if(doexaprog)
                    ObjProgExamineTrigger(ch, obj);

                return;
            }
        }
    }

    ch->Echo("You do not see that here.\r\n");
}

static void show_char_to_char_0(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char buf1[MAX_STRING_LENGTH] = { '\0' };
    char message[MAX_STRING_LENGTH] = { '\0' };

    if(!IsNpc(victim) && !victim->Desc)
    {
        if(!victim->Switched)
            strcat(buf, "(Link Dead) ");
        else if(!IsAffectedBy(victim->Switched, Flag::Affect::Possess))
            strcat(buf, "(Switched) ");
    }

    if(!IsNpc(victim)
       && victim->Flags.test(Flag::Plr::Afk))
        strcat(buf, "[AFK] ");

    if((!IsNpc(victim) && victim->Flags.test(Flag::Plr::WizInvis))
       || (IsNpc(victim) && victim->Flags.test(Flag::Mob::MobInvis)))
    {
        if(!IsNpc(victim))
            sprintf(buf1, "(Invis %d) ", victim->PCData->WizInvis);
        else
            sprintf(buf1, "(Mobinvis %d) ", victim->MobInvis);

        strcat(buf, buf1);
    }

    if(IsAffectedBy(victim, Flag::Affect::Invisible))
        strcat(buf, "(Invis) ");

    if(IsAffectedBy(victim, Flag::Affect::Hide))
        strcat(buf, "(Stealth) ");

    if(IsAffectedBy(victim, Flag::Affect::PassDoor))
        strcat(buf, "(Translucent) ");

    if(IsAffectedBy(victim, Flag::Affect::FaerieFire))
        strcat(buf, "&P(Pink Aura)&w ");

    if(IsEvil(victim)
       && IsAffectedBy(ch, Flag::Affect::DetectEvil))
        strcat(buf, "&R(Red Aura)&w ");

    if((victim->Fatigue.Current > 10)
       && (IsAffectedBy(ch, Flag::Affect::DetectMagic) || IsImmortal(ch)))
        strcat(buf, "&B(Blue Aura)&w ");

    if(!IsNpc(victim) && victim->Flags.test(Flag::Plr::Litterbug))
        strcat(buf, "(LITTERBUG) ");

    if(IsNpc(victim) && IsImmortal(ch)
       && victim->Flags.test(Flag::Mob::Prototype))
        strcat(buf, "(PROTO) ");

    if(victim->Desc && IsInEditor(victim))
        strcat(buf, "(Writing) ");

    SetCharacterColor(AT_PERSON, ch);

    if(victim->Position == victim->DefaultPosition
       && !victim->LongDescr.empty())
    {
        strcat(buf, victim->LongDescr.c_str());
        ch->Echo("%s", buf);
        show_visible_affects_to_char(victim, ch);
        return;
    }

    if(!IsNpc(victim) && !ch->Flags.test(Flag::Plr::Brief))
        strcat(buf, victim->PCData->Title.c_str());
    else
        strcat(buf, PERS(victim, ch).c_str());

    switch(victim->Position)
    {
    case POS_DEAD:     strcat(buf, " is DEAD!!");                     break;
    case POS_MORTAL:   strcat(buf, " is mortally wounded.");          break;
    case POS_INCAP:    strcat(buf, " is incapacitated.");             break;
    case POS_STUNNED:  strcat(buf, " is lying here stunned.");        break;
    case POS_SLEEPING:
        if(victim->On != NULL)
        {
            if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_AT)
            {
                sprintf(message, " is sleeping at %s",
                        victim->On->ShortDescr.c_str());
                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SLEEP_ON)
            {
                sprintf(message, " is sleeping on %s",
                        victim->On->ShortDescr.c_str());

                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else
            {
                sprintf(message, " is sleeping in %s",
                        victim->On->ShortDescr.c_str());

                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
        }
        else
        {
            if(ch->Position == POS_SITTING
               || ch->Position == POS_RESTING)
                strcat(buf, " is sleeping nearby.");
            else
                strcat(buf, " is deep in slumber here.");
        }
        break;

    case POS_RESTING:
        if(victim->On != NULL)
        {
            if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == REST_AT)
            {
                sprintf(message, " is resting at %s",
                        victim->On->ShortDescr.c_str());

                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == REST_ON)
            {
                sprintf(message, " is resting on %s",
                        victim->On->ShortDescr.c_str());

                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else
            {
                sprintf(message, " is resting in %s",
                        victim->On->ShortDescr.c_str());

                if(((ch->Position < POS_FIGHTING) && (ch->Position > POS_STUNNED))
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
        }
        else
        {
            if(ch->Position == POS_RESTING)
                strcat(buf, " is sprawled out alongside you.");
            else if(ch->Position == POS_MOUNTED)
                strcat(buf, " is sprawled out at the foot of your mount.");
            else
                strcat(buf, " is sprawled out here.");
        }
        break;

    case POS_SITTING:
        if(victim->On != NULL)
        {
            if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SIT_AT)
            {
                sprintf(message, " is sitting at %s",
                        victim->On->ShortDescr.c_str());

                if((ch->Position == POS_SITTING)
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else if(victim->On->Value[OVAL_FURNITURE_PREPOSITION] == SIT_ON)
            {
                sprintf(message, " is sitting on %s",
                        victim->On->ShortDescr.c_str());

                if((ch->Position == POS_SITTING)
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
            else
            {
                sprintf(message, " is sitting in %s",
                        victim->On->ShortDescr.c_str());

                if((ch->Position == POS_SITTING)
                   && ch->On && (ch->On == victim->On))
                    strcat(message, " with you");

                strcat(message, ".");
                strcat(buf, message);
            }
        }
        else
        {
            if(ch->Position == POS_SITTING)
                strcat(buf, " sits here with you.");
            else if(ch->Position == POS_RESTING)
                strcat(buf, " sits nearby as you lie around.");
            else
                strcat(buf, " sits upright here.");
        }
        break;

    case POS_STANDING:
        if(IsImmortal(victim))
            strcat(buf, " is here before you.");
        else if((victim->InRoom->Sector == SectorType::Underwater)
                && !IsAffectedBy(victim, Flag::Affect::AquaBreath) && !IsNpc(victim))
            strcat(buf, " is drowning here.");
        else if(victim->InRoom->Sector == SectorType::Underwater)
            strcat(buf, " is here in the water.");
        else if((victim->InRoom->Sector == SectorType::Oceanfloor)
                && !IsAffectedBy(victim, Flag::Affect::AquaBreath) && !IsNpc(victim))
            strcat(buf, " is drowning here.");
        else if(victim->InRoom->Sector == SectorType::Oceanfloor)
            strcat(buf, " is standing here in the water.");
        else if(IsAffectedBy(victim, Flag::Affect::Floating)
                || IsAffectedBy(victim, Flag::Affect::Flying))
            strcat(buf, " is hovering here.");
        else
            strcat(buf, " is standing here.");
        break;

    case POS_SHOVE:    strcat(buf, " is being shoved around.");       break;
    case POS_DRAG:     strcat(buf, " is being dragged around.");      break;
    case POS_MOUNTED:
        strcat(buf, " is here, upon ");

        if(!victim->Mount)
            strcat(buf, "thin air???");
        else
            if(victim->Mount == ch)
                strcat(buf, "your back.");
            else
                if(victim->InRoom == victim->Mount->InRoom)
                {
                    strcat(buf, PERS(victim->Mount, ch).c_str());
                    strcat(buf, ".");
                }
                else
                    strcat(buf, "someone who left???");
        break;

    case POS_FIGHTING:
        strcat(buf, " is here, fighting ");

        if(!IsFighting(victim))
            strcat(buf, "thin air???");
        else if(WhoFighting(victim) == ch)
            strcat(buf, "YOU!");
        else if(victim->InRoom == WhoFighting(victim)->InRoom)
        {
            strcat(buf, PERS(WhoFighting(victim), ch).c_str());
            strcat(buf, ".");
        }
        else
            strcat(buf, "someone who left??");
        break;

    default:
        break;
    }

    strcat(buf, "\r\n");
    buf[0] = CharToUppercase(buf[0]);
    ch->Echo("%s", buf);
    show_visible_affects_to_char(victim, ch);
}

static void show_char_to_char_1(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch)
{
    std::shared_ptr<Object> obj;
    int iWear = 0;
    bool found = false;

    if(CanSeeCharacter(victim, ch))
    {
        Act(AT_ACTION, "$n looks at you.", ch, NULL, victim, ActTarget::Vict);
        Act(AT_ACTION, "$n looks at $N.", ch, NULL, victim, ActTarget::NotVict);
    }

    ch->Echo("%s is a %s %s\r\n", victim->Name.c_str(),
             SexNames[victim->Sex], NpcRace[victim->Race]);

    if(!victim->Description.empty())
    {
        ch->Echo(victim->Description);
    }
    else
    {
        Act(AT_PLAIN, "You see nothing special about $M.", ch, NULL, victim, ActTarget::Char);
    }

    ShowCharacterCondition(ch, victim);

    found = false;

    if(((obj = GetEquipmentOnCharacter(victim, WEAR_OVER)) == NULL)
       || obj->Value[2] == 0 || IsGreater(ch))
    {
        for(iWear = 0; iWear < MAX_WEAR; iWear++)
        {
            if((obj = GetEquipmentOnCharacter(victim, (WearLocation)iWear)) != NULL
               && CanSeeObject(ch, obj)
               && (!obj->Description.empty()
                   || (ch->Flags.test(Flag::Plr::Holylight)
                       || IsNpc(ch))))
            {
                if(!found)
                {
                    ch->Echo("\r\n");
                    Act(AT_PLAIN, "$N is using:", ch, NULL, victim, ActTarget::Char);
                    found = true;
                }

                ch->Echo("%s", WhereName[iWear]);
                ch->Echo(FormatObjectToCharacter(obj, ch, true));
                ch->Echo("\r\n");
            }
        }
    }
    else
    {
        ch->Echo("%s", WhereName[WEAR_OVER]);
        ch->Echo(FormatObjectToCharacter(obj, ch, true));
        ch->Echo("\r\n");
    }

    if(IsNpc(ch) || victim == ch)
        return;

    if(GetRandomPercent() < GetSkillLevel(ch, gsn_peek))
    {
        ch->Echo("\r\nYou peek at the inventory:\r\n");
        ShowObjectListToCharacter(victim->Objects(), ch, true, true);
        LearnFromSuccess(ch, gsn_peek);
    }
    else if(GetSkillLevel(ch, gsn_peek))
        LearnFromFailure(ch, gsn_peek);
}

static void show_ships_to_char(std::shared_ptr<Room> room, const std::shared_ptr<Character> ch)
{
    const int NUMBER_OF_COLUMNS = 2;
    int column = 0;

    for(auto ship : room->Ships())
    {
        SetCharacterColor(AT_SHIP, ch);
        ch->Echo("%-35s", ship->Name.c_str());

        if(++column % NUMBER_OF_COLUMNS == 0)
        {
            ch->Echo("\r\n&w");
        }
        else
        {
            ch->Echo("     ");
        }
    }

    if(++column % NUMBER_OF_COLUMNS == 0)
    {
        ch->Echo("\r\n&w");
    }
}

void show_char_to_char(const std::list<std::shared_ptr<Character>> &list, std::shared_ptr<Character> ch)
{
    for(auto rch : list)
    {
        if(rch == ch)
            continue;

        if(CanSeeCharacter(ch, rch))
        {
            show_char_to_char_0(rch, ch);
        }
        else if(rch->Race == RACE_DEFEL)
        {
            SetCharacterColor(AT_BLOOD, ch);
            ch->Echo("You see a pair of red eyes staring back at you.\r\n");
        }
        else if(IsRoomDark(ch->InRoom)
                && IsAffectedBy(rch, Flag::Affect::Infrared))
        {
            SetCharacterColor(AT_BLOOD, ch);
            ch->Echo("The red form of a living creature is here.\r\n");
        }
    }
}

static void show_visible_affects_to_char(std::shared_ptr<Character> victim, std::shared_ptr<Character> ch)
{
    char buf[MAX_STRING_LENGTH];

    if(IsAffectedBy(victim, Flag::Affect::Charm))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("%s looks ahead free of expression.\r\n",
                 IsNpc(victim) ? Capitalize(victim->ShortDescr).c_str() : victim->Name.c_str());
    }

    if(!IsNpc(victim) && !victim->Desc
       && victim->Switched && IsAffectedBy(victim->Switched, Flag::Affect::Possess))
    {
        SetCharacterColor(AT_MAGIC, ch);
        strcpy(buf, PERS(victim, ch).c_str());
        strcat(buf, " appears to be in a deep trance...\r\n");
    }
}

static void look_under(std::shared_ptr<Character> ch, const std::string &what, bool doexaprog)
{
    int count = 0;
    std::shared_ptr<Object> obj;

    if(what.empty())
    {
        ch->Echo("Look beneath what?\r\n");
        return;
    }

    obj = GetObjectHere(ch, what);

    if(!obj)
    {
        ch->Echo("You do not see that here.\r\n");
        return;
    }

    if(ch->CarryWeight + obj->Weight > GetCarryCapacityWeight(ch))
    {
        ch->Echo("It's too heavy for you to look under.\r\n");
        return;
    }

    count = obj->Count;
    obj->Count = 1;
    Act(AT_PLAIN, "You lift $p and look beneath it:", ch, obj, NULL, ActTarget::Char);
    Act(AT_PLAIN, "$n lifts $p and looks beneath it:", ch, obj, NULL, ActTarget::Room);
    obj->Count = count;

    if(obj->Flags.test(Flag::Obj::Covering))
    {
        ShowObjectListToCharacter(obj->Objects(), ch, true, true);
    }
    else
    {
        ch->Echo("Nothing.\r\n");
    }

    if(doexaprog)
    {
        ObjProgExamineTrigger(ch, obj);
    }
}

static bool requirements_are_met(std::shared_ptr<Character> ch)
{
    if(!ch->Desc)
    {
        return false;
    }

    if(ch->Position < POS_SLEEPING)
    {
        ch->Echo("You can't see anything but stars!\r\n");

        return false;
    }

    if(ch->Position == POS_SLEEPING)
    {
        ch->Echo("You can't see anything, you're sleeping!\r\n");

        return false;
    }

    if(IsBlind(ch))
    {
        ch->Echo("You can't see a thing!\r\n");
        return false;
    }

    if(!IsNpc(ch)
       && !ch->Flags.test(Flag::Plr::Holylight)
       && !IsAffectedBy(ch, Flag::Affect::TrueSight)
       && IsRoomDark(ch->InRoom))
    {
        SetCharacterColor(AT_DGREY, ch);
        ch->Echo("It is pitch black...\r\n");
        show_char_to_char(ch->InRoom->Characters(), ch);

        return false;
    }

    return true;
}

static void look_in(std::shared_ptr<Character> ch, const std::string &what, bool doexaprog)
{
    int count = 0;

    if(what.empty())
    {
        ch->Echo("Look in what?\r\n");
        return;
    }

    auto obj = GetObjectHere(ch, what);

    if(!obj)
    {
        ch->Echo("You do not see that here.\r\n");
        return;
    }

    switch(obj->ItemType)
    {
    default:
        ch->Echo("That is not a container.\r\n");
        break;

    case ITEM_DRINK_CON:
        if(obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] <= 0)
        {
            ch->Echo("It is empty.\r\n");

            if(doexaprog)
            {
                ObjProgExamineTrigger(ch, obj);
            }

            break;
        }

        ch->Echo("It's %s full of a %s liquid.\r\n",
                 obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < obj->Value[OVAL_DRINK_CON_CAPACITY] / 4
                 ? "less than" :
                 obj->Value[OVAL_DRINK_CON_CURRENT_AMOUNT] < 3 * obj->Value[OVAL_DRINK_CON_CAPACITY] / 4
                 ? "about" : "more than",
                 LiquidTable[obj->Value[OVAL_DRINK_CON_LIQUID_TYPE]].Color
        );

        if(doexaprog)
        {
            ObjProgExamineTrigger(ch, obj);
        }
        break;

    case ITEM_PORTAL:
        for(auto pexit : ch->InRoom->Exits())
        {
            if(pexit->Direction == DIR_PORTAL
               && pexit->Flags.test(Flag::Exit::Portal))
            {
                if(IsRoomPrivate(ch, pexit->ToRoom)
                   && GetTrustLevel(ch) < SysData.LevelToOverridePrivateFlag)
                {
                    SetCharacterColor(AT_WHITE, ch);
                    ch->Echo("That room is private, buster!\r\n");
                    return;
                }

                auto original = ch->InRoom;
                CharacterFromRoom(ch);
                CharacterToRoom(ch, pexit->ToRoom);
                do_look(ch, "auto");
                CharacterFromRoom(ch);
                CharacterToRoom(ch, original);
                return;
            }
        }

        ch->Echo("You see a swirling chaos...\r\n");
        break;

    case ITEM_CONTAINER:
    case ITEM_CORPSE_NPC:
    case ITEM_CORPSE_PC:
    case ITEM_DROID_CORPSE:
        if(IsBitSet(obj->Value[OVAL_CONTAINER_FLAGS], CONT_CLOSED))
        {
            ch->Echo("It is closed.\r\n");
            break;
        }

        count = obj->Count;
        obj->Count = 1;
        Act(AT_PLAIN, "$p contains:", ch, obj, NULL, ActTarget::Char);
        obj->Count = count;
        ShowObjectListToCharacter(obj->Objects(), ch, true, true);

        if(doexaprog)
        {
            ObjProgExamineTrigger(ch, obj);
        }

        break;
    }
}

static void show_exit_to_char(std::shared_ptr<Character> ch, std::shared_ptr<Exit> pexit, short door)
{
    if(!pexit->Keyword.empty())
    {
        if(pexit->Flags.test(Flag::Exit::Closed)
           && !pexit->Flags.test(Flag::Exit::Window))
        {
            if(pexit->Flags.test(Flag::Exit::Secret)
               && door != DIR_INVALID)
            {
                ch->Echo("Nothing special there.\r\n");
            }
            else
            {
                Act(AT_PLAIN, "The $d is closed.", ch, nullptr,
                    pexit->Keyword, ActTarget::Char);
            }

            return;
        }

        if(pexit->Flags.test(Flag::Exit::Bashed))
        {
            Act(AT_RED, "The $d has been bashed from its hinges!",
                ch, nullptr, pexit->Keyword, ActTarget::Char);
        }
    }

    if(!pexit->Description.empty())
    {
        ch->Echo(pexit->Description);
    }
    else
    {
        ch->Echo("Nothing special there.\r\n");
    }

    /*
     * Ability to look into the next room                     -Thoric
     */
    if(pexit->ToRoom
       && (IsAffectedBy(ch, Flag::Affect::Scrying)
           || pexit->Flags.test(Flag::Exit::CanLook)
           || GetTrustLevel(ch) >= LEVEL_IMMORTAL))
    {
        if(!pexit->Flags.test(Flag::Exit::CanLook)
           && GetTrustLevel(ch) < LEVEL_IMMORTAL)
        {
            SetCharacterColor(AT_MAGIC, ch);
            ch->Echo("You attempt to scry...\r\n");

            if(!IsNpc(ch))
            {
                int percent = 99;

                if(GetRandomPercent() > percent)
                {
                    ch->Echo("You fail.\r\n");
                    return;
                }
            }
        }

        if(IsRoomPrivate(ch, pexit->ToRoom)
           && GetTrustLevel(ch) < SysData.LevelToOverridePrivateFlag)
        {
            SetCharacterColor(AT_WHITE, ch);
            ch->Echo("That room is private buster!\r\n");
            return;
        }

        auto original = ch->InRoom;

        if(pexit->Distance > 1)
        {
            std::shared_ptr<Room> to_room = GenerateExit(ch->InRoom, pexit);

            if(to_room)
            {
                CharacterFromRoom(ch);
                CharacterToRoom(ch, to_room);
            }
            else
            {
                CharacterFromRoom(ch);
                CharacterToRoom(ch, pexit->ToRoom);
            }
        }
        else
        {
            CharacterFromRoom(ch);
            CharacterToRoom(ch, pexit->ToRoom);
        }

        do_look(ch, "auto");
        CharacterFromRoom(ch);
        CharacterToRoom(ch, original);
    }
}

/* 'look' or 'look auto' */
static void show_no_arg(std::shared_ptr<Character> ch, bool is_auto)
{
    SetCharacterColor(AT_RMNAME, ch);
    ch->Echo(GetRoomName(ch->InRoom));
    ch->Echo(" ");

    if(!ch->Desc->Original)
    {
        if(GetTrustLevel(ch) >= LEVEL_IMMORTAL
           && ch->PCData->Flags.test(Flag::PCData::ShowRoomFlags))
        {
            SetCharacterColor(AT_PURPLE, ch);
            ch->Echo("{%ld:%s}", ch->InRoom->Vnum, ch->InRoom->Area->Filename.c_str());

            SetCharacterColor(AT_CYAN, ch);
            ch->Echo("[%s]", FlagString(ch->InRoom->Flags, RoomFlags).c_str());

            SetCharacterColor(AT_DGREEN, ch);
            ch->Echo("(%s)", SectorNames[(int)ch->InRoom->Sector][1]);
        }
    }

    ch->Echo("\r\n");
    SetCharacterColor(AT_RMDESC, ch);

    if(!IsNpc(ch) && !ch->Flags.test(Flag::Plr::Brief))
    {
        ch->Echo(GetRoomDescription(ch->InRoom));
    }

    if(!IsNpc(ch) && ch->Flags.test(Flag::Plr::Autoexits))
    {
        do_exits(ch, "");
    }

    show_ships_to_char(ch->InRoom, ch);
    ShowShuttlesToCharacter(ch->InRoom->Shuttles(), ch);
    ShowObjectListToCharacter(ch->InRoom->Objects(), ch, false, false);
    show_char_to_char(ch->InRoom->Characters(), ch);

    if(!is_auto)
    {
        std::shared_ptr<Ship> ship = GetShipFromCockpit(ch->InRoom->Vnum);

        if(ship)
        {
            LookThroughShipWindow(ch, ship);
        }
    }
}

static void LookThroughShipWindow(std::shared_ptr<Character> ch, std::shared_ptr<Ship> ship)
{
    SetCharacterColor(AT_WHITE, ch);
    ch->Echo("\r\nThrough the transparisteel windows you see:\r\n");

    if(ship->Location || ship->State == SHIP_LANDED)
    {
        auto to_room = GetRoom(ship->Location);

        if(to_room)
        {
            auto original = ch->InRoom;

            ch->Echo("\r\n");
            CharacterFromRoom(ch);
            CharacterToRoom(ch, to_room);
            do_glance(ch, "");
            CharacterFromRoom(ch);
            CharacterToRoom(ch, original);
        }
        else
        {
            ch->Echo("no room?\r\n");
        }
    }
    else if(ship->Spaceobject)
    {
        SetCharacterColor(AT_GREEN, ch);

        for(auto spaceobject : Spaceobjects)
        {
            if(IsSpaceobjectInRange(ship, spaceobject))
            {
                ch->Echo("%s\r\n", spaceobject->Name.c_str());
            }
        }

        struct UserData data
        {
            ch, ship
        };

        ForEachShip(ShowShipIfInVincinity, &data);
        ch->Echo("\r\n");
    }
}

static bool ShowShipIfInVincinity(std::shared_ptr<Ship> target, const UserData *data)
{
    const std::shared_ptr<Character> ch = data->ch;
    std::shared_ptr<Ship> ship = data->ship;

    if(target != ship && target->Spaceobject)
    {
        if(GetShipDistanceToShip(target, ship) < 100 * (ship->Instruments.Sensor + 10) * ((target->Class == SHIP_DEBRIS ? 2 : target->Class) + 1))
        {
            ch->Echo("%s    %.0f %.0f %.0f\r\n",
                     target->Name.c_str(),
                     (target->Position->x - ship->Position->x),
                     (target->Position->y - ship->Position->y),
                     (target->Position->z - ship->Position->z));
        }
        else if(GetShipDistanceToShip(target, ship) < 100 * (ship->Instruments.Sensor + 10) * ((target->Class == SHIP_DEBRIS ? 2 : target->Class) + 3))
        {
            if(target->Class == FIGHTER_SHIP)
            {
                ch->Echo("A small metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            }
            else if(target->Class == MIDSIZE_SHIP)
            {
                ch->Echo("A goodsize metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            }
            else if(target->Class == SHIP_DEBRIS)
            {
                ch->Echo("scattered metallic reflections    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            }
            else if(target->Class >= CAPITAL_SHIP)
            {
                ch->Echo("A huge metallic mass    %.0f %.0f %.0f\r\n",
                         (target->Position->x - ship->Position->x),
                         (target->Position->y - ship->Position->y),
                         (target->Position->z - ship->Position->z));
            }
            else
            {
                /* Do nothing for other ship classes */
            }
        }
    }

    return true;
}
