#include "mud.hpp"
#include "character.hpp"
#include "skill.hpp"

void do_backstab( Character *ch, std::string argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  Object *obj;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't do that right now.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( ch->Mount )
    {
      SendToCharacter( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg ) )
    {
      SendToCharacter( "Backstab whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "How can you sneak up on yourself?\r\n", ch );
      return;
    }

  if ( IsSafe( ch, victim ) )
    return;

  /* Added stabbing weapon. -Narn */
  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL
       ||   ( obj->Value[OVAL_WEAPON_TYPE] != WEAPON_VIBRO_BLADE
	      && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE ) )
    {
      SendToCharacter( "You need to wield a stabbing weapon.\r\n", ch );
      return;
    }

  if ( victim->Fighting )
    {
      SendToCharacter( "You can't backstab someone who is in combat.\r\n", ch );
      return;
    }

  /* Can backstab a char even if it's hurt as long as it's sleeping. -Narn */
  /* Or if it can't see you. -Ulysses */
  if ( victim->Hit < victim->MaxHit
       && ( IsAwake(victim) && CanSeeCharacter(victim,ch) ) )
    {
      Act( AT_PLAIN, "$N is hurt and suspicious ... you can't sneak up.",
           ch, NULL, victim, TO_CHAR );
      return;
    }

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
    + (GetCurrentLuck(victim) - 13);

  SetWaitState( ch, SkillTable[gsn_backstab]->Beats );

  if ( !IsAwake(victim)
       ||   IsNpc(ch)
       ||   percent < ch->PCData->Learned[gsn_backstab] )
    {
      LearnFromSuccess( ch, gsn_backstab );
      global_retcode = HitMultipleTimes( ch, victim, gsn_backstab );

    }
  else
    {
      LearnFromFailure( ch, gsn_backstab );
      global_retcode = InflictDamage( ch, victim, 0, gsn_backstab );
    }
}
