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

#ifndef _SWRIP_CHARACTER_H_
#define _SWRIP_CHARACTER_H_

#include "types.hpp"
#include "constants.hpp"

struct Character
{
  Character *Next;
  Character *Previous;
  Character *NextInRoom;
  Character *PreviousInRoom;
  Character *Master;
  Character *Leader;
  Fight *Fighting;
  Character *Reply;
  Character *Switched;
  Character *Mount;

  SpecFun *spec_fun;
  SpecFun *spec_2;

  ProtoMobile *Prototype;
  Descriptor *Desc;
  Affect *FirstAffect;
  Affect *LastAffect;
  Object *FirstCarrying;
  Object *LastCarrying;
  Room *InRoom;
  Room *WasInRoom;
  Room *WasSentinel;
  Room *PlayerHome;
  struct PCData *PCData;
  CmdFun *LastCommand;
  CmdFun *PreviousCommand;   /* mapping */
  void *dest_buf;
  void *dest_buf_2;
  void *spare_ptr;
  int tempnum;
  struct Editor * Editor;
  Timer *FirstTimer;
  Timer *LastTimer;
  char *Name;
  char *ShortDescr;
  char *LongDescr;
  char *Description;
  short NumFighting;
  CharacterSubState SubState;
  SexType Sex;
  short Race;
  short TopLevel;

  short Trust;
  short IdleTimer;
  short Wait;

  short Hit;
  short MaxHit;
  short Mana;
  short MaxMana;
  short Move;
  short MaxMove;

  short NumberOfAttacks;
  int Gold;
  int Flags;
  int AffectedBy;
  int CarryWeight;
  int CarryNumber;
  int BodyParts;
  int Resistant;
  int Immune;
  int Susceptible;
  int AttackFlags;
  int DefenseFlags;
  int Speaks;
  int Speaking;

  short Alignment;
  short BareNumDie;
  short BareSizeDie;
  short MobThac0;
  short HitRoll;
  short DamRoll;
  short HitPlus;
  short DamPlus;
  PositionType Position;
  PositionType DefaultPosition;
  short Height;
  short Weight;
  short ArmorClass;
  short Wimpy;
  int Deaf;

  short MentalState;           /* simplified */
  short EmotionalState;        /* simplified */
  vnum_t ReTran;
  vnum_t ReGoto;
  short MobInvis;       /* Mobinvis level SB */
  int VipFlags;
  short BackupWait;       /* reinforcements */
  vnum_t BackupMob;     /* reinforcements */
  short WasStunned;
  char *MobClan;    /* for spec_clan_guard.. set by postguard */
  Room *BuzzedHome;
  Room *BuzzedFromRoom;
  Character *Challenged;
  Character *BettedOn;
  int BetAmount;
  char *Owner;
  Room *Home;
  short CmdRecurse;
  Object *On;
  Character *Pet;

  struct
  {
    HuntHateFear *Hunting;
    HuntHateFear *Fearing;
    HuntHateFear *Hating;
  } HHF;

  struct
  {
    short Main;
    short Level[MAX_ABILITY];
    long Experience[MAX_ABILITY];
  } Ability;

  struct
  {
    MPROG_ACT_LIST *mpact;
    int mpactnum;
    short mpscriptpos;
  } mprog;

  struct
  {
    short PoisonDeath;
    short Wand;
    short ParaPetri;
    short Breath;
    short SpellStaff;
  } Saving;

  struct
  {
    short PermStr;
    short PermInt;
    short PermWis;
    short PermDex;
    short PermCon;
    short PermCha;
    short PermLck;
    short PermFrc;

    short ModStr;
    short ModInt;
    short ModWis;
    short ModDex;
    short ModCon;
    short ModCha;
    short ModLck;
    short ModFrc;
  } Stats;
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
Object *GetCarriedObject( const Character *ch, const char *argument );

/*
 * Find an obj in player's equipment.
 */
Object *GetWornObject( const Character *ch, const char *argument );

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

const char *PERS( const Character *ch, const Character *looker );

bool IsClanned( const Character *ch );

void SetWaitState( Character *ch, short number_of_pulses );

bool IsJedi( const Character *ch );

bool IsDroid( const Character *ch );

void ResetPlayerOnDeath( Character *ch );

int GetCostToQuit( const Character *ch );

bool IsBlind( const Character *ch );

bool HasKey( const Character *ch, vnum_t key );

short GetCarryEncumbrance( const Character *ch, short move );

vnum_t WhereHome( const Character *ch );

void ClearCharacter( Character *ch );

void FreeCharacter( Character *ch );

bool IsInArena( const Character *ch );

void ApplyJediBonus( Character *ch );

void ApplySithPenalty( Character *ch );

const char *HeSheIt( const Character *ch );

const char *HimHerIt( const Character *ch );

const char *HisHersIts( const Character *ch );

void AddReinforcements( Character *ch );

void SetCharacterTitle( Character *ch, const char *title );

bool HasPermanentSneak( const Character *ch );

#endif
