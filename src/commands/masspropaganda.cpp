#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"

void do_mass_propaganda( Character *ch , char *argument )
{
  char buf[MAX_STRING_LENGTH];
  char arg1[MAX_INPUT_LENGTH];
  Character *victim = NULL;
  Planet *planet = NULL;
  Clan *clan = NULL;
  int percent = 0;

  if ( IsNpc(ch) || !IsClanned( ch ) || !ch->InRoom->Area->Planet )
    {
      ch->Echo("What would be the point of that.\r\n");
      return;
    }

  argument = OneArgument( argument, arg1 );

  if ( IsNullOrEmpty( arg1 ) )
    {
      ch->Echo("Spread propaganda to who?\r\n");
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

  if ( IsBitSet( ch->InRoom->Flags, ROOM_SAFE ) )
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

  if ( ( clan = ch->PCData->ClanInfo.Clan->MainClan ) == NULL )
    clan = ch->PCData->ClanInfo.Clan;

  planet = ch->InRoom->Area->Planet;

  sprintf( buf, ", and the evils of %s" , planet->GovernedBy ? planet->GovernedBy->Name : "their current leaders" );
  ch->Echo("You speak to them about the benifits of the %s%s.\r\n", ch->PCData->ClanInfo.Clan->Name,
             planet->GovernedBy == clan ? "" : buf );
  Act( AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, TO_VICT    );
  Act( AT_ACTION, "$n tells $N about their organization.\r\n",  ch, NULL, victim, TO_NOTVICT );

  SetWaitState( ch, SkillTable[gsn_masspropaganda]->Beats );

  if ( percent - GetCurrentCharisma(ch) + victim->TopLevel > ch->PCData->Learned[gsn_masspropaganda]  )
    {

      if ( planet->GovernedBy != clan )
        {
          sprintf( buf, "%s is a traitor!" , ch->Name);
          do_yell( victim, buf );
          global_retcode = HitMultipleTimes( victim, ch, TYPE_UNDEFINED );
        }

      return;
    }

  if ( planet->GovernedBy == clan )
    {
      planet->PopularSupport += (.5 + ch->TopLevel/50)*((planet->Population)/2);
      ch->Echo("Popular support for your organization increases.\r\n");
    }
  else
    {
      planet->PopularSupport -= (ch->TopLevel/50)*((planet->Population)/2);
      ch->Echo("Popular support for the current government decreases.\r\n");
    }

  GainXP(ch, DIPLOMACY_ABILITY, victim->TopLevel * 100 );
  ch ->Echo("You gain %d diplomacy experience.\r\n", victim->TopLevel*100 );

  LearnFromSuccess( ch, gsn_masspropaganda );

  if ( planet->PopularSupport > 100 )
    planet->PopularSupport = 100;
  if ( planet->PopularSupport < -100 )
    planet->PopularSupport = -100;
}

