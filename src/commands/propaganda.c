#include "character.h"
#include "mud.h"

void do_propaganda ( Character *ch , char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  PLANET_DATA *planet;
  CLAN_DATA   *clan;

  if ( IsNpc(ch) || !ch->pcdata || !ch->in_room->area || !ch->in_room->area->planet || !ch->pcdata->clan)
    {
      send_to_char( "What would be the point of that.\r\n", ch );
      return;
    }

  planet = ch->in_room->area->planet;
  argument = one_argument( argument, arg1 );

  if ( ch->mount )
    {
      send_to_char( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' )
    {
      send_to_char( "Spread propaganda to who?\r\n", ch );
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


  if ( victim->vip_flags == 0 )
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

  if ( !ch->pcdata->clan )
    {
      sprintf( buf, "You speak to them about the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
      ch_printf( ch, buf );
      act( AT_ACTION, "$n speaks about the planets organization.\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n tells $N about the evils of their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }
  if ( ch->pcdata->clan )
    {
      if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
        clan = ch->pcdata->clan;

      planet = ch->in_room->area->planet;

      sprintf( buf, ", and the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
      ch_printf( ch, "You speak to them about the benifits of the %s%s.\r\n", ch->pcdata->clan->name,
                 planet->governed_by == clan ? "" : buf );
      act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
      act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }
  SetWaitState( ch, skill_table[gsn_propaganda]->beats );

  if ( victim->top_level - GetCurrentCharisma(ch) > ch->pcdata->learned[gsn_propaganda]  )
    {

      if ( (ch->pcdata->clan) ? planet->governed_by != clan : true)
        {
          sprintf( buf, "%s is a traitor!" , ch->name);
          do_yell( victim, buf );
          global_retcode = multi_hit( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->governed_by == clan )
    {
      planet->pop_support += .5 + ch->top_level/50;
      send_to_char( "Popular support for your organization increases.\r\n", ch );
    }
  else
    {
      planet->pop_support -= ch->top_level/50;
      send_to_char( "Popular support for the current government decreases.\r\n", ch );
    }

  gain_exp(ch, DIPLOMACY_ABILITY, victim->top_level * 100 );
  ch_printf( ch , "You gain %d diplomacy experience.\r\n", victim->top_level*100 );

  learn_from_success( ch, gsn_propaganda );

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
  if ( planet->pop_support < -100 )
    planet->pop_support = -100;
}
