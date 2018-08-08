#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_torture( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  int the_chance = 0, dam = 0;
  bool fail = false;

  if ( !IsNpc(ch)
       &&  ch->PCData->Learned[gsn_torture] <= 0  )
    {
      ch->Echo("Your mind races as you realize you have no idea how to do that.\r\n" );
      return;
    }

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo("You can't do that right now.\r\n");
      return;
    }

  OneArgument( argument, arg );

  if ( ch->Mount )
    {
      ch->Echo("You can't get close enough while mounted.\r\n");
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      ch->Echo("Torture whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("Are you masacistic or what...\r\n");
      return;
    }

  if ( !IsAwake(victim) )
    {
      ch->Echo("You need to wake them first.\r\n");
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( victim->Fighting )
    {
      ch->Echo("You can't torture someone whos in combat.\r\n");
      return;
    }

  ch->Alignment -= 100;
  ch->Alignment = urange( -1000, ch->Alignment, 1000 );

  SetWaitState( ch, SkillTable[gsn_torture]->Beats );

  fail = false;
  the_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, LEADERSHIP_ABILITY ) / 10, RIS_PARALYSIS );

  if ( the_chance == 1000 )
    fail = true;
  else
    fail = SaveVsParalyze( the_chance, victim );

  if ( !IsNpc(ch) && !IsNpc(victim) )
    the_chance = SysData.StunModPlrVsPlr;
  else
    the_chance = SysData.StunRegular;

  if ( !fail
       && (  IsNpc(ch)
             || (GetRandomPercent() + the_chance) < ch->PCData->Learned[gsn_torture] ) )
    {
      LearnFromSuccess( ch, gsn_torture );
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, PULSE_VIOLENCE );
      Act( AT_SKILL, "$N slowly tortures you. The pain is excruciating.", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "You torture $N, leaving $M screaming in pain.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n tortures $N, leaving $M screaming in agony!", ch, NULL, victim, TO_NOTVICT );

      dam = RollDice( GetAbilityLevel( ch, LEADERSHIP_ABILITY ) / 80 , 4 );
      dam = urange( 0, victim->MaxHit-10, dam );
      victim->Hit -= dam;
      victim->MaxHit -= dam;

      victim->Echo("You lose %d permanent hit points." ,dam);
      ch->Echo("They lose %d permanent hit points." , dam);
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

