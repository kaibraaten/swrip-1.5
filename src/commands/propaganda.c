#include "character.h"
#include "mud.h"

void do_propaganda ( Character *ch , char *argument )
{
  char buf  [MAX_STRING_LENGTH];
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  Planet *planet;
  Clan   *clan;

  if ( IsNpc(ch) || !ch->pcdata || !ch->in_room->area || !ch->in_room->area->planet || !ch->pcdata->clan)
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
      return;
    }

  planet = ch->in_room->area->planet;
  argument = OneArgument( argument, arg1 );

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( arg1[0] == '\0' )
    {
      SendToCharacter( "Spread propaganda to who?\r\n", ch );
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      SendToCharacter( "They aren't here.\r\n", ch );
      return;
    }

  if ( victim == ch )
    {
      SendToCharacter( "That's pointless.\r\n", ch );
      return;
    }

  if ( IsBitSet( ch->in_room->room_flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
      return;
    }

  if ( ch->position == POS_FIGHTING )
    {
      SendToCharacter( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( victim->position == POS_FIGHTING )
    {
      SendToCharacter( "They're a little busy right now.\r\n" , ch );
      return;
    }


  if ( victim->vip_flags == 0 )
    {
      SendToCharacter( "Diplomacy would be wasted on them.\r\n" , ch );
      return;
    }

  if ( ch->position <= POS_SLEEPING )
    {
      SendToCharacter( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->position <= POS_SLEEPING )
    {
      SendToCharacter( "You might want to wake them first...\r\n" , ch );
      return;
    }

  if ( !ch->pcdata->clan )
    {
      sprintf( buf, "You speak to them about the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
      ChPrintf( ch, buf );
      Act( AT_ACTION, "$n speaks about the planets organization.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tells $N about the evils of their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }
  if ( ch->pcdata->clan )
    {
      if ( ( clan = ch->pcdata->clan->mainclan ) == NULL )
        clan = ch->pcdata->clan;

      planet = ch->in_room->area->planet;

      sprintf( buf, ", and the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
      ChPrintf( ch, "You speak to them about the benifits of the %s%s.\r\n", ch->pcdata->clan->name,
                 planet->governed_by == clan ? "" : buf );
      Act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }
  SetWaitState( ch, skill_table[gsn_propaganda]->beats );

  if ( victim->top_level - GetCurrentCharisma(ch) > ch->pcdata->learned[gsn_propaganda]  )
    {

      if ( (ch->pcdata->clan) ? planet->governed_by != clan : true)
        {
          sprintf( buf, "%s is a traitor!" , ch->name);
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->governed_by == clan )
    {
      planet->pop_support += .5 + ch->top_level/50;
      SendToCharacter( "Popular support for your organization increases.\r\n", ch );
    }
  else
    {
      planet->pop_support -= ch->top_level/50;
      SendToCharacter( "Popular support for the current government decreases.\r\n", ch );
    }

  GainXP(ch, DIPLOMACY_ABILITY, victim->top_level * 100 );
  ChPrintf( ch , "You gain %d diplomacy experience.\r\n", victim->top_level*100 );

  LearnFromSuccess( ch, gsn_propaganda );

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
  if ( planet->pop_support < -100 )
    planet->pop_support = -100;
}
