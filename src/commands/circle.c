#include "character.h"
#include "mud.h"

void do_circle( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  OBJ_DATA *obj;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  OneArgument( argument, arg );

  if ( ch->mount )
    {
      send_to_char( "You can't circle while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "Circle around whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "How can you sneak up on yourself?\r\n", ch );
      return;
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL
       ||   ( obj->value[3] != 11 && obj->value[3] != 2 ) )
    {
      send_to_char( "You need to wield a piercing or stabbing weapon.\r\n", ch );
      return;
    }

  if ( !ch->fighting )
    {
      send_to_char( "You can't circle when you aren't fighting.\r\n", ch);
      return;
    }

  if ( !victim->fighting )
    {
      send_to_char( "You can't circle around a person who is not fighting.\r\n", ch );
      return;
    }

  if ( victim->num_fighting < 2 )
    {
      act( AT_PLAIN, "You can't circle around them without a distraction.",
           ch, NULL, victim, TO_CHAR );
      return;
    }

  percent = GetRandomPercent( ) - (GetCurrentLuck(ch) - 16)
    + (GetCurrentLuck(victim) - 13);

  SetWaitState( ch, skill_table[gsn_circle]->beats );
  if ( percent < (IsNpc(ch) ? (GetAbilityLevel( ch, HUNTING_ABILITY ) * 1.5) : ch->pcdata->learned[gsn_circle]) )
    {
      learn_from_success( ch, gsn_circle );
      global_retcode = multi_hit( ch, victim, gsn_circle );

    }
  else
    {
      learn_from_failure( ch, gsn_circle );
      global_retcode = damage( ch, victim, 0, gsn_circle );
    }
}
