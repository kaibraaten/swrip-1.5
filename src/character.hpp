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

#ifndef _SWRIP_CHARACTER_HPP_
#define _SWRIP_CHARACTER_HPP_

#ifndef __GNUC__
#define __attribute__(a)
#endif

#include <memory>
#include <bitset>
#include <list>
#include <array>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"
#include "stats.hpp"

class Character
{
public:
    Character() = delete;
    Character(std::unique_ptr<class PCData> pcdata);
    Character(std::shared_ptr<ProtoMobile> protoMob);

    virtual ~Character();

    virtual void Echo(const char *fmt, ...) const __attribute__((format(printf, 2, 3)));
    virtual void Echo(const std::string &txt) const;

    const std::list<std::shared_ptr<Affect>> &Affects() const;
    void Add(std::shared_ptr<Affect> affect);
    void Remove(std::shared_ptr<Affect> affect);

    const std::list<std::shared_ptr<Object>> &Objects() const;
    void Add(std::shared_ptr<Object> object);
    void Remove(std::shared_ptr<Object> object);

    const std::list<std::shared_ptr<Timer>> &Timers() const;
    void Add(std::shared_ptr<Timer> timer);
    void Remove(std::shared_ptr<Timer> timer);

    bool IsNpc() const;
    bool IsImmortal() const;
    void SetAbilityLevel(short ability, int newlevel);
    short GetTrustLevel() const;
    bool IsRetiredImmortal() const;

    // Player AND mob
    SpecFun *spec_fun = NULL;
    SpecFun *spec_2 = NULL;
    std::shared_ptr<ProtoMobile> Prototype;
    std::shared_ptr<Descriptor> Desc;
    std::unique_ptr<class PCData> PCData;
    std::string Name;
    std::string ShortDescr;
    std::string LongDescr;
    std::string Description;
    SexType Sex = 0;
    int Race = 0;
    int TopLevel = 0;

    struct
    {
        int Current = 500;
        int Max = 500;
    } HitPoints;

    struct
    {
        int Current = 0;
        int Max = 0;
    } Mana;

    struct
    {
        int Current = 1000;
        int Max = 1000;
    } Fatigue;

    int NumberOfAttacks = 0;
    int Gold = 0;
    std::bitset<Flag::MAX> Flags;
    std::bitset<Flag::MAX> AffectedBy;
    std::bitset<Flag::MAX> Resistant;
    std::bitset<Flag::MAX> Immune;
    std::bitset<Flag::MAX> Susceptible;
    std::bitset<Flag::MAX> AttackFlags;
    std::bitset<Flag::MAX> DefenseFlags;
    int Speaks = LANG_COMMON;
    int Speaking = LANG_COMMON;
    int Alignment = 0;
    int BareNumDie = 1;
    int BareSizeDie = 4;
    int HitRoll = 0;
    int DamRoll = 0;
    int HitPlus = 0;
    int DamPlus = 0;
    PositionType Position = POS_STANDING;
    PositionType DefaultPosition = POS_STANDING;
    int Height = 72;
    int Weight = 180;
    int ArmorClass = 100;
    std::bitset<Flag::MAX> VipFlags;

    SaveVs Saving;
    Stats PermStats;
    Stats StatMods;

    // Player only


    // Mob only


    /////////////////////////////////////////////////////
    // Not persisted runtime data
    /////////////////////////////////////////////////////

    // Mob only
    MProg mprog;
    std::weak_ptr<Object> ActingAsObject;
    
    // Player AND mob
    std::shared_ptr<Character> Next;
    std::shared_ptr<Character> Previous;
    std::shared_ptr<Character> Master;
    std::shared_ptr<Character> Leader;
    std::shared_ptr<Fight> Fighting;
    std::weak_ptr<Character> Reply;
    std::shared_ptr<Character> Switched = NULL;
    std::shared_ptr<Character> Mount = NULL;
    std::shared_ptr<Room> InRoom;
    std::shared_ptr<Room> WasInRoom;
    std::shared_ptr<Room> WasSentinel;
    CmdFun *LastCommand = NULL;
    CmdFun *PreviousCommand = NULL;   /* mapping */
    int NumFighting = 0;
    std::string dest_buf;
    int tempnum = 0;
    CharacterSubState SubState = CharacterSubState::None;
    int Trust = 0;
    int IdleTimer = 0;
    int Wait = 0;
    int CarryWeight = 0;
    int CarryNumber = 0;
    int Wimpy = 0;
    int Deaf = 0;
    int MentalState = 0;           /* simplified */
    int EmotionalState = 0;        /* simplified */
    vnum_t ReTran = INVALID_VNUM;
    vnum_t ReGoto = INVALID_VNUM;
    int MobInvis = 0;
    int BackupWait = 0;       /* reinforcements */
    vnum_t BackupMob = INVALID_VNUM;     /* reinforcements */
    int WasStunned = 0;
    std::string MobClan;    /* for spec_clan_guard.. set by postguard */
    std::shared_ptr<Room> BuzzedHome;
    std::shared_ptr<Room> BuzzedFromRoom;
    std::weak_ptr<Character> Challenged;
    std::weak_ptr<Character> BettedOn;
    int BetAmount = 0;
    std::string Owner;
    std::shared_ptr<Room> Home;
    int CmdRecurse = 0;
    std::shared_ptr<Object> On;

    struct
    {
        std::unique_ptr<HuntHateFear> Hunting;
        std::unique_ptr<HuntHateFear> Fearing;
        std::unique_ptr<HuntHateFear> Hating;
    } HHF;

    struct
    {
        int Main = 0;
        std::array<short, MAX_ABILITY> Level;
        std::array<long, MAX_ABILITY> Experience;
    } Ability;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

bool IsWizVis(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

/*
 * Return how much exp a char has for a specified ability.
 */
long GetAbilityXP(std::shared_ptr<Character> ch, short ability);

void SetAbilityXP(std::shared_ptr<Character> ch, short ability, long xp);

/*
 * Calculate roughly how much experience a character is worth
 */
int GetXPWorth(std::shared_ptr<Character> ch);

/*
 * Retrieve a character's trusted level for permission checking.
 */
short GetTrustLevel(std::shared_ptr<Character> ch);

/*
 * Retrieve a character's age.
 */
short GetAge(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current strength.
 */
short GetCurrentStrength(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current intelligence.
 */
short GetCurrentIntelligence(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current wisdom.
 */
short GetCurrentWisdom(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current dexterity.
 */
short GetCurrentDexterity(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current constitution.
 */
short GetCurrentConstitution(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current charisma.
 */
short GetCurrentCharisma(std::shared_ptr<Character> ch);

/*
 * Retrieve character's current luck.
 */
short GetCurrentLuck(std::shared_ptr<Character> ch);

short GetCurrentForce(std::shared_ptr<Character> ch);

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void AddKill(std::shared_ptr<Character> ch, std::shared_ptr<Character> mob);

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int TimesKilled(std::shared_ptr<Character> ch, std::shared_ptr<Character> mob);

bool HasComlink(std::shared_ptr<Character> ch);

bool HasDiploma(std::shared_ptr<Character> ch);

std::shared_ptr<Object> GetFirstObjectOfType(std::shared_ptr<Character> ch, ItemTypes type);

short GetAbilityLevel(std::shared_ptr<Character> ch, short ability);

/*
 * Return true if a char is affected by a spell.
 */
bool IsAffected(std::shared_ptr<Character> ch, int sn);

/*
 * Return true if a certain ch->affected_by bit is set.
 */
bool IsAffectedBy(std::shared_ptr<Character> ch, size_t affected_by_bit);

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
std::shared_ptr<Object> GetEquipmentOnCharacter(std::shared_ptr<Character> ch, WearLocation iWear);

/*
 * Equip a char with an obj.
 */
void EquipCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj, WearLocation iWear);

/*
 * Unequip a char with an obj.
 */
void UnequipCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

/*
 * Find an obj in player's inventory.
 */
std::shared_ptr<Object> GetCarriedObject(std::shared_ptr<Character> ch, const std::string &argument);

/*
 * Find an obj in player's equipment.
 */
std::shared_ptr<Object> GetWornObject(std::shared_ptr<Character> ch, const std::string &argument);

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool HasMentalStateToFindObject(std::shared_ptr<Character> ch);

/*
 * True if char can see victim.
 */
bool CanSeeCharacter(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);

/*
 * True if char can see obj.
 */
bool CanSeeObject(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

/*
 * True if char can drop obj.
 */
bool CanDropObject(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj);

/*
 * "Fix" a character's stats                                    -Thoric
 */
void FixCharacterStats(std::shared_ptr<Character> ch);

/*
 * Improve mental state                                         -Thoric
 */
void ImproveMentalState(std::shared_ptr<Character> ch, int mod);

/*
 * Deteriorate mental state                                     -Thoric
 */
void WorsenMentalState(std::shared_ptr<Character> ch, int mod);

/*
 * Retrieve a character's carry capacity.
 */
int GetCarryCapacityWeight(std::shared_ptr<Character> ch);

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int GetCarryCapacityNumber(std::shared_ptr<Character> ch);

bool IsImmortal(std::shared_ptr<Character> ch);

bool IsGreater(std::shared_ptr<Character> ch);

bool IsAvatar(std::shared_ptr<Character> ch);

bool IsGood(std::shared_ptr<Character> ch);

bool IsEvil(std::shared_ptr<Character> ch);

bool IsNeutral(std::shared_ptr<Character> ch);

bool IsAwake(std::shared_ptr<Character> ch);

int GetArmorClass(std::shared_ptr<Character> ch);

int GetHitRoll(std::shared_ptr<Character> ch);

int GetDamageRoll(std::shared_ptr<Character> ch);

bool IsDrunk(std::shared_ptr<Character> ch);

bool IsRetiredImmortal(std::shared_ptr<Character> ch);

bool IsAuthed(std::shared_ptr<Character> ch);

bool IsWaitingForAuth(std::shared_ptr<Character> ch);

std::string PERS(std::shared_ptr<Character> ch, std::shared_ptr<Character> looker);

bool IsClanned(std::shared_ptr<Character> ch);

void SetWaitState(std::shared_ptr<Character> ch, short number_of_pulses);

bool IsJedi(std::shared_ptr<Character> ch);

bool IsDroid(std::shared_ptr<Character> ch);

void ResetPlayerOnDeath(std::shared_ptr<Character> ch);

bool IsBlind(std::shared_ptr<Character> ch);

bool HasKey(std::shared_ptr<Character> ch, vnum_t key);

short GetCarryEncumbrance(std::shared_ptr<Character> ch, short move);

vnum_t WhereHome(std::shared_ptr<Character> ch);

void FreeCharacter(std::shared_ptr<Character> ch);

bool IsInArena(std::shared_ptr<Character> ch);

void ApplyJediBonus(std::shared_ptr<Character> ch);

void ApplySithPenalty(std::shared_ptr<Character> ch);

const char *HeSheIt(std::shared_ptr<Character> ch);

const char *HimHerIt(std::shared_ptr<Character> ch);

const char *HisHersIts(std::shared_ptr<Character> ch);

void AddReinforcements(std::shared_ptr<Character> ch);

void SetCharacterTitle(std::shared_ptr<Character> ch, const std::string &title);

bool HasPermanentSneak(std::shared_ptr<Character> ch);

bool HasPermanentHide(std::shared_ptr<Character> ch);

unsigned int GetKillTrackCount(std::shared_ptr<Character> ch);

bool IS_OUTSIDE(std::shared_ptr<Character> ch);

void SetAbilityLevel(std::shared_ptr<Character> ch, short ability, int newlevel);

bool IsNpc(std::shared_ptr<Character> ch);

bool IsInEditor(std::shared_ptr<Character> ch);

bool IsPlaying(std::shared_ptr<Character> ch);

#endif
