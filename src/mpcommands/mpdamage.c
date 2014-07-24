#include "character.h"
#include "mud.h"

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

  if ( is_affected_by( ch, AFF_CHARM ) )
    return;

  if ( !is_npc( ch ) || ( ch->desc && get_trust( ch ) < LEVEL_IMMORTAL )  )
    {
      send_to_char( "Huh?\r\n", ch );
      return;
    }
  argument = one_argument( argument, arg1 );
  argument = one_argument( argument, arg2 );

  if ( arg1[0] == '\0' )
    {
      send_to_char( "mpdamage whom?\r\n", ch );
      progbug( "Mpdamage: invalid argument1", ch );
      return;
    }

  if ( arg2[0] == '\0' )
    {
      send_to_char( "mpdamage inflict how many hps?\r\n", ch );
      progbug( "Mpdamage: invalid argument2", ch );
      return;
    }

  if ( ( victim = get_char_room_mp( ch, arg1 ) ) == NULL )
    {
      send_to_char( "Victim must be in room.\r\n", ch );
      progbug( "Mpdamage: victim not in room", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "You can't mpdamage yourself.\r\n", ch );
      progbug( "Mpdamage: trying to damage self", ch );
      return;
    }

  dam = atoi(arg2);

  if( (dam<0) || (dam>32000) )
    {
      send_to_char( "Mpdamage how much?\r\n", ch );
      progbug( "Mpdamage: invalid (nonexistent?) argument", ch );
      return;
    }

  /* this is kinda begging for trouble        */
  /*
   * Note from Thoric to whoever put this in...
   * Wouldn't it be better to call damage(ch, ch, dam, dt)?
   * I hate redundant code
   */
  if ( simple_damage(ch, victim, dam, TYPE_UNDEFINED ) == rVICT_DIED )
    {
      stop_fighting( ch, FALSE );
      stop_hating( ch );
      stop_fearing( ch );
      stop_hunting( ch );
    }
}

/*
 * Inflict damage from a mudprogram
 *
 *  note: should be careful about using victim afterwards
 */
static ch_ret simple_damage( Character *ch, Character *victim, int dam, int dt )
{
  short dameq;
  bool npcvict;
  OBJ_DATA *damobj;

  if ( !ch )
    {
      bug( "Damage: null ch!", 0 );
      return rERROR;
    }
  if ( !victim )
    {
      progbug( "Damage: null victim!", ch );
      return rVICT_DIED;
    }

  if ( victim->position == POS_DEAD )
    {
      return rVICT_DIED;
    }

  npcvict = is_npc(victim);

  if ( dam )
    {
      if ( IS_FIRE(dt) )
        dam = ris_damage(victim, dam, RIS_FIRE);
      else
        if ( IS_COLD(dt) )
          dam = ris_damage(victim, dam, RIS_COLD);
        else
          if ( IS_ACID(dt) )
            dam = ris_damage(victim, dam, RIS_ACID);
          else
            if ( IS_ELECTRICITY(dt) )
              dam = ris_damage(victim, dam, RIS_ELECTRICITY);
            else
              if ( IS_ENERGY(dt) )
                dam = ris_damage(victim, dam, RIS_ENERGY);
              else
                if ( dt == gsn_poison )
                  dam = ris_damage(victim, dam, RIS_POISON);
                else
                  if ( dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8) )
                    dam = ris_damage(victim, dam, RIS_BLUNT);
                  else
                    if ( dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11) )
                      dam = ris_damage(victim, dam, RIS_PIERCE);
                    else
                      if ( dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3) )
                        dam = ris_damage(victim, dam, RIS_SLASH);
      if ( dam < 0 )
        dam = 0;
    }

  if ( victim != ch )
    {
      /*
       * Damage modifiers.
       */
      if ( is_affected_by(victim, AFF_SANCTUARY) )
        dam /= 2;

      if ( is_affected_by(victim, AFF_PROTECT) && is_evil(ch) )
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
      dameq  = number_range(WEAR_LIGHT, WEAR_EYES);
      damobj = get_eq_char(victim, dameq);
      if ( damobj )
        {
          if ( dam > get_obj_resistance(damobj) )
            {
              set_cur_obj(damobj);
              damage_obj(damobj);
            }
        }
    }

  /*
   * Hurt the victim.
   * Inform the victim of his new state.
   */
  victim->hit -= dam;
  if ( !is_npc(victim)
       &&   get_trust(victim) >= LEVEL_IMMORTAL
       &&   victim->hit < 1 )
    victim->hit = 1;

  if ( !npcvict
       &&   get_trust(victim) >= LEVEL_IMMORTAL
       &&        get_trust(ch)     >= LEVEL_IMMORTAL
       &&   victim->hit < 1 )
    victim->hit = 1;
  update_pos( victim );

  switch( victim->position )
    {
    case POS_MORTAL:
      act( AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      act( AT_DANGER, "You are mortally wounded, and will die soon, if not aided.",
           victim, NULL, NULL, TO_CHAR );
      break;

    case POS_INCAP:
      act( AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_ROOM );
      act( AT_DANGER, "You are incapacitated and will slowly die, if not aided.",
           victim, NULL, NULL, TO_CHAR );
      break;

    case POS_STUNNED:
      if ( !is_affected_by( victim, AFF_PARALYSIS ) )
        {
          act( AT_ACTION, "$n is stunned, but will probably recover.",
               victim, NULL, NULL, TO_ROOM );
          act( AT_HURT, "You are stunned, but will probably recover.",
               victim, NULL, NULL, TO_CHAR );
        }
      break;

    case POS_DEAD:
      act( AT_DEAD, "$n is DEAD!!", victim, 0, 0, TO_ROOM );
      act( AT_DEAD, "You have been KILLED!!\r\n", victim, 0, 0, TO_CHAR );
      break;

    default:
      if ( dam > victim->max_hit / 4 )
        act( AT_HURT, "That really did HURT!", victim, 0, 0, TO_CHAR );
      if ( victim->hit < victim->max_hit / 4 )
        act( AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
             victim, 0, 0, TO_CHAR );
      break;
    }

  /*
   * Payoff for killing things.
   */
  if ( victim->position == POS_DEAD )
    {
      if ( !npcvict )
        {
          sprintf( log_buf, "%s killed by %s at %d",
                   victim->name,
                   (is_npc(ch) ? ch->short_descr : ch->name),
		   victim->in_room->vnum );
          log_string( log_buf );
          to_channel( log_buf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL );


        }
      set_cur_char(victim);
      raw_kill( ch, victim );
      victim = NULL;

      return rVICT_DIED;
    }

  if ( victim == ch )
    return rNONE;

  /*
   * Take care of link dead people.
   */
  if ( !npcvict && !victim->desc )
    {
      if ( number_range( 0, victim->wait ) == 0 )
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
      if ( ( IS_SET(victim->act, ACT_WIMPY) && number_bits( 1 ) == 0
             &&   victim->hit < victim->max_hit / 2 )
           ||   ( is_affected_by(victim, AFF_CHARM) && victim->master
                  &&     victim->master->in_room != victim->in_room ) )
        {
          start_fearing( victim, ch );
          stop_hunting( victim );
          do_flee( victim, "" );
        }
    }

  if ( !npcvict
       &&   victim->hit > 0
       &&   victim->hit <= victim->wimpy
       &&   victim->wait == 0 )
    do_flee( victim, "" );
  else
    if ( !npcvict && IS_SET( victim->act, PLR_FLEE ) )
      do_flee( victim, "" );

  return rNONE;
}
