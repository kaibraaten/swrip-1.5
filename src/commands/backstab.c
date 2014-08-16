#include "mud.h"
#include "character.h"

void do_backstab( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  OBJ_DATA *obj;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't do that right now.\r\n", ch );
      return;
    }

  one_argument( argument, arg );

  if ( ch->mount )
    {
      send_to_char( "You can't get close enough while mounted.\r\n", ch );
      return;
    }

  if ( arg[0] == '\0' )
    {
      send_to_char( "Backstab whom?\r\n", ch );
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

  /* Added stabbing weapon. -Narn */
  if ( ( obj = GetEquipmentOnCharacter( ch, WEAR_WIELD ) ) == NULL
       ||   ( obj->value[3] != WEAPON_VIBRO_BLADE ) )
    {
      send_to_char( "You need to wield a stabbing weapon.\r\n", ch );
      return;
    }

  if ( victim->fighting )
    {
      send_to_char( "You can't backstab someone who is in combat.\r\n", ch );
      return;
    }

  /* Can backstab a char even if it's hurt as long as it's sleeping. -Narn */
  /* Or if it can't see you. -Ulysses */
  if ( victim->hit < victim->max_hit
       && ( IsAwake(victim) && CanSeeCharacter(victim,ch) ) )
    {
      act( AT_PLAIN, "$N is hurt and suspicious ... you can't sneak up.",
           ch, NULL, victim, TO_CHAR );
      return;
    }

  percent = number_percent( ) - (GetCurrentLuck(ch) - 14)
    + (GetCurrentLuck(victim) - 13);

  SetWaitState( ch, skill_table[gsn_backstab]->beats );

  if ( !IsAwake(victim)
       ||   IsNpc(ch)
       ||   percent < ch->pcdata->learned[gsn_backstab] )
    {
      learn_from_success( ch, gsn_backstab );
      global_retcode = multi_hit( ch, victim, gsn_backstab );

    }
  else
    {
      learn_from_failure( ch, gsn_backstab );
      global_retcode = damage( ch, victim, 0, gsn_backstab );
    }
}
