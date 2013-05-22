#include <string.h>
#include "character.h"
#include "mud.h"

bool is_wizvis( const CHAR_DATA *ch, const CHAR_DATA *victim )
{
  if ( !IS_NPC(victim)
       && IS_SET(victim->act, PLR_WIZINVIS)
       && get_trust( ch ) < victim->pcdata->wizinvis )
    return FALSE;

  return TRUE;
}

/*
 * Return how much exp a char has for a specified ability.
 */
long get_exp( const CHAR_DATA *ch, short ability )
{
  if ( ability >= MAX_ABILITY || ability < 0 )
    return 0;

  return ch->experience[ability];
}

void set_exp( CHAR_DATA *ch, short ability, long xp )
{
  if ( ability >= MAX_ABILITY || ability < 0 )
    {
      bug("%s: ability out of range: %d", __FUNCTION__, ability );
      return;
    }

  if( xp < 0 )
    {
      bug( "%s: negative value %d invalid", xp );
      return;
    }

  ch->experience[ability] = xp;
}

/*
 * Calculate roughly how much experience a character is worth
 */
int get_exp_worth( const CHAR_DATA *ch )
{
  int xp = 0;

  xp = get_level( ch, COMBAT_ABILITY ) * ch->top_level * 50;
  xp += ch->max_hit * 2;
  xp -= (ch->armor-50) * 2;
  xp += ( ch->barenumdie * ch->baresizedie + GET_DAMROLL(ch) ) * 50;
  xp += GET_HITROLL(ch) * ch->top_level * 10;

  if ( IS_AFFECTED(ch, AFF_SANCTUARY) )
    xp += xp * 1.5;

  if ( IS_AFFECTED(ch, AFF_FIRESHIELD) )
    xp += xp * 1.2;

  if ( IS_AFFECTED(ch, AFF_SHOCKSHIELD) )
    xp += xp * 1.2;

  xp = URANGE( MIN_EXP_WORTH, xp, MAX_EXP_WORTH );

  return xp;
}

/*
 * Retrieve a character's trusted level for permission checking.
 */
short get_trust( const CHAR_DATA *ch )
{
  if ( !ch )
    return 0;

  if ( ch->trust != 0 )
    return ch->trust;

  if ( IS_NPC(ch) && ch->top_level >= LEVEL_AVATAR )
    return LEVEL_AVATAR;

  if ( ch->top_level >= LEVEL_NEOPHYTE && IS_RETIRED( ch ) )
    return LEVEL_NEOPHYTE;

  return ch->top_level;
}

/*
 * Retrieve a character's age.
 */
short get_age( const CHAR_DATA *ch )
{
  if( IS_NPC(ch) )
    return 17;

  return 17 + ( ch->pcdata->played + (current_time - ch->pcdata->logon) ) / 1515800;
}

/*
 * Retrieve character's current strength.
 */
short get_curr_str( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_str + ch->mod_str, max );
}

/*
 * Retrieve character's current intelligence.
 */
short get_curr_int( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_int + ch->mod_int, max );
}

/*
 * Retrieve character's current wisdom.
 */
short get_curr_wis( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_wis + ch->mod_wis, max );
}

/*
 * Retrieve character's current dexterity.
 */
short get_curr_dex( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_dex + ch->mod_dex, max );
}

/*
 * Retrieve character's current constitution.
 */
short get_curr_con( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_con + ch->mod_con, max );
}

/*
 * Retrieve character's current charisma.
 */
short get_curr_cha( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_cha + ch->mod_cha, max );
}

/*
 * Retrieve character's current luck.
 */
short get_curr_lck( const CHAR_DATA *ch )
{
  short max = 25;
  return URANGE( 3, ch->perm_lck + ch->mod_lck, max );
}

short get_curr_frc( const CHAR_DATA *ch )
{
  short max = 0;

  if (!IS_NPC(ch))
    {
      max = 20 + race_table[ch->race].frc_plus;
      max = UMIN(max,25);
    }
  else
    {
      max  = 25;
    }

  return URANGE( 0 , ch->perm_frc + ch->mod_frc, max );
}

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void add_kill( CHAR_DATA *ch, const CHAR_DATA *mob )
{
  int x;
  short vnum, track;

  if ( IS_NPC(ch) )
    return;

  if ( !IS_NPC(mob) )
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
int times_killed( const CHAR_DATA *ch, const CHAR_DATA *mob )
{
  int x;
  short vnum, track;

  if ( IS_NPC(ch) )
    return 0;

  if ( !IS_NPC(mob) )
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

bool has_comlink( const CHAR_DATA *ch )
{
  OBJ_DATA *obj = NULL;

  if( IS_IMMORTAL( ch ) )
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

short get_level( const CHAR_DATA *ch, short ability )
{
  return ch->ability_level[ability];
}

void set_level( CHAR_DATA *ch, short ability, int newlevel )
{
  if( newlevel >= 0 && newlevel <= MAX_ABILITY_LEVEL )
    ch->ability_level[ability] = newlevel;
  else
    bug("%s: level out of range: %d", newlevel);
}

/*
 * Return true if a char is affected by a spell.
 */
bool is_affected( const CHAR_DATA *ch, int sn )
{
  AFFECT_DATA *paf = NULL;

  for ( paf = ch->first_affect; paf; paf = paf->next )
    if ( paf->type == sn )
      return TRUE;

  return FALSE;
}

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
OBJ_DATA *get_eq_char( const CHAR_DATA *ch, int iWear )
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
void equip_char( CHAR_DATA *ch, OBJ_DATA *obj, int iWear )
{
  AFFECT_DATA *paf;
  OBJ_DATA      *otmp;

  if ( (otmp=get_eq_char( ch, iWear )) != NULL
       &&   (!otmp->pIndexData->layers || !obj->pIndexData->layers) )
    {
      bug( "Equip_char: already equipped (%d).", iWear );
      return;
    }

  separate_obj(obj);    /* just in case */
  if ( ( IS_OBJ_STAT(obj, ITEM_ANTI_EVIL)    && IS_EVIL(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_GOOD)    && IS_GOOD(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_NEUTRAL) && IS_NEUTRAL(ch) ) )
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
void unequip_char( CHAR_DATA *ch, OBJ_DATA *obj )
{
  AFFECT_DATA *paf;

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
OBJ_DATA *get_obj_carry( const CHAR_DATA *ch, const char *argument )
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
OBJ_DATA *get_obj_wear( const CHAR_DATA *ch, const char *argument )
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
bool ms_find_obj( const CHAR_DATA *ch )
{
  int ms = ch->mental_state;
  int drunk = IS_NPC(ch) ? 0 : ch->pcdata->condition[COND_DRUNK];
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
bool can_see( const CHAR_DATA *ch, const CHAR_DATA *victim )
{
  if (!victim)
    return FALSE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  if ( !ch )
    {
      if ( IS_AFFECTED(victim, AFF_INVISIBLE)
           || IS_AFFECTED(victim, AFF_HIDE)
           || IS_SET(victim->act, PLR_WIZINVIS) )
        return FALSE;
      else
        return TRUE;
    }

  if ( ch == victim )
    return TRUE;

  if ( !IS_NPC(victim)
       && IS_SET(victim->act, PLR_WIZINVIS)
       && get_trust( ch ) < victim->pcdata->wizinvis )
    return FALSE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return TRUE;

  /* SB */
  if ( IS_NPC(victim)
       && IS_SET(victim->act, ACT_MOBINVIS)
       && get_trust( ch ) < victim->mobinvis )
    return FALSE;

  if ( !IS_IMMORTAL(ch) && !IS_NPC(victim) && !victim->desc
       && get_timer(victim, TIMER_RECENTFIGHT) > 0
       && (!victim->switched || !IS_AFFECTED(victim->switched, AFF_POSSESS)) )
    return FALSE;

  if ( !IS_NPC(ch) && IS_SET(ch->act, PLR_HOLYLIGHT) )
    return TRUE;

  /* The miracle cure for blindness? -- Altrag */
  if ( !IS_AFFECTED(ch, AFF_TRUESIGHT) )
    {
      if ( IS_AFFECTED(ch, AFF_BLIND) )
        return FALSE;

      if ( room_is_dark( ch->in_room ) && !IS_AFFECTED(ch, AFF_INFRARED) )
        return FALSE;

      if ( IS_AFFECTED(victim, AFF_HIDE)
           && !IS_AFFECTED(ch, AFF_DETECT_HIDDEN)
           && !victim->fighting )
        {
          if ( ch->race == RACE_DEFEL && victim->race == RACE_DEFEL )
            return TRUE;

          return FALSE;
        }


      if ( IS_AFFECTED(victim, AFF_INVISIBLE)
           &&  !IS_AFFECTED(ch, AFF_DETECT_INVIS) )
        return FALSE;
    }

  return TRUE;
}

/*
 * True if char can see obj.
 */
bool can_see_obj( const CHAR_DATA *ch, const OBJ_DATA *obj )
{
  if ( !IS_NPC(ch) && IS_SET(ch->act, PLR_HOLYLIGHT) )
    return TRUE;

  if ( IS_OBJ_STAT( obj, ITEM_BURRIED ) )
    return FALSE;

  if ( IS_AFFECTED( ch, AFF_TRUESIGHT ) )
    return TRUE;

  if ( IS_AFFECTED( ch, AFF_BLIND ) )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_HIDDEN) )
    return FALSE;

  if ( obj->item_type == ITEM_LIGHT && obj->value[2] != 0 )
    return TRUE;

  if ( room_is_dark( ch->in_room ) && !IS_AFFECTED(ch, AFF_INFRARED) )
    return FALSE;

  if ( IS_OBJ_STAT(obj, ITEM_INVIS) && !IS_AFFECTED(ch, AFF_DETECT_INVIS) )
    return FALSE;

  return TRUE;
}

/*
 * True if char can drop obj.
 */
bool can_drop_obj( const CHAR_DATA *ch, const OBJ_DATA *obj )
{
  if ( !IS_OBJ_STAT(obj, ITEM_NODROP) )
    return TRUE;

  if ( !IS_NPC(ch) && get_trust(ch) >= LEVEL_IMMORTAL )
    return TRUE;

  if ( IS_NPC(ch) && ch->pIndexData->vnum == 3 )
    return TRUE;

  return FALSE;
}

/*
 * "Fix" a character's stats                                    -Thoric
 */
void fix_char( CHAR_DATA *ch )
{
  AFFECT_DATA *aff;
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
  ch->mod_str           = 0;
  ch->mod_dex           = 0;
  ch->mod_wis           = 0;
  ch->mod_int           = 0;
  ch->mod_con           = 0;
  ch->mod_cha           = 0;
  ch->mod_lck           = 0;
  ch->damroll           = 0;
  ch->hitroll           = 0;
  ch->alignment = URANGE( -1000, ch->alignment, 1000 );
  ch->saving_breath     = 0;
  ch->saving_wand       = 0;
  ch->saving_para_petri = 0;
  ch->saving_spell_staff = 0;
  ch->saving_poison_death = 0;

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
void better_mental_state( CHAR_DATA *ch, int mod )
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
void worsen_mental_state( CHAR_DATA *ch, int mod )
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
