#include "character.h"
#include "mud.h"

void do_mass_propaganda( Character *ch , char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  Character *victim;
  Planet *planet;
  Clan *clan;
  int percent = 0;

  if ( IsNpc(ch) || !IsClanned( ch ) || !ch->in_room->area->planet )
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );

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

  if ( ( clan = ch->pcdata->ClanInfo.Clan->mainclan ) == NULL )
    clan = ch->pcdata->ClanInfo.Clan;

  planet = ch->in_room->area->planet;

  sprintf( buf, ", and the evils of %s" , planet->governed_by ? planet->governed_by->name : "their current leaders" );
  Echo( ch, "You speak to them about the benifits of the %s%s.\r\n", ch->pcdata->ClanInfo.Clan->name,
             planet->governed_by == clan ? "" : buf );
  Act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
  Act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );

  SetWaitState( ch, skill_table[gsn_masspropaganda]->beats );

  if ( percent - GetCurrentCharisma(ch) + victim->top_level > ch->pcdata->learned[gsn_masspropaganda]  )
    {

      if ( planet->governed_by != clan )
        {
          sprintf( buf, "%s is a traitor!" , ch->name);
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->governed_by == clan )
    {
      planet->pop_support += (.5 + ch->top_level/50)*((planet->population)/2);
      SendToCharacter( "Popular support for your organization increases.\r\n", ch );
    }
  else
    {
      planet->pop_support -= (ch->top_level/50)*((planet->population)/2);
      SendToCharacter( "Popular support for the current government decreases.\r\n", ch );
    }

  GainXP(ch, DIPLOMACY_ABILITY, victim->top_level * 100 );
  Echo( ch , "You gain %d diplomacy experience.\r\n", victim->top_level*100 );

  LearnFromSuccess( ch, gsn_masspropaganda );

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
  if ( planet->pop_support < -100 )
    planet->pop_support = -100;
}
