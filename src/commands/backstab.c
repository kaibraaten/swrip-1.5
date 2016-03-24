#include "mud.h"
#include "character.h"
#include "skill.h"

void do_backstab( Character *ch, char *argument )
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

  if ( ch->mount )
    {
      SendToCharacter( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
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
       ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
      SendToCharacter( "You need to wield a stabbing weapon.\r\n", ch );
      return;
    }

  if ( victim->fighting )
    {
      SendToCharacter( "You can't backstab someone who is in combat.\r\n", ch );
      return;
    }

  /* Can backstab a char even if it's hurt as long as it's sleeping. -Narn */
  /* Or if it can't see you. -Ulysses */
  if ( victim->hit < victim->max_hit
       && ( IsAwake(victim) && CanSeeCharacter(victim,ch) ) )
    {
      Act( AT_PLAIN, "$N is hurt and suspicious ... you can't sneak up.",
           ch, NULL, victim, TO_CHAR );
      return;
    }

  percent = GetRandomPercent() - (GetCurrentLuck(ch) - 14)
    + (GetCurrentLuck(victim) - 13);

  SetWaitState( ch, skill_table[gsn_backstab]->beats );

  if ( !IsAwake(victim)
       ||   IsNpc(ch)
       ||   percent < ch->pcdata->learned[gsn_backstab] )
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
