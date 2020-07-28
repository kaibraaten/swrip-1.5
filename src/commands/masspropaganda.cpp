#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"
#include "systemdata.hpp"

void do_mass_propaganda(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    std::string arg1;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Planet> planet;
    std::shared_ptr<Clan> clan;
    int percent = 0;

    if(IsNpc(ch) || !IsClanned(ch) || !ch->InRoom->Area->Planet)
    {
        ch->Echo("What would be the point of that.\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);

    if(arg1.empty())
    {
        ch->Echo("Spread propaganda to who?\r\n");
        return;
    }

    if((victim = GetCharacterInRoom(ch, arg1)) == NULL)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(victim == ch)
    {
        ch->Echo("That's pointless.\r\n");
        return;
    }

    if(ch->InRoom->Flags.test(Flag::Room::Safe))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("This isn't a good place to do that.\r\n");
        return;
    }

    if(ch->Position == POS_FIGHTING)
    {
        ch->Echo("Interesting combat technique.\r\n");
        return;
    }

    if(victim->Position == POS_FIGHTING)
    {
        ch->Echo("They're a little busy right now.\r\n");
        return;
    }


    if(victim->VipFlags == 0)
    {
        ch->Echo("Diplomacy would be wasted on them.\r\n");
        return;
    }

    if(ch->Position <= POS_SLEEPING)
    {
        ch->Echo("In your dreams or what?\r\n");
        return;
    }

    if(victim->Position <= POS_SLEEPING)
    {
        ch->Echo("You might want to wake them first...\r\n");
        return;
    }

    if((clan = ch->PCData->ClanInfo.Clan->MainClan) == NULL)
        clan = ch->PCData->ClanInfo.Clan;

    planet = ch->InRoom->Area->Planet;

    sprintf(buf, ", and the evils of %s",
            planet->GovernedBy ? planet->GovernedBy->Name.c_str() : "their current leaders");
    ch->Echo("You speak to them about the benefits of %s%s.\r\n",
             ch->PCData->ClanInfo.Clan->Name.c_str(),
             planet->GovernedBy == clan ? "" : buf);
    Act(AT_ACTION, "$n speaks about his organization.\r\n", ch, NULL, victim, ActTarget::Vict);
    Act(AT_ACTION, "$n tells $N about their organization.\r\n", ch, NULL, victim, ActTarget::NotVict);

    SetWaitState(ch, SkillTable[gsn_masspropaganda]->Beats);

    if(percent - GetCurrentCharisma(ch) + victim->TopLevel() > GetSkillLevel(ch, gsn_masspropaganda))
    {
        if(planet->GovernedBy != clan)
        {
            sprintf(buf, "%s is a traitor!", ch->Name.c_str());
            do_yell(victim, buf);
            global_retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
        }

        return;
    }

    auto ability = SkillTable[gsn_masspropaganda]->Class;
    int charLevel = 0;

    if(SysData.TopLevelFromAbility)
    {
        charLevel = umin(GetAbilityLevel(ch, ability), 100);
    }
    else
    {
        charLevel = ch->TopLevel();
    }
    
    if(planet->GovernedBy == clan)
    {
        planet->PopularSupport += (.5 + charLevel / 50) * ((planet->Population) / 2);
        ch->Echo("Popular support for your organization increases.\r\n");
    }
    else
    {
        planet->PopularSupport -= (charLevel / 50) * ((planet->Population) / 2);
        ch->Echo("Popular support for the current government decreases.\r\n");
    }

    
    GainXP(ch, ability, victim->TopLevel() * 100);
    ch->Echo("You gain %d %s experience.\r\n",
             victim->TopLevel() * 100,
             AbilityName[(int)ability]);

    LearnFromSuccess(ch, gsn_masspropaganda);

    if(planet->PopularSupport > 100)
        planet->PopularSupport = 100;

    if(planet->PopularSupport < -100)
        planet->PopularSupport = -100;
}

