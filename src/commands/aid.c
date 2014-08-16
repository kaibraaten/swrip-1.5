#include "mud.h"
#include "character.h"

void do_aid( Character *ch, char *argument )
{
  char arg[MAX_INPUT_LENGTH];
  Character *victim;
  int percent;

  if ( IsNpc(ch) && IsAffectedBy( ch, AFF_CHARM ) )
    {
      send_to_char( "You can't concentrate enough for that.\r\n", ch );
      return;
    }

  one_argument( argument, arg );
  if ( arg[0] == '\0' )
    {
      send_to_char( "Aid whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Aid yourself?\r\n", ch );
      return;
    }

  if ( victim->position > POS_STUNNED )
    {
      act( AT_PLAIN, "$N doesn't need your help.", ch, NULL, victim,
           TO_CHAR);
      return;
    }

  if ( victim->hit <= -400 )
    {
      act( AT_PLAIN, "$N's condition is beyond your aiding ability.", ch,
           NULL, victim, TO_CHAR);
      return;
    }

  ch->alignment = ch->alignment + 20;
  ch->alignment = urange( -1000, ch->alignment, 1000 );

  percent = number_percent( ) - (GetCurrentLuck(ch) - 13);
  SetWaitState( ch, skill_table[gsn_aid]->beats );
  if ( !IsNpc(ch) && percent > ch->pcdata->learned[gsn_aid] )
    {
      send_to_char( "You fail.\r\n", ch );
      learn_from_failure( ch, gsn_aid );
      return;
    }

  ch->alignment = ch->alignment + 20;
  ch->alignment = urange( -1000, ch->alignment, 1000 );

  act( AT_SKILL, "You aid $N!",  ch, NULL, victim, TO_CHAR    );
  act( AT_SKILL, "$n aids $N!",  ch, NULL, victim, TO_NOTVICT );
  learn_from_success( ch, gsn_aid );

  if ( victim->hit < 1 )
    victim->hit = 1;

  update_pos( victim );
  act( AT_SKILL, "$n aids you!", ch, NULL, victim, TO_VICT    );
}
