/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <functional>
#include <cctype>
#include <cstring>

#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "badname.hpp"
#include "ship.hpp"
#include "board.hpp"
#include "ban.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "repos/banrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"
#include "timer.hpp"

using NannyFun = std::function<void(std::shared_ptr<Descriptor>, std::string)>;

/*
 * Local functions
 */
static void NannyGetName(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyGetOldPassword(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyConfirmNewName(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyGetNewPassword(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyConfirmNewPassword(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyGetNewSex(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyGetNewRace(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyGetNewClass(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyStatsOk(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyPressEnter(std::shared_ptr<Descriptor> d, std::string argument);
static void NannyReadMotd(std::shared_ptr<Descriptor> d, std::string argument);

static void AskForGender(std::shared_ptr<Descriptor> d);
static void AskForRace(std::shared_ptr<Descriptor> d);
static void AskForClass(std::shared_ptr<Descriptor> d);
static void AskForStats(std::shared_ptr<Descriptor> d);
static void FinalizeCharacter(std::shared_ptr<Descriptor> d);

/*
 * Deal with sockets that haven't logged in yet.
 */
void Nanny(std::shared_ptr<Descriptor> d, std::string argument)
{
    NannyFun nannyFun;

    argument = TrimStringStart(argument);

    switch(d->ConnectionState)
    {
    default:
        Log->Bug("Nanny: bad d->ConnectionState %d.", (int)d->ConnectionState);
        CloseDescriptor(d, true);
        return;

    case ConState::GetName:
        nannyFun = NannyGetName;
        break;

    case ConState::GetOldPassword:
        nannyFun = NannyGetOldPassword;
        break;

    case ConState::ConfirmNewName:
        nannyFun = NannyConfirmNewName;
        break;

    case ConState::GetNewPassword:
        nannyFun = NannyGetNewPassword;
        break;

    case ConState::ConfirmNewPassword:
        nannyFun = NannyConfirmNewPassword;
        break;

    case ConState::GetNewSex:
        nannyFun = NannyGetNewSex;
        break;

    case ConState::GetNewRace:
        nannyFun = NannyGetNewRace;
        break;

    case ConState::GetNewClass:
        nannyFun = NannyGetNewClass;
        break;

    case ConState::StatsOk:
        nannyFun = NannyStatsOk;
        break;

    case ConState::PressEnter:
        nannyFun = NannyPressEnter;
        break;

    case ConState::ReadMOTD:
        nannyFun = NannyReadMotd;
        break;
    }

    nannyFun(d, argument);
}

static void NannyGetName(std::shared_ptr<Descriptor> d, std::string argument)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    bool fOld = false;
    unsigned char chk = 0;
    std::shared_ptr<Character> ch = d->Char;

    if(argument.empty())
    {
        CloseDescriptor(d, false);
        return;
    }

    argument[0] = CharToUppercase(argument[0]);

    if(!IsNameAcceptable(argument))
    {
        d->WriteToBuffer("Illegal name, try another.\r\nName: ");
        return;
    }

    if(CheckPlaying(d, argument, false) == BERR)
    {
        d->WriteToBuffer("Name: ");
        return;
    }

    fOld = PlayerCharacters->Load(d, argument, true);

    if(!d->Char)
    {
        Log->Bug("Bad player file %s@%s.", argument.c_str(), d->Remote.Hostname.c_str());
        d->WriteToBuffer("Your playerfile is corrupt... Please notify mail@mymud.com\r\n");
        CloseDescriptor(d, false);
        return;
    }

    ch = d->Char;

    auto pban = Bans->Find([d, ch](const auto &b)
                           {
                               return (StringPrefix(b->Site, d->Remote.Hostname) == 0
                                       || StringSuffix(b->Site, d->Remote.Hostname) == 0)
                               && b->Level >= ch->TopLevel();
                           });

    if(pban != nullptr)
    {
        d->WriteToBuffer("Your site has been banned from this Mud.\r\n");
        CloseDescriptor(d, false);
        return;
    }

    if(ch->Flags.test(Flag::Plr::Deny))
    {
        auto logBuf = FormatString("Denying access to %s@%s.",
                                   argument.c_str(), d->Remote.Hostname.c_str());
        Log->LogStringPlus(logBuf, LogType::Comm, SysData.LevelOfLogChannel);

        d->WriteToBuffer("You are denied access.\r\n");
        CloseDescriptor(d, false);
        return;
    }

    chk = CheckReconnect(d, argument, false);

    if(chk == BERR)
    {
        return;
    }

    if(chk)
    {
        fOld = true;
    }
    else
    {
        if(wizlock && !IsImmortal(ch))
        {
            d->WriteToBuffer("The game is wizlocked. Only immortals can connect now.\r\n");
            d->WriteToBuffer("Please try back later.\r\n");
            CloseDescriptor(d, false);
            return;
        }
    }

    if(fOld)
    {
        /* Old player */
        d->WriteToBuffer("Password: ");
        d->EchoOff();
        d->ConnectionState = ConState::GetOldPassword;
        return;
    }
    else
    {
        if(IsBadName(ch->Name))
        {
            d->WriteToBuffer("\r\nThat name is unacceptable, please choose another.\r\n");
            d->WriteToBuffer("Name: ");
            d->ConnectionState = ConState::GetName;
            return;
        }

        d->WriteToBuffer("\r\nI don't recognize your name, you must be new here.\r\n\r\n");
        sprintf(buf, "Did I get that right, %s (Y/N)? ", argument.c_str());
        d->WriteToBuffer(buf);
        d->ConnectionState = ConState::ConfirmNewName;
        return;
    }
}

static void NannyGetOldPassword(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;
    unsigned char chk = 0;
    char buf[MAX_STRING_LENGTH];

    d->WriteToBuffer("\r\n", 2);

    if(StrCmp(EncodeString(argument), ch->PCData->Password))
    {
        d->WriteToBuffer("Wrong password.\r\n");
        /* clear descriptor pointer to get rid of bug message in log */
        d->Char->Desc = NULL;
        CloseDescriptor(d, false);
        return;
    }

    d->EchoOn();

    if(CheckPlaying(d, ch->Name, true))
    {
        return;
    }

    chk = CheckReconnect(d, ch->Name, true);

    if(chk == BERR)
    {
        if(d->Char && d->Char->Desc)
        {
            d->Char->Desc = NULL;
        }

        CloseDescriptor(d, false);
        return;
    }
    else if(chk == 1)
    {
        return;
    }

    if(!SysData.AllowMultiplaying && CheckMultiplaying(d, ch->Name))
    {
        CloseDescriptor(d, false);
        return;
    }

    sprintf(buf, "%s", ch->Name.c_str());
    d->Char->Desc = nullptr;
    FreeCharacter(d->Char);
    PlayerCharacters->Load(d, buf, false);
    ch = d->Char;
    auto logBuf = FormatString("%s@%s has connected.",
                               ch->Name.c_str(),
                               d->Remote.Hostname.c_str());

    if(ch->TopLevel() < LEVEL_CREATOR)
    {
        Log->LogStringPlus(logBuf, LogType::Comm, SysData.LevelOfLogChannel);
    }
    else
    {
        Log->LogStringPlus(logBuf, LogType::Comm, ch->TopLevel());
    }

    d->WriteToBuffer("Press enter...\r\n");
    d->ConnectionState = ConState::PressEnter;

    if(ch->PCData->Build.Area)
    {
        do_loadarea(ch, "");
    }
}

static void NannyConfirmNewName(std::shared_ptr<Descriptor> d, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    std::shared_ptr<Character> ch = d->Char;

    switch(argument[0])
    {
    case 'y': case 'Y':
        sprintf(buf, "\r\nMake sure to use a password that won't be easily guessed by someone else."
                "\r\nPick a good password for %s: ",
                ch->Name.c_str());
        d->WriteToBuffer(buf);
        d->EchoOff();
        d->ConnectionState = ConState::GetNewPassword;
        break;

    case 'n': case 'N':
        d->WriteToBuffer("Ok, what IS it, then? ");
        /* clear descriptor pointer to get rid of bug message in log */
        d->Char->Desc = nullptr;
        FreeCharacter(d->Char);
        d->Char = nullptr;
        d->ConnectionState = ConState::GetName;
        break;

    default:
        d->WriteToBuffer("Please type Yes or No. ");
        break;
    }
}

static void NannyGetNewPassword(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::string pwdnew;
    std::shared_ptr<Character> ch = d->Char;

    d->WriteToBuffer("\r\n", 2);

    if(argument.size() < 5)
    {
        d->WriteToBuffer("Password must be at least five characters long.\r\nPassword: ");
        return;
    }

    pwdnew = EncodeString(argument);

    if(pwdnew.find('~') != std::string::npos)
    {
        d->WriteToBuffer("New password not acceptable, try again.\r\nPassword: ");
        return;
    }

    ch->PCData->Password = pwdnew;
    d->WriteToBuffer("\r\nPlease retype the password to confirm: ");
    d->ConnectionState = ConState::ConfirmNewPassword;
}

static void NannyConfirmNewPassword(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;

    d->WriteToBuffer("\r\n", 2);

    if(StrCmp(EncodeString(argument), ch->PCData->Password))
    {
        d->WriteToBuffer("Passwords don't match.\r\nRetype password: ");
        d->ConnectionState = ConState::GetNewPassword;
        return;
    }

    d->EchoOn();
    AskForRace(d);
    d->ConnectionState = ConState::GetNewRace;
}

static void NannyGetNewSex(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;

    switch(argument[0])
    {
    case 'm':
    case 'M':
        ch->Sex = SEX_MALE;
        break;

    case 'f':
    case 'F':
        ch->Sex = SEX_FEMALE;
        break;

    default:
        d->WriteToBuffer("That's not a sex.\r\n");
        AskForGender(d);
        return;
    }

    AskForClass(d);
    d->ConnectionState = ConState::GetNewClass;
}

static void NannyGetNewRace(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::string arg;
    std::shared_ptr<Character> ch = d->Char;
    int iRace = 0;

    argument = OneArgument(argument, arg);

    if(!StrCmp(arg, "help"))
    {
        do_help(ch, argument);
        d->WriteToBuffer("Please choose a race: ");
        return;
    }

    if(!StrCmp(arg, "showstat"))
    {
        do_showstatistic(ch, argument);
        d->WriteToBuffer("Please choose a race: ");
        return;
    }

    for(iRace = 0; iRace < MAX_RACE; iRace++)
    {
        const Race *race = &RaceTable[iRace];

        if(toupper(arg[0]) == toupper(race->Name[0])
           && !StringPrefix(arg, race->Name)
           && RaceIsAvailableToPlayers(race))
        {
            ch->Race = iRace;
            break;
        }
    }

    if(iRace == MAX_RACE || iRace == RACE_GOD
       || IsNullOrEmpty(RaceTable[iRace].Name))
    {
        d->WriteToBuffer("That's not a race.\r\n");
        AskForRace(d);
        return;
    }

    if(IsDroid(ch))
    {
        ch->Sex = SEX_NEUTRAL;
        AskForClass(d);
        d->ConnectionState = ConState::GetNewClass;
    }
    else
    {
        AskForGender(d);
        d->ConnectionState = ConState::GetNewSex;
    }
}

static void NannyGetNewClass(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::string arg;
    std::shared_ptr<Character> ch = d->Char;
    int iClass = 0;

    argument = OneArgument(argument, arg);

    if(!StrCmp(arg, "help"))
    {
        do_help(ch, argument);
        d->WriteToBuffer("Please choose an ability class: ");
        return;
    }

    for(iClass = 0; iClass < (int)AbilityClass::Max; iClass++)
    {
        if(toupper(arg[0]) == toupper(AbilityName[iClass][0])
           && !StringPrefix(arg, AbilityName[iClass]))
        {
            ch->Ability.Main = AbilityClass(iClass);
            break;
        }
    }

    if(iClass == (int)AbilityClass::Max
       || (iClass == (int)AbilityClass::Force && !SysData.CanChooseJedi)
       || IsNullOrEmpty(AbilityName[iClass]))
    {
        d->WriteToBuffer("That's not a skill class.\r\n");
        AskForClass(d);
        return;
    }

    d->WriteToBuffer("\r\nRolling stats....\r\n");
    AskForStats(d);
    d->ConnectionState = ConState::StatsOk;
}

static void NannyStatsOk(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;

    switch(argument[0])
    {
    case 'y':
    case 'Y':
        break;

    case 'n':
    case 'N':
        AskForStats(d);
        return;
    default:
        d->WriteToBuffer("Invalid selection.\r\nYES or NO? ");
        return;
    }

    ch->Flags.set(Flag::Plr::Ansi);
    FinalizeCharacter(d);
    d->ConnectionState = ConState::PressEnter;
}

static void NannyPressEnter(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;

    if(ch->Flags.test(Flag::Plr::Ansi))
    {
        ch->Echo("\033[2J");
    }
    else
    {
        ch->Echo("\014");
    }

    if(IsImmortal(ch))
    {
        ch->Echo("&WImmortal Message of the Day&d\r\n");
        do_help(ch, "imotd");
    }

    if(ch->TopLevel() > 0)
    {
        ch->Echo("\r\n&WMessage of the Day&d\r\n");
        do_help(ch, "motd");
    }

    if(ch->TopLevel() >= 100)
    {
        ch->Echo("\r\n&WAvatar Message of the Day&d\r\n");
        do_help(ch, "amotd");
    }

    if(ch->TopLevel() == 0)
    {
        do_help(ch, "nmotd");
    }

    ch->Echo("\r\n&WPress [ENTER] &Y");
    d->ConnectionState = ConState::ReadMOTD;
}

static bool PutCharacterInCorrectShip(std::shared_ptr<Ship> ship, const Vo &vo)
{
    std::shared_ptr<Character> ch = vo.Ch;
    
    if(ch->InRoom->Vnum >= ship->Rooms.First
       && ch->InRoom->Vnum <= ship->Rooms.Last)
    {
        if(ship->Class != SHIP_PLATFORM || ship->Spaceobject != NULL)
        {
            CharacterToRoom(ch, ch->InRoom);
            return false;
        }
    }

    return true;
}

static void NannyReadMotd(std::shared_ptr<Descriptor> d, std::string argument)
{
    std::shared_ptr<Character> ch = d->Char;
    char buf[MAX_STRING_LENGTH];

    d->WriteToBuffer("\r\n&YWelcome to SWRiP 1.5&d\r\n\r\n");
    AddCharacter(ch);
    d->ConnectionState = ConState::Playing;

    if(ch->TopLevel() == 0)
    {
        int iLang = 0;

        ch->PermStats.Lck = GetRandomNumberFromRange(6, 20);
        ch->PermStats.Frc = GetRandomNumberFromRange(-800, 20);
        ch->AffectedBy = RaceTable[ch->Race].Affected;
        ch->PermStats.Lck += RaceTable[ch->Race].Stats.ModLck;
        ch->PermStats.Frc += RaceTable[ch->Race].Stats.ModFrc;

        if(ch->Ability.Main == AbilityClass::Force)
        {
            // People who pick Jedi will always have max Frc stat.
            ch->PermStats.Frc = umax(20, ch->PermStats.Frc);
        }
        else
        {
            ch->PermStats.Frc = urange(0, ch->PermStats.Frc, 20);
        }

        if(ch->Ability.Main == AbilityClass::Hunting)
        {
            ch->PermStats.Frc = 0;
        }

        if(IsDroid(ch))
        {
            ch->PermStats.Frc = 0;
        }

        // Smugglers get max Lck stat.
        if(ch->Ability.Main == AbilityClass::Smuggling)
        {
            ch->PermStats.Lck = umax(20, ch->PermStats.Lck);
        }
        
        for(iLang = 0; LanguageArray[iLang] != LANG_UNKNOWN; iLang++)
        {
            if(LanguageArray[iLang] == RaceTable[ch->Race].Language)
            {
                break;
            }
        }

        if(LanguageArray[iLang] == LANG_UNKNOWN)
        {
            Log->Bug("Nanny: invalid racial language.");
        }
        else
        {
            if((iLang = LookupSkill(LanguageNames[iLang])) < 0)
            {
                Log->Bug("Nanny: cannot find racial language.");
            }
            else
            {
                ch->PCData->Learned[iLang] = 100;
                ch->Speaking = RaceTable[ch->Race].Language;

                if(ch->Race == RACE_QUARREN
                   && (iLang = LookupSkill("quarren")) >= 0)
                {
                    ch->PCData->Learned[iLang] = 100;
                    SetBit(ch->Speaks, LANG_QUARREN);
                }

                if(ch->Race == RACE_MON_CALAMARI
                   && (iLang = LookupSkill("common")) >= 0)
                {
                    ch->PCData->Learned[iLang] = 100;
                }
            }
        }

        ch->Resistant |= RaceTable[ch->Race].Resistant;
        ch->Susceptible |= RaceTable[ch->Race].Susceptible;

        for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
        {
            SetAbilityLevel(ch, AbilityClass(ability), 1);
            SetAbilityXP(ch, AbilityClass(ability), 0);
        }

        ch->TopLevel(1);

        ch->HitPoints.Current = ch->HitPoints.Max;
        ch->HitPoints.Current += RaceTable[ch->Race].Hit;
        ch->HitPoints.Max += RaceTable[ch->Race].Hit;
        ch->Fatigue.Current = ch->Fatigue.Max;
        ch->Gold = NEW_CHARACTER_START_CREDITS;

        if(ch->PermStats.Frc > 0)
        {
            ch->Mana.Max = 200;
        }
        else
        {
            ch->Mana.Max = 0;
        }

        ch->Mana.Max += RaceTable[ch->Race].Mana;
        ch->Mana.Current = 0;
        sprintf(buf, "%s the %s", ch->Name.c_str(), RaceTable[ch->Race].Name);
        SetCharacterTitle(ch, buf);

        /* Added by Narn.  Start new characters with autoexit and autgold
           already turned on.  Very few people don't use those. */
        ch->Flags.set(Flag::Plr::Autocred);
        ch->Flags.set(Flag::Plr::Autoexits);

        /* New players don't have to earn some eq */

        auto obj = CreateObject(GetProtoObject(OBJ_VNUM_SCHOOL_GLOWROD), 0);
        ObjectToCharacter(obj, ch);
        EquipCharacter(ch, obj, WEAR_LIGHT);

        vnum_t weaponVnum = OBJ_VNUM_SCHOOL_BLADE;

        obj = CreateObject(GetProtoObject(weaponVnum), 0);
        ObjectToCharacter(obj, ch);
        EquipCharacter(ch, obj, WEAR_WIELD);

        /* comlink */
        std::shared_ptr<ProtoObject> obj_ind = GetProtoObject(OBJ_VNUM_SCHOOL_COMLINK);

        if(obj_ind != NULL)
        {
            obj = CreateObject(obj_ind, 0);
            ObjectToCharacter(obj, ch);
        }

        if(!SysData.NewPlayersMustWaitForAuth)
        {
            CharacterToRoom(ch, GetRoom(ROOM_VNUM_SCHOOL));
            ch->PCData->AuthState = 3;
        }
        else
        {
            CharacterToRoom(ch, GetRoom(ROOM_VNUM_SCHOOL));
            ch->PCData->AuthState = 1;
            ch->PCData->Flags.set(Flag::PCData::Unauthed);
        }
    }
    else if(!IsImmortal(ch) && ch->PCData->ReleaseDate > current_time)
    {
        if(ch->PCData->JailVnum)
        {
            CharacterToRoom(ch, GetRoom(ch->PCData->JailVnum));
        }
        else
        {
            CharacterToRoom(ch, GetRoom(ROOM_VNUM_HELL));
        }
    }
    else if(ch->InRoom && !IsImmortal(ch)
            && !ch->InRoom->Flags.test(Flag::Room::Spacecraft)
            && ch->InRoom != GetRoom(ROOM_VNUM_HELL))
    {
        CharacterToRoom(ch, ch->InRoom);
    }
    else if(ch->InRoom && !IsImmortal(ch)
            && ch->InRoom->Flags.test(Flag::Room::Spacecraft)
            && ch->InRoom != GetRoom(ROOM_VNUM_HELL))
    {
        Vo vo(ch);
        ForEachShip(PutCharacterInCorrectShip, vo);
    }
    else
    {
        CharacterToRoom(ch, GetRoom(WhereHome(ch)));
    }

    ch->Flags.reset(Flag::Mob::Polymorphed);

    RemoveTimer(ch, TimerType::ShoveDrag);

    for(auto home : Homes->FindHomesForResident(ch->Name))
    {
        Homes->Load(home);
    }

    if(ch->PCData->Pet)
    {
        Act(AT_ACTION, "$n returns with $s master.",
            ch->PCData->Pet, NULL, ch, ActTarget::NotVict);
        Act(AT_ACTION, "$N returns with you.",
            ch, NULL, ch->PCData->Pet, ActTarget::Char);
    }

    ch->PCData->Logon = current_time;

    Act(AT_ACTION, "$n has entered the game.", ch, NULL, NULL, ActTarget::Room);
    do_look(ch, "auto");
    CountMailMessages(ch);
}

bool IsNameAcceptable(const std::string &name)
{
    const char *pc = NULL;
    bool fIll = true;

    /*
     * Reserved words.
     */
    if(IsName(name, "all auto someone immortal self god supreme demigod dog guard cityguard cat cornholio spock hicaine hithoric death ass fuck shit piss crap quit"))
        return false;

    /*
     * Length restrictions.
     */
    if(name.size() < MIN_NAME_LENGTH || name.size() > MAX_NAME_LENGTH)
        return false;

    /*
     * Alphanumerics only.
     * Lock out IllIll twits.
     */
    for(pc = name.c_str(); !IsNullOrEmpty(pc); pc++)
    {
        if(!isalpha(*pc))
            return false;

        if(CharToLowercase(*pc) != 'i' && CharToLowercase(*pc) != 'l')
            fIll = false;
    }

    if(fIll)
    {
        return false;
    }

    return true;
}

static void AskForGender(std::shared_ptr<Descriptor> d)
{
    d->WriteToBuffer("\r\nWhat is your sex (M/F)? ");
}

static void AskForRace(std::shared_ptr<Descriptor> d)
{
    int iRace = 0;
    int columns = 0;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char buf2[MAX_STRING_LENGTH];

    d->WriteToBuffer("\r\nYou may choose from the following races, or type showstat [race] to learn more:\r\n");

    for(iRace = 0; iRace < MAX_RACE; iRace++)
    {
        const Race *race = &RaceTable[iRace];

        if(iRace == RACE_GOD || !RaceIsAvailableToPlayers(race))
        {
            continue;
        }

        if(!IsNullOrEmpty(race->Name))
        {
            sprintf(buf2, "%-20s", race->Name);
            strcat(buf, buf2);

            if(++columns % 3 == 0)
            {
                strcat(buf, "\r\n");
            }

            d->WriteToBuffer(buf);
            buf[0] = '\0';
        }
    }

    if(columns % 3 != 0)
    {
        strcat(buf, "\r\n");
    }

    strcat(buf, ": ");
    d->WriteToBuffer(buf);
}

static void AskForClass(std::shared_ptr<Descriptor> d)
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    char buf2[MAX_STRING_LENGTH];
    int columns = 0;

    d->WriteToBuffer("\r\nPlease choose a main ability from the following classes:\r\n");

    for(int iClass = 0; iClass < (int)AbilityClass::Max; iClass++)
    {
        if(iClass == (int)AbilityClass::Force && !SysData.CanChooseJedi)
        {
            continue;
        }

        if(!IsNullOrEmpty(AbilityName[iClass]))
        {
            sprintf(buf2, "%-20s", Capitalize(AbilityName[iClass]).c_str());
            strcat(buf, buf2);

            if(++columns % 2 == 0)
            {
                strcat(buf, "\r\n");
            }

            d->WriteToBuffer(buf);
            buf[0] = '\0';
        }
    }

    if(columns % 2 != 0)
    {
        strcat(buf, "\r\n");
    }

    strcat(buf, ": ");
    d->WriteToBuffer(buf);
}

static void AskForStats(std::shared_ptr<Descriptor> d)
{
    std::shared_ptr<Character> ch = d->Char;
    char buf[MAX_STRING_LENGTH];

    ch->PermStats.Str = GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);
    ch->PermStats.Int = GetRandomNumberFromRange(3, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);
    ch->PermStats.Wis = GetRandomNumberFromRange(3, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);
    ch->PermStats.Dex = GetRandomNumberFromRange(3, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);
    ch->PermStats.Con = GetRandomNumberFromRange(3, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);
    ch->PermStats.Cha = GetRandomNumberFromRange(3, 6) + GetRandomNumberFromRange(1, 6) + GetRandomNumberFromRange(1, 6);

    ch->PermStats.Str += RaceTable[ch->Race].Stats.ModStr;
    ch->PermStats.Int += RaceTable[ch->Race].Stats.ModInt;
    ch->PermStats.Wis += RaceTable[ch->Race].Stats.ModWis;
    ch->PermStats.Dex += RaceTable[ch->Race].Stats.ModDex;
    ch->PermStats.Con += RaceTable[ch->Race].Stats.ModCon;
    ch->PermStats.Cha += RaceTable[ch->Race].Stats.ModCha;

    sprintf(buf, "\r\nSTR: %d  INT: %d  WIS: %d  DEX: %d  CON: %d  CHA: %d\r\n",
            ch->PermStats.Str, ch->PermStats.Int, ch->PermStats.Wis,
            ch->PermStats.Dex, ch->PermStats.Con, ch->PermStats.Cha);

    d->WriteToBuffer(buf);
    d->WriteToBuffer("\r\nAre these stats OK, (Y/N)? ");
}

static void FinalizeCharacter(std::shared_ptr<Descriptor> d)
{
    std::shared_ptr<Character> ch = d->Char;
    auto logBuf = FormatString("%s@%s new %s.",
                               ch->Name.c_str(), d->Remote.Hostname.c_str(),
                               RaceTable[ch->Race].Name);
    Log->LogStringPlus(logBuf, LogType::Comm, SysData.LevelOfLogChannel);
    ToChannel(logBuf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL);
    d->WriteToBuffer("Press [ENTER]\r\n");

    for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
    {
        SetAbilityLevel(ch, AbilityClass(ability), 0);
    }

    ch->TopLevel(0);
    ch->Position = POS_STANDING;
}
