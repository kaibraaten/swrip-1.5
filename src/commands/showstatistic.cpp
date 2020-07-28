#include <memory>
#include <cstring>
#include "mud.hpp"
#include "character.hpp"
#include "pcdata.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "race.hpp"

void do_showstatistic(std::shared_ptr<Character> ch, std::string argument)
{
    auto pclass = AbilityClass::None;
    const Race *race = NULL;
    bool chk_race = false;
    char buf[MAX_INPUT_LENGTH];
    char buf2[MAX_INPUT_LENGTH];
    int raceIndex = GetRaceFromName(argument);

    if(raceIndex < 0)
    {
        pclass = GetClassFromName(argument);
    }
    else
    {
        chk_race = true;
        race = &RaceTable[raceIndex];

        if(!RaceIsAvailableToPlayers(race))
        {
            race = NULL;
        }
    }

    if(!race && pclass == AbilityClass::None)
    {
        ch->Echo("No such race or class.\r\n");
        return;
    }

    if(raceIndex == RACE_GOD)
    {
        ch->Echo("Gods are indefeasible...\r\n");
        return;
    }

    std::shared_ptr<Descriptor> desc = std::make_shared<NullDescriptor>();
    std::shared_ptr<Character> raceCh = std::make_shared<Character>(std::make_unique<PCData>());
    MapCharacterAndDescriptor(raceCh, desc);

    raceCh->TopLevel(1);
    raceCh->InRoom = GetRoom(ROOM_VNUM_LIMBO);
    raceCh->PermStats.Str = 20;
    raceCh->PermStats.Int = 20;
    raceCh->PermStats.Wis = 20;
    raceCh->PermStats.Dex = 20;
    raceCh->PermStats.Con = 20;
    raceCh->PermStats.Cha = 20;
    raceCh->PermStats.Lck = 3;

    if(chk_race)
    {
        raceCh->Race = raceIndex;
        raceCh->PermStats.Str += race->Stats.ModStr;
        raceCh->PermStats.Int += race->Stats.ModInt;
        raceCh->PermStats.Wis += race->Stats.ModWis;
        raceCh->PermStats.Dex += race->Stats.ModDex;
        raceCh->PermStats.Con += race->Stats.ModCon;
        raceCh->PermStats.Cha += race->Stats.ModCha;
    }
    else
    {
        raceCh->Ability.Main = pclass;
        raceCh->Race = 0;
    }

    if(chk_race)
    {
        ch->Echo("&R%s Statistics\r\n", race->Name);
        ch->Echo("&cStr: &C%d  &cWis: &C%d  &cInt: &C%d  &cDex: &C%d  &cCon: &C%d  &cCha: &C%d\r\n",
                 raceCh->PermStats.Str, raceCh->PermStats.Wis, raceCh->PermStats.Int,
                 raceCh->PermStats.Dex, raceCh->PermStats.Con, raceCh->PermStats.Cha);
        ch->Echo("                     &B| &CCMB &B| &CPIL &B| &CENG &B| &CBH  &B| &CSMUG &B| &CDIP &B| &CLEA &B|");

        for(int iC = 0; iC < (int)AbilityClass::Max; iC++)
        {
            if(AbilityClass(iC) == AbilityClass::Force && !SysData.CanChooseJedi)
            {
                continue;
            }

            raceCh->Ability.Main = AbilityClass(iC);
            sprintf(buf, "\r\n&c%-20s &B| &C", Capitalize(AbilityName[iC]).c_str());

            for(int iC2 = 0; iC2 < (int)AbilityClass::Max; iC2++)
            {
                auto ability = AbilityClass(iC2);
                
                if(ability == AbilityClass::Force
                   || ability == AbilityClass::Commando)
                    continue;

                if(ability == AbilityClass::Smuggling)
                    sprintf(buf2, "%-3d+ &B| &C", GetMaxAbilityLevel(raceCh, ability));
                else
                    sprintf(buf2, "%-3d &B| &C", GetMaxAbilityLevel(raceCh, ability));

                strcat(buf, buf2);
            }

            ch->Echo("%s", buf);
        }
    }
    else
    {
        sprintf(buf, "&R%s Statistics\r\n", Capitalize(AbilityName[(int)pclass]).c_str());
        ch->Echo("%s", buf);

        ch->Echo("                     &B| &CCMB &B| &CPIL &B| &CENG &B| &CBH  &B| &CSMUG &B| &CDIP &B| &CLEA &B|");

        for(int iR = 0; iR < MAX_RACE; iR++)
        {
            if(!RaceIsAvailableToPlayers(&RaceTable[iR]))
            {
                continue;
            }

            raceCh->Race = iR;
            raceCh->PermStats.Str = 20 + RaceTable[raceCh->Race].Stats.ModStr;
            raceCh->PermStats.Int = 20 + RaceTable[raceCh->Race].Stats.ModInt;
            raceCh->PermStats.Wis = 20 + RaceTable[raceCh->Race].Stats.ModWis;
            raceCh->PermStats.Dex = 20 + RaceTable[raceCh->Race].Stats.ModDex;
            raceCh->PermStats.Con = 20 + RaceTable[raceCh->Race].Stats.ModCon;
            raceCh->PermStats.Cha = 20 + RaceTable[raceCh->Race].Stats.ModCha;
            sprintf(buf, "\r\n&c%-20s &B| &C", RaceTable[iR].Name);

            for(int iC2 = 0; iC2 < (int)AbilityClass::Force; ++iC2)
            {
                if(AbilityClass(iC2) == AbilityClass::Smuggling)
                {
                    if(pclass == AbilityClass::Smuggling)
                    {
                        raceCh->PermStats.Lck = 20;
                        sprintf(buf2, "%-3d  &B| &C", GetMaxAbilityLevel(raceCh, AbilityClass(iC2)));
                        raceCh->PermStats.Lck = 3;
                    }
                    else
                    {
                        sprintf(buf2, "%-3d+ &B| &C", GetMaxAbilityLevel(raceCh, AbilityClass(iC2)));
                    }
                }
                else
                {
                    sprintf(buf2, "%-3d &B| &C", GetMaxAbilityLevel(raceCh, AbilityClass(iC2)));
                }
                
                strcat(buf, buf2);
            }

            ch->Echo("%s", buf);
        }
    }
}
