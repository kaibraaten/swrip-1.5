#include "character.hpp"
#include "mud.h"
#include "clan.h"
#include "skill.h"
#include "planet.h"
#include "area.h"

void do_bribe( Character *ch , char *argument )
{
  char arg1[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Planet *planet = NULL;
  Clan *clan = NULL;
  int percent = 0;
  int amount = 0;

  if ( !IsClanned( ch ) || !ch->InRoom->Area->Planet )
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( argument ) )
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

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
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

  if ( ch->Gold < amount )
    {
      SendToCharacter( "Try getting that amount first.\r\n" , ch );
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      SendToCharacter( "Interesting combat technique.\r\n" , ch );
      return;
    }

  if ( victim->Position == POS_FIGHTING )
    {
      SendToCharacter( "They're a little busy right now.\r\n" , ch );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      SendToCharacter( "In your dreams or what?\r\n" , ch );
      return;
    }

  if ( victim->Position <= POS_SLEEPING )
    {
      SendToCharacter( "You might want to wake them first...\r\n" , ch );
      return;
    }

  if ( victim->VipFlags == 0 )
    {
      SendToCharacter( "Diplomacy would be wasted on them.\r\n" , ch );
      return;
    }

  ch->Gold -= amount;
  victim->Gold += amount;

  Echo( ch, "You give them a small gift on behalf of %s.\r\n", ch->PCData->ClanInfo.Clan->Name );
  Act( AT_ACTION, "$n offers you a small bribe.\r\n", ch, NULL, victim, TO_VICT    );
  Act( AT_ACTION, "$n gives $N some money.\r\n",  ch, NULL, victim, TO_NOTVICT );

  if ( !IsNpc( victim ) )
    return;

  SetWaitState( ch, SkillTable[gsn_bribe]->Beats );

  if ( percent - amount + victim->TopLevel > ch->PCData->Learned[gsn_bribe]  )
    return;

  if ( ( clan = ch->PCData->ClanInfo.Clan->MainClan ) == NULL )
    clan = ch->PCData->ClanInfo.Clan;

  planet = ch->InRoom->Area->Planet;


  if ( clan == planet->GovernedBy )
    {
      planet->PopularSupport += urange( 0.1 , amount/1000 , 2 );
      SendToCharacter( "Popular support for your organization increases slightly.\r\n", ch );

      amount = umin( amount, ( GetRequiredXpForLevel(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) + 1) - GetRequiredXpForLevel(GetAbilityLevel( ch, DIPLOMACY_ABILITY ) ) ) );

      GainXP( ch, DIPLOMACY_ABILITY, amount );
      Echo( ch, "You gain %d diplomacy experience.\r\n", amount );

      LearnFromSuccess( ch, gsn_bribe );
    }

  if ( planet->PopularSupport > 100 )
    planet->PopularSupport = 100;
}
