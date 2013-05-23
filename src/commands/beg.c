#include "character.h"
#include "mud.h"

void do_beg( CHAR_DATA *ch, char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  CHAR_DATA *victim;
  int percent, xp;
  int amount;

  if ( is_npc (ch) ) return;

  argument = one_argument( argument, arg1 );

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Beg for money from whom?\r\n", ch );
      return;
    }

  if ( ms_find_obj(ch) )
    return;

  if ( ( victim = get_char_room( ch, arg1 ) ) == NULL )
    {
      send_to_char( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      send_to_char( "That's pointless.\r\n", ch );
      return;
    }

  if ( IS_SET( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      set_char_color( AT_MAGIC, ch );
      send_to_char( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      send_to_char( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( victim->position == POS_FIGHTING )
    {
      send_to_char( "They're a little busy right now.\r\n" , ch );
      return;
    }

  if ( ch->position <= POS_SLEEPING )
    {
      send_to_char( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->position <= POS_SLEEPING )
    {
      send_to_char( "You might want to wake them first...\r\n" , ch );
      return;
    }

  if ( !is_npc( victim ) )
    {
      send_to_char( "You beg them for money.\r\n", ch );
      act( AT_ACTION, "$n begs you to give $s some change.\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n begs $N for change.\r\n",  ch, NULL, victim, TO_NOTVICT );
      return;
    }

  WAIT_STATE( ch, skill_table[gsn_beg]->beats );
  percent  = number_percent( ) + get_level( ch, SMUGGLING_ABILITY ) + victim->top_level;

  if ( percent > ch->pcdata->learned[gsn_beg]  )
    {
      /*
       * Failure.
       */
      send_to_char( "You beg them for money but don't get any!\r\n", ch );
      act( AT_ACTION, "$n is really getting on your nerves with all this begging!\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n begs $N for money.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if ( victim->alignment < 0 && victim->top_level >= ch->top_level+5 )
        {
          sprintf( buf, "%s is an annoying beggar and needs to be taught a lesson!", ch->name );
          do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
        }

      learn_from_failure( ch, gsn_beg );

      return;
    }


  act( AT_ACTION, "$n begs $N for money.\r\n",  ch, NULL, victim, TO_NOTVICT );
  act( AT_ACTION, "$n begs you for money!\r\n", ch, NULL, victim, TO_VICT    );

  amount = UMIN( victim->gold , number_range(1, 10) );
  if ( amount <= 0 )
    {
      do_look( victim , ch->name );
      do_say( victim , "Sorry I have nothing to spare.\r\n" );
      learn_from_failure( ch, gsn_beg );
      return;
    }

  ch->gold     += amount;
  victim->gold -= amount;
  ch_printf( ch, "%s gives you %d credits.\r\n", victim->short_descr , amount );
  learn_from_success( ch, gsn_beg );
  xp = UMIN( amount*10 , ( exp_level( get_level( ch, SMUGGLING_ABILITY ) + 1) - exp_level( get_level( ch, SMUGGLING_ABILITY ) )  )  );
  xp = UMIN( xp , xp_compute( ch, victim ) );
  gain_exp( ch, SMUGGLING_ABILITY, xp );
  ch_printf( ch, "&WYou gain %ld smuggling experience points!\r\n", xp );
  act( AT_ACTION, "$N gives $n some money.\r\n",  ch, NULL, victim, TO_NOTVICT );
  act( AT_ACTION, "You give $n some money.\r\n", ch, NULL, victim, TO_VICT    );
}