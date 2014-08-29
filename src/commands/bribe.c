#include "character.h"
#include "mud.h"
#include "clan.h"

void do_bribe( Character *ch , char *argument )
{
  char arg1 [MAX_INPUT_LENGTH];
  Character *victim;
  Planet *planet;
  Clan   *clan;
  int percent = 0;
  int amount = 0;

  if ( !IsClanned( ch ) || !ch->in_room->area->planet )
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( ch->mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( argument[0] == '\0' )
    {
      SendToCharacter( "Bribe who how much?\r\n", ch );
      return;
    }

  amount = atoi( argument );

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

  if ( amount <= 0 )
    {
      SendToCharacter( "A little bit more money would be a good plan.\r\n", ch );
      return;
    }

  if ( ch->gold < amount )
    {
      SendToCharacter( "Try getting that amount first.\r\n" , ch );
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

  if ( victim->vip_flags == 0 )
    {
      SendToCharacter( "Diplomacy would be wasted on them.\r\n" , ch );
      return;
    }

  ch->gold -= amount;
  victim->gold += amount;

  Echo( ch, "You give them a small gift on behalf of %s.\r\n", ch->pcdata->ClanInfo.Clan->name );
  Act( AT_ACTION, "$n offers you a small bribe.\r\n", ch, NULL, victim, TO_VICT    );
  Act( AT_ACTION, "$n gives $N some money.\r\n",  ch, NULL, victim, TO_NOTVICT );

  if ( !IsNpc( victim ) )
    return;

  SetWaitState( ch, skill_table[gsn_bribe]->beats );

  if ( percent - amount + victim->top_level > ch->pcdata->learned[gsn_bribe]  )
    return;

  if ( ( clan = ch->pcdata->ClanInfo.Clan->mainclan ) == NULL )
    clan = ch->pcdata->ClanInfo.Clan;

  planet = ch->in_room->area->planet;


  if ( clan == planet->governed_by )
    {
      planet->pop_support += urange( 0.1 , amount/1000 , 2 );
      SendToCharacter( "Popular support for your organization increases slightly.\r\n", ch );

      amount = umin( amount ,( GetRequiredXpForLevel(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ) ) );

      GainXP( ch, DIPLOMACY_ABILITY, amount );
      Echo( ch, "You gain %d diplomacy experience.\r\n", amount );

      LearnFromSuccess( ch, gsn_bribe );
    }

  if ( planet->pop_support > 100 )
    planet->pop_support = 100;
}
