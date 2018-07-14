#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"

void do_propaganda( Character *ch , char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Planet *planet = NULL;
  Clan *clan = NULL;

  if ( IsNpc(ch) || !ch->InRoom->Area->Planet )
    {
      SendToCharacter( "What would be the point of that.\r\n", ch );
      return;
    }

  planet = ch->InRoom->Area->Planet;
  argument = OneArgument( argument, arg1 );

  if ( ch->Mount )
    {
      SendToCharacter( "You can't do that while mounted.\r\n", ch );
      return;
    }

  if ( IsNullOrEmpty( arg1 ) )
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


  if ( victim->VipFlags == 0 )
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

  if ( !IsClanned( ch ) )
    {
      sprintf( buf, "You speak to them about the evils of %s" , planet->GovernedBy ? planet->GovernedBy->Name : "their current leaders" );
      Echo( ch, buf );
      Act( AT_ACTION, "$n speaks about the planets organization.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tells $N about the evils of their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }
  else
    {
      if ( ( clan = ch->PCData->ClanInfo.Clan->MainClan ) == NULL )
	{
	  clan = ch->PCData->ClanInfo.Clan;
	}

      planet = ch->InRoom->Area->Planet;

      sprintf( buf, ", and the evils of %s" , planet->GovernedBy ? planet->GovernedBy->Name : "their current leaders" );
      Echo( ch, "You speak to them about the benefits of the %s%s.\r\n",
	    ch->PCData->ClanInfo.Clan->Name,
	    planet->GovernedBy == clan ? "" : buf );
      Act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }

  SetWaitState( ch, SkillTable[gsn_propaganda]->Beats );

  if ( victim->TopLevel - GetCurrentCharisma(ch) > ch->PCData->Learned[gsn_propaganda] )
    {
      if ( IsClanned( ch ) ? planet->GovernedBy != clan : true)
        {
          sprintf( buf, "%s is a traitor!" , ch->Name);
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->GovernedBy == clan )
    {
      planet->PopularSupport += .5 + ch->TopLevel/50;
      SendToCharacter( "Popular support for your organization increases.\r\n", ch );
    }
  else
    {
      planet->PopularSupport -= ch->TopLevel/50;
      SendToCharacter( "Popular support for the current government decreases.\r\n", ch );
    }

  GainXP(ch, DIPLOMACY_ABILITY, victim->TopLevel * 100 );
  Echo( ch , "You gain %d diplomacy experience.\r\n", victim->TopLevel*100 );

  LearnFromSuccess( ch, gsn_propaganda );

  if ( planet->PopularSupport > 100 )
    planet->PopularSupport = 100;

  if ( planet->PopularSupport < -100 )
    planet->PopularSupport = -100;
}
