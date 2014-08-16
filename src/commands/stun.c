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
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&  ch->pcdata->learned[gsn_stun] <= 0  )
    {
      send_to_char(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ch->move < 16 )
    {
      set_char_color( AT_SKILL, ch );
      send_to_char( "You are far too tired to do that.\r\n", ch );
      return;           /* missing return fixed March 11/96 */
    }

  SetWaitState( ch, skill_table[gsn_stun]->beats );
  fail = false;
  stun_chance = ris_save( victim, GetAbilityLevel( ch, COMBAT_ABILITY ), RIS_PARALYSIS );

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
             || (number_percent( ) + stun_chance) < ch->pcdata->learned[gsn_stun] ) )
    {
      learn_from_success( ch, gsn_stun );
      /*    DO *NOT* CHANGE!    -Thoric    */
      ch->move -= 15;
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      SetWaitState( victim, PULSE_VIOLENCE );
      act( AT_SKILL, "$N smashes into you, leaving you stunned!", victim, NULL, ch, TO_CHAR );
      act( AT_SKILL, "You smash into $N, leaving $M stunned!", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n smashes into $N, leaving $M stunned!", ch, NULL, victim, TO_NOTVICT );
      if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
        {
          af.type      = gsn_stun;
          af.location  = APPLY_AC;
          af.modifier  = 20;
	  af.duration  = 3;
          af.bitvector = AFF_PARALYSIS;
          affect_to_char( victim, &af );
          update_pos( victim );
        }
    }
  else
    {
      SetWaitState( ch,     2 * PULSE_VIOLENCE );
      ch->move -= 5;
      learn_from_failure( ch, gsn_stun );
      act( AT_SKILL, "$N charges at you screaming, but you dodge out of the way.", victim, NULL, ch, TO_CHAR );
      act( AT_SKILL, "Your attempt to stun $N leaves you racing past $E as $e laughs.", ch, NULL, victim, TO_CHAR );
      act( AT_SKILL, "$n charges screaming at $N, but keeps going right on past.", ch, NULL, victim, TO_NOTVICT );
    }
}
