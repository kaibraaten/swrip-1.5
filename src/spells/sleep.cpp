#include "character.hpp"
#include "mud.hpp"
#include "skill.hpp"
#include "log.hpp"

extern char *spell_target_name;

ch_ret spell_sleep( int sn, int level, Character *ch, void *vo )
{
  Affect af;
  int retcode;
  int sleep_chance;
  int tmp;
  Character *victim;
  Skill *skill = GetSkill(sn);

  if ( ( victim = GetCharacterInRoom( ch, spell_target_name ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return rSPELL_FAILED;
    }

  if ( !IsNpc(victim) && victim->Fighting )
    {
      ch->Echo("You cannot sleep a fighting player.\r\n");
      return rSPELL_FAILED;
    }

  if ( IsSafe(ch, victim) )
    return rSPELL_FAILED;

  if ( IsBitSet( victim->Immune, RIS_MAGIC ) )
    {
      ImmuneCasting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( SPELL_FLAG(skill, SF_PKSENSITIVE)
       &&  !IsNpc(ch) && !IsNpc(victim) )
    tmp = level;
  else
    tmp = level;

  if ( IsAffectedBy(victim, AFF_SLEEP)
       ||       (sleep_chance=ModifySavingThrowBasedOnResistance(victim, tmp, RIS_SLEEP)) == 1000
       ||  (victim != ch && IsBitSet(victim->InRoom->Flags, ROOM_SAFE))
       ||   SaveVsSpellStaff( sleep_chance, victim ) )
    {
      FailedCasting( skill, ch, victim, NULL );
      if ( ch == victim )
        return rSPELL_FAILED;
      if ( !victim->Fighting )
        {
          retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
          if ( retcode == rNONE )
            retcode = rSPELL_FAILED;
          return retcode;
        }
    }
  af.Type      = sn;
  af.Duration  = (4 + level) * DUR_CONV;
  af.Location  = APPLY_NONE;
  af.Modifier  = 0;
  af.AffectedBy = AFF_SLEEP;
  JoinAffect( victim, &af );

  /* Added by Narn at the request of Dominus. */
  if ( !IsNpc( victim ) )
    {
      sprintf( log_buf, "%s has cast sleep on %s.", ch->Name, victim->Name );
      Log->LogStringPlus( log_buf, LOG_NORMAL, ch->TopLevel );
      ToChannel( log_buf, CHANNEL_MONITOR, "Monitor", umax( LEVEL_IMMORTAL, ch->TopLevel ) );
    }

  if ( IsAwake(victim) && victim->Race != RACE_DROID )
    {
      Act( AT_MAGIC, "You feel very sleepy ..... zzzzzz.", victim, NULL, NULL, TO_CHAR );
      Act( AT_MAGIC, "$n goes to sleep.", victim, NULL, NULL, TO_ROOM );
      victim->Position = POS_SLEEPING;
    }
  else if ( IsAwake(victim) && victim->Race == RACE_DROID )
    {
      Act( AT_MAGIC, "You feel a jolt as you are deactivated.", victim, NULL, NULL, TO_CHAR );
      Act( AT_MAGIC, "$n shutsdown.", victim, NULL, NULL, TO_ROOM );
      victim->Position = POS_SLEEPING;
    }
  if ( IsNpc( victim ) )
    if ( IsNpc( victim ) )
      StartHating( victim, ch );

  return rNONE;
}

