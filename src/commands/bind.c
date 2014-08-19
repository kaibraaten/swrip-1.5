#include "character.h"
#include "mud.h"

static bool aff_paralysis( Character *ch, Character *victim );

void do_bind ( Character *ch , char *argument )
{
  Character *victim;
  char logbuf[MAX_STRING_LENGTH];

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Bind whom?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, argument ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( IsBitSet(victim->act, PLR_AFK))
    {
      sprintf( logbuf , "%s just bound %s with an afk flag on!." , ch->name, victim->name );
      log_string( logbuf );
    }

  if ( IsSafe( ch, victim ) )
    return;

  if ( IsAffectedBy(ch, AFF_CHARM) )
    {
      if ( ch->master == victim )
        {
          Act( AT_PLAIN, "$N is your beloved master.", ch, NULL, victim, TO_CHAR );
          return;
        }
    }

  if ( ch->position == POS_FIGHTING )
    {
      SendToCharacter( "You are a little busy!\r\n", ch );
      return;
    }

  ch->alignment -= 10;

  SetWaitState( ch, 1 * PULSE_VIOLENCE );

  if ( IsNpc(victim) || GetRandomPercent( ) > ch->pcdata->learned[gsn_bind] )
    {
      SendToCharacter( "You fail.\r\n", ch );
      return;
    }

  if( victim->position != POS_STUNNED )
    return;

  Act( AT_YELLOW, "$n binds you up!",  ch, NULL, victim, TO_VICT    );
  Act( AT_YELLOW, "You bind $N up.", ch, NULL, victim, TO_CHAR    );
  Act( AT_BLUE, "$n quickly binds $N, leaving $M helpless!", ch, NULL, victim, TO_NOTVICT );
  aff_paralysis( ch, victim );
  LearnFromSuccess( ch, gsn_bind );
}

static bool aff_paralysis( Character *ch, Character *victim )
{
  Affect af;

  if ( !IsAffectedBy( victim, AFF_PARALYSIS ) )
    {
      af.type      = gsn_stun;
      af.location  = APPLY_AC;
      af.modifier  = 20;
      af.duration  = 30;
      af.bitvector = AFF_PARALYSIS;
      AffectToCharacter( victim, &af );
      UpdatePosition( victim );

      if ( IsNpc(victim) )
        {
          StartHating( victim, ch );
          StartHunting( victim, ch );
          victim->was_stunned = 10;
        }
    }

  return true;
}
