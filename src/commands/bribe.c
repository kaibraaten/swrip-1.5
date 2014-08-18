#include "character.h"
#include "mud.h"

void do_bribe ( Character *ch , char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  Planet *planet;
  Clan   *clan;
  int percent = 0;
  int amount = 0;

  if ( IsNpc(ch) || !ch->pcdata || !ch->pcdata->clan || !ch->in_room->area || !ch->in_room->area->planet )
    {
      send_to_char( "What would be the point of that.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      send_to_char( "Bribe who how much?\r\n", ch );
      return;
    }

  amount = atoi( argument );

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

  if ( amount <= 0 )
    {
      send_to_char( "A little bit more money would be a good plan.\r\n", ch );
      return;
    }

  if ( ch->gold < amount )
    {
      send_to_char( "Try getting that amount first.\r\n" , ch );
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

  if ( victim->vip_flags == 0 )
    {
      send_to_char( "Diplomacy would be wasted on them.\r\n" , ch );
      return;
    }

  ch->gold -= amount;
  victim->gold += amount;

  ch_printf( ch, "You give them a small gift on behalf of %s.\r\n", ch->pcdata->clan->name );
  act( AT_ACTION, "$n offers you a small bribe.\r\n", ch, NULL, victim, TO_VICT    );
  act( AT_ACTION, "$n gives $N some money.\r\n",  ch, NULL, victim, TO_NOTVICT );

  if ( !IsNpc( victim ) )
    return;

  SetWaitState( ch, skill_table[gsn_bribe]->beats );

  if ( percent - amount + victim->top_level > ch->pcdata->learned[gsn_bribe]  )
    return;

  if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
    clan = ch->pcdata->clan;

  planet = ch->in_room->area->planet;


  if ( clan == planet->governed_by )
    {
      planet->pop_support += urange( 0.1 , amount/1000 , 2 );
      send_to_char( "Popular support for your organization increases slightly.\r\n", ch );

      amount = umin( amount ,( exp_level(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) + 1) - exp_level(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ) ) );

      gain_exp( ch, DIPLOMACY_ABILITY, amount );
      ch_printf( ch, "You gain %d diplomacy experience.\r\n", amount );

      learn_from_success( ch, gsn_bribe );
    }

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
}
