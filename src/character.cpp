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

#include <cstring>
#include <cassert>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "character.hpp"
#include "mud.hpp"
#include "editor.hpp"
#include "craft.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "alias.hpp"
#include "race.hpp"
#include "repos/playerrepository.hpp"
#include "repos/homerepository.hpp"
#include "home.hpp"

struct Character::Impl
{
    std::list<std::shared_ptr<Affect>> Affects;
    std::list<Object*> Objects;
    std::list<std::shared_ptr<Timer>> Timers;
};

Character::Character(std::unique_ptr<class PCData> pcdata)
    : PCData(std::move(pcdata)),
    Flags(PLR_BLANK | PLR_COMBINE | PLR_PROMPT),
    PermStats(10),
    pImpl(std::make_unique<Impl>())
{
    Ability.Level.fill(0);
    Ability.Experience.fill(0);
}

Character::Character(std::shared_ptr<ProtoMobile> protoMob)
    : spec_fun(protoMob->spec_fun),
    spec_2(protoMob->spec_2),
    Prototype(protoMob),
    Name(protoMob->Name),
    ShortDescr(protoMob->ShortDescr),
    LongDescr(protoMob->LongDescr),
    Description(protoMob->Description),
    Sex(protoMob->Sex),
    Race(protoMob->Race),
    TopLevel(NumberFuzzy(protoMob->Level)),
    NumberOfAttacks(protoMob->NumberOfAttacks),
    Gold(protoMob->Gold),
    Flags(protoMob->Flags),
    AffectedBy(protoMob->AffectedBy),
    Resistant(protoMob->Resistant),
    Immune(protoMob->Immune),
    Susceptible(protoMob->Susceptible),
    AttackFlags(protoMob->AttackFlags),
    DefenseFlags(protoMob->DefenseFlags),
    Speaks(protoMob->Speaks),
    Speaking(protoMob->Speaking),
    Alignment(protoMob->Alignment),
    BareNumDie(protoMob->DamNoDice),
    BareSizeDie(protoMob->DamSizeDice),
    HitRoll(protoMob->HitRoll),
    DamRoll(protoMob->DamRoll),
    HitPlus(protoMob->HitPlus),
    DamPlus(protoMob->DamPlus),
    Position(protoMob->Position),
    DefaultPosition(protoMob->DefaultPosition),
    Height(protoMob->Height),
    Weight(protoMob->Weight),
    VipFlags(protoMob->VipFlags),
    PermStats(protoMob->Stats),
    pImpl(std::make_unique<Impl>())
{
    Ability.Level.fill(0);
    Ability.Experience.fill(0);

    for (int ability = 0; ability < MAX_ABILITY; ability++)
    {
        SetAbilityLevel(ability, TopLevel);
    }

    if (protoMob->ArmorClass != 0)
    {
        ArmorClass = protoMob->ArmorClass;
    }
    else
    {
        ArmorClass = 100 - TopLevel * 2.5;
    }

    if (protoMob->HitNoDice != 0)
    {
        HitPoints.Max = protoMob->HitNoDice * GetRandomNumberFromRange(1, protoMob->HitSizeDice) + protoMob->HitPlus;
    }
    else
    {
        HitPoints.Max = TopLevel * 10 + GetRandomNumberFromRange(TopLevel, TopLevel * 10);
    }

    HitPoints.Current = HitPoints.Max;

    Saving.PoisonDeath = protoMob->Saving.PoisonDeath;
    Saving.Wand = protoMob->Saving.Wand;
    Saving.ParaPetri = protoMob->Saving.ParaPetri;
    Saving.Breath = protoMob->Saving.Breath;
    Saving.SpellStaff = protoMob->Saving.SpellStaff;
}

Character::~Character()
{

}

void Character::Echo(const std::string &txt) const
{
    Echo("%s", txt.c_str());
}

void Character::Echo(const char *fmt, ...) const
{
    if (IsNpc() || Desc == nullptr)
    {
        return;
    }

    va_list va;
    va_start(va, fmt);
    std::vector<char> buf = CreateFmtBuffer(fmt, va);
    va_end(va);

    if (!buf.empty())
    {
        Desc->WriteToBuffer(&buf[0]);
    }
}

const std::list<std::shared_ptr<Affect>> &Character::Affects() const
{
    return pImpl->Affects;
}

void Character::Add(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.push_back(affect);
}

void Character::Remove(std::shared_ptr<Affect> affect)
{
    pImpl->Affects.remove(affect);
}

const std::list<Object*> &Character::Objects() const
{
    return pImpl->Objects;
}

void Character::Add(Object *object)
{
    pImpl->Objects.push_back(object);
}

void Character::Remove(Object *object)
{
    pImpl->Objects.remove(object);
}

const std::list<std::shared_ptr<Timer>> &Character::Timers() const
{
    return pImpl->Timers;
}

void Character::Add(std::shared_ptr<Timer> timer)
{
    pImpl->Timers.push_back(timer);
}

void Character::Remove(std::shared_ptr<Timer> timer)
{
    pImpl->Timers.remove(timer);
}

////////////////////////////////////////////////////////////////
// Non-class functions
bool IsWizVis(const Character *ch, const Character *victim)
{
    if (!IsNpc(victim)
        && IsBitSet(victim->Flags, PLR_WIZINVIS)
        && GetTrustLevel(ch) < victim->PCData->WizInvis)
        return false;

    return true;
}

/*
 * Return how much exp a char has for a specified ability.
 */
long GetAbilityXP(const Character *ch, short ability)
{
    if (ability >= MAX_ABILITY || ability < 0)
        return 0;

    return ch->Ability.Experience[ability];
}

void SetAbilityXP(Character *ch, short ability, long xp)
{
    if (ability >= MAX_ABILITY || ability < 0)
    {
        Log->Bug("%s: ability out of range: %d", __FUNCTION__, ability);
        return;
    }

    if (xp < 0)
    {
        Log->Bug("%s: negative value %ld invalid", __FUNCTION__, xp);
        return;
    }

    ch->Ability.Experience[ability] = xp;
}

/*
 * Calculate roughly how much experience a character is worth
 */
int GetXPWorth(const Character *ch)
{
    int xp = 0;

    xp = GetAbilityLevel(ch, COMBAT_ABILITY) * ch->TopLevel * 50;
    xp += ch->HitPoints.Max * 2;
    xp -= (ch->ArmorClass - 50) * 2;
    xp += (ch->BareNumDie * ch->BareSizeDie + GetDamageRoll(ch)) * 50;
    xp += GetHitRoll(ch) * ch->TopLevel * 10;

    if (IsAffectedBy(ch, Flag::Affect::Sanctuary))
        xp += xp * 1.5;

    if (IsAffectedBy(ch, Flag::Affect::Fireshield))
        xp += xp * 1.2;

    if (IsAffectedBy(ch, Flag::Affect::Shockshield))
        xp += xp * 1.2;

    xp = urange(MIN_EXP_WORTH, xp, MAX_EXP_WORTH);

    return xp;
}

/*
 * Retrieve a character's trusted level for permission checking.
 */
short Character::GetTrustLevel() const
{
    if (Trust != 0)
        return Trust;

    if (IsNpc() && TopLevel >= LEVEL_AVATAR)
        return LEVEL_AVATAR;

    if (TopLevel >= LEVEL_IMMORTAL && IsRetiredImmortal())
        return LEVEL_IMMORTAL;

    return TopLevel;
}

short GetTrustLevel(const Character* ch)
{
    return ch->GetTrustLevel();
}

/*
 * Retrieve a character's age.
 */
short GetAge(const Character *ch)
{
    if (IsNpc(ch))
        return 17;

    return 17 + (ch->PCData->Played + (current_time - ch->PCData->Logon)) / 1515800;
}

/*
 * Retrieve character's current strength.
 */
short GetCurrentStrength(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Str + ch->StatMods.Str, max);
}

/*
 * Retrieve character's current intelligence.
 */
short GetCurrentIntelligence(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Int + ch->StatMods.Int, max);
}

/*
 * Retrieve character's current wisdom.
 */
short GetCurrentWisdom(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Wis + ch->StatMods.Wis, max);
}

/*
 * Retrieve character's current dexterity.
 */
short GetCurrentDexterity(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Dex + ch->StatMods.Dex, max);
}

/*
 * Retrieve character's current constitution.
 */
short GetCurrentConstitution(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Con + ch->StatMods.Con, max);
}

/*
 * Retrieve character's current charisma.
 */
short GetCurrentCharisma(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Cha + ch->StatMods.Cha, max);
}

/*
 * Retrieve character's current luck.
 */
short GetCurrentLuck(const Character *ch)
{
    short max = 25;
    return urange(3, ch->PermStats.Lck + ch->StatMods.Lck, max);
}

short GetCurrentForce(const Character *ch)
{
    short max = 0;

    if (!IsNpc(ch))
    {
        max = 20 + RaceTable[ch->Race].Stats.ModFrc;
        max = umin(max, 25);
    }
    else
    {
        max = 25;
    }

    return urange(0, ch->PermStats.Frc + ch->StatMods.Frc, max);
}

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void AddKill(Character *ch, const Character *mob)
{
    if (IsNpc(ch))
        return;

    if (!IsNpc(mob))
        return;

    vnum_t vnum = mob->Prototype->Vnum;

    for (KilledData &killed : ch->PCData->Killed)
    {
        if (killed.Vnum == vnum)
        {
            if (killed.Count < 50)
            {
                ++killed.Count;
            }

            return;
        }
    }

    ch->PCData->Killed.push_front({ vnum, 1 });

    if (ch->PCData->Killed.size() >= GetKillTrackCount(ch))
    {
        ch->PCData->Killed.pop_back();
    }
}

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int TimesKilled(const Character *ch, const Character *mob)
{
    if (IsNpc(ch))
        return 0;

    if (!IsNpc(mob))
        return 0;

    vnum_t vnum = mob->Prototype->Vnum;

    for (const KilledData &killed : ch->PCData->Killed)
    {
        if (killed.Vnum == vnum)
        {
            return killed.Count;
        }
    }

    return 0;
}

bool HasComlink(const Character *ch)
{
    if (IsImmortal(ch))
    {
        return true;
    }

    const Object *comlink = GetFirstObjectOfType(ch, ITEM_COMLINK);
    return comlink != nullptr ? true : false;
}

bool HasDiploma(const Character *ch)
{
    return Find(ch->Objects(),
        [](auto obj)
    {
        return obj->Prototype->Vnum == OBJ_VNUM_SCHOOL_DIPLOMA;
    });
}

short GetAbilityLevel(const Character *ch, short ability)
{
    return ch->Ability.Level[ability];
}

void Character::SetAbilityLevel(short ability, int newlevel)
{
    int maxlevel = IsImmortal() ? 200 : MAX_ABILITY_LEVEL;

    if (newlevel >= 0 && newlevel <= maxlevel)
    {
        Ability.Level[ability] = newlevel;
    }
    else
    {
        Log->Bug("%s: level out of range: %d", __FUNCTION__, newlevel);
    }
}

void SetAbilityLevel(Character *ch, short ability, int newlevel)
{
    ch->SetAbilityLevel(ability, newlevel);
}

/*
 * Return true if a char is affected by a spell.
 */
bool IsAffected(const Character *ch, int sn)
{
    return Find(ch->Affects(),
        [sn](const auto affect)
    {
        return affect->Type == sn;
    }) != nullptr;
}

bool IsAffectedBy(const Character *ch, size_t affected_by_bit)
{
    return ch->AffectedBy.test(affected_by_bit);
}

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
Object *GetEquipmentOnCharacter(const Character *ch, WearLocation iWear)
{
    Object *maxobj = NULL;

    for (Object *obj : ch->Objects())
    {
        if (obj->WearLoc == iWear)
        {
            if (!obj->Prototype->Layers)
            {
                return obj;
            }
            else if (!maxobj
                || obj->Prototype->Layers > maxobj->Prototype->Layers)
            {
                maxobj = obj;
            }
        }
    }

    return maxobj;
}

/*
 * Equip a char with an obj.
 */
void EquipCharacter(Character *ch, Object *obj, WearLocation iWear)
{
    Object *otmp = GetEquipmentOnCharacter(ch, iWear);

    if (otmp != nullptr
        && (otmp->Prototype->Layers == 0 || obj->Prototype->Layers == 0))
    {
        Log->Bug("%s: %s %s (%ld) already has %s (%ld) equipped on wear location %d.",
            __FUNCTION__,
            IsNpc(ch) ? "Mob" : "Player",
            ch->Name.c_str(), IsNpc(ch) ? ch->Prototype->Vnum : INVALID_VNUM,
            otmp->ShortDescr.c_str(), otmp->Prototype->Vnum,
            iWear);
        return;
    }

    SeparateOneObjectFromGroup(obj);    /* just in case */

    if ((obj->Flags.test(Flag::Obj::AntiEvil) && IsEvil(ch))
        || (obj->Flags.test(Flag::Obj::AntiGood) && IsGood(ch))
        || (obj->Flags.test(Flag::Obj::AntiNeutral) && IsNeutral(ch)))
    {
        /*
         * Thanks to Morgenes for the bug fix here!
         */
        if (loading_char != ch)
        {
            Act(AT_MAGIC, "You are zapped by $p and drop it.", ch, obj, NULL, TO_CHAR);
            Act(AT_MAGIC, "$n is zapped by $p and drops it.", ch, obj, NULL, TO_ROOM);
        }

        if (obj->CarriedBy)
            ObjectFromCharacter(obj);

        ObjectToRoom(obj, ch->InRoom);
        ObjProgZapTrigger(ch, obj);

        if (SysData.SaveFlags.test(Flag::AutoSave::Zap)
            && !CharacterDiedRecently(ch))
        {
            PlayerCharacters->Save(ch);
        }

        return;
    }

    ch->ArmorClass -= GetObjectArmorClass(obj, iWear);
    obj->WearLoc = iWear;

    ch->CarryNumber -= GetObjectCount(obj);

    if (obj->Flags.test(Flag::Obj::Magic)
        || obj->WearLoc == WEAR_FLOATING)
        ch->CarryWeight -= GetObjectWeight(obj);

    for (auto paf : obj->Prototype->Affects())
    {
        ModifyAffect(ch, paf, true);
    }

    for (auto paf : obj->Affects())
    {
        ModifyAffect(ch, paf, true);
    }

    if (obj->ItemType == ITEM_LIGHT
        && obj->Value[OVAL_LIGHT_POWER] != 0
        && ch->InRoom)
        ++ch->InRoom->Light;
}

/*
 * Unequip a char with an obj.
 */
void UnequipCharacter(Character *ch, Object *obj)
{
    if (obj->WearLoc == WEAR_NONE)
    {
        Log->Bug("%s: already unequipped.", __FUNCTION__);
        return;
    }

    ch->CarryNumber += GetObjectCount(obj);
    if (obj->Flags.test(Flag::Obj::Magic) || obj->WearLoc == WEAR_FLOATING)
        ch->CarryWeight += GetObjectWeight(obj);

    ch->ArmorClass += GetObjectArmorClass(obj, obj->WearLoc);
    obj->WearLoc = WEAR_NONE;

    for (auto paf : obj->Prototype->Affects())
        ModifyAffect(ch, paf, false);

    if (obj->CarriedBy)
        for (auto paf : obj->Affects())
            ModifyAffect(ch, paf, false);

    if (!obj->CarriedBy)
        return;

    if (obj->ItemType == ITEM_LIGHT
        && obj->Value[OVAL_LIGHT_POWER] != 0
        && ch->InRoom
        &&   ch->InRoom->Light > 0)
        --ch->InRoom->Light;
}

/*
 * Find an obj in player's inventory.
 */
Object *GetCarriedObject(const Character *ch, const std::string &argument)
{
    std::string arg;
    vnum_t vnum = INVALID_VNUM;
    int count = 0;
    int number = NumberArgument(argument, arg);

    if (GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber(arg))
    {
        vnum = strtol(arg.c_str(), nullptr, 10);
    }

    for (Object *obj : Reverse(ch->Objects()))
    {
        if (obj->WearLoc == WEAR_NONE
            && CanSeeObject(ch, obj)
            && (NiftyIsName(arg, obj->Name) || obj->Prototype->Vnum == vnum))
        {
            count += obj->Count;

            if (count >= number)
            {
                return obj;
            }
        }
    }

    if (vnum != INVALID_VNUM)
    {
        return NULL;
    }

    /* If we didn't find an exact match, run through the list of objects
       again looking for prefix matching, ie swo == sword.
       Added by Narn, Sept/96
    */
    count = 0;

    for (Object *obj : Reverse(ch->Objects()))
    {
        if (obj->WearLoc == WEAR_NONE
            && CanSeeObject(ch, obj)
            && NiftyIsNamePrefix(arg, obj->Name))
        {
            if ((count += obj->Count) >= number)
            {
                return obj;
            }
        }
    }

    return NULL;
}

/*
 * Find an obj in player's equipment.
 */
Object *GetWornObject(const Character *ch, const std::string &argument)
{
    std::string arg;
    int count = 0;
    vnum_t vnum = INVALID_VNUM;

    if (!ch)
    {
        Log->Bug("%s: null ch", __FUNCTION__);
        return nullptr;
    }

    int number = NumberArgument(argument, arg);

    if (GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber(arg))
    {
        vnum = strtol(arg.c_str(), nullptr, 10);
    }

    for (Object *obj : Reverse(ch->Objects()))
        if (obj->WearLoc != WEAR_NONE
            && CanSeeObject(ch, obj)
            && (NiftyIsName(arg, obj->Name) || obj->Prototype->Vnum == vnum))
            if (++count == number)
                return obj;

    if (vnum != INVALID_VNUM)
        return NULL;

    /* If we didn't find an exact match, run through the list of objects
       again looking for prefix matching, ie swo == sword.
       Added by Narn, Sept/96
    */
    count = 0;

    for (Object *obj : Reverse(ch->Objects()))
        if (obj->WearLoc != WEAR_NONE
            && CanSeeObject(ch, obj)
            && NiftyIsNamePrefix(arg, obj->Name))
            if (++count == number)
                return obj;

    return NULL;
}

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool HasMentalStateToFindObject(const Character *ch)
{
    int ms = ch->MentalState;
    int drunk = IsNpc(ch) ? 0 : ch->PCData->Condition[COND_DRUNK];
    std::string t;

    /*
     * we're going to be nice and let nothing weird happen unless
     * you're a tad messed up
     */
    drunk = umax(1, drunk);

    if (abs(ms) + (drunk / 3) < 30)
        return false;

    if ((GetRandomPercent() + (ms < 0 ? 15 : 5)) > abs(ms) / 2 + drunk / 4)
        return false;

    if (ms > 15)        /* range 1 to 20 */
    {
        switch (GetRandomNumberFromRange(umax(1, (ms / 5 - 15)), (ms + 4) / 5))
        {
        default:
        case 1:
            t = "As you reach for it, you forgot what it was...\r\n";
            break;

        case 2:
            t = "As you reach for it, something inside stops you...\r\n";
            break;

        case 3:
            t = "As you reach for it, it seems to move out of the way...\r\n";
            break;

        case 4:
            t = "You grab frantically for it, but can't seem to get a hold of it...\r\n";
            break;

        case 5:
            t = "It disappears as soon as you touch it!\r\n";
            break;

        case 6:
            t = "You would if it would stay still!\r\n";
            break;

        case 7:
            t = "Whoa! It's covered in blood! Ack! Ick!\r\n";
            break;

        case 8:
            t = "Wow... trails!\r\n";
            break;

        case 9:
            t = "You reach for it, then notice the back of your hand is growing something!\r\n";
            break;

        case 10:
            t = "As you grasp it, it shatters into tiny shards which bite into your flesh!\r\n";
            break;

        case 11:
            t = "What about that huge dragon flying over your head?!?!?\r\n";
            break;

        case 12:
            t = "You scratch yourself instead...\r\n";
            break;

        case 13:
            t = "You hold the universe in the palm of your hand!\r\n";
            break;

        case 14:
            t = "You're too scared.\r\n";
            break;

        case 15:
            t = "Your mother smacks your hand... 'NO!'\r\n";
            break;

        case 16:
            t = "Your hand grasps the worse pile of revoltingness than you could ever imagine!\r\n";
            break;

        case 17:
            t = "You stop reaching for it as it screams out at you in pain!\r\n";
            break;

        case 18:
            t = "What about the millions of burrow-maggots feasting on your arm?!?!\r\n";
            break;

        case 19:
            t = "That doesn't matter anymore... you've found the true answer to everything!\r\n";
            break;

        case 20:
            t = "A supreme entity has no need for that.\r\n";
            break;
        }
    }
    else
    {
        int sub = urange(1, abs(ms) / 2 + drunk, 60);

        switch (GetRandomNumberFromRange(1, sub / 10))
        {
        default:
        case 1:
            t = "In just a second...\r\n";
            break;

        case 2:
            t = "You can't find that...\r\n";
            break;

        case 3:
            t = "It's just beyond your grasp...\r\n";
            break;

        case 4:
            t = "...but it's under a pile of other stuff...\r\n";
            break;

        case 5:
            t = "You go to reach for it, but pick your nose instead.\r\n";
            break;

        case 6:
            t = "Which one?!? I see two... no three...\r\n";
            break;
        }
    }

    ch->Echo(t);
    return true;
}

/*
 * True if char can see victim.
 */
bool CanSeeCharacter(const Character *ch, const Character *victim)
{
    if (!victim)
        return false;

    if (victim->Position == POS_FIGHTING || victim->Position < POS_SLEEPING)
        return true;

    if (!ch)
    {
        if (IsAffectedBy(victim, Flag::Affect::Invisible)
            || IsAffectedBy(victim, Flag::Affect::Hide)
            || IsBitSet(victim->Flags, PLR_WIZINVIS))
            return false;
        else
            return true;
    }

    if (ch == victim)
        return true;

    if (!IsNpc(victim)
        && IsBitSet(victim->Flags, PLR_WIZINVIS)
        && GetTrustLevel(ch) < victim->PCData->WizInvis)
        return false;

    if (victim->Position == POS_FIGHTING || victim->Position < POS_SLEEPING)
        return true;

    if (victim->Position == POS_FIGHTING || victim->Position < POS_SLEEPING)
        return true;

    /* SB */
    if (IsNpc(victim)
        && IsBitSet(victim->Flags, ACT_MOBINVIS)
        && GetTrustLevel(ch) < victim->MobInvis)
        return false;

    if (!IsImmortal(ch) && !IsNpc(victim) && !victim->Desc
        && GetTimer(victim, TIMER_RECENTFIGHT) > 0
        && (!victim->Switched || !IsAffectedBy(victim->Switched, Flag::Affect::Possess)))
        return false;

    if (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_HOLYLIGHT))
        return true;

    /* The miracle cure for blindness? -- Altrag */
    if (!IsAffectedBy(ch, Flag::Affect::TrueSight))
    {
        if (IsAffectedBy(ch, Flag::Affect::Blind))
            return false;

        if (IsRoomDark(ch->InRoom) && !IsAffectedBy(ch, Flag::Affect::Infrared))
            return false;

        if (IsAffectedBy(victim, Flag::Affect::Hide)
            && !IsAffectedBy(ch, Flag::Affect::DetectHidden)
            && !victim->Fighting)
        {
            if (ch->Race == RACE_DEFEL && victim->Race == RACE_DEFEL)
                return true;

            return false;
        }


        if (IsAffectedBy(victim, Flag::Affect::Invisible)
            && !IsAffectedBy(ch, Flag::Affect::DetectInvis))
            return false;
    }

    return true;
}

/*
 * True if char can see obj.
 */
bool CanSeeObject(const Character *ch, const Object *obj)
{
    if (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_HOLYLIGHT))
        return true;

    if (obj->Flags.test(Flag::Obj::Burried))
        return false;

    if (IsAffectedBy(ch, Flag::Affect::TrueSight))
        return true;

    if (IsAffectedBy(ch, Flag::Affect::Blind))
        return false;

    if (obj->Flags.test(Flag::Obj::Hidden))
        return false;

    if (obj->ItemType == ITEM_LIGHT && obj->Value[OVAL_LIGHT_POWER] != 0)
        return true;

    if (IsRoomDark(ch->InRoom) && !IsAffectedBy(ch, Flag::Affect::Infrared))
        return false;

    if (obj->Flags.test(Flag::Obj::Invis) && !IsAffectedBy(ch, Flag::Affect::DetectInvis))
        return false;

    return true;
}

/*
 * True if char can drop obj.
 */
bool CanDropObject(const Character *ch, const Object *obj)
{
    if (!obj->Flags.test(Flag::Obj::NoDrop))
        return true;

    if (!IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        return true;

    if (IsNpc(ch) && ch->Prototype->Vnum == MOB_VNUM_SUPERMOB)
        return true;

    return false;
}

/*
 * "Fix" a character's stats                                    -Thoric
 */
void FixCharacterStats(Character *ch)
{
    Object *carry[MAX_LEVEL * 200];
    int ncarry = 0;

    DeEquipCharacter(ch);

    while (!ch->Objects().empty())
    {
        Object *obj = ch->Objects().front();
        carry[ncarry++] = obj;
        ObjectFromCharacter(obj);
    }

    for (auto aff : ch->Affects())
    {
        ModifyAffect(ch, aff, false);
    }

    ch->AffectedBy = RaceTable[ch->Race].Affected;
    ch->MentalState = 0;
    ch->HitPoints.Current = umax(1, ch->HitPoints.Current);
    ch->Mana.Current = umax(1, ch->Mana.Current);
    ch->Fatigue.Current = umax(1, ch->Fatigue.Current);
    ch->ArmorClass = 100;
    ch->StatMods = Stats();
    ch->DamRoll = 0;
    ch->HitRoll = 0;
    ch->Alignment = urange(-1000, ch->Alignment, 1000);
    ch->Saving.Breath = 0;
    ch->Saving.Wand = 0;
    ch->Saving.ParaPetri = 0;
    ch->Saving.SpellStaff = 0;
    ch->Saving.PoisonDeath = 0;

    ch->CarryWeight = 0;
    ch->CarryNumber = 0;

    for (auto aff : ch->Affects())
    {
        ModifyAffect(ch, aff, true);
    }

    for (int x = 0; x < ncarry; x++)
    {
        ObjectToCharacter(carry[x], ch);
    }

    ReEquipCharacter(ch);
}

/*
 * Improve mental state                                         -Thoric
 */
void ImproveMentalState(Character *ch, int mod)
{
    int c = urange(0, abs(mod), 20);
    int con = GetCurrentConstitution(ch);

    c += GetRandomPercent() < con ? 1 : 0;

    if (ch->MentalState < 0)
        ch->MentalState = urange(-100, ch->MentalState + c, 0);
    else if (ch->MentalState > 0)
        ch->MentalState = urange(0, ch->MentalState - c, 100);
}

/*
 * Deteriorate mental state                                     -Thoric
 */
void WorsenMentalState(Character *ch, int mod)
{
    int c = urange(0, abs(mod), 20);
    int con = GetCurrentConstitution(ch);

    c -= GetRandomPercent() < con ? 1 : 0;

    if (c < 1)
        return;

    if (IsDroid(ch))
        return;

    if (ch->MentalState < 0)
        ch->MentalState = urange(-100, ch->MentalState - c, 100);
    else if (ch->MentalState > 0)
        ch->MentalState = urange(-100, ch->MentalState + c, 100);
    else
        ch->MentalState -= c;
}

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int GetCarryCapacityNumber(const Character *ch)
{
    int penalty = 0;

    if (!IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        return GetTrustLevel(ch) * 200;

    if (IsNpc(ch) && IsBitSet(ch->Flags, ACT_PET))
        return 0;

    if (GetEquipmentOnCharacter(ch, WEAR_WIELD))
        ++penalty;

    if (GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD))
        ++penalty;

    if (GetEquipmentOnCharacter(ch, WEAR_MISSILE_WIELD))
        ++penalty;

    if (GetEquipmentOnCharacter(ch, WEAR_HOLD))
        ++penalty;

    if (GetEquipmentOnCharacter(ch, WEAR_SHIELD))
        ++penalty;

    return urange(5, (ch->TopLevel + 15) / 5 + GetCurrentDexterity(ch) - 13 - penalty, 20);
}

/*
 * Retrieve a character's carry capacity.
 */
int GetCarryCapacityWeight(const Character *ch)
{
    if (!IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL)
        return 1000000;

    if (IsNpc(ch) && IsBitSet(ch->Flags, ACT_PET))
        return 0;

    return StrengthBonus[GetCurrentStrength(ch)].Carry;
}

bool Character::IsNpc() const
{
    return IsBitSet(Flags, ACT_NPC) || PCData == nullptr;
}

bool IsNpc(const Character* ch)
{
    return ch->IsNpc();
}

bool Character::IsImmortal() const
{
    return GetTrustLevel() >= LEVEL_IMMORTAL;
}

bool IsImmortal(const Character* ch)
{
    return ch->IsImmortal();
}

bool IsGreater(const Character *ch)
{
    return GetTrustLevel(ch) >= LEVEL_GREATER;
}

bool IsAvatar(const Character *ch)
{
    return GetTrustLevel(ch) >= LEVEL_AVATAR;
}

bool IsGood(const Character *ch)
{
    return ch->Alignment >= 350;
}

bool IsEvil(const Character *ch)
{
    return ch->Alignment <= -350;
}

bool IsNeutral(const Character *ch)
{
    return !IsGood(ch) && !IsEvil(ch);
}

bool IsAwake(const Character *ch)
{
    return ch->Position > POS_SLEEPING;
}

int GetArmorClass(const Character *ch)
{
    int dexterity_modifier = IsAwake(ch) ? DexterityBonus[GetCurrentDexterity(ch)].Defensive : 0;
    int combat_level_modifier = ch->Race == RACE_DEFEL ? GetAbilityLevel(ch, COMBAT_ABILITY) * 2 + 5 : GetAbilityLevel(ch, COMBAT_ABILITY) / 2;

    return ch->ArmorClass + dexterity_modifier - combat_level_modifier;
}

int GetHitRoll(const Character *ch)
{
    int base_hitroll = ch->HitRoll;
    int strength_modifier = StrengthBonus[GetCurrentStrength(ch)].ToHit;
    int mental_state_modifier = 2 - (abs(ch->MentalState) / 10);

    return base_hitroll + strength_modifier + mental_state_modifier;
}

int GetDamageRoll(const Character *ch)
{
    int base_damroll = ch->DamRoll;
    int strength_modifier = StrengthBonus[GetCurrentStrength(ch)].ToDamage;
    int mental_state_modifier = ch->MentalState > 5 && ch->MentalState < 15 ? 1 : 0;

    return base_damroll + strength_modifier + mental_state_modifier;
}

bool IsDrunk(const Character *ch)
{
    return GetRandomPercent() < ch->PCData->Condition[COND_DRUNK];
}

bool Character::IsRetiredImmortal() const
{
    return !IsNpc() && PCData->Flags.test(Flag::PCData::Retired);
}

bool IsRetiredImmortal(const Character* ch)
{
    return ch->IsRetiredImmortal();
}

bool IsAuthed(const Character *ch)
{
    if (IsNpc(ch))
    {
        return true;
    }

    return !ch->PCData->Flags.test(Flag::PCData::Unauthed);
}

bool IsWaitingForAuth(const Character *ch)
{
    return !IsNpc(ch)
        && ch->Desc
        && ch->PCData->AuthState == 1
        && ch->PCData->Flags.test(Flag::PCData::Unauthed);
}

#define DISGUISE(ch)            ((!NiftyIsName((ch)->Name, (ch)->PCData->Title)) ? 1 : 0)

std::string PERS(const Character *ch, const Character *looker)
{
    return CanSeeCharacter(looker, ch) ? (IsNpc(ch) ? ch->ShortDescr : ((GetTrustLevel(looker) <= LEVEL_IMMORTAL) ? (DISGUISE(ch) ? ch->PCData->Title : ch->Name) : ch->Name)) : (IsImmortal(ch) ? "A Great One" : "someone");
}

bool IsClanned(const Character *ch)
{
    return !IsNpc(ch) && ch->PCData->ClanInfo.Clan;
}

void SetWaitState(Character *ch, short number_of_pulses)
{
    ch->Wait = umax(ch->Wait, number_of_pulses);
}

bool IsJedi(const Character *ch)
{
    return GetAbilityLevel(ch, FORCE_ABILITY) > 1;
}

bool IsDroid(const Character *ch)
{
    return ch->Race == RACE_DROID
        || ch->Race == RACE_PROTOCOL_DROID
        || ch->Race == RACE_ASSASSIN_DROID
        || ch->Race == RACE_GLADIATOR_DROID
        || ch->Race == RACE_ASTROMECH_DROID
        || ch->Race == RACE_INTERROGATION_DROID
        || (IsNpc(ch) && IsBitSet(ch->Flags, ACT_DROID));
}

void ResetPlayerOnDeath(Character *ch)
{
    if (IsNpc(ch))
    {
        return;
    }

    FixCharacterStats(ch);
    ch->Fighting = NULL;
    ch->Mount = NULL;

    while (!ch->Affects().empty())
    {
        RemoveAffect(ch, ch->Affects().front());
    }

    ch->AffectedBy = RaceTable[ch->Race].Affected;
    ch->NumFighting = 0;
    ch->HitPoints.Current = 1;

    if (IsJedi(ch))
    {
        ch->Mana.Current = 1;
    }

    ch->Fatigue.Current = 1;
    ch->EmotionalState = 0;
    ch->On = NULL;
    StopHunting(ch);
    StopHating(ch);
    StopFearing(ch);

    ch->PCData->Condition.fill(0);
    ch->PCData->Addiction.fill(0);
    ch->PCData->DrugLevel.fill(0);

    ch->PCData->WantedOn.reset();
    ch->PCData->JailVnum = INVALID_VNUM;
}

bool IsBlind(const Character *ch)
{
    if (!IsNpc(ch) && IsBitSet(ch->Flags, PLR_HOLYLIGHT))
        return false;

    if (IsAffectedBy(ch, Flag::Affect::TrueSight))
        return false;

    if (IsAffectedBy(ch, Flag::Affect::Blind))
    {
        return true;
    }

    return false;
}

bool HasKey(const Character *ch, vnum_t key)
{
    return Find(ch->Objects(),
        [key](auto obj)
    {
        return obj->Prototype->Vnum == key
            || obj->Value[OVAL_KEY_UNLOCKS_VNUM] == key;
    });
}

/*
 * Modify movement due to encumbrance                           -Thoric
 */
short GetCarryEncumbrance(const Character *ch, short move)
{
    int max = GetCarryCapacityWeight(ch);
    int cur = ch->CarryWeight;

    if (cur >= max)
    {
        return move * 4;
    }
    else if (cur >= max * 0.95)
    {
        return move * 3.5;
    }
    else if (cur >= max * 0.90)
    {
        return move * 3;
    }
    else if (cur >= max * 0.85)
    {
        return move * 2.5;
    }
    else if (cur >= max * 0.80)
    {
        return move * 2;
    }
    else if (cur >= max * 0.75)
    {
        return move * 1.5;
    }
    else
    {
        return move;
    }
}

vnum_t WhereHome(const Character *ch)
{
    auto homes = Homes->FindHomesForResident(ch->Name);
    
    if (!homes.empty())
    {
        return homes.front()->Vnum();
    }
    else if (IsImmortal(ch))
    {
        return ROOM_START_IMMORTAL;
    }
    else
    {
        return ROOM_START_PLAYER;
    }
}

/*
 * Free a character.
 */
void FreeCharacter(Character *ch)
{
    assert(ch != nullptr);

    if (ch->Desc)
    {
        Log->Bug("%s: char still has descriptor.", __FUNCTION__);
    }

    while (!ch->Objects().empty())
    {
        ExtractObject(ch->Objects().back());
    }

    while (!ch->Affects().empty())
    {
        RemoveAffect(ch, ch->Affects().back());
    }

    while (!ch->Timers().empty())
    {
        ExtractTimer(ch, ch->Timers().front());
    }

    StopHunting(ch);
    StopHating(ch);
    StopFearing(ch);
    FreeFight(ch);

    if (ch->PCData)
    {
        if (ch->PCData->TextEditor)
        {
            StopEditing(ch);
        }
        
        if (ch->PCData->Note)
        {
            ch->PCData->Note.reset();
        }

        if (ch->PCData->CraftingSession)
        {
            FreeCraftingSession(ch->PCData->CraftingSession);
        }

        while (!ch->PCData->Comments().empty())
        {
            ch->PCData->Remove(ch->PCData->Comments().front());
        }

        FreeAliases(ch);
        ImcFreeCharacter(ch);
    }

    for (auto mpact : ch->mprog.ActLists())
    {
        FreeMemory(mpact->buf);
    }

    delete ch;
}

bool IsInArena(const Character *ch)
{
    return ch->InRoom->Flags.test(Flag::Room::Arena);
}

void ApplyJediBonus(Character *ch)
{
    if (GetRandomPercent() == 1)
    {
        ch->Mana.Max++;
        ch->Echo("&YYou are wise in your use of the force.\r\n");
        ch->Echo("You feel a little stronger in your wisdom.&w\r\n");
    }
}

void ApplySithPenalty(Character *ch)
{
    if (GetRandomPercent() == 1)
    {
        ch->Mana.Max++;

        if (ch->HitPoints.Max > 100)
        {
            ch->HitPoints.Max--;
        }

        ch->HitPoints.Current--;
        ch->Echo("&zYour body grows weaker as your strength in the dark side grows.&w\r\n");
    }
}

const char *GetCharacterRace(const Character *ch)
{
    if (ch->Race < MAX_NPC_RACE && ch->Race >= 0)
        return (NpcRace[ch->Race]);

    return "Unknown";
}

void SetCharacterTitle(Character *ch, const std::string &title)
{
    if (IsNpc(ch))
    {
        Log->Bug("Set_title: NPC.");
        return;
    }

    ch->PCData->Title = TrimString(title);
}

void AddReinforcements(Character *ch)
{
    std::shared_ptr<ProtoMobile> pMobIndex;
    Object *blaster = nullptr;
    std::shared_ptr<ProtoObject> pObjIndex;
    int multiplier = 1;

    if ((pMobIndex = GetProtoMobile(ch->BackupMob)) == nullptr)
    {
        return;
    }

    assert(ch->InRoom != nullptr);

    Log->Info("%s just posted a guard on %ld!", ch->Name.c_str(), ch->InRoom->Vnum);

    if (ch->BackupMob == MOB_VNUM_STORMTROOPER ||
        ch->BackupMob == MOB_VNUM_NR_TROOPER ||
        ch->BackupMob == MOB_VNUM_MERCINARY ||
        ch->BackupMob == MOB_VNUM_IMP_FORCES ||
        ch->BackupMob == MOB_VNUM_NR_FORCES ||
        ch->BackupMob == MOB_VNUM_MERC_FORCES)
    {
        Character *mob[3];

        if (ch->BackupMob == MOB_VNUM_IMP_FORCES ||
            ch->BackupMob == MOB_VNUM_NR_FORCES ||
            ch->BackupMob == MOB_VNUM_MERC_FORCES)
        {
            multiplier = 2;
        }

        ch->Echo("Your reinforcements have arrived.\r\n");

        for (int mob_cnt = 0; mob_cnt < 3; mob_cnt++)
        {
            int ability = 0;

            mob[mob_cnt] = CreateMobile(pMobIndex);
            CharacterToRoom(mob[mob_cnt], ch->InRoom);
            Act(AT_IMMORT, "$N has arrived.", ch, NULL, mob[mob_cnt], TO_ROOM);
            mob[mob_cnt]->TopLevel = multiplier / 1.4 * GetAbilityLevel(ch, LEADERSHIP_ABILITY) / 3;

            for (ability = 0; ability < MAX_ABILITY; ability++)
            {
                SetAbilityLevel(mob[mob_cnt], ability, mob[mob_cnt]->TopLevel);
            }

            mob[mob_cnt]->HitPoints.Current = mob[mob_cnt]->TopLevel * 15;
            mob[mob_cnt]->HitPoints.Max = mob[mob_cnt]->HitPoints.Current;
            mob[mob_cnt]->ArmorClass = 100 - mob[mob_cnt]->TopLevel*2.5;
            mob[mob_cnt]->DamRoll = mob[mob_cnt]->TopLevel / 5;
            mob[mob_cnt]->HitRoll = mob[mob_cnt]->TopLevel / 5;

            if ((pObjIndex = GetProtoObject(OBJ_VNUM_BLASTECH_E11)) != NULL)
            {
                blaster = CreateObject(pObjIndex, mob[mob_cnt]->TopLevel);
                ObjectToCharacter(blaster, mob[mob_cnt]);
                EquipCharacter(mob[mob_cnt], blaster, WEAR_WIELD);
            }

            if (mob[mob_cnt]->Master)
            {
                StopFollowing(mob[mob_cnt]);
            }

            StartFollowing(mob[mob_cnt], ch);
            mob[mob_cnt]->AffectedBy.set(Flag::Affect::Charm);
            do_setblaster(mob[mob_cnt], "full");
        }
    }
    else
    {
        Character *mob = NULL;
        int ability = 0;

        if (ch->BackupMob == MOB_VNUM_IMP_ELITE ||
            ch->BackupMob == MOB_VNUM_NR_ELITE ||
            ch->BackupMob == MOB_VNUM_MERC_ELITE)
        {
            multiplier = 2;
        }

        mob = CreateMobile(pMobIndex);
        CharacterToRoom(mob, ch->InRoom);

        if (ch->PCData && ch->PCData->ClanInfo.Clan)
        {
            mob->Name = ch->PCData->ClanInfo.Clan->Name;
            mob->LongDescr = FormatString("(%s) %s",
                ch->PCData->ClanInfo.Clan->Name.c_str(),
                mob->LongDescr.c_str());
        }

        Act(AT_IMMORT, "$N has arrived.", ch, NULL, mob, TO_ROOM);
        ch->Echo("Your guard has arrived.\r\n");
        mob->TopLevel = multiplier * GetAbilityLevel(ch, LEADERSHIP_ABILITY) / 2;

        for (ability = 0; ability < MAX_ABILITY; ability++)
        {
            SetAbilityLevel(mob, ability, mob->TopLevel);
        }

        mob->HitPoints.Current = mob->TopLevel * 10;
        mob->HitPoints.Max = mob->HitPoints.Current;
        mob->ArmorClass = 100 - mob->TopLevel*2.5;
        mob->DamRoll = mob->TopLevel / 5;
        mob->HitRoll = mob->TopLevel / 5;

        if ((pObjIndex = GetProtoObject(OBJ_VNUM_BLASTECH_E11)) != NULL)
        {
            blaster = CreateObject(pObjIndex, mob->TopLevel);
            ObjectToCharacter(blaster, mob);
            EquipCharacter(mob, blaster, WEAR_WIELD);
        }

        /* for making this more accurate in the future */

        if (ch->PCData && ch->PCData->ClanInfo.Clan)
        {
            mob->MobClan = ch->PCData->ClanInfo.Clan->Name;
        }
    }
}

const char *HeSheIt(const Character *ch)
{
    return ch->Sex == SEX_MALE ? "he" : ch->Sex == SEX_FEMALE ? "she" : "it";
}

const char *HimHerIt(const Character *ch)
{
    return ch->Sex == SEX_MALE ? "him" : ch->Sex == SEX_FEMALE ? "her" : "it";
}

const char *HisHersIts(const Character *ch)
{
    return ch->Sex == SEX_MALE ? "his" : ch->Sex == SEX_FEMALE ? "hers" : "its";
}

bool HasPermanentHide(const Character *ch)
{
    return ch->Race == RACE_DEFEL;
}

bool HasPermanentSneak(const Character *ch)
{
    switch (ch->Race)
    {
    case RACE_SHISTAVANEN:
    case RACE_DEFEL:
    case RACE_BOTHAN:
    case RACE_TOGORIAN:
    case RACE_DUG:
    case RACE_COYNITE:
        return true;

    default:
        return false;
    }
}

unsigned int GetKillTrackCount(const Character *ch)
{
    return urange(2, ((GetAbilityLevel(ch, COMBAT_ABILITY) + 3) * MAX_KILLTRACK) / LEVEL_AVATAR, MAX_KILLTRACK);
}

Object *GetFirstObjectOfType(const Character *ch, ItemTypes type)
{
    return Find(ch->Objects(),
                [type](auto obj)
                {
                    return obj->ItemType == type;
                });
}

bool IS_OUTSIDE(const Character *ch)
{
    return !ch->InRoom->Flags.test(Flag::Room::Indoors)
        && !ch->InRoom->Flags.test(Flag::Room::Spacecraft);
}
