#include <cstring>
#include <utility/random.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "room.hpp"

void do_gather_intelligence(std::shared_ptr<Character> ch, std::string argument)
{
    std::shared_ptr<Character> victim;
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int percent = 0, the_chance = 0;
    std::shared_ptr<Planet> planet;

    if(argument.empty())
    {
        ch->Echo("You must input a name.\r\n");
        return;
    }

    strcat(buf, "0.");
    strcat(buf, argument.c_str());

    SetWaitState(ch, SkillTable[gsn_gather_intelligence]->Beats);

    if(((victim = GetCharacterAnywhere(ch, buf)) == NULL))
    {
        ch->Echo("You fail to gather information on that individual.\r\n");
        return;
    }

    if(IsNpc(victim))
    {
        ch->Echo("This person has not made much of a name for %sself!\r\n",
                 HimHerIt(victim));
        return;
    }

    percent = GetRandomPercent() * 2;

    if(IsNpc(ch) || percent < ch->PCData->Learned[gsn_gather_intelligence])
    {

        if(ch == victim)
        {
            ch->Echo("I am sure you know enough about yourself right now.\r\n");
            return;
        }

        LearnFromSuccess(ch, gsn_gather_intelligence);

        the_chance = GetRandomPercent();

        if(the_chance < 25)
        {
            if((planet = victim->InRoom->Area->Planet) == NULL)
            {
                ch->Echo("Information has been received that %s is travelling.\r\n",
                         victim->Name.c_str());
            }
            else
            {
                ch->Echo("Information has been received that %s is on %s.\r\n",
                         victim->Name.c_str(), planet->Name.c_str());
            }

            return;
        }

        if(the_chance < 30)
        {
            if(IsClanned(victim))
            {
                ch->Echo("%s seems to be involved with %s.\r\n",
                         victim->Name.c_str(), victim->PCData->ClanInfo.Clan->Name.c_str());
            }
            else
            {
                ch->Echo("%s does not seem to be involved with any organization.\r\n",
                         victim->Name.c_str());
            }

            return;
        }

        if(the_chance < 40)
        {
            if(victim->HitPoints.Current < (victim->HitPoints.Max / 4))
            {
                ch->Echo("Hospital records show that %s has had a very serious injury and has not fully recovered.\r\n", victim->Name.c_str());
            }
            else if(victim->HitPoints.Current < (victim->HitPoints.Max / 2))
            {
                ch->Echo("Hospital records show that %s has had a serious injury and has begun to recover.\r\n", victim->Name.c_str());
            }
            else if(victim->HitPoints.Current < victim->HitPoints.Max)
            {
                ch->Echo("Hospital records show that %s has had a minor injury recently.\r\n",
                         victim->Name.c_str());
            }
            else if(victim->HitPoints.Current == victim->HitPoints.Max)
            {
                ch->Echo("There has been no recently medical history for %s.\r\n",
                         victim->Name.c_str());
            }

            return;
        }

        if(the_chance < 50)
        {
            switch(victim->Ability.Main)
            {
            case COMBAT_ABILITY:
                sprintf(buf, "%s appears to have centered training on combat.",
                        victim->Name.c_str());
                break;

            case PILOTING_ABILITY:
                sprintf(buf, "%s appears to have centered training on piloting ships.",
                        victim->Name.c_str());
                break;

            case ENGINEERING_ABILITY:
                sprintf(buf, "%s appears to have centered training on engineering.",
                        victim->Name.c_str());
                break;

            case HUNTING_ABILITY:
                sprintf(buf, "%s appears to have centered training on bounty hunting.",
                        victim->Name.c_str());
                break;

            case SMUGGLING_ABILITY:
                sprintf(buf, "%s appears to have centered training on smuggling.",
                        victim->Name.c_str());
                break;

            case DIPLOMACY_ABILITY:
                sprintf(buf, "%s appears to have centered training on diplomacy.",
                        victim->Name.c_str());
                break;

            case LEADERSHIP_ABILITY:
                sprintf(buf, "%s appears to have centered training on leadership.",
                        victim->Name.c_str());
                break;

            case FORCE_ABILITY:
                sprintf(buf, "%s appears to have centered attention on studying the Force.",
                        victim->Name.c_str());
                break;

            case COMMANDO_ABILITY:
                sprintf(buf, "%s has not centered training on anything, but seems to mix smuggling with piloting abilities.", victim->Name.c_str());
                break;

            default:
                break;
            }

            ch->Echo("%s\r\n", buf);
            return;
        }

        if(the_chance < 55)
        {
            if(IsJedi(victim))
            {
                if(victim->Mana.Current > 1000)
                    sprintf(buf, "%s appears to have centered %s attention on studying the Force, and is rumored to excel at its use.", HisHersIts(victim), victim->Name.c_str());
                else if(victim->Mana.Current > 200)
                    sprintf(buf, "%s appears to have centered %s attention on studying the Force, and is rumored to have some skill.", HisHersIts(victim), victim->Name.c_str());
                else
                    sprintf(buf, "%s appears to have centered %s attention on studying the Force, and is rumored to have found some minor ability in it.", HisHersIts(victim), victim->Name.c_str());
            }
            else
            {
                sprintf(buf, "%s appears to have centered %s attention on the mundane.",
                        HisHersIts(victim), victim->Name.c_str());
            }

            ch->Echo("%s\r\n", buf);
            return;
        }

        ch->Echo("You fail to gather information on that individual.");
        return;
    }
    else
    {
        ch->Echo("You fail to gather information on that individual.");
        return;
    }
}

