#include "character.h"
#include "mud.h"

void do_slay( CHAR_DATA *ch, char *argument )
{
  CHAR_DATA *victim;
  char arg[MAX_INPUT_LENGTH];
  char arg2[MAX_INPUT_LENGTH];

  argument = one_argument( argument, arg );
  one_argument( argument, arg2 );

  if ( arg[0] == '\0' )
    {
      send_to_char( "Slay whom?\r\n", ch );
      return;
    }

  if ( ( victim = get_char_room( ch, arg ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( ch == victim )
    {
      send_to_char( "Suicide is a mortal sin.\r\n", ch );
      return;
    }

  if ( !IS_NPC(victim)
       && ( get_trust( victim ) == 103 || get_trust( ch ) < 103) )
    {
      send_to_char( "You failed.\r\n", ch );
      return;
    }

  if ( !str_cmp( arg2, "immolate" ) )
    {
      act( AT_FIRE, "Your fireball turns $N into a blazing inferno.",  ch, NULL, victim, TO_CHAR    );
      act( AT_FIRE, "$n releases a searing fireball in your direction.", ch, NULL, victim, TO_VICT    );
      act( AT_FIRE, "$n points at $N, who bursts into a flaming inferno.",  ch, NULL, victim, TO_NOTVICT );
    }
  else if ( !str_cmp( arg2, "shatter" ) )
    {
      act( AT_LBLUE, "You freeze $N with a glance and shatter the frozen corpse into tiny shards.",  ch, NULL, victim, TO_CHAR    );
      act( AT_LBLUE, "$n freezes you with a glance and shatters your frozen body into tiny shards.", ch, NULL, victim, TO_VICT    );
      act( AT_LBLUE, "$n freezes $N with a glance and shatters the frozen body into tiny shards.",  ch, NULL, victim, TO_NOTVICT );
    }
  else if ( !str_cmp( arg2, "demon" ) )
    {
      act( AT_IMMORT, "You gesture, and a slavering demon appears.  With a horrible grin, the",  ch, NULL, victim, TO_CHAR );
      act( AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",  ch, NULL, victim, TO_CHAR );
      act( AT_IMMORT, "$n gestures, and a slavering demon appears.  The foul creature turns on",  ch, NULL, victim, TO_VICT );
      act( AT_IMMORT, "you with a horrible grin.   You scream in panic before being eaten alive.",  ch, NULL, victim, TO_VICT );
      act( AT_IMMORT, "$n gestures, and a slavering demon appears.  With a horrible grin, the",  ch, NULL, victim, TO_NOTVICT );
      act( AT_IMMORT, "foul creature turns on $N, who screams in panic before being eaten alive.",  ch, NULL, victim, TO_NOTVICT );
    }
  else if ( !str_cmp( arg2, "pounce" ) && get_trust(ch) >= LEVEL_ASCENDANT )
    {
      act( AT_BLOOD, "Leaping upon $N with bared fangs, you tear open $S throat and toss the corpse to the ground...",  ch, NULL, victim, TO_CHAR );
      act( AT_BLOOD, "In a heartbeat, $n rips $s fangs through your throat!  Your blood sprays and pours to the ground as your life ends...", ch, NULL, victim, TO_VICT );
      act( AT_BLOOD, "Leaping suddenly, $n sinks $s fangs into $N's throat.  As blood sprays and gushes to the ground, $n tosses $N's dying body away.",  ch, NULL, victim, TO_NOTVICT );
    }
  else if ( !str_cmp( arg2, "slit" ) && get_trust(ch) >= LEVEL_ASCENDANT )
    {
      act( AT_BLOOD, "You calmly slit $N's throat.", ch, NULL, victim, TO_CHAR );
      act( AT_BLOOD, "$n reaches out with a clawed finger and calmly slits your throat.", ch, NULL, victim, TO_VICT );
      act( AT_BLOOD, "$n calmly slits $N's throat.", ch, NULL, victim, TO_NOTVICT );
    }
  else
    {
      act( AT_IMMORT, "You slay $N in cold blood!",  ch, NULL, victim, TO_CHAR    );
      act( AT_IMMORT, "$n slays you in cold blood!", ch, NULL, victim, TO_VICT    );
      act( AT_IMMORT, "$n slays $N in cold blood!",  ch, NULL, victim, TO_NOTVICT );
    }

  set_cur_char(victim);
  raw_kill( ch, victim );
}
