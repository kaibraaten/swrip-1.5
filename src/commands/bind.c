#include "character.h"
#include "mud.h"

static bool aff_paralysis( Character *ch, Character *victim );

void do_bind ( Character *ch , char *argument )
{
  Character *victim;
  char logbuf[MAX_STRING_LENGTH];

  if ( argument[0] == '\0' )
    {
      send_to_char( "Bind whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, argument ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( IS_SET(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just bound %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }

  if ( is_safe( ch, victim ) )
    return;

  if ( is_affected_by(ch, AFF_CHARM) )
    {
      if ( ch->master == victim )
        {
          act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "You are a little busy!\r\n", ch );
      return;
    }

  ch->alignment -= 10;

  set_wait_state( ch, 1 * PULSE_VIOLENCE );

  if ( IsNpc(victim) || number_percent( ) > ch->pcdata->learned[gsn_bind] )
    {
      send_to_char( "You fail.\r\n", ch );
      return;
    }

  if( victim->position != POS_STUNNED )
    return;

  act( AT_YELLOW, "$n binds you up!",  ch, NULL, victim, TO_VICT    );
  act( AT_YELLOW, "You bind $N up.", ch, NULL, victim, TO_CHAR    );
  act( AT_BLUE, "$n quickly binds $N, leaving $M helpless!", ch, NULL, victim, TO_NOTVICT );
  aff_paralysis( ch, victim );
  learn_from_success( ch, gsn_bind );
}

static bool aff_paralysis( Character *ch, Character *victim )
{
  AFFECT_DATA af;

  if ( !is_affected_by( victim, AFF_PARALYSIS ) )
    {
      af.type      = gsn_stun;
      af.location  = APPLY_AC;
      af.modifier  = 20;
      af.duration  = 30;
      af.bitvector = AFF_PARALYSIS;
      affect_to_char( victim, &af );
      update_pos( victim );

      if ( IsNpc(victim) )
        {
          start_hating( victim, ch );
          start_hunting( victim, ch );
          victim->was_stunned = 10;
        }
    }

  return TRUE;
}
