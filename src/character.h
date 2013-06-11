#ifndef _SWRIP_CHARACTER_H_
#define _SWRIP_CHARACTER_H_

#include "types.h"
#include "constants.h"

struct Character
{
  Character *           next;
  Character *           prev;
  Character *           master;
  Character *           leader;
  FIGHT_DATA *  fighting;
  Character *           reply;
  Character *           switched;
  Character *           mount;

  SPEC_FUN *            spec_fun;
  SPEC_FUN *            spec_2;

  MOB_INDEX_DATA *      pIndexData;
  DESCRIPTOR_DATA *     desc;
  AFFECT_DATA * first_affect;
  AFFECT_DATA * last_affect;
  OBJ_DATA *            first_carrying;
  OBJ_DATA *            last_carrying;
  ROOM_INDEX_DATA *     in_room;
  ROOM_INDEX_DATA *     was_in_room;
  ROOM_INDEX_DATA *   was_sentinel;
  ROOM_INDEX_DATA *   plr_home;
  PC_DATA *             pcdata;
  DO_FUN *              last_cmd;
  DO_FUN *              prev_cmd;   /* mapping */
  void *                dest_buf;
  void *                dest_buf_2;
  void *                spare_ptr;
  int                   tempnum;
  EDITOR_DATA * editor;
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
  int                   retran;
  int                   regoto;
  short         mobinvis;       /* Mobinvis level SB */
  int                 vip_flags;
  short              backup_wait;       /* reinforcements */
  int                 backup_mob;     /* reinforcements */
  short              was_stunned;
  char            *   mob_clan;    /* for spec_clan_guard.. set by postguard */
  GUARD_DATA      *   guard_data;
  ROOM_INDEX_DATA *   buzzed_home;
  ROOM_INDEX_DATA *   buzzed_from_room;
  Character           *   challenged;
  Character *         betted_on;
  int                 bet_amt;
  char      *   owner;
  ROOM_INDEX_DATA *   home;
  short   cmd_recurse;
  OBJ_DATA          *   on;
  Character         *   pet;

  struct
  {
    HHF_DATA *hunting;
    HHF_DATA *fearing;
    HHF_DATA *hating;
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

  struct
  {
    short      questmob;
    short      questobj;
    short      questpoints;
    int        nextquest;
    int        countdown;
    Character *questgiver;
  } quest;
};

bool IsWizvis( const Character *ch, const Character *victim );

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
short GetTrustedLevel( const Character *ch );

/*
 * Retrieve a character's age.
 */
short GetAge( const Character *ch ) ;

/*
 * Retrieve character's current strength.
 */
short GetCurrentStr( const Character *ch );

/*
 * Retrieve character's current intelligence.
 */
short GetCurrentInt( const Character *ch );

/*
 * Retrieve character's current wisdom.
 */
short GetCurrentWis( const Character *ch );

/*
 * Retrieve character's current dexterity.
 */
short GetCurrentDex( const Character *ch );

/*
 * Retrieve character's current constitution.
 */
short GetCurrentCon( const Character *ch );

/*
 * Retrieve character's current charisma.
 */
short GetCurrentCha( const Character *ch );

/*
 * Retrieve character's current luck.
 */
short GetCurrentLck( const Character *ch );

short GetCurrentFrc( const Character *ch );

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

short GetLevel( const Character *ch, short ability );

void SetLevel( Character *ch, short ability, int newlevel );

/*
 * Return true if a char is affected by a spell.
 */
bool is_affected( const Character *ch, int sn );

/*
 * Return true if a certain ch->affected_by bit is set.
 */
bool is_affected_by( const Character *ch, int affected_by_bit );

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
OBJ_DATA *get_eq_char( const Character *ch, int iWear );

/*
 * Equip a char with an obj.
 */
void equip_char( Character *ch, OBJ_DATA *obj, int iWear );

/*
 * Unequip a char with an obj.
 */
void unequip_char( Character *ch, OBJ_DATA *obj );

/*
 * Find an obj in player's inventory.
 */
OBJ_DATA *get_obj_carry( const Character *ch, const char *argument );

/*
 * Find an obj in player's equipment.
 */
OBJ_DATA *get_obj_wear( const Character *ch, const char *argument );

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool ms_find_obj( const Character *ch );

/*
 * True if char can see victim.
 */
bool can_see( const Character *ch, const Character *victim );

/*
 * True if char can see obj.
 */
bool can_see_obj( const Character *ch, const OBJ_DATA *obj );

/*
 * True if char can drop obj.
 */
bool can_drop_obj( const Character *ch, const OBJ_DATA *obj );

/*
 * "Fix" a character's stats                                    -Thoric
 */
void fix_char( Character *ch );

/*
 * Improve mental state                                         -Thoric
 */
void better_mental_state( Character *ch, int mod );

/*
 * Deteriorate mental state                                     -Thoric
 */
void worsen_mental_state( Character *ch, int mod );

/*
 * Retrieve a character's carry capacity.
 */
int can_carry_w( const Character *ch );

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int can_carry_n( const Character *ch );

bool IsNpc( const Character *ch );

bool IsImmortal( const Character *ch );

bool is_god( const Character *ch );

bool is_hero( const Character *ch );

bool is_good( const Character *ch );

bool is_evil( const Character *ch );

bool is_neutral( const Character *ch );

bool is_evil_mob_index_data( const MOB_INDEX_DATA *mob );

bool is_awake( const Character *ch );

int get_armor_class( const Character *ch );

int get_hitroll( const Character *ch );

int get_damroll( const Character *ch );

bool is_drunk( const Character *ch );

bool is_retired_immortal( const Character *ch );

bool is_not_authed( const Character *ch );

bool is_waiting_for_auth( const Character *ch );

char *PERS( const Character *ch, const Character *looker );

bool is_clanned( const Character *ch );

void set_wait_state( Character *ch, short number_of_pulses );

bool IsForcer( const Character *ch );

#endif
