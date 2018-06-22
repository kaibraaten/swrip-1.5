#include "character.h"
#include "mud.h"
#include "skill.h"

void do_stun( Character *ch, char *argument )
{
  Character *victim;
  Affect af;
  int stun_chance;
  bool fail;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&  ch->PCData->Learned[gsn_stun] <= 0  )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ch->Move < 16 )
    {
      SetCharacterColor( AT_SKILL, ch );
      SendToCharacter( "You are far too tired to do that.\r\n", ch );
      return;           /* missing return fixed March 11/96 */
    }

  SetWaitState( ch, SkillTable[gsn_stun]->Beats );
  fail = false;
  stun_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, COMBAT_ABILITY ), RIS_PARALYSIS );

  if ( stun_chance == 1000 )
    fail = true;
  else
    fail = SaveVsParalyze( stun_chance, victim );

  stun_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
		  -   (GetCurrentDexterity(ch)     + GetCurrentStrength(ch))) * 10) + 10;

  /* harder for player to stun another player */
  if ( !IsNpc(ch) && !IsNpc(victim) )
    stun_chance += SysData.StunModPlrVsPlr;
  else
    stun_chance += SysData.StunRegular;

  if ( !fail
       && (  IsNpc(ch)
             || (GetRandomPercent() + stun_chance) < ch->PCData->Learned[gsn_stun] ) )
    {
      LearnFromSuccess( ch, gsn_stun );
      /*    DO *NOT* CHANGE!    -Thoric    */
      ch->Move -= 15;
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, PULSE_VIOLENCE );
      Act( AT_SKILL, "$N smashes into you, leaving you stunned!", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "You smash into $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n smashes into $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );

      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          af.Type      = gsn_stun;
          af.Location  = APPLY_AC;
          af.Modifier  = 20;
	  af.Duration  = 3;
          af.AffectedBy = AFF_PARALYSIS;
          AffectToCharacter( victim, &af );
          UpdatePosition( victim );
        }
    }
  else
    {
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      ch->Move -= 5;
      LearnFromFailure( ch, gsn_stun );
      Act( AT_SKILL, "$N charges at you screaming, but you dodge out of the way.", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "Your attempt to stun $N leaves you racing past $E as $e laughs.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n charges screaming at $N, but keeps going right on past.", ch, NULL, victim, TO_NOTVICT );
    }
}
