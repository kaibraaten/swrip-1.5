#include <string.h>
#include "character.h"
#include "mud.h"

bool is_wizvis( const Character *ch, const Character *victim )
{
  if ( !is_npc(victim)
       && IS_SET(victim->act, PLR_WIZINVIS)
       && get_trust( ch ) < victim->pcdata->wizinvis )
    return FALSE;

  return TRUE;
}

/*
 * Return how much exp a char has for a specified ability.
 */
long get_exp( const Character *ch, short ability )
{
  if ( ability >= MAX_ABILITY || ability < 0 )
    return 0;

  return ch->ability.experience[ability];
}

void set_exp( Character *ch, short ability, long xp )
{
  if ( ability >= MAX_ABILITY || ability < 0 )
    {
      bug("%s: ability out of range: %d", __FUNCTION__, ability );
      return;
    }

  if( xp < 0 )
    {
      bug( "%s: negative value %d invalid", __FUNCTION__, xp );
      return;
    }

  ch->ability.experience[ability] = xp;
}

/*
 * Calculate roughly how much experience a character is worth
 */
int get_exp_worth( const Character *ch )
{
  int xp = 0;

  xp = get_level( ch, COMBAT_ABILITY ) * ch->top_level * 50;
  xp += ch->max_hit * 2;
  xp -= (ch->armor-50) * 2;
  xp += ( ch->barenumdie * ch->baresizedie + get_damroll(ch) ) * 50;
  xp += get_hitroll(ch) * ch->top_level * 10;

  if ( is_affected_by(ch, AFF_SANCTUARY) )
    xp += xp * 1.5;

  if ( is_affected_by(ch, AFF_FIRESHIELD) )
    xp += xp * 1.2;

  if ( is_affected_by(ch, AFF_SHOCKSHIELD) )
    xp += xp * 1.2;

  xp = URANGE( MIN_EXP_WORTH, xp, MAX_EXP_WORTH );

  return xp;
}

/*
 * Retrieve a character's trusted level for permission checking.
 */
short get_trust( const Character *ch )
{
  if ( !ch )
    return 0;

  if ( ch->trust != 0 )
    return ch->trust;

  if ( is_npc(ch) && ch->top_level >= LEVEL_AVATAR )
    return LEVEL_AVATAR;

  if ( ch->top_level >= LEVEL_NEOPHYTE && is_retired_immortal( ch ) )
    return LEVEL_NEOPHYTE;

  return ch->top_level;
}

/*
 * Retrieve a character's age.
 */
short get_age( const Character *ch )
{
  if( is_npc(ch) )
    return 17;

  return 17 + ( ch->pcdata->played + (current_time - ch->pcdata->logon) ) / 1515800;
}

/*
 * Retrieve character's current strength.
 */
short get_curr_str( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_str + ch->stats.mod_str, max );
}

/*
 * Retrieve character's current intelligence.
 */
short get_curr_int( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_int + ch->stats.mod_int, max );
}

/*
 * Retrieve character's current wisdom.
 */
short get_curr_wis( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_wis + ch->stats.mod_wis, max );
}

/*
 * Retrieve character's current dexterity.
 */
short get_curr_dex( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_dex + ch->stats.mod_dex, max );
}

/*
 * Retrieve character's current constitution.
 */
short get_curr_con( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_con + ch->stats.mod_con, max );
}

/*
 * Retrieve character's current charisma.
 */
short get_curr_cha( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_cha + ch->stats.mod_cha, max );
}

/*
 * Retrieve character's current luck.
 */
short get_curr_lck( const Character *ch )
{
  short max = 25;
  return URANGE( 3, ch->stats.perm_lck + ch->stats.mod_lck, max );
}

short get_curr_frc( const Character *ch )
{
  short max = 0;

  if (!is_npc(ch))
    {
      max = 20 + race_table[ch->race].stats.mod_frc;
      max = UMIN(max,25);
    }
  else
    {
      max  = 25;
    }

  return URANGE( 0 , ch->stats.perm_frc + ch->stats.mod_frc, max );
}

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void add_kill( Character *ch, const Character *mob )
{
  int x;
  short vnum, track;

  if ( is_npc(ch) )
    return;

  if ( !is_npc(mob) )
    return;

  vnum = mob->pIndexData->vnum;
  track = URANGE( 2, ((get_level( ch, COMBAT_ABILITY ) + 3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
  for ( x = 0; x < track; x++ )
    if ( ch->pcdata->killed[x].vnum == vnum )
      {
        if ( ch->pcdata->killed[x].count < 50 )
          ++ch->pcdata->killed[x].count;
        return;
      }
    else
      if ( ch->pcdata->killed[x].vnum == 0 )
        break;
  memmove( (char *) ch->pcdata->killed+sizeof(KILLED_DATA),
           ch->pcdata->killed, (track-1) * sizeof(KILLED_DATA) );
  ch->pcdata->killed[0].vnum  = vnum;
  ch->pcdata->killed[0].count = 1;
  if ( track < MAX_KILLTRACK )
    ch->pcdata->killed[track].vnum = 0;
}

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int times_killed( const Character *ch, const Character *mob )
{
  int x;
  short vnum, track;

  if ( is_npc(ch) )
    return 0;

  if ( !is_npc(mob) )
    return 0;

  vnum = mob->pIndexData->vnum;
  track = URANGE( 2, ((get_level( ch, COMBAT_ABILITY ) + 3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
  for ( x = 0; x < track; x++ )
    if ( ch->pcdata->killed[x].vnum == vnum )
      return ch->pcdata->killed[x].count;
    else
      if ( ch->pcdata->killed[x].vnum == 0 )
        break;
  return 0;
}

bool has_comlink( const Character *ch )
{
  OBJ_DATA *obj = NULL;

  if( is_immortal( ch ) )
    {
      return TRUE;
    }

  for( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if( obj->pIndexData->item_type == ITEM_COMLINK )
        {
          return TRUE;
        }
    }

  return FALSE;
}

short get_level( const Character *ch, short ability )
{
  return ch->ability.level[ability];
}

void set_level( Character *ch, short ability, int newlevel )
{
  int maxlevel = is_immortal( ch ) ? 200 : MAX_ABILITY_LEVEL;

  if( newlevel >= 0 && newlevel <= maxlevel )
    {
      ch->ability.level[ability] = newlevel;
    }
  else
    {
      bug("%s: level out of range: %d", __FUNCTION__, newlevel);
    }
}

/*
 * Return true if a char is affected by a spell.
 */
bool is_affected( const Character *ch, int sn )
{
  Affect *paf = NULL;

  for ( paf = ch->first_affect; paf; paf = paf->next )
    if ( paf->type == sn )
      return TRUE;

  return FALSE;
}

bool is_affected_by( const Character *ch, int affected_by_bit )
{
  return IS_SET( ch->affected_by, affected_by_bit );
}

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
OBJ_DATA *get_eq_char( const Character *ch, int iWear )
{
  OBJ_DATA *obj, *maxobj = NULL;

  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->wear_loc == iWear )
      {
        if ( !obj->pIndexData->layers )
          return obj;
        else
          if ( !maxobj
               ||    obj->pIndexData->layers > maxobj->pIndexData->layers )
            maxobj = obj;
      }

  return maxobj;
}

/*
 * Equip a char with an obj.
 */
void equip_char( Character *ch, OBJ_DATA *obj, int iWear )
{
  Affect *paf;
  OBJ_DATA      *otmp;

  if ( (otmp=get_eq_char( ch, iWear )) != NULL
       &&   (!otmp->pIndexData->layers || !obj->pIndexData->layers) )
    {
      bug( "Equip_char: already equipped (%d).", iWear );
      return;
    }

  separate_obj(obj);    /* just in case */
  if ( ( IS_OBJ_STAT(obj, ITEM_ANTI_EVIL)    && is_evil(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_GOOD)    && is_good(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_NEUTRAL) && is_neutral(ch) ) )
    {
      /*
       * Thanks to Morgenes for the bug fix here!
       */
      if ( loading_char != ch )
        {
          act( AT_MAGIC, "You are zapped by $p and drop it.", ch, obj, NULL, TO_CHAR );
          act( AT_MAGIC, "$n is zapped by $p and drops it.",  ch, obj, NULL, TO_ROOM );
        }
      if ( obj->carried_by )
        obj_from_char( obj );
      obj_to_room( obj, ch->in_room );
      oprog_zap_trigger( ch, obj);
      if ( IS_SET(sysdata.save_flags, SV_ZAPDROP) && !char_died(ch) )
        save_char_obj( ch );
      return;
    }

  ch->armor             -= apply_ac( obj, iWear );
  obj->wear_loc  = iWear;

  ch->carry_number      -= get_obj_number( obj );
  if ( IS_SET( obj->extra_flags, ITEM_MAGIC ) || obj->wear_loc == WEAR_FLOATING )
    ch->carry_weight  -= get_obj_weight( obj );

  for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, TRUE );

  for ( paf = obj->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, TRUE );

  if ( obj->item_type == ITEM_LIGHT
       &&   obj->value[2] != 0
       &&   ch->in_room )
    ++ch->in_room->light;
}

/*
 * Unequip a char with an obj.
 */
void unequip_char( Character *ch, OBJ_DATA *obj )
{
  Affect *paf;

  if ( obj->wear_loc == WEAR_NONE )
    {
      bug( "Unequip_char: already unequipped.", 0 );
      return;
    }

  ch->carry_number      += get_obj_number( obj );
  if ( IS_SET( obj->extra_flags, ITEM_MAGIC ) || obj->wear_loc == WEAR_FLOATING )
    ch->carry_weight  += get_obj_weight( obj );

  ch->armor             += apply_ac( obj, obj->wear_loc );
  obj->wear_loc  = -1;

  for ( paf = obj->pIndexData->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, FALSE );
  if ( obj->carried_by )
    for ( paf = obj->first_affect; paf; paf = paf->next )
      affect_modify( ch, paf, FALSE );

  if ( !obj->carried_by )
    return;

  if ( obj->item_type == ITEM_LIGHT
       &&   obj->value[2] != 0
       &&   ch->in_room
       &&   ch->in_room->light > 0 )
    --ch->in_room->light;
}

/*
 * Find an obj in player's inventory.
 */
OBJ_DATA *get_obj_carry( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int number, count, vnum;

  number = number_argument( argument, arg );
  if ( get_trust(ch) >= LEVEL_SAVIOR && is_number( arg ) )
    vnum = atoi( arg );
  else
    vnum = -1;

  count  = 0;
  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc == WEAR_NONE
         &&   can_see_obj( ch, obj )
         &&  (nifty_is_name( arg, obj->name ) || obj->pIndexData->vnum == vnum) )
      if ( (count += obj->count) >= number )
        return obj;

  if ( vnum != -1 )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;
  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc == WEAR_NONE
         &&   can_see_obj( ch, obj )
         &&   nifty_is_name_prefix( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  return NULL;
}

/*
 * Find an obj in player's equipment.
 */
OBJ_DATA *get_obj_wear( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  OBJ_DATA *obj;
  int number, count, vnum;

  if ( !ch )
    {
      bug( "get_obj_wear: null ch" );
    }

  number = number_argument( argument, arg );

  if ( get_trust(ch) >= LEVEL_SAVIOR && is_number( arg ) )
    vnum = atoi( arg );
  else
    vnum = -1;

  count  = 0;
  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc != WEAR_NONE
         &&   can_see_obj( ch, obj )
         &&  (nifty_is_name( arg, obj->name ) || obj->pIndexData->vnum == vnum) )
      if ( ++count == number )
        return obj;

  if ( vnum != -1 )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;
  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc != WEAR_NONE
         &&   can_see_obj( ch, obj )
         &&   nifty_is_name_prefix( arg, obj->name ) )
      if ( ++count == number )
        return obj;

  return NULL;
}

/*
 * How mental state could affect finding an object              -Thoric
 * Used by get/drop/put/quaff/recite/etc
 * Increasingly freaky based on mental state and drunkeness
 */
bool ms_find_obj( const Character *ch )
{
  int ms = ch->mental_state;
  int drunk = is_npc(ch) ? 0 : ch->pcdata->condition[COND_DRUNK];
  const char *t = NULL;

  /*
   * we're going to be nice and let nothing weird happen unless
   * you're a tad messed up
   */
  drunk = UMAX( 1, drunk );

  if ( abs(ms) + (drunk/3) < 30 )
    return FALSE;

  if ( (number_percent() + (ms < 0 ? 15 : 5))> abs(ms)/2 + drunk/4 )
    return FALSE;

  if ( ms > 15 )        /* range 1 to 20 */
    {
      switch( number_range( UMAX(1, (ms/5-15)), (ms+4) / 5 ) )
	{
	default:
	case 1:
	  t="As you reach for it, you forgot what it was...\r\n";
	  break;

	case 2:
	  t="As you reach for it, something inside stops you...\r\n";
	  break;

	case 3:
	  t="As you reach for it, it seems to move out of the way...\r\n";
	  break;

	case 4:
	  t="You grab frantically for it, but can't seem to get a hold of it...\r\n";
	  break;

	case 5:
	  t="It disappears as soon as you touch it!\r\n";
	  break;

	case 6:
	  t="You would if it would stay still!\r\n";
	  break;

	case 7:
	  t="Whoa!  It's covered in blood!  Ack!  Ick!\r\n";
	  break;

	case 8:
	  t="Wow... trails!\r\n";
	  break;

	case 9:
	  t="You reach for it, then notice the back of your hand is growing something!\r\n";
	  break;

	case 10:
	  t="As you grasp it, it shatters into tiny shards which bite into your flesh!\r\n";
	  break;

	case 11:
	  t="What about that huge dragon flying over your head?!?!?\r\n";
	  break;

	case 12:
	  t="You stratch yourself instead...\r\n";
	  break;

	case 13:
	  t="You hold the universe in the palm of your hand!\r\n";
	  break;

	case 14:
	  t="You're too scared.\r\n";
	  break;

	case 15:
	  t="Your mother smacks your hand... 'NO!'\r\n";
	  break;

	case 16:
	  t="Your hand grasps the worse pile of revoltingness than you could ever imagine!\r\n";
	  break;
	
	case 17:
	  t="You stop reaching for it as it screams out at you in pain!\r\n";
	  break;

	case 18:
	  t="What about the millions of burrow-maggots feasting on your arm?!?!\r\n";
	  break;

	case 19:
	  t="That doesn't matter anymore... you've found the true answer to everything!\r\n";
	  break;

	case 20:
	  t="A supreme entity has no need for that.\r\n";
	  break;
	}
    }
  else
    {
      int sub = URANGE(1, abs(ms)/2 + drunk, 60);

      switch( number_range( 1, sub/10 ) )
        {
        default:
        case 1:
	  t="In just a second...\r\n";
	  break;

        case 2:
	  t="You can't find that...\r\n";
	  break;

        case 3:
	  t="It's just beyond your grasp...\r\n";
	  break;

        case 4:
	  t="...but it's under a pile of other stuff...\r\n";
	  break;

        case 5:
	  t="You go to reach for it, but pick your nose instead.\r\n";
	  break;

        case 6:
	  t="Which one?!? I see two... no three...\r\n";
	  break;
        }
    }

  ch_printf( ch, t );
  return TRUE;
}

/*
 * True if char can see victim.
 */
bool can_see( const Character *ch, const Character *victim )
{
  if (!victim)
    return FALSE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  if ( !ch )
    {
      if ( is_affected_by(victim, AFF_INVISIBLE)
           || is_affected_by(victim, AFF_HIDE)
           || IS_SET(victim->act, PLR_WIZINVIS) )
        return FALSE;
      else
        return TRUE;
    }

  if ( ch == victim )
    return TRUE;

  if ( !is_npc(victim)
       && IS_SET(victim->act, PLR_WIZINVIS)
       && get_trust( ch ) < victim->pcdata->wizinvis )
    return FALSE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  /* SB */
  if ( is_npc(victim)
       && IS_SET(victim->act, ACT_MOBINVIS)
       && get_trust( ch ) < victim->mobinvis )
    return FALSE;

  if ( !is_immortal(ch) && !is_npc(victim) && !victim->desc
       && get_timer(victim, TIMER_RECENTFIGHT) > 0
       && (!victim->switched || !is_affected_by(victim->switched, AFF_POSSESS)) )
    return FALSE;

  if ( !is_npc(ch) && IS_SET(ch->act, PLR_HOLYLIGHT) )
    return TRUE;

  /* The miracle cure for blindness? -- Altrag */
  if ( !is_affected_by(ch, AFF_TRUESIGHT) )
    {
      if ( is_affected_by(ch, AFF_BLIND) )
        return FALSE;

      if ( room_is_dark( ch->in_room ) && !is_affected_by(ch, AFF_INFRARED) )
        return FALSE;

      if ( is_affected_by(victim, AFF_HIDE)
           && !is_affected_by(ch, AFF_DETECT_HIDDEN)
           && !victim->fighting )
        {
          if ( ch->race == RACE_DEFEL && victim->race == RACE_DEFEL )
            return TRUE;

          return FALSE;
        }


      if ( is_affected_by(victim, AFF_INVISIBLE)
           &&  !is_affected_by(ch, AFF_DETECT_INVIS) )
        return FALSE;
    }

  return TRUE;
}

/*
 * True if char can see obj.
 */
bool can_see_obj( const Character *ch, const OBJ_DATA *obj )
{
  if ( !is_npc(ch) && IS_SET(ch->act, PLR_HOLYLIGHT) )
    return TRUE;

  if ( IS_OBJ_STAT( obj, ITEM_BURRIED ) )
    return FALSE;

  if ( is_affected_by( ch, AFF_TRUESIGHT ) )
    return TRUE;

  if ( is_affected_by( ch, AFF_BLIND ) )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_HIDDEN) )
    return FALSE;

  if ( obj->item_type == ITEM_LIGHT && obj->value[2] != 0 )
    return TRUE;

  if ( room_is_dark( ch->in_room ) && !is_affected_by(ch, AFF_INFRARED) )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_INVIS) && !is_affected_by(ch, AFF_DETECT_INVIS) )
    return FALSE;

  return TRUE;
}

/*
 * True if char can drop obj.
 */
bool can_drop_obj( const Character *ch, const OBJ_DATA *obj )
{
  if ( !IS_OBJ_STAT(obj, ITEM_NODROP) )
    return TRUE;

  if ( !is_npc(ch) && get_trust(ch) >= LEVEL_IMMORTAL )
    return TRUE;

  if ( is_npc(ch) && ch->pIndexData->vnum == 3 )
    return TRUE;

  return FALSE;
}

/*
 * "Fix" a character's stats                                    -Thoric
 */
void fix_char( Character *ch )
{
  Affect *aff;
  OBJ_DATA *carry[MAX_LEVEL*200];
  OBJ_DATA *obj;
  int x, ncarry;

  de_equip_char( ch );

  ncarry = 0;
  while ( (obj=ch->first_carrying) != NULL )
    {
      carry[ncarry++]  = obj;
      obj_from_char( obj );
    }

  for ( aff = ch->first_affect; aff; aff = aff->next )
    affect_modify( ch, aff, FALSE );

  ch->affected_by       = race_table[ch->race].affected;
  ch->mental_state      = 0;
  ch->hit               = UMAX( 1, ch->hit  );
  ch->mana              = UMAX( 1, ch->mana );
  ch->move              = UMAX( 1, ch->move );
  ch->armor             = 100;
  ch->stats.mod_str           = 0;
  ch->stats.mod_dex           = 0;
  ch->stats.mod_wis           = 0;
  ch->stats.mod_int           = 0;
  ch->stats.mod_con           = 0;
  ch->stats.mod_cha           = 0;
  ch->stats.mod_lck           = 0;
  ch->damroll           = 0;
  ch->hitroll           = 0;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  ch->saving.breath     = 0;
  ch->saving.wand       = 0;
  ch->saving.para_petri = 0;
  ch->saving.spell_staff = 0;
  ch->saving.poison_death = 0;

  ch->carry_weight      = 0;
  ch->carry_number      = 0;

  for ( aff = ch->first_affect; aff; aff = aff->next )
    affect_modify( ch, aff, TRUE );

  for ( x = 0; x < ncarry; x++ )
    obj_to_char( carry[x], ch );

  re_equip_char( ch );
}

/*
 * Improve mental state                                         -Thoric
 */
void better_mental_state( Character *ch, int mod )
{
  int c = URANGE( 0, abs(mod), 20 );
  int con = get_curr_con(ch);

  c += number_percent() < con ? 1 : 0;

  if ( ch->mental_state < 0 )
    ch->mental_state = URANGE( -100, ch->mental_state + c, 0 );
  else
    if ( ch->mental_state > 0 )
      ch->mental_state = URANGE( 0, ch->mental_state - c, 100 );
}

/*
 * Deteriorate mental state                                     -Thoric
 */
void worsen_mental_state( Character *ch, int mod )
{
  int c   = URANGE( 0, abs(mod), 20 );
  int con = get_curr_con(ch);

  c -= number_percent() < con ? 1 : 0;

  if ( c < 1 )
    return;

  if ( is_droid(ch) )
    return;

  if ( ch->mental_state < 0 )
    ch->mental_state = URANGE( -100, ch->mental_state - c, 100 );
  else if ( ch->mental_state > 0 )
    ch->mental_state = URANGE( -100, ch->mental_state + c, 100 );
  else
    ch->mental_state -= c;
}

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int can_carry_n( const Character *ch )
{
  int penalty = 0;

  if ( !is_npc(ch) && get_trust(ch) >= LEVEL_IMMORTAL )
    return get_trust(ch)*200;

  if ( is_npc(ch) && IS_SET(ch->act, ACT_PET) )
    return 0;

  if ( get_eq_char(ch, WEAR_WIELD) )
    ++penalty;

  if ( get_eq_char(ch, WEAR_DUAL_WIELD) )
    ++penalty;

  if ( get_eq_char(ch, WEAR_MISSILE_WIELD) )
    ++penalty;

  if ( get_eq_char(ch, WEAR_HOLD) )
    ++penalty;

  if ( get_eq_char(ch, WEAR_SHIELD) )
    ++penalty;

  return URANGE(5, (ch->top_level+15)/5 + get_curr_dex(ch)-13 - penalty, 20);
}

/*
 * Retrieve a character's carry capacity.
 */
int can_carry_w( const Character *ch )
{
  if ( !is_npc(ch) && get_trust(ch) >= LEVEL_IMMORTAL )
    return 1000000;

  if ( is_npc(ch) && IS_SET(ch->act, ACT_PET) )
    return 0;

  return str_app[get_curr_str(ch)].carry;
}

bool is_npc( const Character *ch )
{
  return IS_SET( ch->act, ACT_is_npc ) || !ch->pcdata;
}

bool is_immortal( const Character *ch )
{
  return get_trust( ch ) >= LEVEL_IMMORTAL;
}

bool is_god( const Character *ch )
{
  return get_trust( ch ) >= LEVEL_GOD;
}

bool is_hero( const Character *ch )
{
  return get_trust( ch ) >= LEVEL_HERO;
}

bool is_good( const Character *ch )
{
  return ch->alignment >= 350;
}

bool is_evil( const Character *ch )
{
  return ch->alignment <= -350;
}

bool is_neutral( const Character *ch )
{
  return !is_good( ch ) && !is_evil( ch );
}

bool is_evil_mob_index_data( const ProtoMobile *mob )
{
  return mob->alignment <= -350;
}

bool is_awake( const Character *ch )
{
  return ch->position > POS_SLEEPING;
}

int get_armor_class( const Character *ch )
{
  int dexterity_modifier = is_awake( ch ) ? dex_app[get_curr_dex(ch)].defensive : 0;
  int combat_level_modifier = ch->race == RACE_DEFEL ? get_level( ch, COMBAT_ABILITY ) * 2 + 5 : get_level( ch, COMBAT_ABILITY ) / 2;

  return ch->armor + dexterity_modifier - combat_level_modifier;
}

int get_hitroll( const Character *ch )
{
  int base_hitroll = ch->hitroll;
  int strength_modifier = str_app[get_curr_str( ch )].tohit;
  int mental_state_modifier = 2 - ( abs( ch->mental_state ) / 10 );

  return base_hitroll + strength_modifier + mental_state_modifier;
}

int get_damroll( const Character *ch )
{
  int base_damroll = ch->damroll;
  int strength_modifier = str_app[get_curr_str(ch)].todam;
  int mental_state_modifier = ch->mental_state > 5 && ch->mental_state < 15 ? 1 : 0;

  return base_damroll + strength_modifier + mental_state_modifier;
}

bool is_drunk( const Character *ch )
{
  return number_percent() < ch->pcdata->condition[COND_DRUNK];
}

bool is_retired_immortal( const Character *ch )
{
  return !is_npc( ch ) && IS_SET( ch->pcdata->flags, PCFLAG_RETIRED );
}

bool is_not_authed( const Character *ch )
{
  return !is_npc( ch )
    && ch->pcdata->auth_state <= 3
    && IS_SET( ch->pcdata->flags, PCFLAG_UNAUTHED);
}

bool is_waiting_for_auth( const Character *ch )
{
  return !is_npc( ch )
    && ch->desc
    && ch->pcdata->auth_state == 1
    && IS_SET(ch->pcdata->flags, PCFLAG_UNAUTHED);
}

#define DISGUISE(ch)            ((!nifty_is_name((ch)->name, (ch)->pcdata->title)) ? 1 : 0)

char *PERS( const Character *ch, const Character *looker )
{
  return can_see( looker, ch ) ? ( is_npc(ch) ? ch->short_descr : ((get_trust(looker) <= LEVEL_IMMORTAL) ? (DISGUISE(ch) ? ch->pcdata->title : ch->name ) : ch->name)) : ( is_immortal(ch) ? "A Great One" : "someone" );
}

bool is_clanned( const Character *ch )
{
  return !is_npc( ch ) && ch->pcdata->clan;
}

void set_wait_state( Character *ch, short number_of_pulses )
{
  ch->wait = UMAX( ch->wait, number_of_pulses );
}

bool is_jedi( const Character *ch )
{
  return get_level( ch, FORCE_ABILITY ) > 1;
}
