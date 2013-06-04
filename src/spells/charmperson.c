#include "character.h"
#include "mud.h"

ch_ret spell_charm_person( int sn, int level, Character *ch, void *vo )
{
  Character *victim = (Character *) vo;
  AFFECT_DATA af;
  int charm_chance;
  char buf[MAX_STRING_LENGTH];
  SKILLTYPE *skill = get_skilltype(sn);

  if ( victim == ch )
    {
      send_to_char( "You like yourself even better!\r\n", ch );
      return rSPELL_FAILED;
    }

  if ( IS_SET( victim->immune, RIS_MAGIC )
       ||   IS_SET( victim->immune, RIS_CHARM ) )
    {
      immune_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( (!is_npc( victim ) && !is_npc( ch )) || ch->race == RACE_DROID )
    {
      send_to_char( "I don't think so...\r\n", ch );
      send_to_char( "You feel as if someone tried to enter your mind but failed..\r\n", victim );
      return rSPELL_FAILED;
    }

  charm_chance = ris_save( victim, level, RIS_CHARM );

  if ( is_affected_by(victim, AFF_CHARM)
       ||   charm_chance == 1000
       ||   is_affected_by(ch, AFF_CHARM)
       ||   level < victim->top_level
       ||        circle_follow( victim, ch )
       ||   saves_spell_staff( charm_chance, victim ) )
    {
      failed_casting( skill, ch, victim, NULL );
      return rSPELL_FAILED;
    }

  if ( victim->master )
    stop_follower( victim );

  add_follower( victim, ch );
  af.type      = sn;
  af.duration  = (number_fuzzy( (level + 1) / 3 ) + 1) * DUR_CONV;
  af.location  = 0;
  af.modifier  = 0;
  af.bitvector = AFF_CHARM;
  affect_to_char( victim, &af );
  act( AT_MAGIC, "Isn't $n just so nice?", ch, NULL, victim, TO_VICT );
  act( AT_MAGIC, "$N's eyes glaze over...", ch, NULL, victim, TO_ROOM );

  if ( ch != victim )
    send_to_char( "Ok.\r\n", ch );

  sprintf( buf, "%s has charmed %s.", ch->name, victim->name);
  log_string_plus( buf, LOG_NORMAL, ch->top_level );

  return rNONE;
}
