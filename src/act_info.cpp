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

#include <sstream>
#include <cctype>
#include <cstring>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "vector3_aux.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "object.hpp"
#include "systemdata.hpp"
#include "race.hpp"

static std::string SeeHalucinatedObject(int ms, bool fShort);

int GetRaceFromName(const std::string &arg)
{
    int iRace;

    for(iRace = 0; iRace < MAX_RACE; iRace++)
    {
        if(toupper(arg[0]) == toupper(RaceTable[iRace].Name[0])
           && !StringPrefix(arg, RaceTable[iRace].Name))
        {
            break;
        }
    }

    if(iRace == MAX_RACE)
    {
        return -1;
    }

    return iRace;
}

bool RaceIsAvailableToPlayers(const Race *race)
{
    if(SysData.ExtendedRaceSelection)
    {
        return true;
    }
    else
    {
        return race->AvailableForSelection;
    }
}

AbilityClass GetClassFromName(const std::string &arg)
{
    int iClass = 0;

    for(iClass = 0; iClass < (int)AbilityClass::Max; iClass++)
    {
        if(iClass == (int) AbilityClass::Force
           && (StrCmp(arg, "jedi") == 0 || StrCmp(arg, "sith") == 0))
        {
            break;
        }

        if(toupper(arg[0]) == toupper(AbilityName[iClass][0])
           && !StringPrefix(arg, AbilityName[iClass]))
        {
            break;
        }
    }

    if(iClass == (int)AbilityClass::Max)
    {
        return AbilityClass::None;
    }

    return AbilityClass(iClass);
}

std::string FormatObjectToCharacter(std::shared_ptr<Object> obj, std::shared_ptr<Character> ch, bool fShort)
{
    std::ostringstream buf;

    if(obj->Flags.test(Flag::Obj::Invis))
    {
        buf << "(Invis) ";
    }

    if((IsAffectedBy(ch, Flag::Affect::DetectMagic) || IsImmortal(ch))
       && obj->Flags.test(Flag::Obj::Magic))
    {
        buf << "&B(Blue Aura)&w ";
    }

    if(obj->Flags.test(Flag::Obj::Glow))
    {
        buf << "(Glowing) ";
    }

    if(obj->Flags.test(Flag::Obj::Hum))
    {
        buf << "(Humming) ";
    }

    if(obj->Flags.test(Flag::Obj::Hidden))
    {
        buf << "(Hidden) ";
    }

    if(obj->Flags.test(Flag::Obj::Burried))
    {
        buf << "(Burried) ";
    }

    if(IsImmortal(ch)
       && obj->Flags.test(Flag::Obj::Prototype))
    {
        buf << "(PROTO) ";
    }

    if(IsAffectedBy(ch, Flag::Affect::DetectTraps) && IsObjectTrapped(obj))
    {
        buf << "(Trap) ";
    }

    if(fShort)
    {
        buf << obj->ShortDescr;
    }
    else
    {
        buf << obj->Description;
    }

    return buf.str();
}

/*
 * Some increasingly freaky halucinated objects         -Thoric
 */
static std::string SeeHalucinatedObject(int ms, bool fShort)
{
    int sms = urange(1, (ms + 10) / 5, 20);

    if(fShort)
    {
        switch(GetRandomNumberFromRange(6 - urange(1, sms / 2, 5), sms))
        {
        case  1:
            return "a sword";

        case  2:
            return "a stick";

        case  3:
            return "something shiny";

        case  4:
            return "something";

        case  5:
            return "something interesting";

        case  6:
            return "something colorful";

        case  7:
            return "something that looks cool";

        case  8:
            return "a nifty thing";

        case  9:
            return "a cloak of flowing colors";

        case 10:
            return "a mystical flaming sword";

        case 11:
            return "a swarm of insects";

        case 12:
            return "a deathbane";

        case 13:
            return "a figment of your imagination";

        case 14:
            return "your gravestone";

        case 15:
            return "the long lost boots of Ranger Thoric";

        case 16:
            return "a glowing tome of arcane knowledge";

        case 17:
            return "a long sought secret";

        case 18:
            return "the meaning of it all";

        case 19:
            return "the answer";

        case 20:
            return "the key to life, the universe and everything";
        }
    }

    switch(GetRandomNumberFromRange(6 - urange(1, sms / 2, 5), sms))
    {
    case  1:
        return "A nice looking sword catches your eye.";

    case  2:
        return "The ground is covered in small sticks.";

    case  3:
        return "Something shiny catches your eye.";

    case  4:
        return "Something catches your attention.";

    case  5:
        return "Something interesting catches your eye.";

    case  6:
        return "Something colorful flows by.";

    case  7:
        return "Something that looks cool calls out to you.";

    case  8:
        return "A nifty thing of great importance stands here.";

    case  9:
        return "A cloak of flowing colors asks you to wear it.";

    case 10:
        return "A mystical flaming sword awaits your grasp.";

    case 11:
        return "A swarm of insects buzzes in your face!";

    case 12:
        return "The extremely rare Deathbane lies at your feet.";

    case 13:
        return "A figment of your imagination is at your command.";

    case 14:
        return "You notice a gravestone here... upon closer examination, it reads your name.";

    case 15:
        return "The long lost boots of Ranger Thoric lie off to the side.";

    case 16:
        return "A glowing tome of arcane knowledge hovers in the air before you.";

    case 17:
        return "A long sought secret of all mankind is now clear to you.";

    case 18:
        return "The meaning of it all, so simple, so clear... of course!";

    case 19:
        return "The answer.  One.  It's always been One.";

    case 20:
        return "The key to life, the universe and everything awaits your hand.";
    }

    return "Whoa!!!";
}


/*
 * Show a list to a character.
 * Can coalesce duplicated items.
 */
void ShowObjectListToCharacter(const std::list<std::shared_ptr<Object>> &list, std::shared_ptr<Character> ch,
                               bool fShort, bool fShowNothing)
{
    if(!ch->Desc)
        return;

    /*
     * if there's no list... then don't do all this crap!  -Thoric
     */
    if(list.empty())
    {
        if(fShowNothing)
        {
            if(IsNpc(ch) || ch->Flags.test(Flag::Plr::Combine))
                ch->Echo("     ");

            ch->Echo("Nothing.\r\n");
        }

        return;
    }

    /*
     * Alloc space for output lines.
     */
    int ms = (ch->MentalState ? ch->MentalState : 1)
        * (IsNpc(ch) ? 1 : (ch->PCData->Condition[COND_DRUNK] ? (ch->PCData->Condition[COND_DRUNK] / 12) : 1));
    int offcount = 0;
    int count = list.size();

    /*
     * If not mentally stable...
     */
    if(abs(ms) > 40)
    {
        offcount = urange(-(count), (count * ms) / 100, count * 2);

        if(offcount < 0)
            offcount += GetRandomNumberFromRange(0, abs(offcount));
        else
            if(offcount > 0)
                offcount -= GetRandomNumberFromRange(0, offcount);
    }
    else
    {
        offcount = 0;
    }

    if(count + offcount <= 0)
    {
        if(fShowNothing)
        {
            if(IsNpc(ch) || ch->Flags.test(Flag::Plr::Combine))
                ch->Echo("     ");

            ch->Echo("Nothing.\r\n");
        }

        return;
    }

    char **prgpstrShow = nullptr;
    int *prgnShow = nullptr;
    int *pitShow = nullptr;
    AllocateMemory(prgpstrShow, char *, count + ((offcount > 0) ? offcount : 0));
    AllocateMemory(prgnShow, int, count + ((offcount > 0) ? offcount : 0));
    AllocateMemory(pitShow, int, count + ((offcount > 0) ? offcount : 0));
    int nShow = 0;
    int tmp = (offcount > 0) ? offcount : 0;
    int cnt = 0;

    /*
     * Format the list of objects.
     */
    for(auto obj : list)
    {
        if(offcount < 0 && ++cnt >(count + offcount))
            break;

        if(tmp > 0 && NumberBits(1) == 0)
        {
            prgpstrShow[nShow] = CopyString(SeeHalucinatedObject(ms, fShort));
            prgnShow[nShow] = 1;
            pitShow[nShow] = GetRandomNumberFromRange(ITEM_LIGHT, ITEM_BOOK);
            nShow++;
            --tmp;
        }

        if(obj->WearLoc == WEAR_NONE
           && CanSeeObject(ch, obj)
           && (!obj->Description.empty() || (ch->Flags.test(Flag::Plr::Holylight) || IsNpc(ch)))
           && (obj->ItemType != ITEM_TRAP || IsAffectedBy(ch, Flag::Affect::DetectTraps)))
        {
            std::string pstrShow = FormatObjectToCharacter(obj, ch, fShort);
            bool fCombine = false;

            if(IsNpc(ch) || ch->Flags.test(Flag::Plr::Combine))
            {
                /*
                 * Look for duplicates, case sensitive.
                 * Matches tend to be near end so run loop backwords.
                 */
                for(int iShow = nShow - 1; iShow >= 0; iShow--)
                {
                    if(!StrCmp(prgpstrShow[iShow], pstrShow))
                    {
                        prgnShow[iShow] += obj->Count;
                        fCombine = true;
                        break;
                    }
                }
            }

            pitShow[nShow] = obj->ItemType;
            /*
             * Couldn't combine, or didn't want to.
             */
            if(!fCombine)
            {
                prgpstrShow[nShow] = CopyString(pstrShow);
                prgnShow[nShow] = obj->Count;
                nShow++;
            }
        }
    }

    if(tmp > 0)
    {
        for(int x = 0; x < tmp; x++)
        {
            prgpstrShow[nShow] = CopyString(SeeHalucinatedObject(ms, fShort));
            prgnShow[nShow] = 1;
            pitShow[nShow] = GetRandomNumberFromRange(ITEM_LIGHT, ITEM_BOOK);
            nShow++;
        }
    }

    /*
     * Output the formatted list.         -Color support by Thoric
     */
    for(int iShow = 0; iShow < nShow; iShow++)
    {
        switch(pitShow[iShow])
        {
        default:
            SetCharacterColor(AT_OBJECT, ch);
            break;

        case ITEM_BLOOD:
            SetCharacterColor(AT_BLOOD, ch);
            break;

        case ITEM_MONEY:
        case ITEM_TREASURE:
            SetCharacterColor(AT_YELLOW, ch);
            break;

        case ITEM_FOOD:
            SetCharacterColor(AT_HUNGRY, ch);
            break;

        case ITEM_DRINK_CON:
        case ITEM_FOUNTAIN:
            SetCharacterColor(AT_THIRSTY, ch);
            break;

        case ITEM_FIRE:
            SetCharacterColor(AT_FIRE, ch);
            break;

        case ITEM_SCROLL:
        case ITEM_WAND:
        case ITEM_STAFF:
            break;
        }

        if(fShowNothing)
        {
            ch->Echo("     ");
        }

        ch->Echo("%s", prgpstrShow[iShow]);

        if(prgnShow[iShow] != 1)
        {
            ch->Echo(" (%d)", prgnShow[iShow]);
        }

        ch->Echo("\r\n");
        FreeMemory(prgpstrShow[iShow]);
    }

    if(fShowNothing && nShow == 0)
    {
        if(IsNpc(ch) || ch->Flags.test(Flag::Plr::Combine))
        {
            ch->Echo("     ");
        }

        ch->Echo("Nothing.\r\n");
    }

    /*
     * Clean up.
     */
    FreeMemory(prgpstrShow);
    FreeMemory(prgnShow);
    FreeMemory(pitShow);
}

void ShowCharacterCondition(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    int percent = 0;

    if(victim->HitPoints.Max > 0)
        percent = (100 * victim->HitPoints.Current) / victim->HitPoints.Max;
    else
        percent = -1;

    std::string buf = PERS(victim, ch);

    if((IsNpc(victim) && victim->Flags.test(Flag::Mob::Droid))
       || IsDroid(victim))
    {

        if(percent >= 100)
            buf += " is in perfect condition.\r\n";
        else if(percent >= 90)
            buf += " is slightly scratched.\r\n";
        else if(percent >= 80)
            buf += " has a few scrapes.\r\n";
        else if(percent >= 70)
            buf += " has some dents.\r\n";
        else if(percent >= 60)
            buf += " has a couple holes in its plating.\r\n";
        else if(percent >= 50)
            buf += " has a many broken pieces.\r\n";
        else if(percent >= 40)
            buf += " has many exposed circuits.\r\n";
        else if(percent >= 30)
            buf += " is leaking oil.\r\n";
        else if(percent >= 20)
            buf += " has smoke coming out of it.\r\n";
        else if(percent >= 10)
            buf += " is almost completely broken.\r\n";
        else
            buf += " is about to EXPLODE.\r\n";
    }
    else
    {
        if(percent >= 100)
            buf += " is in perfect health.\r\n";
        else if(percent >= 90)
            buf += " is slightly scratched.\r\n";
        else if(percent >= 80)
            buf += " has a few bruises.\r\n";
        else if(percent >= 70)
            buf += " has some cuts.\r\n";
        else if(percent >= 60)
            buf += " has several wounds.\r\n";
        else if(percent >= 50)
            buf += " has many nasty wounds.\r\n";
        else if(percent >= 40)
            buf += " is bleeding freely.\r\n";
        else if(percent >= 30)
            buf += " is covered in blood.\r\n";
        else if(percent >= 20)
            buf += " is leaking guts.\r\n";
        else if(percent >= 10)
            buf += " is almost dead.\r\n";
        else
            buf += " is DYING.\r\n";
    }

    buf[0] = CharToUppercase(buf[0]);
    ch->Echo(buf);
}
