#include "mud.h"
#include "character.h"
#include "skill.h"

void do_disarm( Character *ch, char *argument )
{
  Character *victim;
  Object *obj;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&   ch->pcdata->learned[gsn_disarm] <= 0  )
    {
      SendToCharacter( "You don't know how to disarm opponents.\r\n", ch );
      return;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_WIELD ) == NULL )
    {
      SendToCharacter( "You must wield a weapon to disarm.\r\n", ch );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      SendToCharacter( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) == NULL )
    {
      SendToCharacter( "Your opponent is not wielding a weapon.\r\n", ch );
      return;
    }

  SetWaitState( ch, skill_table[gsn_disarm]->beats );
  percent = GetRandomPercent() + GetAbilityLevel( victim, COMBAT_ABILITY )
    - GetAbilityLevel( ch, COMBAT_ABILITY )
    - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 15);

  if ( !CanSeeObject( ch, obj ) )
    percent += 10;

  if ( IsNpc(ch) || percent < ch->pcdata->learned[gsn_disarm] * 2 / 3 )
    Disarm( ch, victim );
  else
    {
      SendToCharacter( "You failed.\r\n", ch );
      LearnFromFailure( ch, gsn_disarm );
    }
}
