#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_bribe(std::shared_ptr<Character> ch, std::string argument)
{
    std::string arg1;
    std::shared_ptr<Character> victim;
    std::shared_ptr<Planet> planet;
    std::shared_ptr<Clan> clan;
    int percent = 0;
    int amount = 0;

    if(!IsClanned(ch) || !ch->InRoom->Area->Planet)
    {
        ch->Echo("What would be the point of that.\r\n");
        return;
    }

    argument = OneArgument(argument, arg1);

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    if(argument.empty())
    {
        ch->Echo("Bribe whom how much?\r\n");
        return;
    }

    amount = strtol(argument.c_str(), nullptr, 10);

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

    if(amount <= 0)
    {
        ch->Echo("A little bit more money would be a good plan.\r\n");
        return;
    }

    if(ch->Gold < amount)
    {
        ch->Echo("Try getting that amount first.\r\n");
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

    if(ch->Position <= POS_SLEEPING)
    {
        ch->Echo("In your dreams or what?\r\n");
        return;
    }

    if(victim->Position <= POS_SLEEPING)
    {
        ch->Echo("You might want to wake them first.\r\n");
        return;
    }

    if(victim->VipFlags == 0)
    {
        ch->Echo("Diplomacy would be wasted on them.\r\n");
        return;
    }

    ch->Gold -= amount;
    victim->Gold += amount;

    ch->Echo("You give them a small gift on behalf of %s.\r\n",
             ch->PCData->ClanInfo.Clan->Name.c_str());
    Act(AT_ACTION, "$n offers you a small bribe.\r\n", ch, NULL, victim, ActTarget::Vict);
    Act(AT_ACTION, "$n gives $N some money.\r\n", ch, NULL, victim, ActTarget::NotVict);

    if(!IsNpc(victim))
        return;

    SetWaitState(ch, SkillTable[gsn_bribe]->Beats);

    if(percent - amount + victim->TopLevel() > GetSkillLevel(ch, gsn_bribe))
        return;

    if((clan = ch->PCData->ClanInfo.Clan->MainClan) == NULL)
        clan = ch->PCData->ClanInfo.Clan;

    planet = ch->InRoom->Area->Planet;

    if(clan == planet->GovernedBy)
    {
        AbilityClass ability = SkillTable[gsn_bribe]->Class;
        planet->PopularSupport += urange(0.1, amount / 1000, 2);
        ch->Echo("Popular support for your organization increases slightly.\r\n");

        amount = umin(amount, (GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, ability))));

        GainXP(ch, ability, amount);
        ch->Echo("You gain %d %s experience.\r\n",
                 amount, AbilityName[(int)ability]);

        LearnFromSuccess(ch, gsn_bribe);
    }

    if(planet->PopularSupport > 100)
        planet->PopularSupport = 100;
}

