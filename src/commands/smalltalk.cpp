#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_smalltalk( Character *ch , char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Planet *planet = NULL;
  Clan *clan = NULL;
  int percent = 0;

  if ( IsNpc(ch) )
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
    }

  argument = OneArgument( argument, arg1 );

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg1 ) )
    {
      SendToCharacter( "Create smalltalk with whom?\r\n", ch );
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

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      SendToCharacter( "This isn't a good place to do that.\r\n", ch );
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


  if ( !IsNpc(victim) || victim->VipFlags == 0 )
    {
      SendToCharacter( "Diplomacy would be wasted on them.\r\n" , ch );
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

  SetWaitState( ch, SkillTable[gsn_smalltalk]->Beats );

  if ( percent - GetAbilityLevel( ch, DIPLOMACY_ABILITY ) + victim->TopLevel > ch->PCData->Learned[gsn_smalltalk]  )
    {
      /*
       * Failure.
       */
      SendToCharacter( "You attempt to make smalltalk with them.. but are ignored.\r\n", ch );
      Act( AT_ACTION, "$n is really getting on your nerves with all this chatter!\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n asks $N about the weather but is ignored.\r\n",  ch, NULL, victim, TO_NOTVICT );

      if ( victim->Alignment < -500 && victim->TopLevel >= ch->TopLevel+5 )
        {
          sprintf( buf, "SHUT UP %s!", ch->Name );
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  SendToCharacter( "You strike up a short conversation with them.\r\n", ch );
  Act( AT_ACTION, "$n smiles at you and says, 'hello'.\r\n", ch, NULL, victim, TO_VICT    );
  Act( AT_ACTION, "$n chats briefly with $N.\r\n",  ch, NULL, victim, TO_NOTVICT );

  if ( !IsClanned( ch ) || !ch->InRoom->Area->Planet )
    return;

  if ( ( clan = ch->PCData->ClanInfo.Clan->MainClan ) == NULL )
    clan = ch->PCData->ClanInfo.Clan;

  planet = ch->InRoom->Area->Planet;

  if ( clan != planet->GovernedBy )
    return;

  planet->PopularSupport += 0.2;
  SendToCharacter( "Popular support for your organization increases slightly.\r\n", ch );

  GainXP(ch, DIPLOMACY_ABILITY, victim->TopLevel * 10 );
  Echo( ch , "You gain %d diplomacy experience.\r\n", victim->TopLevel*10 );

  LearnFromSuccess( ch, gsn_smalltalk );

  if ( planet->PopularSupport > 100 )
    planet->PopularSupport = 100;
}
