#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "plugins.hpp"

static const char *TinyGetAffectLocationName(int location);

void do_score(std::shared_ptr<Character> ch, std::string argument)
{
    char buf[MAX_STRING_LENGTH];
    int iLang = 0, drug = 0;

    if (IsNpc(ch))
    {
        do_oldscore(ch, argument);
        return;
    }

    SetCharacterColor(AT_SCORE, ch);

    ch->Echo("\r\n&CScore for %s.\r\n", ch->PCData->Title.c_str());
    SetCharacterColor(AT_SCORE, ch);

    if ( GetTrustLevel( ch ) != ch->TopLevel() )
        ch->Echo("&cYou are trusted at level &C%d.\r\n", GetTrustLevel( ch ) );

    ch->Echo("&C----------------------------------------------------------------------------\r\n");

    ch->Echo("&cRace: %-17.10s                &cLog In:  &C%s\r",
             Capitalize(GetCharacterRace(ch)).c_str(),
             ( IsNpc(ch) ? "(null)" : ctime(&(ch->PCData->Logon)) ) );

    ch->Echo("&cHitroll: &C%-2.2d  &cDamroll: &C%-2.2d   &cArmor: &C%-4d        &cSaved:  &C%s\r",
             GetHitRoll(ch), GetDamageRoll(ch), GetArmorClass(ch),
             (ch->PCData && ch->PCData->SaveTime) ? ctime(&(ch->PCData->SaveTime)) : "no\n" );

    ch->Echo("&cAlign: &C%-5d    &cWimpy: &C%-3d                    &cTime:   &C%s\r",
             ch->Alignment, ch->Wimpy  , ctime(&current_time) );

    if ( IsJedi( ch ) || IsImmortal(ch) )
        ch->Echo("&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d     &cForce: &C%d &cof &C%d\r\n",
                 ch->HitPoints.Current, ch->HitPoints.Max,
                 ch->Fatigue.Current, ch->Fatigue.Max,
                 ch->Mana.Current, ch->Mana.Max );
    else
        ch->Echo("&cHit Points: &C%d &cof &C%d     &cMove: &C%d &cof &C%d\r\n",
                 ch->HitPoints.Current, ch->HitPoints.Max,
                 ch->Fatigue.Current, ch->Fatigue.Max );

    ch->Echo("&cStr: &C%2d  &cDex: &C%2d  &cCon: &C%2d  &cInt: &C%2d  &cWis: &C%2d  &cCha: &C%2d  &cLck: &C??  &cFrc: &C??\r\n",
             GetCurrentStrength(ch), GetCurrentDexterity(ch),GetCurrentConstitution(ch),GetCurrentIntelligence(ch),GetCurrentWisdom(ch),GetCurrentCharisma(ch));

    ch->Echo("&C----------------------------------------------------------------------------\r\n");

    for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
    {
        if(AbilityClass(ability) == AbilityClass::Commando)
        {
            continue;
        }
        else if(AbilityClass(ability) != AbilityClass::Force || IsJedi(ch) )
        {
            char maxbuf[MAX_STRING_LENGTH] = {'\0'};

            if(AbilityClass(ability) == AbilityClass::Force)
            {
                sprintf(maxbuf, "%s", "???");
            }
            else
            {
                sprintf(maxbuf, "%d", GetMaxAbilityLevel(ch, AbilityClass(ability)));
            }

            ch->Echo("&c%-15s   &CLevel: %-3d   Max: %-3s   Exp: %-10ld   Next: %-10ld\r\n",
                     Capitalize(AbilityName[ability]).c_str(),
                     GetAbilityLevel(ch, AbilityClass(ability)), maxbuf,
                     GetAbilityXP(ch, AbilityClass(ability)),
                     GetRequiredXpForLevel(GetAbilityLevel(ch, AbilityClass(ability)) + 1));
        }
        else
        {
            ch->Echo("&c%-15s   &CLevel: %-3d   Max: ???   Exp: ???          Next: ???\r\n",
                     Capitalize(AbilityName[ability]).c_str(),
                     GetAbilityLevel(ch, AbilityClass(ability)));
        }
    }

    ch->Echo("&C----------------------------------------------------------------------------\r\n");
    ch->Echo("&cCREDITS: &C%-10d   &cBANK: &C%-10ld    &cPkills: &C%-5.5d   &cMkills: &C%-5.5d\r\n",
             ch->Gold, ch->PCData->Bank, ch->PCData->PKills, ch->PCData->MKills);

    ch->Echo("&cWeight: &C%5.5d &c(&Cmax %7.7d&c)    Items: &C%5.5d &c(&Cmax %5.5d&c)\r\n",
             ch->CarryWeight, GetCarryCapacityWeight(ch),
             ch->CarryNumber, GetCarryCapacityNumber(ch));

    ch->Echo("&cAutoExit(&C%c&c)  AutoLoot(&C%c&c)  Autosac(&C%c&c)\r\n",
             ch->Flags.test(Flag::Plr::Autoexits) ? '*' : ' ',
             ch->Flags.test(Flag::Plr::Autoloot) ? '*' : ' ',
             ch->Flags.test(Flag::Plr::Autosac) ? '*' : ' ');

    switch (ch->Position)
    {
    case POS_DEAD:
        sprintf(buf, "&CYou are slowly decomposing. ");
        break;

    case POS_MORTAL:
        sprintf(buf, "&CYou are mortally wounded. ");
        break;

    case POS_INCAP:
        sprintf(buf, "&CYou are incapacitated. ");
        break;

    case POS_STUNNED:
        sprintf(buf, "&CYou are stunned. ");
        break;

    case POS_SLEEPING:
        sprintf(buf, "&CYou are sleeping. ");
        break;

    case POS_RESTING:
        sprintf(buf, "&CYou are resting. ");
        break;

    case POS_STANDING:
        sprintf(buf, "&CYou are standing. ");
        break;

    case POS_FIGHTING:
        sprintf(buf, "&CYou are fighting. " );
        break;

    case POS_MOUNTED:
        sprintf(buf, "&CYou are mounted. ");
        break;

    case POS_SITTING:
        sprintf(buf, "&CYou are sitting. ");
        break;

    default:
        break;
    }

    ch->Echo("%s", buf);

    if (!IsNpc(ch) && ch->PCData->Condition[COND_DRUNK] > 10)
        ch->Echo("&CYou are drunk.\r\n");

    if (!IsNpc(ch) && ch->PCData->Condition[COND_THIRST] == 0)
        ch->Echo("&CYou are in danger of dehydrating.\r\n");

    if (!IsNpc(ch) && ch->PCData->Condition[COND_FULL] == 0)
        ch->Echo("&CYou are starving to death.\r\n");

    if ( ch->Position != POS_SLEEPING )
        switch( ch->MentalState / 10 )
        {
        default:   ch->Echo( "&CYou're completely messed up!\r\n" );      break;
        case -10:  ch->Echo( "&CYou're barely conscious.\r\n" );  break;
        case  -9:  ch->Echo( "&CYou can barely keep your eyes open.\r\n" );       break;
        case  -8:  ch->Echo( "&CYou're extremely drowsy.\r\n" );  break;
        case  -7:  ch->Echo( "&CYou feel very unmotivated.\r\n" );        break;
        case  -6:  ch->Echo( "&CYou feel sedated.\r\n" );         break;
        case  -5:  ch->Echo( "&CYou feel sleepy.\r\n" );          break;
        case  -4:  ch->Echo( "&CYou feel tired.\r\n" );           break;
        case  -3:  ch->Echo( "&CYou could use a rest.\r\n" );             break;
        case  -2:  ch->Echo( "&CYou feel a little under the weather.\r\n" );      break;
        case  -1:  ch->Echo( "&CYou feel fine.\r\n" );            break;
        case   0:  ch->Echo( "&CYou feel great.\r\n" );           break;
        case   1:  ch->Echo( "&CYou feel energetic.\r\n" );       break;
        case   2:  ch->Echo( "&CYour mind is racing.\r\n" );      break;
        case   3:  ch->Echo( "&CYou can't think straight.\r\n" ); break;
        case   4:  ch->Echo( "&CYour mind is going 100 miles an hour.\r\n" );     break;
        case   5:  ch->Echo( "&CYou're high as a kite.\r\n" );    break;
        case   6:  ch->Echo( "&CYour mind and body are slipping apart.\r\n" );    break;
        case   7:  ch->Echo( "&CReality is slipping away.\r\n" ); break;
        case   8:  ch->Echo( "&CYou have no idea what is real, and what is not.\r\n" );   break;
        case   9:  ch->Echo( "&CYou feel immortal.\r\n" );        break;
        case  10:  ch->Echo( "&CYou are a Supreme Entity.\r\n" ); break;
        }
    else if ( ch->MentalState >45 )
        ch->Echo("&CYour sleep is filled with strange and vivid dreams.\r\n");
    else if ( ch->MentalState >25 )
        ch->Echo("&CYour sleep is uneasy.\r\n");
    else if ( ch->MentalState <-35 )
        ch->Echo("&CYou are deep in a much needed sleep.\r\n");
    else if ( ch->MentalState <-25 )
        ch->Echo("&CYou are in deep slumber.\r\n");

    if ( !IsNpc(ch) )
    {
        if ( !ch->PCData->AliasFocus.empty() )
        {
            sprintf( buf,
                     "&cYour current alias focus is : &C%s.\r\n",
                     ch->PCData->AliasFocus.c_str());
            ch->Echo("%s", buf);
        }
        else
            ch->Echo("&cYou have no current target.\r\n");
    }

    ch->Echo("&cSPICE Level/Addiction: &C");

    for ( drug = 0; drug <= 9; drug++ )
        if ( ch->PCData->DrugLevel[drug] > 0 || ch->PCData->DrugLevel[drug] > 0 )
        {
            ch->Echo("%s&c(&C%d&c/&C%d&c) ", GetSpiceTypeName(drug),
                     ch->PCData->DrugLevel[drug],
                     ch->PCData->Addiction[drug] );
        }

    ch->Echo("\r\n&cLanguages: &c");

    for ( iLang = 0; LanguageArray[iLang] != LANG_UNKNOWN; iLang++ )
        if ( CharacterKnowsLanguage( ch, LanguageArray[iLang], ch )
             ||  (IsNpc(ch) && ch->Speaks == 0) )
        {
            if(LanguageNames[iLang][0] == '_')
            {
                continue;
            }

            if ( LanguageArray[iLang] & ch->Speaking
                 ||  (IsNpc(ch) && !ch->Speaking) )
                SetCharacterColor( AT_RED, ch );

            ch->Echo("%s ", LanguageNames[iLang]);
            SetCharacterColor( AT_SCORE, ch );
        }

    ch->Echo("\r\n");
    ch->Echo("&cWANTED ON: &C%s\r\n",
             FlagString(ch->PCData->WantedOn, WantedFlags).c_str() );

    if ( !ch->PCData->Bestowments.empty() )
        ch->Echo( "&cYou are bestowed with the command(s): &C%s.\r\n",
                  ch->PCData->Bestowments.c_str() );

    if ( IsClanned( ch ) )
    {
        std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

        ch->Echo("&C----------------------------------------------------------------------------\r\n");
        ch->Echo("&cORGANIZATION: &C%-35s &cSALARY: &C%-10d    &cPkills/Deaths: &C%3.3d&c/&C%3.3d",
                 clan->Name.c_str(), ch->PCData->ClanInfo.Salary,
                 clan->PlayerKills, clan->PlayerDeaths) ;
        ch->Echo("\r\n");
    }

    if (IsImmortal(ch))
    {
        ch->Echo("&C----------------------------------------------------------------------------\r\n");
        ch->Echo("&cIMMORTAL DATA:  Wizinvis [&C%s&c]  Wizlevel (&C%d&c)\r\n",
                 ch->Flags.test(Flag::Plr::WizInvis) ? "X" : " ", ch->PCData->WizInvis );
        ch->Echo("&cBamfin:  &C%s\r\n", !ch->PCData->BamfIn.empty()
                 ? ch->PCData->BamfIn.c_str()
                 : FormatString("%s appears in a swirling mist.", ch->Name.c_str()).c_str());
        ch->Echo("&cBamfout: &C%s\r\n", !ch->PCData->BamfOut.empty()
                 ? ch->PCData->BamfOut.c_str()
                 : FormatString("%s leaves in a swirling mist.", ch->Name.c_str()).c_str());

        /* AreaLoaded info - Scryn 8/11*/
        if (ch->PCData->Build.Area)
        {
            ch->Echo("&cVnums:   Room (&C%-5.5ld &c- &C%-5.5ld&c)   Object (&C%-5.5ld &c- &C%-5.5ld&c)   Mob (&C%-5.5ld &c- &C%-5.5ld&c)\r\n",
                     ch->PCData->Build.Area->VnumRanges.Room.First, ch->PCData->Build.Area->VnumRanges.Room.Last,
                     ch->PCData->Build.Area->VnumRanges.Object.First, ch->PCData->Build.Area->VnumRanges.Object.Last,
                     ch->PCData->Build.Area->VnumRanges.Mob.First, ch->PCData->Build.Area->VnumRanges.Mob.Last);
        }

        if(ch->PCData->Build.Plugin)
        {
            auto plugin = ch->PCData->Build.Plugin;
            ch->Echo("&cPlugin:  &C%s &c(&C%s&c)\r\n",
                     plugin->Name().c_str(), plugin->Id().c_str());
        }
    }

    if (!ch->Affects().empty())
    {
        int i = 0;

        ch->Echo("&C----------------------------------------------------------------------------\r\n");
        ch->Echo("&cAFFECT DATA:                            &C");

        for(auto paf : ch->Affects())
        {
            auto sktmp = GetSkill(paf->Type);

            if ( sktmp == nullptr )
                continue;

            if (ch->TopLevel() < 20)
            {
                ch->Echo("&c[&C%-34.34s&c]    ", Capitalize(sktmp->Name).c_str());

                if (i == 0)
                    i = 1;

                if ((++i % 2) == 0)
                    ch->Echo("\r\n");
            }
            else
            {
                if (paf->Modifier == 0)
                    ch->Echo("&c[&C%-24.24s&c;&C%5d rds&c]    ",
                             Capitalize(sktmp->Name).c_str(),
                             paf->Duration);
                else
                    if (paf->Modifier > 999)
                        ch->Echo("&c[&C%-15.15s&c; &C%7.7s;%5d rds&c]    ",
                                 Capitalize(sktmp->Name).c_str(),
                                 TinyGetAffectLocationName(paf->Location),
                                 paf->Duration);
                    else
                        ch->Echo("&c[&C%-11.11s&c;&C%+-3.3d %7.7s&c;&C%5d rds&c]    ",
                                 Capitalize(sktmp->Name).c_str(),
                                 paf->Modifier,
                                 TinyGetAffectLocationName(paf->Location),
                                 paf->Duration);
                if (i == 0)
                    i = 1;
                if ((++i % 2) == 0)
                    ch->Echo("\r\n");
            }
        }
    }

    ch->Echo("\r\n");
}

static const char *TinyGetAffectLocationName(int location)
{
    switch (location) {
    case APPLY_NONE:              return "NIL";
    case APPLY_STR:                       return " STR  ";
    case APPLY_DEX:                       return " DEX  ";
    case APPLY_INT:                       return " INT  ";
    case APPLY_WIS:                       return " WIS  ";
    case APPLY_CON:                       return " CON  ";
    case APPLY_CHA:                       return " CHA  ";
    case APPLY_LCK:                       return " LCK  ";
    case APPLY_SEX:                       return " SEX  ";
    case APPLY_LEVEL:             return " LVL  ";
    case APPLY_AGE:                       return " AGE  ";
    case APPLY_MANA:              return " MANA ";
    case APPLY_HIT:                       return " HV   ";
    case APPLY_MOVE:              return " MOVE ";
    case APPLY_GOLD:              return " GOLD ";
    case APPLY_EXP:                       return " EXP  ";
    case APPLY_AC:                        return " AC   ";
    case APPLY_HITROLL:           return " HITRL";
    case APPLY_DAMROLL:           return " DAMRL";
    case APPLY_SAVING_POISON:     return "SV POI";
    case APPLY_SAVING_ROD:                return "SV ROD";
    case APPLY_SAVING_PARA:               return "SV PARA";
    case APPLY_SAVING_BREATH:     return "SV BRTH";
    case APPLY_SAVING_SPELL:      return "SV SPLL";
    case APPLY_HEIGHT:            return "HEIGHT";
    case APPLY_WEIGHT:            return "WEIGHT";
    case APPLY_AFFECT:            return "AFF BY";
    case APPLY_RESISTANT:         return "RESIST";
    case APPLY_IMMUNE:            return "IMMUNE";
    case APPLY_SUSCEPTIBLE:               return "SUSCEPT";
    case APPLY_WEAPONSPELL:               return " WEAPON";
    case APPLY_BACKSTAB:          return "BACKSTB";
    case APPLY_PICK:              return " PICK  ";
    case APPLY_TRACK:             return " TRACK ";
    case APPLY_STEAL:             return " STEAL ";
    case APPLY_SNEAK:             return " SNEAK ";
    case APPLY_HIDE:              return " HIDE  ";
    case APPLY_PALM:              return " PALM  ";
    case APPLY_DETRAP:            return " DETRAP";
    case APPLY_DODGE:             return " DODGE ";
    case APPLY_PEEK:              return " PEEK  ";
    case APPLY_SCAN:              return " SCAN  ";
    case APPLY_GOUGE:             return " GOUGE ";
    case APPLY_SEARCH:            return " SEARCH";
    case APPLY_MOUNT:             return " MOUNT ";
    case APPLY_DISARM:            return " DISARM";
    case APPLY_KICK:              return " KICK  ";
    case APPLY_PARRY:             return " PARRY ";
    case APPLY_BASH:              return " BASH  ";
    case APPLY_STUN:              return " STUN  ";
    case APPLY_PUNCH:             return " PUNCH ";
    case APPLY_CLIMB:             return " CLIMB ";
    case APPLY_GRIP:              return " GRIP  ";
    case APPLY_SCRIBE:            return " SCRIBE";
    case APPLY_BREW:              return " BREW  ";
    case APPLY_WEARSPELL:         return " WEAR  ";
    case APPLY_REMOVESPELL:               return " REMOVE";
    case APPLY_EMOTION:           return "EMOTION";
    case APPLY_MENTALSTATE:               return " MENTAL";
    case APPLY_STRIPSN:           return " DISPEL";
    case APPLY_REMOVE:            return " REMOVE";
    case APPLY_DIG:                       return " DIG   ";
    case APPLY_FULL:              return " HUNGER";
    case APPLY_THIRST:            return " THIRST";
    case APPLY_DRUNK:             return " DRUNK ";
    case APPLY_BLOOD:             return " BLOOD ";
    case APPLY_SNIPE:             return " SNIPE ";
    }

    Log->Bug("Affect_location_name: unknown location %d.", location);
    return "(?)";
}
