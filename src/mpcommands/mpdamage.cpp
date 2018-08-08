#include <cassert>
#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"

static ch_ret simple_damage( Character *ch, Character *victim, int dam, int dt );

/*
 * syntax: mpdamage (character) (#hps)
 */
void do_mp_damage( Character *ch, char *argument )
{
  char arg1[ MAX_INPUT_LENGTH ];
  char arg2[ MAX_INPUT_LENGTH ];
  Character *victim;
  int dam;

  if ( IsAffectedBy( ch, AFF_CHARM ) )
    return;

  if ( !IsNpc( ch ) || ( ch->Desc && GetTrustLevel( ch ) < LEVEL_IMMORTAL )  )
    {
      ch->Echo("Huh?\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );
  argument = OneArgument( argument, arg2 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("mpdamage whom?\r\n");
      ProgBug( "Mpdamage: invalid argument1", ch );
      return;
    }

  if ( IsNullOrEmpty( arg2 ) )
    {
      ch->Echo("mpdamage inflict how many hps?\r\n");
      ProgBug( "Mpdamage: invalid argument2", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoomMudProg( ch, arg1 ) ) == NULL )
    {
      ch->Echo("Victim must be in room.\r\n");
      ProgBug( "Mpdamage: victim not in room", ch );
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("You can't mpdamage yourself.\r\n");
      ProgBug( "Mpdamage: trying to damage self", ch );
      return;
    }

  dam = atoi(arg2);

  if( dam < 0 || dam > SHRT_MAX )
    {
      ch->Echo("Mpdamage how much?\r\n");
      ProgBug( "Mpdamage: invalid (nonexistent?) argument", ch );
      return;
    }

  /* this is kinda begging for trouble        */
  /*
   * Note from Thoric to whoever put this in...
   * Wouldn't it be better to call InflictDamage(ch, ch, dam, dt)?
   * I hate redundant code
   */
  if ( simple_damage(ch, victim, dam, TYPE_UNDEFINED ) == rVICT_DIED )
    {
      StopFighting( ch, false );
      StopHating( ch );
      StopFearing( ch );
      StopHunting( ch );
    }
}

/*
 * Inflict damage from a mudprogram
 *
 *  note: should be careful about using victim afterwards
 */
static ch_ret simple_damage( Character *ch, Character *victim, int dam, int dt )
{
  bool npcvict;
  Object *damobj;

  assert(ch != nullptr);
  assert(victim != nullptr);

  if ( victim->Position == POS_DEAD )
    {
      return rVICT_DIED;
    }

  npcvict = IsNpc(victim);

  if ( dam )
    {
      if ( IS_FIRE(dt) )
        dam = ModifyDamageBasedOnResistance(victim, dam, RIS_FIRE);
      else
        if ( IS_COLD(dt) )
          dam = ModifyDamageBasedOnResistance(victim, dam, RIS_COLD);
        else
          if ( IS_ACID(dt) )
            dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ACID);
          else
            if ( IS_ELECTRICITY(dt) )
              dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ELECTRICITY);
            else
              if ( IS_ENERGY(dt) )
                dam = ModifyDamageBasedOnResistance(victim, dam, RIS_ENERGY);
              else
                if ( dt == gsn_poison )
                  dam = ModifyDamageBasedOnResistance(victim, dam, RIS_POISON);
                else
                  if ( dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8) )
                    dam = ModifyDamageBasedOnResistance(victim, dam, RIS_BLUNT);
                  else
                    if ( dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11) )
                      dam = ModifyDamageBasedOnResistance(victim, dam, RIS_PIERCE);
                    else
                      if ( dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3) )
                        dam = ModifyDamageBasedOnResistance(victim, dam, RIS_SLASH);
      if ( dam < 0 )
        dam = 0;
    }

  if ( victim != ch )
    {
      /*
       * Damage modifiers.
       */
      if ( IsAffectedBy(victim, AFF_SANCTUARY) )
        dam /= 2;

      if ( IsAffectedBy(victim, AFF_PROTECT) && IsEvil(ch) )
        dam -= (int) (dam / 4);

      if ( dam < 0 )
        dam = 0;

      /* dam_message( ch, victim, dam, dt ); */
    }

  /*
   * Check for EQ damage.... ;)
   */

  if (dam > 10)
    {
      /* get a random body eq part */
      WearLocation dameq  = (WearLocation)GetRandomNumberFromRange(WEAR_LIGHT, WEAR_EYES);
      damobj = GetEquipmentOnCharacter(victim, dameq);
      if ( damobj )
        {
          if ( dam > GetObjectResistance(damobj) )
            {
              SetCurrentGlobalObject(damobj);
              DamageObject(damobj);
            }
        }
    }

  /*
   * Hurt the victim.
   * Inform the victim of his new state.
   */
  victim->Hit -= dam;
  if ( !IsNpc(victim)
       &&   GetTrustLevel(victim) >= LEVEL_IMMORTAL
       &&   victim->Hit < 1 )
    victim->Hit = 1;

  if ( !npcvict
       &&   GetTrustLevel(victim) >= LEVEL_IMMORTAL
       &&        GetTrustLevel(ch)     >= LEVEL_IMMORTAL
       &&   victim->Hit < 1 )
    victim->Hit = 1;
  UpdatePosition( victim );

  switch( victim->Position )
    {
    case POS_MORTAL:
      Act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      Act( AT_DANGER, "You are mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_CHAR );
      break;

    case POS_INCAP:
      Act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      Act( AT_DANGER, "You are incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_CHAR );
      break;

    case POS_STUNNED:
      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          Act( AT_ACTION, "$n is stunned, but will probably recover.",
               victim, NULL, NULL, TO_ROOM );
          Act( AT_HURT, "You are stunned, but will probably recover.",
               victim, NULL, NULL, TO_CHAR );
        }
      break;

    case POS_DEAD:
      Act( AT_DEAD, "$n is DEAD!!", victim, 0, 0, TO_ROOM );
      Act( AT_DEAD, "You have been KILLED!!\r\n", victim, 0, 0, TO_CHAR );
      break;

    default:
      if ( dam > victim->MaxHit / 4 )
        Act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );
      if ( victim->Hit < victim->MaxHit / 4 )
        Act( AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
             victim, 0, 0, TO_CHAR );
      break;
    }

  /*
   * Payoff for killing things.
   */
  if ( victim->Position == POS_DEAD )
    {
      if ( !npcvict )
        {
          sprintf( log_buf, "%s killed by %s at %ld",
                   victim->Name,
                   (IsNpc(ch) ? ch->ShortDescr : ch->Name),
		   victim->InRoom->Vnum );
          Log->Info( log_buf );
          ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );


        }
      SetCurrentGlobalCharacter(victim);
      RawKill( ch, victim );
      victim = NULL;

      return rVICT_DIED;
    }

  if ( victim == ch )
    return rNONE;

  /*
   * Take care of link dead people.
   */
  if ( !npcvict && !victim->Desc )
    {
      if ( GetRandomNumberFromRange( 0, victim->Wait ) == 0 )
        {
          do_recall( victim, "" );
          return rNONE;
        }
    }

  /*
   * Wimp out?
   */
  if ( npcvict && dam > 0 )
    {
      if ( ( IsBitSet(victim->Flags, ACT_WIMPY) && NumberBits( 1 ) == 0
             &&   victim->Hit < victim->MaxHit / 2 )
           ||   ( IsAffectedBy(victim, AFF_CHARM) && victim->Master
                  &&     victim->Master->InRoom != victim->InRoom ) )
        {
          StartFearing( victim, ch );
          StopHunting( victim );
          do_flee( victim, "" );
        }
    }

  if ( !npcvict
       &&   victim->Hit > 0
       &&   victim->Hit <= victim->Wimpy
       &&   victim->Wait == 0 )
    do_flee( victim, "" );
  else
    if ( !npcvict && IsBitSet( victim->Flags, PLR_FLEE ) )
      do_flee( victim, "" );

  return rNONE;
}

