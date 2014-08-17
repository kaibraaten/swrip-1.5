#include "mud.h"
#include "character.h"

void do_disarm( Character *ch, char *argument )
{
  Character *victim;
  OBJ_DATA *obj;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&   ch->pcdata->learned[gsn_disarm] <= 0  )
    {
      send_to_char( "You don't know how to disarm opponents.\r\n", ch );
      return;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_WIELD ) == NULL )
    {
      send_to_char( "You must wield a weapon to disarm.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {
      send_to_char( "You aren't fighting anyone.\r\n", ch );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) == NULL )
    {
      send_to_char( "Your opponent is not wielding a weapon.\r\n", ch );
      return;
    }

  SetWaitState( ch, skill_table[gsn_disarm]->beats );
  percent = GetRandomPercent() + GetAbilityLevel( victim, COMBAT_ABILITY )
    - GetAbilityLevel( ch, COMBAT_ABILITY )
    - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 15);

  if ( !CanSeeObject( ch, obj ) )
    percent += 10;

  if ( IsNpc(ch) || percent < ch->pcdata->learned[gsn_disarm] * 2 / 3 )
    disarm( ch, victim );
  else
    {
      send_to_char( "You failed.\r\n", ch );
      learn_from_failure( ch, gsn_disarm );
    }
}
