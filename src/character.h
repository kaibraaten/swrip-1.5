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

#include "types.h"
#include "constants.h"

struct Character
{
  Character *           next;
  Character *           prev;
  Character *           next_in_room;
  Character *           prev_in_room;
  Character *           master;
  Character *           leader;
  Fight     *           fighting;
  Character *           reply;
  Character *           switched;
  Character *           mount;

  SPEC_FUN *            spec_fun;
  SPEC_FUN *            spec_2;

  ProtoMobile *      pIndexData;
  Descriptor *     desc;
  Affect * first_affect;
  Affect * last_affect;
  OBJ_DATA *            first_carrying;
  OBJ_DATA *            last_carrying;
  Room *     in_room;
  Room *     was_in_room;
  Room *   was_sentinel;
  Room *   plr_home;
  PC_DATA *             pcdata;
  DO_FUN *              last_cmd;
  DO_FUN *              prev_cmd;   /* mapping */
  void *                dest_buf;
  void *                dest_buf_2;
  void *                spare_ptr;
  int                   tempnum;
  Editor * editor;
  TIMER *       first_timer;
  TIMER *       last_timer;
  char *                name;
  char *                short_descr;
  char *                long_descr;
  char *                description;
  short         num_fighting;
  short         substate;
  short         sex;
  short         race;
  short top_level;

  short         trust;
  short         timer;
  short         wait;

  short         hit;
  short         max_hit;
  short         mana;
  short         max_mana;
  short         move;
  short         max_move;

  short         numattacks;
  int                   gold;
  int           act;
  int                   affected_by;
  int                   carry_weight;
  int                   carry_number;
  int                   xflags;
  int                   resistant;
  int                   immune;
  int                   susceptible;
  int                   attacks;
  int                   defenses;
  int                   speaks;
  int                   speaking;

  short         alignment;
  short         barenumdie;
  short         baresizedie;
  short         mobthac0;
  short         hitroll;
  short         damroll;
  short         hitplus;
  short         damplus;
  int           position;
  int           defposition;
  short         height;
  short         weight;
  short         armor;
  short         wimpy;
  int                   deaf;

  short         mental_state;           /* simplified */
  short         emotional_state;        /* simplified */
  vnum_t                retran;
  vnum_t                regoto;
  short         mobinvis;       /* Mobinvis level SB */
  int                 vip_flags;
  short              backup_wait;       /* reinforcements */
  int                 backup_mob;     /* reinforcements */
  short              was_stunned;
  char            *   mob_clan;    /* for spec_clan_guard.. set by postguard */
  GuardData      *   guard_data;
  Room *   buzzed_home;
  Room *   buzzed_from_room;
  Character           *   challenged;
  Character *         betted_on;
  int                 bet_amt;
  char      *   owner;
  Room *   home;
  short   cmd_recurse;
  OBJ_DATA          *   on;
  Character         *   pet;

  struct
  {
    HuntHateFear *hunting;
    HuntHateFear *fearing;
    HuntHateFear *hating;
  } hhf;

  struct
  {
    short main;
    short level[MAX_ABILITY];
    long experience[MAX_ABILITY];
  } ability;

  struct
  {
    MPROG_ACT_LIST *mpact;
    int mpactnum;
    short mpscriptpos;
  } mprog;

  struct
  {
    short poison_death;
    short wand;
    short para_petri;
    short breath;
    short spell_staff;
  } saving;

  struct
  {
    short perm_str;
    short perm_int;
    short perm_wis;
    short perm_dex;
    short perm_con;
    short perm_cha;
    short perm_lck;
    short perm_frc;

    short mod_str;
    short mod_int;
    short mod_wis;
    short mod_dex;
    short mod_con;
    short mod_cha;
    short mod_lck;
    short mod_frc;
  } stats;
};

bool IsWizVis( const Character *ch, const Character *victim );

/*
 * Return how much exp a char has for a specified ability.
 */
long GetExperience( const Character *ch, short ability );

void SetExperience( Character *ch, short ability, long xp );

/*
 * Calculate roughly how much experience a character is worth
 */
int GetExperienceWorth( const Character *ch );

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
OBJ_DATA *GetEquipmentOnCharacter( const Character *ch, int iWear );

/*
 * Equip a char with an obj.
 */
void EquipCharacter( Character *ch, OBJ_DATA *obj, int iWear );

/*
 * Unequip a char with an obj.
 */
void UnequipCharacter( Character *ch, OBJ_DATA *obj );

/*
 * Find an obj in player's inventory.
 */
OBJ_DATA *GetCarriedObject( const Character *ch, const char *argument );

/*
 * Find an obj in player's equipment.
 */
OBJ_DATA *GetWornObject( const Character *ch, const char *argument );

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool ms_find_obj( const Character *ch );

/*
 * True if char can see victim.
 */
bool CanSeeCharacter( const Character *ch, const Character *victim );

/*
 * True if char can see obj.
 */
bool CanSeeObject( const Character *ch, const OBJ_DATA *obj );

/*
 * True if char can drop obj.
 */
bool CanDropObject( const Character *ch, const OBJ_DATA *obj );

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

#endif
