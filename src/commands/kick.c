#include "character.h"
#include "mud.h"
#include "skill.h"

void do_kick( Character *ch, char *argument )
{
  Character *victim;
  char logbuf[MAX_STRING_LENGTH];

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just attacked %s with an afk flag on!." , ch->name, victim->name );
      LogPrintf( logbuf );
    }


  SetWaitState( ch, SkillTable[gsn_kick]->beats );

  if ( IsNpc(ch) || GetRandomPercent() < ch->pcdata->learned[gsn_kick] )
    {
      LearnFromSuccess( ch, gsn_kick );
      global_retcode = InflictDamage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel(ch, COMBAT_ABILITY ) ), gsn_kick );
    }
  else
    {
      LearnFromFailure( ch, gsn_kick );
      global_retcode = InflictDamage( ch, victim, 0, gsn_kick );
    }
}
