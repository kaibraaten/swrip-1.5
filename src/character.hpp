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
  Character(class PCData *pcdata, Descriptor *desc);
  Character(ProtoMobile *protoMob);
  
  virtual ~Character();

  virtual void Echo(const char *fmt, ...) const;
  virtual void Echo(const std::string &txt) const;
  
  const std::list<Affect*> &Affects() const;
  void Add(Affect *affect);
  void Remove(Affect *affect);

  const std::list<Object*> &Objects() const;
  void Add(Object *object);
  void Remove(Object *object);

  const std::list<Timer*> &Timers() const;
  void Add(Timer *timer);
  void Remove(Timer *timer);
  
  // Player AND mob
  SpecFun *spec_fun = NULL;
  SpecFun *spec_2 = NULL;
  ProtoMobile *Prototype = NULL;
  Descriptor *Desc = NULL;
  class PCData *PCData = NULL;
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
  int Flags = 0;
  int AffectedBy = 0;
  int Resistant = 0;
  int Immune = 0;
  int Susceptible = 0;
  int AttackFlags = 0;
  int DefenseFlags = 0;
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

  struct
  {
    int PoisonDeath = 0;
    int Wand = 0;
    int ParaPetri = 0;
    int Breath = 0;
    int SpellStaff = 0;
  } Saving;

  Stats PermStats;
  Stats StatMods;

  // Player only


  // Mob only

  
  /////////////////////////////////////////////////////
  // Not persisted runtime data
  /////////////////////////////////////////////////////

  // Mob only
  MProg mprog;

  // Player AND mob
  Character *Next = NULL;
  Character *Previous = NULL;
  Character *Master = NULL;
  Character *Leader = NULL;
  Fight *Fighting = NULL;
  Character *Reply = NULL;
  Character *Switched = NULL;
  Character *Mount = NULL;
  Room *InRoom = NULL;
  Room *WasInRoom = NULL;
  Room *WasSentinel = NULL;
  Room *PlayerHome = NULL;
  CmdFun *LastCommand = NULL;
  CmdFun *PreviousCommand = NULL;   /* mapping */
  void *dest_buf = NULL;
  void *dest_buf_2 = NULL;
  void *spare_ptr = NULL;
  int tempnum = 0;
  struct Editor * Editor = NULL;
  int NumFighting = 0;
  CharacterSubState SubState = SUB_NONE;
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
  Room *BuzzedHome = NULL;
  Room *BuzzedFromRoom = NULL;
  Character *Challenged = NULL;
  Character *BettedOn = NULL;
  int BetAmount = 0;
  std::string Owner;
  Room *Home = NULL;
  int CmdRecurse = 0;
  Object *On = NULL;
  Character *Pet = NULL;

  struct
  {
    HuntHateFear *Hunting = NULL;
    HuntHateFear *Fearing = NULL;
    HuntHateFear *Hating = NULL;
  } HHF;

  struct
  {
    int Main = 0;
    std::array<short, MAX_ABILITY> Level;
    std::array<long, MAX_ABILITY> Experience;
  } Ability;

private:
  struct Impl;
  Impl *pImpl = nullptr;
};

bool IsWizVis( const Character *ch, const Character *victim );

/*
 * Return how much exp a char has for a specified ability.
 */
long GetAbilityXP( const Character *ch, short ability );

void SetAbilityXP( Character *ch, short ability, long xp );

/*
 * Calculate roughly how much experience a character is worth
 */
int GetXPWorth( const Character *ch );

/*
 * Retrieve a character's trusted level for permission checking.
 */
short GetTrustLevel( const Character *ch );

/*
 * Retrieve a character's age.
 */
short GetAge( const Character *ch ) ;

/*
 * Retrieve character's current strength.
 */
short GetCurrentStrength( const Character *ch );

/*
 * Retrieve character's current intelligence.
 */
short GetCurrentIntelligence( const Character *ch );

/*
 * Retrieve character's current wisdom.
 */
short GetCurrentWisdom( const Character *ch );

/*
 * Retrieve character's current dexterity.
 */
short GetCurrentDexterity( const Character *ch );

/*
 * Retrieve character's current constitution.
 */
short GetCurrentConstitution( const Character *ch );

/*
 * Retrieve character's current charisma.
 */
short GetCurrentCharisma( const Character *ch );

/*
 * Retrieve character's current luck.
 */
short GetCurrentLuck( const Character *ch );

short GetCurrentForce( const Character *ch );

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void AddKill( Character *ch, const Character *mob );

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int TimesKilled( const Character *ch, const Character *mob );

bool HasComlink( const Character *ch );

bool HasDiploma(const Character *ch);

Object *GetFirstObjectOfType(const Character *ch, ItemTypes type);

short GetAbilityLevel( const Character *ch, short ability );

void SetAbilityLevel( Character *ch, short ability, int newlevel );

/*
 * Return true if a char is affected by a spell.
 */
bool IsAffected( const Character *ch, int sn );

/*
 * Return true if a certain ch->affected_by bit is set.
 */
bool IsAffectedBy( const Character *ch, int affected_by_bit );

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
Object *GetEquipmentOnCharacter( const Character *ch, WearLocation iWear );

/*
 * Equip a char with an obj.
 */
void EquipCharacter( Character *ch, Object *obj, WearLocation iWear );

/*
 * Unequip a char with an obj.
 */
void UnequipCharacter( Character *ch, Object *obj );

/*
 * Find an obj in player's inventory.
 */
Object *GetCarriedObject( const Character *ch, const std::string &argument );

/*
 * Find an obj in player's equipment.
 */
Object *GetWornObject( const Character *ch, const std::string &argument );

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool HasMentalStateToFindObject( const Character *ch );

/*
 * True if char can see victim.
 */
bool CanSeeCharacter( const Character *ch, const Character *victim );

/*
 * True if char can see obj.
 */
bool CanSeeObject( const Character *ch, const Object *obj );

/*
 * True if char can drop obj.
 */
bool CanDropObject( const Character *ch, const Object *obj );

/*
 * "Fix" a character's stats                                    -Thoric
 */
void FixCharacterStats( Character *ch );

/*
 * Improve mental state                                         -Thoric
 */
void ImproveMentalState( Character *ch, int mod );

/*
 * Deteriorate mental state                                     -Thoric
 */
void WorsenMentalState( Character *ch, int mod );

/*
 * Retrieve a character's carry capacity.
 */
int GetCarryCapacityWeight( const Character *ch );

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int GetCarryCapacityNumber( const Character *ch );

bool IsNpc( const Character *ch );

bool IsImmortal( const Character *ch );

bool IsGreater( const Character *ch );

bool IsAvatar( const Character *ch );

bool IsGood( const Character *ch );

bool IsEvil( const Character *ch );

bool IsNeutral( const Character *ch );

bool IsAwake( const Character *ch );

int GetArmorClass( const Character *ch );

int GetHitRoll( const Character *ch );

int GetDamageRoll( const Character *ch );

bool IsDrunk( const Character *ch );

bool IsRetiredImmortal( const Character *ch );

bool IsAuthed( const Character *ch );

bool IsWaitingForAuth( const Character *ch );

std::string PERS( const Character *ch, const Character *looker );

bool IsClanned( const Character *ch );

void SetWaitState( Character *ch, short number_of_pulses );

bool IsJedi( const Character *ch );

bool IsDroid( const Character *ch );

void ResetPlayerOnDeath( Character *ch );

bool IsBlind( const Character *ch );

bool HasKey( const Character *ch, vnum_t key );

short GetCarryEncumbrance( const Character *ch, short move );

vnum_t WhereHome( const Character *ch );

void FreeCharacter( Character *ch );

bool IsInArena( const Character *ch );

void ApplyJediBonus( Character *ch );

void ApplySithPenalty( Character *ch );

const char *HeSheIt( const Character *ch );

const char *HimHerIt( const Character *ch );

const char *HisHersIts( const Character *ch );

void AddReinforcements( Character *ch );

void SetCharacterTitle( Character *ch, const std::string &title );

bool HasPermanentSneak( const Character *ch );

unsigned int GetKillTrackCount(const Character *ch);

bool IS_OUTSIDE( const Character *ch );

#endif
