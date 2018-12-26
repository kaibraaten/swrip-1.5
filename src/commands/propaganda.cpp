#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_propaganda( Character *ch, std::string arg1 )
{
  char buf[MAX_STRING_LENGTH];
  Character *victim = NULL;
  std::shared_ptr<Planet> planet;
  std::shared_ptr<Clan> clan;

  if ( IsNpc(ch) || !ch->InRoom->Area->Planet )
    {
      ch->Echo("What would be the point of that.\r\n");
      return;
    }

  planet = ch->InRoom->Area->Planet;

  if ( ch->Mount )
    {
      ch->Echo("You can't do that while mounted.\r\n");
      return;
    }

  if ( arg1.empty() )
    {
      ch->Echo("Spread propaganda to whom?\r\n");
      return;
    }

  if ( ( victim = GetCharacterInRoom( ch, arg1 ) ) == NULL )
    {
      ch->Echo("They aren't here.\r\n");
      return;
    }

  if ( victim == ch )
    {
      ch->Echo("That's pointless.\r\n");
      return;
    }

  if ( ch->InRoom->Flags.test( Flag::Room::Safe ) )
    {
      SetCharacterColor( AT_MAGIC, ch );
      ch->Echo("This isn't a good place to do that.\r\n");
      return;
    }

  if ( ch->Position == POS_FIGHTING )
    {
      ch->Echo("Interesting combat technique.\r\n" );
      return;
    }

  if ( victim->Position == POS_FIGHTING )
    {
      ch->Echo("They're a little busy right now.\r\n" );
      return;
    }


  if ( victim->VipFlags == 0 )
    {
      ch->Echo("Diplomacy would be wasted on them.\r\n" );
      return;
    }

  if ( ch->Position <= POS_SLEEPING )
    {
      ch->Echo("In your dreams or what?\r\n" );
      return;
    }

  if ( victim->Position <= POS_SLEEPING )
    {
      ch->Echo("You might want to wake them first...\r\n" );
      return;
    }

  if ( !IsClanned( ch ) )
    {
      sprintf( buf, "You speak to them about the evils of %s",
               planet->GovernedBy ? planet->GovernedBy->Name.c_str() : "their current leaders" );
      ch->Echo( "%s", buf );
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

      sprintf( buf, ", and the evils of %s",
               planet->GovernedBy ? planet->GovernedBy->Name.c_str() : "their current leaders" );
      ch->Echo("You speak to them about the benefits of the %s%s.\r\n",
	    ch->PCData->ClanInfo.Clan->Name.c_str(),
	    planet->GovernedBy == clan ? "" : buf );
      Act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
      Act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );
    }

  SetWaitState( ch, SkillTable[gsn_propaganda]->Beats );

  if ( victim->TopLevel - GetCurrentCharisma(ch) > ch->PCData->Learned[gsn_propaganda] )
    {
      if ( IsClanned( ch ) ? planet->GovernedBy != clan : true)
        {
          sprintf( buf, "%s is a traitor!", ch->Name.c_str());
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->GovernedBy == clan )
    {
      planet->PopularSupport += .5 + ch->TopLevel/50;
      ch->Echo("Popular support for your organization increases.\r\n");
    }
  else
    {
      planet->PopularSupport -= ch->TopLevel/50;
      ch->Echo("Popular support for the current government decreases.\r\n");
    }

  GainXP(ch, DIPLOMACY_ABILITY, victim->TopLevel * 100 );
  ch ->Echo("You gain %d diplomacy experience.\r\n", victim->TopLevel*100 );

  LearnFromSuccess( ch, gsn_propaganda );

  if ( planet->PopularSupport > 100 )
    planet->PopularSupport = 100;

  if ( planet->PopularSupport < -100 )
    planet->PopularSupport = -100;
}
