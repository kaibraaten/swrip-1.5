#include "character.h"
#include "mud.h"

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
       &&  ch->pcdata->learned[gsn_stun] <= 0  )
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

  if ( ch->move < 16 )
    {
      SetCharacterColor( AT_SKILL, ch );
      SendToCharacter( "You are far too tired to do that.\r\n", ch );
      return;           /* missing return fixed March 11/96 */
    }

  SetWaitState( ch, skill_table[gsn_stun]->beats );
  fail = false;
  stun_chance = ModifySavingThrowBasedOnResistance( victim, GetAbilityLevel( ch, COMBAT_ABILITY ), RIS_PARALYSIS );

  if ( stun_chance == 1000 )
    fail = true;
  else
    fail = saves_para_petri( stun_chance, victim );

  stun_chance = (((GetCurrentDexterity(victim) + GetCurrentStrength(victim))
		  -   (GetCurrentDexterity(ch)     + GetCurrentStrength(ch))) * 10) + 10;

  /* harder for player to stun another player */
  if ( !IsNpc(ch) && !IsNpc(victim) )
    stun_chance += sysdata.stun_plr_vs_plr;
  else
    stun_chance += sysdata.stun_regular;

  if ( !fail
       && (  IsNpc(ch)
             || (GetRandomPercent( ) + stun_chance) < ch->pcdata->learned[gsn_stun] ) )
    {
      LearnFromSuccess( ch, gsn_stun );
      /*    DO *NOT* CHANGE!    -Thoric    */
      ch->move -= 15;
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, PULSE_VIOLENCE );
      Act( AT_SKILL, "$N smashes into you, leaving you stunned!", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "You smash into $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n smashes into $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );
      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          af.type      = gsn_stun;
          af.location  = APPLY_AC;
          af.modifier  = 20;
	  af.duration  = 3;
          af.bitvector = AFF_PARALYSIS;
          AffectToCharacter( victim, &af );
          UpdatePosition( victim );
        }
    }
  else
    {
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      ch->move -= 5;
      LearnFromFailure( ch, gsn_stun );
      Act( AT_SKILL, "$N charges at you screaming, but you dodge out of the way.", victim, NULL, ch, TO_CHAR );
      Act( AT_SKILL, "Your attempt to stun $N leaves you racing past $E as $e laughs.", ch, NULL, victim, TO_CHAR );
      Act( AT_SKILL, "$n charges screaming at $N, but keeps going right on past.", ch, NULL, victim, TO_NOTVICT );
    }
}
