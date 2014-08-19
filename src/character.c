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

#include <string.h>
#include "character.h"
#include "mud.h"

bool IsWizVis( const Character *ch, const Character *victim )
{
  if ( !IsNpc(victim)
       && IsBitSet(victim->act, PLR_WIZINVIS)
       && GetTrustLevel( ch ) < victim->pcdata->wizinvis )
    return false;

  return true;
}

/*
 * Return how much exp a char has for a specified ability.
 */
long GetExperience( const Character *ch, short ability )
{
  if ( ability >= MAX_ABILITY || ability < 0 )
    return 0;

  return ch->ability.experience[ability];
}

void SetExperience( Character *ch, short ability, long xp )
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
int GetExperienceWorth( const Character *ch )
{
  int xp = 0;

  xp = GetAbilityLevel( ch, COMBAT_ABILITY ) * ch->top_level * 50;
  xp += ch->max_hit * 2;
  xp -= (ch->armor-50) * 2;
  xp += ( ch->barenumdie * ch->baresizedie + GetDamageRoll(ch) ) * 50;
  xp += GetHitRoll(ch) * ch->top_level * 10;

  if ( IsAffectedBy(ch, AFF_SANCTUARY) )
    xp += xp * 1.5;

  if ( IsAffectedBy(ch, AFF_FIRESHIELD) )
    xp += xp * 1.2;

  if ( IsAffectedBy(ch, AFF_SHOCKSHIELD) )
    xp += xp * 1.2;

  xp = urange( MIN_EXP_WORTH, xp, MAX_EXP_WORTH );

  return xp;
}

/*
 * Retrieve a character's trusted level for permission checking.
 */
short GetTrustLevel( const Character *ch )
{
  if ( !ch )
    return 0;

  if ( ch->trust != 0 )
    return ch->trust;

  if ( IsNpc(ch) && ch->top_level >= LEVEL_AVATAR )
    return LEVEL_AVATAR;

  if ( ch->top_level >= LEVEL_IMMORTAL && IsRetiredImmortal( ch ) )
    return LEVEL_IMMORTAL;

  return ch->top_level;
}

/*
 * Retrieve a character's age.
 */
short GetAge( const Character *ch )
{
  if( IsNpc(ch) )
    return 17;

  return 17 + ( ch->pcdata->played + (current_time - ch->pcdata->logon) ) / 1515800;
}

/*
 * Retrieve character's current strength.
 */
short GetCurrentStrength( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_str + ch->stats.mod_str, max );
}

/*
 * Retrieve character's current intelligence.
 */
short GetCurrentIntelligence( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_int + ch->stats.mod_int, max );
}

/*
 * Retrieve character's current wisdom.
 */
short GetCurrentWisdom( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_wis + ch->stats.mod_wis, max );
}

/*
 * Retrieve character's current dexterity.
 */
short GetCurrentDexterity( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_dex + ch->stats.mod_dex, max );
}

/*
 * Retrieve character's current constitution.
 */
short GetCurrentConstitution( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_con + ch->stats.mod_con, max );
}

/*
 * Retrieve character's current charisma.
 */
short GetCurrentCharisma( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_cha + ch->stats.mod_cha, max );
}

/*
 * Retrieve character's current luck.
 */
short GetCurrentLuck( const Character *ch )
{
  short max = 25;
  return urange( 3, ch->stats.perm_lck + ch->stats.mod_lck, max );
}

short GetCurrentForce( const Character *ch )
{
  short max = 0;

  if (!IsNpc(ch))
    {
      max = 20 + RaceTable[ch->race].stats.mod_frc;
      max = umin(max,25);
    }
  else
    {
      max  = 25;
    }

  return urange( 0 , ch->stats.perm_frc + ch->stats.mod_frc, max );
}

/*
 * Add another notch on that there belt... ;)
 * Keep track of the last so many kills by vnum                 -Thoric
 */
void AddKill( Character *ch, const Character *mob )
{
  int x;
  short vnum, track;

  if ( IsNpc(ch) )
    return;

  if ( !IsNpc(mob) )
    return;

  vnum = mob->Prototype->vnum;
  track = urange( 2, ((GetAbilityLevel( ch, COMBAT_ABILITY ) + 3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
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
  memmove( (char *) ch->pcdata->killed+sizeof(KilledData),
           ch->pcdata->killed, (track-1) * sizeof(KilledData) );
  ch->pcdata->killed[0].vnum  = vnum;
  ch->pcdata->killed[0].count = 1;
  if ( track < MAX_KILLTRACK )
    ch->pcdata->killed[track].vnum = 0;
}

/*
 * Return how many times this player has killed this mob        -Thoric
 * Only keeps track of so many (MAX_KILLTRACK), and keeps track by vnum
 */
int TimesKilled( const Character *ch, const Character *mob )
{
  int x;
  short vnum, track;

  if ( IsNpc(ch) )
    return 0;

  if ( !IsNpc(mob) )
    return 0;

  vnum = mob->Prototype->vnum;
  track = urange( 2, ((GetAbilityLevel( ch, COMBAT_ABILITY ) + 3) * MAX_KILLTRACK)/LEVEL_AVATAR, MAX_KILLTRACK );
  for ( x = 0; x < track; x++ )
    if ( ch->pcdata->killed[x].vnum == vnum )
      return ch->pcdata->killed[x].count;
    else
      if ( ch->pcdata->killed[x].vnum == 0 )
        break;
  return 0;
}

bool HasComlink( const Character *ch )
{
  Object *obj = NULL;

  if( IsImmortal( ch ) )
    {
      return true;
    }

  for( obj = ch->last_carrying; obj; obj = obj->prev_content )
    {
      if( obj->Prototype->item_type == ITEM_COMLINK )
        {
          return true;
        }
    }

  return false;
}

short GetAbilityLevel( const Character *ch, short ability )
{
  return ch->ability.level[ability];
}

void SetAbilityLevel( Character *ch, short ability, int newlevel )
{
  int maxlevel = IsImmortal( ch ) ? 200 : MAX_ABILITY_LEVEL;

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
bool IsAffected( const Character *ch, int sn )
{
  Affect *paf = NULL;

  for ( paf = ch->first_affect; paf; paf = paf->next )
    if ( paf->type == sn )
      return true;

  return false;
}

bool IsAffectedBy( const Character *ch, int affected_by_bit )
{
  return IsBitSet( ch->affected_by, affected_by_bit );
}

/*
 * Find a piece of eq on a character.
 * Will pick the top layer if clothing is layered.              -Thoric
 */
Object *GetEquipmentOnCharacter( const Character *ch, int iWear )
{
  Object *obj, *maxobj = NULL;

  for ( obj = ch->first_carrying; obj; obj = obj->next_content )
    if ( obj->wear_loc == iWear )
      {
        if ( !obj->Prototype->layers )
          return obj;
        else
          if ( !maxobj
               ||    obj->Prototype->layers > maxobj->Prototype->layers )
            maxobj = obj;
      }

  return maxobj;
}

/*
 * Equip a char with an obj.
 */
void EquipCharacter( Character *ch, Object *obj, int iWear )
{
  Affect *paf;
  Object      *otmp;

  if ( (otmp=GetEquipmentOnCharacter( ch, iWear )) != NULL
       &&   (!otmp->Prototype->layers || !obj->Prototype->layers) )
    {
      bug( "Equip_char: already equipped (%d).", iWear );
      return;
    }

  separate_obj(obj);    /* just in case */
  if ( ( IS_OBJ_STAT(obj, ITEM_ANTI_EVIL)    && IsEvil(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_GOOD)    && IsGood(ch)    )
       ||   ( IS_OBJ_STAT(obj, ITEM_ANTI_NEUTRAL) && IsNeutral(ch) ) )
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
      if ( IsBitSet(sysdata.save_flags, SV_ZAPDROP) && !char_died(ch) )
        save_char_obj( ch );
      return;
    }

  ch->armor             -= apply_ac( obj, iWear );
  obj->wear_loc  = iWear;

  ch->carry_number      -= get_obj_number( obj );
  if ( IsBitSet( obj->extra_flags, ITEM_MAGIC ) || obj->wear_loc == WEAR_FLOATING )
    ch->carry_weight  -= get_obj_weight( obj );

  for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, true );

  for ( paf = obj->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, true );

  if ( obj->item_type == ITEM_LIGHT
       && obj->value[OVAL_LIGHT_POWER] != 0
       && ch->in_room )
    ++ch->in_room->light;
}

/*
 * Unequip a char with an obj.
 */
void UnequipCharacter( Character *ch, Object *obj )
{
  Affect *paf;

  if ( obj->wear_loc == WEAR_NONE )
    {
      bug( "UnEquipCharacter: already unequipped.", 0 );
      return;
    }

  ch->carry_number      += get_obj_number( obj );
  if ( IsBitSet( obj->extra_flags, ITEM_MAGIC ) || obj->wear_loc == WEAR_FLOATING )
    ch->carry_weight  += get_obj_weight( obj );

  ch->armor             += apply_ac( obj, obj->wear_loc );
  obj->wear_loc  = -1;

  for ( paf = obj->Prototype->first_affect; paf; paf = paf->next )
    affect_modify( ch, paf, false );
  if ( obj->carried_by )
    for ( paf = obj->first_affect; paf; paf = paf->next )
      affect_modify( ch, paf, false );

  if ( !obj->carried_by )
    return;

  if ( obj->item_type == ITEM_LIGHT
       &&   obj->value[OVAL_LIGHT_POWER] != 0
       &&   ch->in_room
       &&   ch->in_room->light > 0 )
    --ch->in_room->light;
}

/*
 * Find an obj in player's inventory.
 */
Object *GetCarriedObject( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  int number = 0, count = 0;
  vnum_t vnum = INVALID_VNUM;

  number = NumberArgument( argument, arg );

  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    vnum = atoi( arg );

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc == WEAR_NONE
         &&   CanSeeObject( ch, obj )
         &&  (NiftyIsName( arg, obj->name ) || obj->Prototype->vnum == vnum) )
      if ( (count += obj->count) >= number )
        return obj;

  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc == WEAR_NONE
         &&   CanSeeObject( ch, obj )
         &&   NiftyIsNamePrefix( arg, obj->name ) )
      if ( (count += obj->count) >= number )
        return obj;

  return NULL;
}

/*
 * Find an obj in player's equipment.
 */
Object *GetWornObject( const Character *ch, const char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Object *obj = NULL;
  int number = 0, count = 0;
  vnum_t vnum = INVALID_VNUM;

  if ( !ch )
    {
      bug( "GetWornObject: null ch" );
    }

  number = NumberArgument( argument, arg );

  if ( GetTrustLevel(ch) >= LEVEL_CREATOR && IsNumber( arg ) )
    vnum = atoi( arg );

  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc != WEAR_NONE
         &&   CanSeeObject( ch, obj )
         &&  (NiftyIsName( arg, obj->name ) || obj->Prototype->vnum == vnum) )
      if ( ++count == number )
        return obj;

  if ( vnum != INVALID_VNUM )
    return NULL;

  /* If we didn't find an exact match, run through the list of objects
     again looking for prefix matching, ie swo == sword.
     Added by Narn, Sept/96
  */
  count = 0;
  for ( obj = ch->last_carrying; obj; obj = obj->prev_content )
    if ( obj->wear_loc != WEAR_NONE
         &&   CanSeeObject( ch, obj )
         &&   NiftyIsNamePrefix( arg, obj->name ) )
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
  int drunk = IsNpc(ch) ? 0 : ch->pcdata->condition[COND_DRUNK];
  const char *t = NULL;

  /*
   * we're going to be nice and let nothing weird happen unless
   * you're a tad messed up
   */
  drunk = umax( 1, drunk );

  if ( abs(ms) + (drunk/3) < 30 )
    return false;

  if ( (GetRandomPercent() + (ms < 0 ? 15 : 5))> abs(ms)/2 + drunk/4 )
    return false;

  if ( ms > 15 )        /* range 1 to 20 */
    {
      switch( GetRandomNumberFromRange( umax(1, (ms/5-15)), (ms+4) / 5 ) )
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
	  t="Whoa! It's covered in blood! Ack! Ick!\r\n";
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
	  t="You scratch yourself instead...\r\n";
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
      int sub = urange(1, abs(ms)/2 + drunk, 60);

      switch( GetRandomNumberFromRange( 1, sub/10 ) )
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

  ChPrintf( ch, t );
  return true;
}

/*
 * True if char can see victim.
 */
bool CanSeeCharacter( const Character *ch, const Character *victim )
{
  if (!victim)
    return false;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return true;

  if ( !ch )
    {
      if ( IsAffectedBy(victim, AFF_INVISIBLE)
           || IsAffectedBy(victim, AFF_HIDE)
           || IsBitSet(victim->act, PLR_WIZINVIS) )
        return false;
      else
        return true;
    }

  if ( ch == victim )
    return true;

  if ( !IsNpc(victim)
       && IsBitSet(victim->act, PLR_WIZINVIS)
       && GetTrustLevel( ch ) < victim->pcdata->wizinvis )
    return false;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return true;

  if ( victim->position == POS_FIGHTING || victim->position < POS_SLEEPING )
    return true;

  /* SB */
  if ( IsNpc(victim)
       && IsBitSet(victim->act, ACT_MOBINVIS)
       && GetTrustLevel( ch ) < victim->mobinvis )
    return false;

  if ( !IsImmortal(ch) && !IsNpc(victim) && !victim->desc
       && get_timer(victim, TIMER_RECENTFIGHT) > 0
       && (!victim->switched || !IsAffectedBy(victim->switched, AFF_POSSESS)) )
    return false;

  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_HOLYLIGHT) )
    return true;

  /* The miracle cure for blindness? -- Altrag */
  if ( !IsAffectedBy(ch, AFF_TRUESIGHT) )
    {
      if ( IsAffectedBy(ch, AFF_BLIND) )
        return false;

      if ( room_is_dark( ch->in_room ) && !IsAffectedBy(ch, AFF_INFRARED) )
        return false;

      if ( IsAffectedBy(victim, AFF_HIDE)
           && !IsAffectedBy(ch, AFF_DETECT_HIDDEN)
           && !victim->fighting )
        {
          if ( ch->race == RACE_DEFEL && victim->race == RACE_DEFEL )
            return true;

          return false;
        }


      if ( IsAffectedBy(victim, AFF_INVISIBLE)
           &&  !IsAffectedBy(ch, AFF_DETECT_INVIS) )
        return false;
    }

  return true;
}

/*
 * True if char can see obj.
 */
bool CanSeeObject( const Character *ch, const Object *obj )
{
  if ( !IsNpc(ch) && IsBitSet(ch->act, PLR_HOLYLIGHT) )
    return true;

  if ( IS_OBJ_STAT( obj, ITEM_BURRIED ) )
    return false;

  if ( IsAffectedBy( ch, AFF_TRUESIGHT ) )
    return true;

  if ( IsAffectedBy( ch, AFF_BLIND ) )
    return false;

  if ( IS_OBJ_STAT(obj, ITEM_HIDDEN) )
    return false;

  if ( obj->item_type == ITEM_LIGHT && obj->value[OVAL_LIGHT_POWER] != 0 )
    return true;

  if ( room_is_dark( ch->in_room ) && !IsAffectedBy(ch, AFF_INFRARED) )
    return false;

  if ( IS_OBJ_STAT(obj, ITEM_INVIS) && !IsAffectedBy(ch, AFF_DETECT_INVIS) )
    return false;

  return true;
}

/*
 * True if char can drop obj.
 */
bool CanDropObject( const Character *ch, const Object *obj )
{
  if ( !IS_OBJ_STAT(obj, ITEM_NODROP) )
    return true;

  if ( !IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL )
    return true;

  if ( IsNpc(ch) && ch->Prototype->vnum == 3 )
    return true;

  return false;
}

/*
 * "Fix" a character's stats                                    -Thoric
 */
void FixCharacterStats( Character *ch )
{
  Affect *aff = NULL;
  Object *carry[MAX_LEVEL*200];
  Object *obj = NULL;
  int x = 0;
  int ncarry = 0;

  de_EquipCharacter( ch );

  while ( (obj=ch->first_carrying) != NULL )
    {
      carry[ncarry++]  = obj;
      obj_from_char( obj );
    }

  for ( aff = ch->first_affect; aff; aff = aff->next )
    {
      affect_modify( ch, aff, false );
    }

  ch->affected_by          = RaceTable[ch->race].affected;
  ch->mental_state         = 0;
  ch->hit                  = umax( 1, ch->hit  );
  ch->mana                 = umax( 1, ch->mana );
  ch->move                 = umax( 1, ch->move );
  ch->armor                = 100;
  ch->stats.mod_str        = 0;
  ch->stats.mod_dex        = 0;
  ch->stats.mod_wis        = 0;
  ch->stats.mod_int        = 0;
  ch->stats.mod_con        = 0;
  ch->stats.mod_cha        = 0;
  ch->stats.mod_lck        = 0;
  ch->damroll              = 0;
  ch->hitroll              = 0;
  ch->alignment = urange( -1000, ch->alignment, 1000 );
  ch->saving.breath        = 0;
  ch->saving.wand          = 0;
  ch->saving.para_petri    = 0;
  ch->saving.spell_staff   = 0;
  ch->saving.poison_death  = 0;

  ch->carry_weight         = 0;
  ch->carry_number         = 0;

  for ( aff = ch->first_affect; aff; aff = aff->next )
    affect_modify( ch, aff, true );

  for ( x = 0; x < ncarry; x++ )
    obj_to_char( carry[x], ch );

  re_EquipCharacter( ch );
}

/*
 * Improve mental state                                         -Thoric
 */
void ImproveMentalState( Character *ch, int mod )
{
  int c = urange( 0, abs(mod), 20 );
  int con = GetCurrentConstitution(ch);

  c += GetRandomPercent() < con ? 1 : 0;

  if ( ch->mental_state < 0 )
    ch->mental_state = urange( -100, ch->mental_state + c, 0 );
  else
    if ( ch->mental_state > 0 )
      ch->mental_state = urange( 0, ch->mental_state - c, 100 );
}

/*
 * Deteriorate mental state                                     -Thoric
 */
void WorsenMentalState( Character *ch, int mod )
{
  int c   = urange( 0, abs(mod), 20 );
  int con = GetCurrentConstitution(ch);

  c -= GetRandomPercent() < con ? 1 : 0;

  if ( c < 1 )
    return;

  if ( IsDroid(ch) )
    return;

  if ( ch->mental_state < 0 )
    ch->mental_state = urange( -100, ch->mental_state - c, 100 );
  else if ( ch->mental_state > 0 )
    ch->mental_state = urange( -100, ch->mental_state + c, 100 );
  else
    ch->mental_state -= c;
}

/*
 * Retrieve a character's carry capacity.
 * Vastly reduced (finally) due to containers           -Thoric
 */
int GetCarryCapacityNumber( const Character *ch )
{
  int penalty = 0;

  if ( !IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL )
    return GetTrustLevel(ch)*200;

  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_PET) )
    return 0;

  if ( GetEquipmentOnCharacter(ch, WEAR_WIELD) )
    ++penalty;

  if ( GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD) )
    ++penalty;

  if ( GetEquipmentOnCharacter(ch, WEAR_MISSILE_WIELD) )
    ++penalty;

  if ( GetEquipmentOnCharacter(ch, WEAR_HOLD) )
    ++penalty;

  if ( GetEquipmentOnCharacter(ch, WEAR_SHIELD) )
    ++penalty;

  return urange(5, (ch->top_level+15)/5 + GetCurrentDexterity(ch)-13 - penalty, 20);
}

/*
 * Retrieve a character's carry capacity.
 */
int GetCarryCapacityWeight( const Character *ch )
{
  if ( !IsNpc(ch) && GetTrustLevel(ch) >= LEVEL_IMMORTAL )
    return 1000000;

  if ( IsNpc(ch) && IsBitSet(ch->act, ACT_PET) )
    return 0;

  return str_app[GetCurrentStrength(ch)].carry;
}

bool IsNpc( const Character *ch )
{
  return IsBitSet( ch->act, ACT_IsNpc ) || !ch->pcdata;
}

bool IsImmortal( const Character *ch )
{
  return GetTrustLevel( ch ) >= LEVEL_IMMORTAL;
}

bool IsGreater( const Character *ch )
{
  return GetTrustLevel( ch ) >= LEVEL_GREATER;
}

bool IsAvatar( const Character *ch )
{
  return GetTrustLevel( ch ) >= LEVEL_AVATAR;
}

bool IsGood( const Character *ch )
{
  return ch->alignment >= 350;
}

bool IsEvil( const Character *ch )
{
  return ch->alignment <= -350;
}

bool IsNeutral( const Character *ch )
{
  return !IsGood( ch ) && !IsEvil( ch );
}

bool IsAwake( const Character *ch )
{
  return ch->position > POS_SLEEPING;
}

int GetArmorClass( const Character *ch )
{
  int dexterity_modifier = IsAwake( ch ) ? dex_app[GetCurrentDexterity(ch)].defensive : 0;
  int combat_level_modifier = ch->race == RACE_DEFEL ? GetAbilityLevel( ch, COMBAT_ABILITY ) * 2 + 5 : GetAbilityLevel( ch, COMBAT_ABILITY ) / 2;

  return ch->armor + dexterity_modifier - combat_level_modifier;
}

int GetHitRoll( const Character *ch )
{
  int base_hitroll = ch->hitroll;
  int strength_modifier = str_app[GetCurrentStrength( ch )].tohit;
  int mental_state_modifier = 2 - ( abs( ch->mental_state ) / 10 );

  return base_hitroll + strength_modifier + mental_state_modifier;
}

int GetDamageRoll( const Character *ch )
{
  int base_damroll = ch->damroll;
  int strength_modifier = str_app[GetCurrentStrength(ch)].todam;
  int mental_state_modifier = ch->mental_state > 5 && ch->mental_state < 15 ? 1 : 0;

  return base_damroll + strength_modifier + mental_state_modifier;
}

bool IsDrunk( const Character *ch )
{
  return GetRandomPercent() < ch->pcdata->condition[COND_DRUNK];
}

bool IsRetiredImmortal( const Character *ch )
{
  return !IsNpc( ch ) && IsBitSet( ch->pcdata->flags, PCFLAG_RETIRED );
}

bool IsAuthed( const Character *ch )
{
  if( IsNpc( ch ) )
    {
      return true;
    }

  return !IsBitSet( ch->pcdata->flags, PCFLAG_UNAUTHED);
}

bool IsWaitingForAuth( const Character *ch )
{
  return !IsNpc( ch )
    && ch->desc
    && ch->pcdata->auth_state == 1
    && IsBitSet(ch->pcdata->flags, PCFLAG_UNAUTHED);
}

#define DISGUISE(ch)            ((!NiftyIsName((ch)->name, (ch)->pcdata->title)) ? 1 : 0)

const char *PERS( const Character *ch, const Character *looker )
{
  return CanSeeCharacter( looker, ch ) ? ( IsNpc(ch) ? ch->short_descr : ((GetTrustLevel(looker) <= LEVEL_IMMORTAL) ? (DISGUISE(ch) ? ch->pcdata->title : ch->name ) : ch->name)) : ( IsImmortal(ch) ? "A Great One" : "someone" );
}

bool IsClanned( const Character *ch )
{
  return !IsNpc( ch ) && ch->pcdata->clan;
}

void SetWaitState( Character *ch, short number_of_pulses )
{
  ch->wait = umax( ch->wait, number_of_pulses );
}

bool IsJedi( const Character *ch )
{
  return GetAbilityLevel( ch, FORCE_ABILITY ) > 1;
}
