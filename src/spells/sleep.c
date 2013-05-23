#include "character.h"
#include "mud.h"

extern char *spell_target_name;

ch_ret spell_sleep( int sn, int level, CHAR_DATA *ch, void *vo )
{
  AFFECT_DATA af;
  int retcode;
  int sleep_chance;
  int tmp;
  CHAR_DATA *victim;
  SKILLTYPE *skill = get_skilltype(sn);

  if ( ( victim = get_char_room( ch, spell_target_name ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( !is_npc(victim) && victim->fighting )
    {
      send_to_char( "You cannot sleep a fighting player.\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( is_safe(ch, victim) )
    return rSPELL_FAILED;

  if ( IS_SET( victim->immune, RIS_MAGIC ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       &&  !is_npc(ch) && !is_npc(victim) )
    tmp = level;
  else
    tmp = level;

  if ( is_affected_by(victim, AFF_SLEEP)
       ||       (sleep_chance=ris_save(victim, tmp, RIS_SLEEP)) == 1000
       ||  (victim != ch && IS_SET(victim->in_room->room_flags, ROOM_SAFE))
       ||   saves_spell_staff( sleep_chance, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      if ( ch == victim )
        return rSPELL_FAILED;
      if ( !victim->fighting )
        {
          retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
          if ( retcode == rNONE )
            retcode = rSPELL_FAILED;
          return retcode;
        }
    }
  af.type      = sn;
  af.duration  = (4 + level) * DUR_CONV;
  af.location  = APPLY_NONE;
  af.modifier  = 0;
  af.bitvector = AFF_SLEEP;
  affect_join( victim, &af );

  /* Added by Narn at the request of Dominus. */
  if ( !is_npc( victim ) )
    {
      sprintf( log_buf, "%s has cast sleep on %s.", ch->name, victim->name );
      log_string_plus( log_buf, LOG_NORMAL, ch->top_level );
      to_channel( log_buf, CHANNEL_MONITOR, "Monitor", UMAX( LEVEL_IMMORTAL, ch->top_level ) );
    }

  if ( IS_AWAKE(victim) && victim->race != RACE_DROID )
    {
      act( AT_MAGIC, "You feel very sleepy ..... zzzzzz.", victim, NULL, NULL, TO_CHAR );
      act( AT_MAGIC, "$n goes to sleep.", victim, NULL, NULL, TO_ROOM );
      victim->position = POS_SLEEPING;
    }
  else if ( IS_AWAKE(victim) && victim->race == RACE_DROID )
    {
      act( AT_MAGIC, "You feel a jolt as you are deactivated.", victim, NULL, NULL, TO_CHAR );
      act( AT_MAGIC, "$n shutsdown.", victim, NULL, NULL, TO_ROOM );
      victim->position = POS_SLEEPING;
    }
  if ( is_npc( victim ) )
    if ( is_npc( victim ) )
      start_hating( victim, ch );

  return rNONE;
}
