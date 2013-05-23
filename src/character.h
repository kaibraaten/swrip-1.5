#ifndef _SWRIP_CHARACTER_H_
#define _SWRIP_CHARACTER_H_

#include "types.h"

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

#endif
