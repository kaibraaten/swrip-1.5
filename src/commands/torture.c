#include "mud.h"
#include "character.h"
#include "skill.h"

void do_torture( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  int the_chance, dam;
  bool fail;

  if ( !IsNpc(ch)
       &&  ch->pcdata->learned[gsn_torture] <= 0  )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't do that right now.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( ch->mount )
    {
      SendToCharacter( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      SendToCharacter( "Torture whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Are you masacistic or what...\r\n", ch );
      return;
    }

  if ( !IsAwake(victim) )
    {
      SendToCharacter( "You need to wake them first.\r\n", ch );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( victim->fighting )
    {
      SendToCharacter( "You can't torture someone whos in combat.\r\n", ch );
      return;
    }

  ch->alignment -= 100;
  ch->alignment = urange( -1000, ch->alignment, 1000 );

  SetWaitState( ch, SkillTable[gsn_torture]->beats );

  fail = false;
  the_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, LEADERSHIP_ABILITY ) / 10, RIS_PARALYSIS );

  if ( the_chance == 1000 )
    fail = true;
  else
    fail = SaveVsParalyze( the_chance, victim );

  if ( !IsNpc(ch) && !IsNpc(victim) )
    the_chance = sysdata.stun_plr_vs_plr;
  else
    the_chance = sysdata.stun_regular;

  if ( !fail
       && (  IsNpc(ch)
             || (GetRandomPercent() + the_chance) < ch->pcdata->learned[gsn_torture] ) )
    {
      LearnFromSuccess( ch, gsn_torture );
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, PULSE_VIOLENCE );
      Act( AT_SKILL, "$N slowly tortures you. The pain is excruciating.", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "You torture $N, leaving $M screaming in pain.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n tortures $N, leaving $M screaming in agony!", ch, NULL, victim, TO_NOTVICT );

      dam = RollDice( GetAbilityLevel( ch, LEADERSHIP_ABILITY ) / 80 , 4 );
      dam = urange( 0, victim->max_hit-10, dam );
      victim->hit -= dam;
      victim->max_hit -= dam;

      Echo( victim, "You lose %d permanent hit points." ,dam);
      Echo( ch, "They lose %d permanent hit points." , dam);
    }
  else
    {
      Act( AT_SKILL, "$N tries to cut off your finger!", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "You mess up big time.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n tries to painfully torture $N.", ch, NULL, victim, TO_NOTVICT );
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
    }
}
