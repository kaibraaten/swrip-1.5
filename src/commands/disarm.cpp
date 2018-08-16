#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"
#include "pcdata.hpp"

void do_disarm( Character *ch, char *argument )
{
  Character *victim = NULL;
  Object *obj = NULL;
  int percent = 0;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      ch->Echo( "You can't concentrate enough for that.\r\n" );
      return;
    }

  if ( !IsNpc(ch)
       &&   ch->PCData->Learned[gsn_disarm] <= 0  )
    {
      ch->Echo( "You don't know how to disarm opponents.\r\n" );
      return;
    }

  if ( GetEquipmentOnCharacter( ch, WEAR_WIELD ) == NULL )
    {
      ch->Echo( "You must wield a weapon to disarm.\r\n" );
      return;
    }

  if ( ( victim = GetFightingOpponent( ch ) ) == NULL )
    {
      ch->Echo( "You aren't fighting anyone.\r\n" );
      return;
    }

  if ( ( obj = GetEquipmentOnCharacter( victim, WEAR_WIELD ) ) == NULL )
    {
      ch->Echo( "Your opponent is not wielding a weapon.\r\n" );
      return;
    }

  SetWaitState( ch, SkillTable[gsn_disarm]->Beats );
  percent = GetRandomPercent() + GetAbilityLevel( victim, COMBAT_ABILITY )
    - GetAbilityLevel( ch, COMBAT_ABILITY )
    - (GetCurrentLuck(ch) - 15) + (GetCurrentLuck(victim) - 15);

  if ( !CanSeeObject( ch, obj ) )
    percent += 10;

  if ( IsNpc(ch) || percent < ch->PCData->Learned[gsn_disarm] * 2 / 3 )
    {
      Disarm( ch, victim );
    }
  else
    {
      ch->Echo( "You failed.\r\n" );
      LearnFromFailure( ch, gsn_disarm );
    }
}
