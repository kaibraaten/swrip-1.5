#include "character.h"
#include "mud.h"

void do_punch( Character *ch, char *argument )
{
  Character *victim;
  char arg[MAX_INPUT_LENGTH];

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      SendToCharacter( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  if ( !IsNpc(ch)
       &&   ch->pcdata->learned[gsn_punch] <= 0 )
    {
      SendToCharacter(
                   "Your mind races as you realize you have no idea how to do that.\r\n", ch );
      return;
    }

  if ( ( victim = who_fighting( ch ) ) == NULL )
    {

      OneArgument( argument, arg );

      if ( arg[0] == '\0' )
        {
          SendToCharacter( "Punch whom?\r\n", ch );
          return;
        }

      if ( ( victim = get_char_room( ch, arg ) ) == NULL )
        {
          SendToCharacter( "They aren't here.\r\n", ch );
          return;
        }

      if ( !IsNpc(victim) )
        {
          SendToCharacter( "You must MURDER a player.\r\n", ch );
          return;
        }

      if ( victim == ch )
        {
          SendToCharacter( "You punch yourself.  Ouch!\r\n", ch );
          multi_hit( ch, ch, TYPE_UNDEFINED );
	  return;
        }

      if ( is_safe( ch, victim ) )
        return;

      if ( IsAffectedBy(ch, AFF_CHARM) && ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }

      if ( victim->vip_flags != 0 )
        ch->alignment -= 10;
    }

  SetWaitState( ch, skill_table[gsn_punch]->beats );

  if ( IsNpc(ch) || GetRandomPercent( ) < ch->pcdata->learned[gsn_punch] )
    {
      learn_from_success( ch, gsn_punch );
      global_retcode = damage( ch, victim, GetRandomNumberFromRange( 1, GetAbilityLevel(ch, COMBAT_ABILITY ) ), gsn_punch );
    }
  else
    {
      learn_from_failure( ch, gsn_punch );
      global_retcode = damage( ch, victim, 0, gsn_punch );
    }
}
