#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "act.hpp"

void do_smalltalk(Character *ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    std::string arg1;
    Character *victim = NULL;
    std::shared_ptr<Planet> planet;
    std::shared_ptr<Clan> clan;
    int percent = 0;

    if(IsNpc(ch))
    {
        ch->Echo("What would be the point of that.\r\n");
    }

    argument = OneArgument(argument, arg1);

    if(ch->Mount)
    {
        ch->Echo("You can't do that while mounted.\r\n");
        return;
    }

    if(arg1.empty())
    {
        ch->Echo("Create smalltalk with whom?\r\n");
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


    if(!IsNpc(victim) || victim->VipFlags == 0)
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

    SetWaitState(ch, SkillTable[gsn_smalltalk]->Beats);

    if(percent - GetAbilityLevel(ch, DIPLOMACY_ABILITY) + victim->TopLevel > ch->PCData->Learned[gsn_smalltalk])
    {
        /*
         * Failure.
         */
        ch->Echo("You attempt to make smalltalk with them, but are ignored.\r\n");
        Act(AT_ACTION, "$n is really getting on your nerves with all this chatter!\r\n", ch, NULL, victim, ActTarget::Vict);
        Act(AT_ACTION, "$n asks $N about the weather but is ignored.\r\n", ch, NULL, victim, ActTarget::NotVict);

        if(victim->Alignment < -500 && victim->TopLevel >= ch->TopLevel + 5)
        {
            sprintf(buf, "SHUT UP %s!", ch->Name.c_str());
            do_yell(victim, buf);
            global_retcode = HitMultipleTimes(victim, ch, TYPE_UNDEFINED);
        }

        return;
    }

    ch->Echo("You strike up a short conversation with them.\r\n");
    Act(AT_ACTION, "$n smiles at you and says, 'hello'.\r\n", ch, NULL, victim, ActTarget::Vict);
    Act(AT_ACTION, "$n chats briefly with $N.\r\n", ch, NULL, victim, ActTarget::NotVict);

    if(!IsClanned(ch) || !ch->InRoom->Area->Planet)
        return;

    if((clan = ch->PCData->ClanInfo.Clan->MainClan) == NULL)
        clan = ch->PCData->ClanInfo.Clan;

    planet = ch->InRoom->Area->Planet;

    if(clan != planet->GovernedBy)
        return;

    planet->PopularSupport += 0.2;
    ch->Echo("Popular support for your organization increases slightly.\r\n");

    GainXP(ch, DIPLOMACY_ABILITY, victim->TopLevel * 10);
    ch->Echo("You gain %d diplomacy experience.\r\n", victim->TopLevel * 10);

    LearnFromSuccess(ch, gsn_smalltalk);

    if(planet->PopularSupport > 100)
        planet->PopularSupport = 100;
}
