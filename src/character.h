#ifndef _SWRIP_CHARACTER_H_
#define _SWRIP_CHARACTER_H_

#include "types.h"
#include "constants.h"

struct char_data
{
  CHAR_DATA *           next;
  CHAR_DATA *           prev;
  CHAR_DATA *           next_in_room;
  CHAR_DATA *           prev_in_room;
  CHAR_DATA *           master;
  CHAR_DATA *           leader;
  FIGHT_DATA *  fighting;
  CHAR_DATA *           reply;
  CHAR_DATA *           switched;
  CHAR_DATA *           mount;
  HHF_DATA *            hunting;
  HHF_DATA *            fearing;
  HHF_DATA *            hating;
  SPEC_FUN *            spec_fun;
  SPEC_FUN *            spec_2;
  MPROG_ACT_LIST *      mpact;
  int                   mpactnum;
  short         mpscriptpos;
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
  short ability_level[MAX_ABILITY];
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
  long          experience[MAX_ABILITY];
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
  short         saving_poison_death;
  short         saving_wand;
  short         saving_para_petri;
  short         saving_breath;
  short         saving_spell_staff;
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
  short         perm_str;
  short         perm_int;
  short         perm_wis;
  short         perm_dex;
  short         perm_con;
  short         perm_cha;
  short         perm_lck;
  short         perm_frc;
  short         mod_str;
  short         mod_int;
  short         mod_wis;
  short         mod_dex;
  short         mod_con;
  short         mod_cha;
  short         mod_lck;
  short         mod_frc;
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
  short              main_ability;
  ROOM_INDEX_DATA *   buzzed_home;
  ROOM_INDEX_DATA *   buzzed_from_room;
  short              questmob;
  short         questobj;
  short              questpoints;
  int           nextquest;
  int                   countdown;
  CHAR_DATA       *   questgiver;
  CHAR_DATA           *   challenged;
  CHAR_DATA *         betted_on;
  int                 bet_amt;
  char      *   owner;
  ROOM_INDEX_DATA *   home;
  short   cmd_recurse;
  OBJ_DATA          *   on;
  CHAR_DATA         *   pet;
};

bool is_wizvis( const CHAR_DATA *ch, const CHAR_DATA *victim );

/*
 * Return how much exp a char has for a specified ability.
 */
long get_exp( const CHAR_DATA *ch, short ability );

void set_exp( CHAR_DATA *ch, short ability, long xp );

/*
 * Calculate roughly how much experience a character is worth
 */
int get_exp_worth( const CHAR_DATA *ch );

/*
 * Retrieve a character's trusted level for permission checking.
 */
short get_trust( const CHAR_DATA *ch );

/*
 * Retrieve a character's age.
 */
short get_age( const CHAR_DATA *ch ) ;

/*
 * Retrieve character's current strength.
 */
short get_curr_str( const CHAR_DATA *ch );

/*
 * Retrieve character's current intelligence.
 */
short get_curr_int( const CHAR_DATA *ch );

/*
 * Retrieve character's current wisdom.
 */
short get_curr_wis( const CHAR_DATA *ch );

/*
 * Retrieve character's current dexterity.
 */
short get_curr_dex( const CHAR_DATA *ch );

/*
 * Retrieve character's current constitution.
 */
short get_curr_con( const CHAR_DATA *ch );

/*
 * Retrieve character's current charisma.
 */
short get_curr_cha( const CHAR_DATA *ch );

/*
 * Retrieve character's current luck.
 */
short get_curr_lck( const CHAR_DATA *ch );

short get_curr_frc( const CHAR_DATA *ch );

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void add_kill( CHAR_DATA *ch, const CHAR_DATA *mob );

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int times_killed( const CHAR_DATA *ch, const CHAR_DATA *mob );

bool has_comlink( const CHAR_DATA *ch );

short get_level( const CHAR_DATA *ch, short ability );

void set_level( CHAR_DATA *ch, short ability, int newlevel );

/*
 * Return true if a char is affected by a spell.
 */
bool is_affected( const CHAR_DATA *ch, int sn );

/*
 * Return true if a certain ch->affected_by bit is set.
 */
bool is_affected_by( const CHAR_DATA *ch, int affected_by_bit );

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
OBJ_DATA *get_eq_char( const CHAR_DATA *ch, int iWear );

/*
 * Equip a char with an obj.
 */
void equip_char( CHAR_DATA *ch, OBJ_DATA *obj, int iWear );

/*
 * Unequip a char with an obj.
 */
void unequip_char( CHAR_DATA *ch, OBJ_DATA *obj );

/*
 * Find an obj in player's inventory.
 */
OBJ_DATA *get_obj_carry( const CHAR_DATA *ch, const char *argument );

/*
 * Find an obj in player's equipment.
 */
OBJ_DATA *get_obj_wear( const CHAR_DATA *ch, const char *argument );

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool ms_find_obj( const CHAR_DATA *ch );

/*
 * True if char can see victim.
 */
bool can_see( const CHAR_DATA *ch, const CHAR_DATA *victim );

/*
 * True if char can see obj.
 */
bool can_see_obj( const CHAR_DATA *ch, const OBJ_DATA *obj );

/*
 * True if char can drop obj.
 */
bool can_drop_obj( const CHAR_DATA *ch, const OBJ_DATA *obj );

/*
 * "Fix" a character's stats                                    -Thoric
 */
void fix_char( CHAR_DATA *ch );

/*
 * Improve mental state                                         -Thoric
 */
void better_mental_state( CHAR_DATA *ch, int mod );

/*
 * Deteriorate mental state                                     -Thoric
 */
void worsen_mental_state( CHAR_DATA *ch, int mod );

/*
 * Retrieve a character's carry capacity.
 */
int can_carry_w( const CHAR_DATA *ch );

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int can_carry_n( const CHAR_DATA *ch );

bool is_npc( const CHAR_DATA *ch );

bool is_immortal( const CHAR_DATA *ch );

bool is_god( const CHAR_DATA *ch );

bool is_hero( const CHAR_DATA *ch );

bool is_good( const CHAR_DATA *ch );

bool is_evil( const CHAR_DATA *ch );

bool is_neutral( const CHAR_DATA *ch );

bool is_evil_mob_index_data( const MOB_INDEX_DATA *mob );

bool is_awake( const CHAR_DATA *ch );

int get_armor_class( const CHAR_DATA *ch );

int get_hitroll( const CHAR_DATA *ch );

int get_damroll( const CHAR_DATA *ch );

bool is_drunk( const CHAR_DATA *ch );

bool is_retired_immortal( const CHAR_DATA *ch );

bool is_not_authed( const CHAR_DATA *ch );

bool is_waiting_for_auth( const CHAR_DATA *ch );

char *PERS( const CHAR_DATA *ch, const CHAR_DATA *looker );

bool is_clanned( const CHAR_DATA *ch );

void set_wait_state( CHAR_DATA *ch, short number_of_pulses );

#endif
