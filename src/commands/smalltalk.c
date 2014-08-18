#include "character.h"
#include "mud.h"

void do_smalltalk ( Character *ch , char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Planet *planet = NULL;
  Clan   *clan = NULL;
  int percent = 0;

  if ( IsNpc(ch) || !ch->pcdata )
    {
      send_to_char( "What would be the point of that.\r\n", ch );
    }

  argument = OneArgument( argument, arg1 );

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Create smalltalk with whom?\r\n", ch );
      return;
    }

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

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
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


  if ( !IsNpc(victim) || victim->vip_flags == 0 )
    {
      send_to_char( "Diplomacy would be wasted on them.\r\n" , ch );
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

  SetWaitState( ch, skill_table[gsn_smalltalk]->beats );

  if ( percent - GetAbilityLevel( ch, DIPLOMACY_ABILITY ) + victim->top_level > ch->pcdata->learned[gsn_smalltalk]  )
    {
      /*
       * Failure.
       */
      send_to_char( "You attempt to make smalltalk with them.. but are ignored.\r\n", ch );
      act( AT_ACTION, "$n is really getting on your nerves with all this chatter!\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n asks $N about the weather but is ignored.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if ( victim->alignment < -500 && victim->top_level >= ch->top_level+5 )
        {
          sprintf( buf, "SHUT UP %s!", ch->name );
          do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  send_to_char( "You strike up a short conversation with them.\r\n", ch );
  act( AT_ACTION, "$n smiles at you and says, 'hello'.\r\n", ch, NULL, victim, TO_VICT    );
  act( AT_ACTION, "$n chats briefly with $N.\r\n",  ch, NULL, victim, TO_NOTVICT );

  if ( IsNpc(ch) || !ch->pcdata || !ch->pcdata->clan || !ch->in_room->area || !ch->in_room->area->planet )
    return;

  if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
    clan = ch->pcdata->clan;

  planet = ch->in_room->area->planet;

  if ( clan != planet->governed_by )
    return;

  planet->pop_support += 0.2;
  send_to_char( "Popular support for your organization increases slightly.\r\n", ch );

  gain_exp(ch, DIPLOMACY_ABILITY, victim->top_level * 10 );
  ch_printf( ch , "You gain %d diplomacy experience.\r\n", victim->top_level*10 );

  learn_from_success( ch, gsn_smalltalk );

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
}
