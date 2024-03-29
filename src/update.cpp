/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <cstdio>
#include <cstring>
#include <ctime>
#include <cmath>
#include <cassert>
#include <utility/random.hpp>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "arena.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "character.hpp"
#include "track.hpp"
#include "missile.hpp"
#include "clan.hpp"
#include "social.hpp"
#include "skill.hpp"
#include "spaceobject.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "race.hpp"
#include "exit.hpp"
#include "home.hpp"
#include "repos/shiprepository.hpp"
#include "repos/clanrepository.hpp"
#include "repos/planetrepository.hpp"
#include "repos/objectrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"
#include "timer.hpp"
#include "impscript/scriptscheduler.hpp"
#include "triggers.hpp"

 /*
  * Local functions.
  */
static int GainHitPoints(std::shared_ptr<Character> ch);
static int GainMana(std::shared_ptr<Character> ch);
static int GainMove(std::shared_ptr<Character> ch);
static void GainAddiction(std::shared_ptr<Character> ch);
static void MobileUpdate();
static void UpdateDruggedPlayers();
static void WeatherUpdate();
static void TaxUpdate();
static void ApplyBankInterest();
static void PaySalaries();
static void CharacterUpdate();
static void ObjectUpdate();
static void AggroUpdate();
static void CharacterCheck();
static void PerformRandomDrunkBehavior(std::shared_ptr<Character> ch);
static void SufferHallucinations(std::shared_ptr<Character> ch);
static void AuctionUpdate();
static void TeleportUpdate();

static int GetMaxCombatLevel(std::shared_ptr<Character> ch);
static int GetMaxPilotingLevel(std::shared_ptr<Character> ch);
static int GetMaxEngineeringLevel(std::shared_ptr<Character> ch);
static int GetMaxBountyHuntingLevel(std::shared_ptr<Character> ch);
static int GetMaxSmugglingLevel(std::shared_ptr<Character> ch);
static int GetMaxLeadershipLevel(std::shared_ptr<Character> ch);
static int GetMaxDiplomacyLevel(std::shared_ptr<Character> ch);
static int GetMaxForceLevel(std::shared_ptr<Character> ch);

static const char *const corpse_descs[] =
{
    "The corpse of %s will soon be gone.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here.",
    "The corpse of %s lies here."
};

static const char *const d_corpse_descs[] =
{
    "The shattered remains %s will soon be gone.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here.",
    "The shattered remains %s are here."
};

/*
 * Advancement stuff.
 */
int GetMaxAbilityLevel(std::shared_ptr<Character> ch, AbilityClass ability)
{
    int level = 0;

    if(IsNpc(ch))
    {
        return 100;
    }

    if(IsImmortal(ch) || ch->Race == RACE_GOD)
    {
        return MAX_ABILITY_LEVEL;
    }

    switch(ability)
    {
    case AbilityClass::Combat:
        level = GetMaxCombatLevel(ch);
        break;

    case AbilityClass::Piloting:
        level = GetMaxPilotingLevel(ch);
        break;

    case AbilityClass::Engineering:
        level = GetMaxEngineeringLevel(ch);
        break;

    case AbilityClass::Hunting:
        level = GetMaxBountyHuntingLevel(ch);
        break;

    case AbilityClass::Smuggling:
        level = GetMaxSmugglingLevel(ch);
        break;

    case AbilityClass::Leadership:
        level = GetMaxLeadershipLevel(ch);
        break;

    case AbilityClass::Diplomacy:
        level = GetMaxDiplomacyLevel(ch);
        break;

    case AbilityClass::Force:
        level = GetMaxForceLevel(ch);
        break;

    default:
        level = 0;
        break;
    }

    return level;
}

static int GetMaxCombatLevel(std::shared_ptr<Character> ch)
{
    int level = 0;
    int statbonus = ch->PermStats.Con + ch->PermStats.Dex + ch->PermStats.Str;

    switch(ch->Ability.Main)
    {
    case AbilityClass::Combat:
        level = 100;
        break;

    case AbilityClass::Force:
        level = 25;
        break;

    case AbilityClass::Hunting:
        level = 25;
        break;

    case AbilityClass::Commando:
        level = 50;
        break;

    default:
        level = 0;
        break;
    }

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Combat];
    level += statbonus;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxPilotingLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Piloting)
        level = 100;

    if(ch->Ability.Main == AbilityClass::Engineering)
        level = 25;

    if(ch->Ability.Main == AbilityClass::Hunting)
        level = 25;

    if(ch->Ability.Main == AbilityClass::Smuggling)
        level = 50;

    if(ch->Ability.Main == AbilityClass::Force)
        level = 25;

    if(ch->Ability.Main == AbilityClass::Commando)
        level = 25;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Piloting];
    level += ch->PermStats.Dex * 2;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxEngineeringLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Engineering)
        level = 100;

    if(ch->Ability.Main == AbilityClass::Piloting)
        level = 20;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Engineering];
    level += ch->PermStats.Int * 2;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxBountyHuntingLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Hunting)
        level = 100;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Hunting];

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxSmugglingLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Smuggling)
        level = 100;

    if(ch->Ability.Main == AbilityClass::Piloting)
        level = 20;

    if(ch->Ability.Main == AbilityClass::Engineering)
        level = 25;

    if(ch->Ability.Main == AbilityClass::Commando)
        level = 50;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Smuggling];
    level += ch->PermStats.Lck * 2;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxLeadershipLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Leadership)
        level = 100;

    if(ch->Ability.Main == AbilityClass::Combat)
        level = 50;

    if(ch->Ability.Main == AbilityClass::Diplomacy)
        level = 50;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Leadership];
    level += ch->PermStats.Wis + ch->PermStats.Cha + ch->PermStats.Int;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxDiplomacyLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Diplomacy)
        level = 100;

    if(ch->Ability.Main == AbilityClass::Piloting)
        level = 10;

    if(ch->Ability.Main == AbilityClass::Leadership)
        level = 50;

    level += RaceTable[ch->Race].AbilityMod[(int)AbilityClass::Diplomacy];
    level += ch->PermStats.Cha * 3;

    return urange(1, level, MAX_ABILITY_LEVEL);
}

static int GetMaxForceLevel(std::shared_ptr<Character> ch)
{
    int level = 0;

    if(ch->Ability.Main == AbilityClass::Force)
    {
        level = 20;
    }

    level += ch->PermStats.Frc * 5;

    return level;
}

void AdvanceLevel(std::shared_ptr<Character> ch, AbilityClass ability)
{
    if(ch->TopLevel() < GetAbilityLevel(ch, ability) && ch->TopLevel() < 100)
    {
        ch->TopLevel(urange(1, GetAbilityLevel(ch, ability), 100));
    }

    if(IsJedi(ch) && ability == AbilityClass::Force)
    {
        ch->Mana.Max += 20;
    }

    if(!IsNpc(ch))
    {
        ch->Flags.reset(Flag::Plr::BoughtPet);
    }
}

void GainXP(std::shared_ptr<Character> ch, AbilityClass ability, long gain)
{
    if(IsNpc(ch))
    {
        return;
    }

    SetAbilityXP(ch, ability, umax(0, GetAbilityXP(ch, ability) + gain));

    if(!IsAuthed(ch)
       && GetAbilityXP(ch, ability) >= GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1))
    {
        ch->Echo("You can not ascend to a higher level until you are authorized.\r\n");
        SetAbilityXP(ch, ability, GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - 1);
        return;
    }

    while(GetAbilityXP(ch, ability) >= GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1))
    {
        short current_level = GetAbilityLevel(ch, ability);
        short new_level = 0;

        if(current_level >= GetMaxAbilityLevel(ch, ability))
        {
            SetAbilityXP(ch, ability, GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - 1);
            return;
        }

        SetCharacterColor(AT_WHITE + AT_BLINK, ch);
        new_level = current_level + 1;
        SetAbilityLevel(ch, ability, new_level);

        ch->Echo("You have now obtained %s level %d!\r\n",
                 AbilityName[(int)ability], GetAbilityLevel(ch, ability));
        AdvanceLevel(ch, ability);
    }

    UpdateClanMember(ch);
}

long LoseXP(std::shared_ptr<Character> ch, AbilityClass ability, long loss)
{
    if(IsNpc(ch))
    {
        return 0;
    }

    int current_exp = GetAbilityXP(ch, ability);
    int actual_loss = umax(loss, 0);
    int new_exp = current_exp - actual_loss;

    SetAbilityXP(ch, ability, new_exp);

    return actual_loss;
}

/*
 * Regeneration stuff.
 */
static int GainHitPoints(std::shared_ptr<Character> ch)
{
    int gain = 0;

    if(IsNpc(ch))
    {
        gain = ch->TopLevel();
    }
    else
    {
        gain = umin(5, ch->TopLevel());

        switch(ch->Position)
        {
        case POS_DEAD:
            return 0;

        case POS_MORTAL:
            return -25;

        case POS_INCAP:
            return -20;

        case POS_STUNNED:
            return GetCurrentConstitution(ch) * 2;

        case POS_SLEEPING:
            gain += GetCurrentConstitution(ch) * 1.5;
            break;

        case POS_RESTING:
            gain += GetCurrentConstitution(ch);
            break;

        default:
            break;
        }

        if(ch->PCData->Condition[COND_FULL] == 0)
        {
            gain /= 2;
        }

        if(ch->PCData->Condition[COND_THIRST] == 0)
        {
            gain /= 2;
        }
    }

    if(IsAffectedBy(ch, Flag::Affect::Poison))
    {
        gain /= 4;
    }

    if(ch->Race == RACE_TRANDOSHAN)
    {
        gain *= 2;
    }

    return umin(gain, ch->HitPoints.Max - ch->HitPoints.Current);
}

static int GainMana(std::shared_ptr<Character> ch)
{
    int gain = 0;

    if(IsNpc(ch))
    {
        gain = ch->TopLevel();
    }
    else
    {
        if(!IsJedi(ch))
        {
            return 0 - ch->Mana.Current;
        }

        gain = umin(5, GetAbilityLevel(ch, AbilityClass::Force) / 2);

        if(ch->Position < POS_SLEEPING)
        {
            return 0;
        }

        switch(ch->Position)
        {
        case POS_SLEEPING:
            gain += GetCurrentIntelligence(ch) * 3;
            break;

        case POS_RESTING:
            gain += GetCurrentIntelligence(ch) * 1.5;
            break;

        default:
            break;
        }

        if(ch->PCData->Condition[COND_FULL] == 0)
        {
            gain /= 2;
        }

        if(ch->PCData->Condition[COND_THIRST] == 0)
        {
            gain /= 2;
        }
    }

    if(IsAffectedBy(ch, Flag::Affect::Poison))
    {
        gain /= 4;
    }

    return umin(gain, ch->Mana.Max - ch->Mana.Current);
}

static int GainMove(std::shared_ptr<Character> ch)
{
    int gain = 0;

    if(IsNpc(ch))
    {
        gain = ch->TopLevel();
    }
    else
    {
        gain = umax(15, 2 * ch->TopLevel());

        switch(ch->Position)
        {
        case POS_DEAD:
            return 0;

        case POS_MORTAL:
            return -1;

        case POS_INCAP:
            return -1;

        case POS_STUNNED:
            return 1;

        case POS_SLEEPING:
            gain += GetCurrentDexterity(ch) * 2;
            break;

        case POS_RESTING:
            gain += GetCurrentDexterity(ch);
            break;

        default:
            break;
        }

        if(ch->PCData->Condition[COND_FULL] == 0)
        {
            gain /= 2;
        }

        if(ch->PCData->Condition[COND_THIRST] == 0)
        {
            gain /= 2;
        }
    }

    if(IsAffectedBy(ch, Flag::Affect::Poison))
    {
        gain /= 4;
    }

    return umin(gain, ch->Fatigue.Max - ch->Fatigue.Current);
}

static void AffectCharacterWithGlitterstim(std::shared_ptr<Character> ch, int drug)
{
    if(!IsAffectedBy(ch, Flag::Affect::Blind))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = gsn_blindness;
        af->Location = APPLY_AC;
        af->Modifier = 10;
        af->Duration = ch->PCData->Addiction[drug];
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Blind });
        AffectToCharacter(ch, af);
    }
}

static void AffectCharacterWithCarsanum(std::shared_ptr<Character> ch, int drug)
{
    if(!IsAffectedBy(ch, Flag::Affect::Weaken))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = -1;
        af->Location = APPLY_DAMROLL;
        af->Modifier = -10;
        af->Duration = ch->PCData->Addiction[drug];
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Weaken });
        AffectToCharacter(ch, af);
    }
}

static void AffectCharacterWithRyll(std::shared_ptr<Character> ch, int drug)
{
    if(!IsAffectedBy(ch, Flag::Affect::Weaken))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = -1;
        af->Location = APPLY_DEX;
        af->Modifier = -5;
        af->Duration = ch->PCData->Addiction[drug];
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Weaken });
        AffectToCharacter(ch, af);
    }
}

static void AffectCharacterWithAndris(std::shared_ptr<Character> ch, int drug)
{
    if(!IsAffectedBy(ch, Flag::Affect::Weaken))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();
        af->Type = -1;
        af->Location = APPLY_CON;
        af->Modifier = -5;
        af->Duration = ch->PCData->Addiction[drug];
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Weaken });
        AffectToCharacter(ch, af);
    }
}

static void GainAddiction(std::shared_ptr<Character> ch)
{
    short drug = 0;

    for(drug = 0; drug <= 9; drug++)
    {
        if(ch->PCData->Addiction[drug] < ch->PCData->DrugLevel[drug])
        {
            ch->PCData->Addiction[drug]++;
        }

        if(ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug] + 150)
        {
            switch(ch->PCData->Addiction[drug])
            {
            default:
                break;

            case SPICE_GLITTERSTIM:
                AffectCharacterWithGlitterstim(ch, drug);
                break;

            case SPICE_CARSANUM:
                AffectCharacterWithCarsanum(ch, drug);
                break;

            case SPICE_RYLL:
                AffectCharacterWithRyll(ch, drug);
                break;

            case SPICE_ANDRIS:
                AffectCharacterWithAndris(ch, drug);
                break;
            }
        }

        if(ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug] + 200)
        {
            ch->Echo("You feel like you are going to die. You NEED %s\r\n.",
                     GetSpiceTypeName(drug));
            WorsenMentalState(ch, 2);
            InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
        }
        else if(ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug] + 100)
        {
            ch->Echo("You need some %s.\r\n", GetSpiceTypeName(drug));
            WorsenMentalState(ch, 2);
        }
        else if(ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug] + 50)
        {
            ch->Echo("You really crave some %s.\r\n", GetSpiceTypeName(drug));
            WorsenMentalState(ch, 1);
        }
        else if(ch->PCData->Addiction[drug] > ch->PCData->DrugLevel[drug] + 25)
        {
            ch->Echo("Some more %s would feel quite nice.\r\n", GetSpiceTypeName(drug));
        }
        else if(ch->PCData->Addiction[drug] < ch->PCData->DrugLevel[drug] - 50)
        {
            Act(AT_POISON, "$n bends over and vomits.", ch, NULL, NULL, ActTarget::Room);
            Act(AT_POISON, "You vomit.", ch, NULL, NULL, ActTarget::Char);
            ch->PCData->DrugLevel[drug] -= 10;
        }

        if(ch->PCData->DrugLevel[drug] > 1)
        {
            ch->PCData->DrugLevel[drug] -= 2;
        }
        else if(ch->PCData->DrugLevel[drug] > 0)
        {
            ch->PCData->DrugLevel[drug] -= 1;
        }
        else if(ch->PCData->Addiction[drug] > 0 && ch->PCData->DrugLevel[drug] <= 0)
        {
            ch->PCData->Addiction[drug]--;
        }
    }
}

void GainCondition(std::shared_ptr<Character> ch, int iCond, int value)
{
    if(value == 0
       || IsNpc(ch)
       || IsImmortal(ch)
       || IsDroid(ch)
       || !IsAuthed(ch))
        return;

    if((iCond == COND_THIRST || iCond == COND_FULL)
       && SysData.DisableHunger)
    {
        return;
    }

    int condition = ch->PCData->Condition[iCond];
    ch->PCData->Condition[iCond] = urange(0, condition + value, 48);

    ch_ret retcode = rNONE;

    if(ch->PCData->Condition[iCond] == 0)
    {
        switch(iCond)
        {
        case COND_FULL:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_HUNGRY, ch);
                ch->Echo("You are STARVING!\r\n");
                WorsenMentalState(ch, 1);
                retcode = InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
            }
            break;

        case COND_THIRST:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_THIRSTY, ch);
                ch->Echo("You are DYING of THIRST!\r\n");
                WorsenMentalState(ch, 2);
                retcode = InflictDamage(ch, ch, 5, TYPE_UNDEFINED);
            }
            break;

        case COND_DRUNK:
            if(condition != 0)
            {
                SetCharacterColor(AT_SOBER, ch);
                ch->Echo("You are sober.\r\n");
            }

            retcode = rNONE;
            break;

        default:
            Log->Bug("Gain_condition: invalid condition type %d", iCond);
            retcode = rNONE;
            break;
        }
    }

    if(retcode != rNONE)
    {
        return;
    }

    if(ch->PCData->Condition[iCond] == 1)
    {
        switch(iCond)
        {
        case COND_FULL:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_HUNGRY, ch);
                ch->Echo("You are really hungry.\r\n");

                if(NumberBits(1) == 0)
                {
                    WorsenMentalState(ch, 1);
                }
            }
            break;

        case COND_THIRST:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_THIRSTY, ch);
                ch->Echo("You are really thirsty.\r\n");
                WorsenMentalState(ch, 1);
            }
            break;

        case COND_DRUNK:
            if(condition != 0)
            {
                SetCharacterColor(AT_SOBER, ch);
                ch->Echo("You are feeling a little less light headed.\r\n");
            }
            break;
        }
    }


    if(ch->PCData->Condition[iCond] == 2)
    {
        switch(iCond)
        {
        case COND_FULL:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_HUNGRY, ch);
                ch->Echo("You are hungry.\r\n");
            }

            break;

        case COND_THIRST:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_THIRSTY, ch);
                ch->Echo("You are thirsty.\r\n");
            }

            break;
        }
    }

    if(ch->PCData->Condition[iCond] == 3)
    {
        switch(iCond)
        {
        case COND_FULL:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_HUNGRY, ch);
                ch->Echo("You are a mite peckish.\r\n");
            }
            break;

        case COND_THIRST:
            if(ch->TopLevel() <= LEVEL_AVATAR)
            {
                SetCharacterColor(AT_THIRSTY, ch);
                ch->Echo("You could use a sip of something refreshing.\r\n");
            }
            break;
        }
    }
}

static void UpdateDruggedPlayers()
{
    for(std::shared_ptr<Character> ch = LastCharacter; ch; ch = gch_prev)
    {
        SetCurrentGlobalCharacter(ch);
        gch_prev = ch->Previous;

        if(!IsNpc(ch))
        {
            PerformRandomDrunkBehavior(ch);
            SufferHallucinations(ch);
        }
    }
}

static bool IsAnimatedCorpse(std::shared_ptr<Character> ch)
{
    return IsNpc(ch) && ch->Prototype->Vnum == MOB_VNUM_ANIMATED_CORPSE;
}

static void CleanUpAnimatedCorpse(std::shared_ptr<Character> ch)
{
    assert(IsAnimatedCorpse(ch));

    if(!ch->InRoom->Characters().empty())
    {
        Act(AT_MAGIC, "$n returns to the dust from whence $e came.",
            ch, NULL, NULL, ActTarget::Room);
    }

    ExtractCharacter(ch, true);
}

static bool IsHunting(std::shared_ptr<Character> ch)
{
    return IsNpc(ch) && !ch->Flags.test(Flag::Mob::Running)
        && !ch->Flags.test(Flag::Mob::Sentinel)
        && !IsFighting(ch) && ch->HHF.Hunting;
}

static void UpdateHunt(std::shared_ptr<Character> ch)
{
    assert(IsHunting(ch));

    if(ch->TopLevel() < 20)
    {
        SetWaitState(ch, 6 * PULSE_PER_SECOND);
    }
    else if(ch->TopLevel() < 40)
    {
        SetWaitState(ch, 5 * PULSE_PER_SECOND);
    }
    else if(ch->TopLevel() < 60)
    {
        SetWaitState(ch, 4 * PULSE_PER_SECOND);
    }
    else if(ch->TopLevel() < 80)
    {
        SetWaitState(ch, 3 * PULSE_PER_SECOND);
    }
    else if(ch->TopLevel() < 100)
    {
        SetWaitState(ch, 2 * PULSE_PER_SECOND);
    }
    else
    {
        SetWaitState(ch, 1 * PULSE_PER_SECOND);
    }

    HuntVictim(ch);
}

static bool IsSentinelWhoIsReadyToReturn(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && !IsFighting(ch) && !ch->HHF.Hunting
        && !ch->Flags.test(Flag::Mob::Running)
        && ch->WasSentinel && ch->Position >= POS_STANDING;
}

static void ReturnSentinelToHome(std::shared_ptr<Character> ch)
{
    assert(IsSentinelWhoIsReadyToReturn(ch));

    Act(AT_ACTION, "$n leaves.", ch, NULL, NULL, ActTarget::Room);
    CharacterFromRoom(ch);
    CharacterToRoom(ch, ch->WasSentinel);
    Act(AT_ACTION, "$n arrives.", ch, NULL, NULL, ActTarget::Room);
    ch->Flags.set(Flag::Mob::Sentinel);
    ch->WasSentinel = nullptr;
}

static bool NpcShouldNotBeUpdated(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && (!ch->InRoom
            || IsAffectedBy(ch, Flag::Affect::Charm)
            || IsAffectedBy(ch, Flag::Affect::Paralysis));
}

static bool IsReadyToPerformSpecFun(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && !ch->Flags.test(Flag::Mob::Running)
        && ch->SpecFuns[0] != nullptr;
}

static bool TryPerformSpecFun(std::shared_ptr<Character> ch)
{
    assert(IsReadyToPerformSpecFun(ch));

    return ch->SpecFuns[0](ch);
}

static bool IsReadyToPerformSpecFun2(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && !ch->Flags.test(Flag::Mob::Running)
        && ch->SpecFuns[1] != nullptr;
}

static bool TryPerformSpecFun2(std::shared_ptr<Character> ch)
{
    assert(IsReadyToPerformSpecFun2(ch));

    return ch->SpecFuns[1](ch);
}

static bool MobHasScriptTrigger(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && IsBitSet(ch->Prototype->mprog.progtypes, SCRIPT_PROG);
}

static bool MobShouldScavenge(std::shared_ptr<Character> ch)
{
    return IsNpc(ch)
        && ch->Flags.test(Flag::Mob::Scavenger)
        && !ch->InRoom->Objects().empty()
        && NumberBits(2) == 0;
}

static void PerformScavenging(std::shared_ptr<Character> ch)
{
    std::shared_ptr<Object> obj_best;
    int max = 1;

    for(auto obj : ch->InRoom->Objects())
    {
        if(obj->WearFlags.test(Flag::Wear::Take)
           && obj->Cost > max
           && !obj->Flags.test(Flag::Obj::Burried))
        {
            obj_best = obj;
            max = obj->Cost;
        }
    }

    if(obj_best)
    {
        ObjectFromRoom(obj_best);
        ObjectToCharacter(obj_best, ch);
        Act(AT_ACTION, "$n gets $p.", ch, obj_best, nullptr, ActTarget::Room);
    }
}

static bool MobShouldWander(std::shared_ptr<Character> ch, DirectionType door)
{
    std::shared_ptr<Exit> pexit = GetExit(ch->InRoom, door);

    return IsNpc(ch)
        && !ch->Flags.test(Flag::Mob::Running)
        && !ch->Flags.test(Flag::Mob::Sentinel)
        && !ch->Flags.test(Flag::Mob::Prototype)
        && pexit != nullptr
        && !pexit->Flags.test(Flag::Exit::Closed)
        && !pexit->ToRoom->Flags.test(Flag::Room::NoMob)
        && (!ch->Flags.test(Flag::Mob::StayArea)
            || pexit->ToRoom->Area == ch->InRoom->Area);
}

static bool MobShouldFlee(std::shared_ptr<Character> ch, DirectionType door)
{
    std::shared_ptr<Exit> pexit = GetExit(ch->InRoom, door);

    return ch->HitPoints.Current < ch->HitPoints.Max / 2
        && door < DIR_SOMEWHERE
        &&pexit != nullptr
        && pexit->ToRoom
        && !pexit->Flags.test(Flag::Exit::Closed)
        && !pexit->ToRoom->Flags.test(Flag::Room::NoMob);
}

static void PerformFlee(std::shared_ptr<Character> ch, DirectionType door)
{
    bool found = false;

    for(std::shared_ptr<Character> rch : ch->InRoom->Characters())
    {
        if(IsFearing(ch, rch))
        {
            std::string buf;

            switch(NumberBits(2))
            {
            case 0:
                buf = FormatString("Get away from me, %s!", rch->Name.c_str());
                break;

            case 1:
                buf = FormatString("Leave me be, %s!", rch->Name.c_str());
                break;

            case 2:
                buf = FormatString("%s is trying to kill me! Help!", rch->Name.c_str());
                break;

            case 3:
                buf = FormatString("Someone save me from %s!", rch->Name.c_str());
                break;
            }

            do_yell(ch, buf);
            found = true;
            break;
        }
    }

    if(found)
    {
        std::shared_ptr<Exit> pexit = GetExit(ch->InRoom, door);
        MoveCharacter(ch, pexit);
    }
}

/*
 * Mob autonomous action.
 * This function takes 25% to 35% of ALL Mud cpu time.
 */
static void MobileUpdate()
{
    /* Examine all mobs. */
    for(std::shared_ptr<Character> ch = LastCharacter; ch; ch = gch_prev)
    {
        SetCurrentGlobalCharacter(ch);
        gch_prev = ch->Previous;

        if(!IsNpc(ch))
        {
            continue;
        }

        if(NpcShouldNotBeUpdated(ch))
        {
            continue;
        }

        if(IsAnimatedCorpse(ch) && !IsAffectedBy(ch, Flag::Affect::Charm))
        {
            CleanUpAnimatedCorpse(ch);
            continue;
        }

        if(IsHunting(ch))
        {
            UpdateHunt(ch);
            continue;
        }
        else if(IsSentinelWhoIsReadyToReturn(ch))
        {
            ReturnSentinelToHome(ch);
        }

        /* Examine call for special procedure */
        if(IsReadyToPerformSpecFun(ch))
        {
            bool specFunWasPerformed = TryPerformSpecFun(ch);

            if(specFunWasPerformed)
            {
                continue;
            }

            if(CharacterDiedRecently(ch))
            {
                continue;
            }
        }

        if(IsReadyToPerformSpecFun2(ch))
        {
            bool specFun2WasPerformed = TryPerformSpecFun2(ch);

            if(specFun2WasPerformed)
            {
                continue;
            }

            if(CharacterDiedRecently(ch))
            {
                continue;
            }
        }

        /* Check for mudprogram script on mob */
        if(MobHasScriptTrigger(ch))
        {
            MobProgScriptTrigger(ch);
            continue;
        }

        if(ch != cur_char)
        {
            Log->Bug("%s: ch != cur_char after spec_fun", __FUNCTION__);
            continue;
        }

        /* That's all for sleeping / busy monster */
        if(ch->Position != POS_STANDING)
        {
            continue;
        }

        if(ch->Flags.test(Flag::Mob::Mounted))
        {
            if(ch->Flags.test(Flag::Mob::Aggressive))
            {
                do_emote(ch, "snarls and growls.");
            }

            continue;
        }

        if(ch->InRoom->Flags.test(Flag::Room::Safe)
           && ch->Flags.test(Flag::Mob::Aggressive))
        {
            do_emote(ch, "glares around and snarls.");
        }

        /* MOBprogram random trigger */
        if(ch->InRoom->Area->NumberOfPlayers > 0)
        {
            MobProgRandomTrigger(ch);

            if(CharacterDiedRecently(ch))
            {
                continue;
            }

            if(ch->Position < POS_STANDING)
            {
                continue;
            }
        }

        /* MOBprogram hour trigger: do something for an hour */
        MobProgHourTrigger(ch);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        RoomProgHourTrigger(ch);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        if(ch->Position < POS_STANDING)
        {
            continue;
        }

        /* Scavenge */
        if(MobShouldScavenge(ch))
        {
            PerformScavenging(ch);
        }

        DirectionType door = (DirectionType)NumberBits(5);

        /* Wander */
        if(MobShouldWander(ch, door))
        {
            std::shared_ptr<Exit> pexit = GetExit(ch->InRoom, door);
            ch_ret retcode = MoveCharacter(ch, pexit);

            /* If ch changes position due
               to it's or someother mob's
               movement via MOBProgs,
               continue - Kahn */
            if(CharacterDiedRecently(ch))
            {
                continue;
            }

            if(retcode != rNONE || ch->Flags.test(Flag::Mob::Sentinel)
               || ch->Position < POS_STANDING)
            {
                continue;
            }
        }

        door = (DirectionType)NumberBits(4);

        /* Flee */
        if(MobShouldFlee(ch, door))
        {
            PerformFlee(ch, door);
        }
    }
}

static void TaxUpdate()
{
    for(auto planet : Planets)
    {
        std::shared_ptr<Clan> clan = planet->GovernedBy;

        if(clan != NULL)
        {
            int numberOfSubclans = clan->Subclans().size();

            if(numberOfSubclans > 0)
            {
                for(const auto &guild : Clans)
                {
                    guild->Funds += GetTaxes(planet) / 1440 / numberOfSubclans;
                    Clans->Save(guild);
                }

                clan->Funds += GetTaxes(planet) / 1440;
                Clans->Save(clan);
            }
            else
            {
                clan->Funds += GetTaxes(planet) / 720;
                Clans->Save(clan);
            }

            Planets->Save(planet);
        }
    }
}

static void ApplyBankInterest()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        /* Interest */
        ch->PCData->Bank *= 1.0071428571428571;
    }
}

#include "repos/playerrepository.hpp"

static void PaySalaries()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        auto clanInfo = ch->PCData->ClanInfo;

        if(clanInfo.Salary > 0
           && clanInfo.Clan
           && clanInfo.Clan->Funds >= clanInfo.Salary)
        {
            ch->PCData->Bank += clanInfo.Salary;
            clanInfo.Clan->Funds -= clanInfo.Salary;
        }
    }
}

/*
 * Update the weather.
 */
static void WeatherUpdate()
{
    char buf[MAX_STRING_LENGTH] = { '\0' };
    int diff = 0;
    short AT_TEMP = AT_PLAIN;

    switch(++time_info.Hour)
    {
    case 5:
        weather_info.Sunlight = SunPosition::Light;
        strcat(buf, "The day has begun.");
        AT_TEMP = AT_YELLOW;
        break;

    case 6:
        weather_info.Sunlight = SunPosition::Rise;
        strcat(buf, "The sun rises in the east.");
        AT_TEMP = AT_ORANGE;
        break;

    case 12:
        weather_info.Sunlight = SunPosition::Light;
        strcat(buf, "It's noon.");
        AT_TEMP = AT_YELLOW;
        break;

    case 19:
        weather_info.Sunlight = SunPosition::Set;
        strcat(buf, "The sun slowly disappears in the west.");
        AT_TEMP = AT_BLOOD;
        break;

    case 20:
        weather_info.Sunlight = SunPosition::Dark;
        strcat(buf, "The night has begun.");
        AT_TEMP = AT_DGREY;
        break;

    case 24:
        time_info.Hour = 0;
        time_info.Day++;
        break;
    }

    if(time_info.Day >= 30)
    {
        time_info.Day = 0;
        time_info.Month++;
    }

    if(time_info.Month >= 17)
    {
        time_info.Month = 0;
        time_info.Year++;
    }

    if(!IsNullOrEmpty(buf))
    {
        for(std::shared_ptr<Character> ch : PlayerCharacters)
        {
            if(IS_OUTSIDE(ch)
               && IsAwake(ch)
               && ch->InRoom != nullptr
               && ch->InRoom->Sector != SectorType::Underwater
               && ch->InRoom->Sector != SectorType::Oceanfloor
               && ch->InRoom->Sector != SectorType::Underground)
            {
                Act(AT_TEMP, buf, ch, nullptr, nullptr, ActTarget::Char);
            }
        }

        buf[0] = '\0';
    }

    /*
     * Weather change.
     */
    if(time_info.Month >= 9 && time_info.Month <= 16)
    {
        diff = weather_info.Mmhg > 985 ? -2 : 2;
    }
    else
    {
        diff = weather_info.Mmhg > 1015 ? -2 : 2;
    }

    weather_info.Change += diff * RollDice(1, 4) + RollDice(2, 6) - RollDice(2, 6);
    weather_info.Change = umax(weather_info.Change, -12);
    weather_info.Change = umin(weather_info.Change, 12);

    weather_info.Mmhg += weather_info.Change;
    weather_info.Mmhg = umax(weather_info.Mmhg, 960);
    weather_info.Mmhg = umin(weather_info.Mmhg, 1040);

    AT_TEMP = AT_GREY;

    switch(weather_info.Sky)
    {
    default:
        Log->Bug("%s: bad sky %d.", __FUNCTION__, (int)weather_info.Sky);
        weather_info.Sky = SkyCondition::Cloudless;
        break;

    case SkyCondition::Cloudless:
        if(weather_info.Mmhg < 990
           || (weather_info.Mmhg < 1010 && NumberBits(2) == 0))
        {
            strcat(buf, "The sky is getting cloudy.");
            weather_info.Sky = SkyCondition::Cloudy;
            AT_TEMP = AT_GREY;
        }
        break;

    case SkyCondition::Cloudy:
        if(weather_info.Mmhg < 970
           || (weather_info.Mmhg < 990 && NumberBits(2) == 0))
        {
            strcat(buf, "It starts to rain.");
            weather_info.Sky = SkyCondition::Raining;
            AT_TEMP = AT_BLUE;
        }

        if(weather_info.Mmhg > 1030 && NumberBits(2) == 0)
        {
            strcat(buf, "The clouds disappear.");
            weather_info.Sky = SkyCondition::Cloudless;
            AT_TEMP = AT_WHITE;
        }
        break;

    case SkyCondition::Raining:
        if(weather_info.Mmhg < 970 && NumberBits(2) == 0)
        {
            strcat(buf, "Lightning flashes in the sky.");
            weather_info.Sky = SkyCondition::Lightning;
            AT_TEMP = AT_YELLOW;
        }

        if(weather_info.Mmhg > 1030
           || (weather_info.Mmhg > 1010 && NumberBits(2) == 0))
        {
            strcat(buf, "The rain stopped.");
            weather_info.Sky = SkyCondition::Cloudy;
            AT_TEMP = AT_WHITE;
        }
        break;

    case SkyCondition::Lightning:
        if(weather_info.Mmhg > 1010
           || (weather_info.Mmhg > 990 && NumberBits(2) == 0))
        {
            strcat(buf, "The lightning has stopped.");
            weather_info.Sky = SkyCondition::Raining;
            AT_TEMP = AT_GREY;
            break;
        }
        break;
    }

    if(!IsNullOrEmpty(buf))
    {
        for(std::shared_ptr<Character> ch : PlayerCharacters)
        {
            if(IS_OUTSIDE(ch)
               && IsAwake(ch)
               && ch->InRoom != nullptr
               && ch->InRoom->Sector != SectorType::Underwater
               && ch->InRoom->Sector != SectorType::Oceanfloor
               && ch->InRoom->Sector != SectorType::Underground)
            {
                Act(AT_TEMP, buf, ch, nullptr, nullptr, ActTarget::Char);
            }
        }
    }
}

static void SanitizeAlignment(std::shared_ptr<Character> ch)
{
    if(ch->Alignment < -1000)
    {
        ch->Alignment = -1000;
    }

    if(ch->Alignment > 1000)
    {
        ch->Alignment = 1000;
    }
}

static void AutosavePlayerCharacters()
{
    short save_count = 0;

    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(SysData.SaveFlags.test(Flag::AutoSave::Auto)
           && IsAuthed(ch)
           && current_time - ch->PCData->SaveTime > (SysData.SaveFrequency * 60)
           && ++save_count < 10) // save max of 10 per tick
        {
            PlayerCharacters->Save(ch);
        }
    }
}

static std::shared_ptr<Room> GetOwnedHome(std::shared_ptr<Character> ch,
                                          const std::vector<std::shared_ptr<Home>> &homes)
{
    auto home = Find(homes,
                     [ch](const auto &h)
                     {
                         return StrCmp(h->Owner(), ch->Name) == 0;
                     });

    if(home != nullptr)
    {
        return GetRoom(home->Vnum());
    }
    else
    {
        return nullptr;
    }
}

static std::shared_ptr<Room> GetRoomToQuitIn(std::shared_ptr<Character> ch)
{
    std::shared_ptr<Room> room;

    if(ch->InRoom != nullptr
       && CheckRoomFlag(ch->InRoom, Flag::Room::Hotel))
    {
        room = ch->InRoom;
    }
    else
    {
        auto homes = Homes->FindHomesForResident(ch->Name);

        if(!homes.empty())
        {
            room = GetOwnedHome(ch, homes);

            if(room == nullptr)
            {
                room = GetRoom(homes.front()->Vnum());
            }
        }
        else
        {
            room = GetRoom(ROOM_PLUOGUS_QUIT);
        }
    }

    return room;
}

static std::vector<std::shared_ptr<Character> > GetLinkdeadCharacters()
{
    std::vector<std::shared_ptr<Character> > linkdeads;

    for(auto ch = FirstCharacter; ch; ch = ch->Next)
    {
        if(!ch->IsNpc()
           && ++ch->IdleTimer > 15
           && ch->Desc == nullptr)
        {
            linkdeads.push_back(ch);
        }
    }

    return linkdeads;
}

static void KickOutLinkdeadCharacters()
{
    auto linkdead = GetLinkdeadCharacters();

    for(auto ch : linkdead)
    {
        auto room = GetRoomToQuitIn(ch);

        if(ch->InRoom)
        {
            CharacterFromRoom(ch);
        }

        CharacterToRoom(ch, room);
        ch->Position = POS_RESTING;
        ch->HitPoints.Current = umax(1, ch->HitPoints.Current);
        PlayerCharacters->Save(ch);
        do_quit(ch, "");
    }
}

static void GainAddictionsForPlayerCharacters()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        GainAddiction(ch);
    }
}

static void WorsenMentalStateForPlayerCharacters()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->TopLevel() < LEVEL_IMMORTAL && ch->PCData->Condition[COND_DRUNK] > 8)
        {
            WorsenMentalState(ch, ch->PCData->Condition[COND_DRUNK] / 8);
        }
    }
}

static void ImproveConditionIfNotThirsty()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->PCData->Condition[COND_THIRST] > 1)
        {
            switch(ch->Position)
            {
            case POS_SLEEPING:
                ImproveMentalState(ch, 5);
                break;

            case POS_RESTING:
                ImproveMentalState(ch, 3);
                break;

            case POS_SITTING:
            case POS_MOUNTED:
                ImproveMentalState(ch, 2);
                break;

            case POS_STANDING:
                ImproveMentalState(ch, 1);
                break;

            case POS_FIGHTING:
                if(NumberBits(2) == 0)
                {
                    ImproveMentalState(ch, 1);
                }

                break;

            default:
                break;
            }
        }
    }
}

static void ImproveConditionIfNotHungry()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->PCData->Condition[COND_FULL] > 1)
        {
            switch(ch->Position)
            {
            case POS_SLEEPING:
                ImproveMentalState(ch, 4);
                break;

            case POS_RESTING:
                ImproveMentalState(ch, 3);
                break;

            case POS_SITTING:
            case POS_MOUNTED:
                ImproveMentalState(ch, 2);
                break;

            case POS_STANDING:
                ImproveMentalState(ch, 1);
                break;

            case POS_FIGHTING:
                if(NumberBits(2) == 0)
                {
                    ImproveMentalState(ch, 1);
                }
                break;

            default:
                break;
            }
        }
    }
}

static void TickdownLightSources()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->TopLevel() < LEVEL_IMMORTAL)
        {
            auto obj = GetEquipmentOnCharacter(ch, WEAR_LIGHT);

            if(obj != nullptr
               && obj->ItemType == ITEM_LIGHT
               && obj->Value[OVAL_LIGHT_POWER] > 0)
            {
                if(--obj->Value[OVAL_LIGHT_POWER] == 0 && ch->InRoom)
                {
                    ch->InRoom->Light -= obj->Count;
                    Act(AT_ACTION, "$p goes out.", ch, obj, NULL, ActTarget::Room);
                    Act(AT_ACTION, "$p goes out.", ch, obj, NULL, ActTarget::Char);

                    if(obj->Serial == cur_obj)
                    {
                        global_objcode = rOBJ_EXPIRED;
                    }

                    ExtractObject(obj);
                }
            }
        }
    }
}

static void SoberUp()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        GainCondition(ch, COND_DRUNK, -1);
    }
}

static void IncreaseHunger()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->TopLevel() < LEVEL_IMMORTAL)
        {
            GainCondition(ch, COND_FULL, -1);
        }
    }
}

static void IncreaseThirst()
{
    for(std::shared_ptr<Character> ch : PlayerCharacters)
    {
        if(ch->TopLevel() < LEVEL_IMMORTAL
           && ch->InRoom != nullptr)
        {
            switch(ch->InRoom->Sector)
            {
            default:
                GainCondition(ch, COND_THIRST, -1);
                break;

            case SectorType::Desert:
                GainCondition(ch, COND_THIRST, -2);
                break;

            case SectorType::Underwater:
            case SectorType::Oceanfloor:
                if(NumberBits(1) == 0)
                {
                    GainCondition(ch, COND_THIRST, -1);
                }

                break;
            }
        }
    }
}

static void PlayerCharacterUpdate()
{
    KickOutLinkdeadCharacters();
    GainAddictionsForPlayerCharacters();
    WorsenMentalStateForPlayerCharacters();
    TickdownLightSources();
    ImproveConditionIfNotHungry();
    ImproveConditionIfNotThirsty();
    SoberUp();
    IncreaseHunger();
    IncreaseThirst();
    AutosavePlayerCharacters();
}

static void CheckReinforcementArrival(std::shared_ptr<Character> ch)
{
    if(ch->BackupWait > 0)
    {
        --ch->BackupWait;

        if(ch->BackupWait == 0)
        {
            AddReinforcements(ch);
        }
    }
}

/*
 * Update all chars, including mobs.
 * This function is performance sensitive.
 */
static void CharacterUpdate()
{
    std::shared_ptr<Character> ch = NULL;

    for(ch = LastCharacter; ch; ch = gch_prev)
    {
        gch_prev = ch->Previous;
        SetCurrentGlobalCharacter(ch);

        /*
         *  Do a room_prog rand check right off the bat
         *   if ch disappears (rprog might wax npc's), continue
         */
        if(!IsNpc(ch))
            RoomProgRandomTrigger(ch);

        if(CharacterDiedRecently(ch))
            continue;

        if(IsNpc(ch))
            MobProgTimeTrigger(ch);

        if(CharacterDiedRecently(ch))
            continue;

        RoomProgTimeTrigger(ch);

        if(CharacterDiedRecently(ch))
            continue;

        SanitizeAlignment(ch);

        if(ch->Position >= POS_STUNNED)
        {
            if(ch->HitPoints.Current < ch->HitPoints.Max)
                ch->HitPoints.Current += GainHitPoints(ch);

            if(ch->Mana.Current < ch->Mana.Max && IsJedi(ch))
                ch->Mana.Current += GainMana(ch);

            if(ch->Fatigue.Current < ch->Fatigue.Max)
                ch->Fatigue.Current += GainMove(ch);
        }

        if(ch->Position == POS_STUNNED)
            UpdatePosition(ch);

        if(!CharacterDiedRecently(ch))
        {
            /*
             * Careful with the damages here,
             *   MUST NOT refer to ch after damage taken,
             *   as it may be lethal damage (on NPC).
             */
            if(IsAffectedBy(ch, Flag::Affect::Poison))
            {
                Act(AT_POISON, "$n shivers and suffers.", ch, NULL, NULL, ActTarget::Room);
                Act(AT_POISON, "You shiver and suffer.", ch, NULL, NULL, ActTarget::Char);
                ch->MentalState = urange(20, ch->MentalState
                                         + 4, 100);
                InflictDamage(ch, ch, 6, gsn_poison);
            }
            else if(ch->Position == POS_INCAP)
            {
                InflictDamage(ch, ch, 1, TYPE_UNDEFINED);
            }
            else if(ch->Position == POS_MORTAL)
            {
                InflictDamage(ch, ch, 4, TYPE_UNDEFINED);
            }

            if(CharacterDiedRecently(ch))
            {
                continue;
            }

            if(ch->MentalState >= 30)
            {
                switch((ch->MentalState + 5) / 10)
                {
                case 3:
                    ch->Echo("You feel feverish.\r\n");
                    Act(AT_ACTION, "$n looks kind of out of it.", ch, NULL, NULL, ActTarget::Room);
                    break;

                case 4:
                    ch->Echo("You do not feel well at all.\r\n");
                    Act(AT_ACTION, "$n doesn't look too good.", ch, NULL, NULL, ActTarget::Room);
                    break;

                case 5:
                    ch->Echo("You need help!\r\n");
                    Act(AT_ACTION, "$n looks like $e could use your help.", ch, NULL, NULL, ActTarget::Room);
                    break;

                case 6:
                    ch->Echo("Seekest thou a cleric.\r\n");
                    Act(AT_ACTION, "Someone should fetch a healer for $n.",
                        ch, NULL, NULL, ActTarget::Room);
                    break;

                case 7:
                    ch->Echo("You feel reality slipping away...\r\n");
                    Act(AT_ACTION, "$n doesn't appear to be aware of what's going on.",
                        ch, NULL, NULL, ActTarget::Room);
                    break;

                case 8:
                    ch->Echo("You begin to understand... everything.\r\n");
                    Act(AT_ACTION, "$n starts ranting like a madman!", ch, NULL, NULL, ActTarget::Room);
                    break;

                case 9:
                    ch->Echo("You are ONE with the universe.\r\n");
                    Act(AT_ACTION, "$n is ranting on about 'the answer', 'ONE' and other mumbo-jumbo...", ch, NULL, NULL, ActTarget::Room);
                    break;

                case 10:
                    ch->Echo("You feel the end is near.\r\n");
                    Act(AT_ACTION, "$n is muttering and ranting in tongues...",
                        ch, NULL, NULL, ActTarget::Room);
                    break;
                }
            }

            if(ch->MentalState <= -30)
                switch((int)((abs(ch->MentalState) + 5) / 10))
                {
                case 10:
                    if(ch->Position > POS_SLEEPING)
                    {
                        if((ch->Position == POS_STANDING
                            || ch->Position < POS_FIGHTING)
                           && GetRandomPercent() + 10 < abs(ch->MentalState))
                        {
                            do_sleep(ch, "");
                        }
                        else
                        {
                            ch->Echo("You're barely conscious.\r\n");
                        }
                    }
                    break;

                case 9:
                    if(ch->Position > POS_SLEEPING)
                    {
                        if((ch->Position == POS_STANDING
                            || ch->Position < POS_FIGHTING)
                           && (GetRandomPercent() + 20) < abs(ch->MentalState))
                        {
                            do_sleep(ch, "");
                        }
                        else
                        {
                            ch->Echo("You can barely keep your eyes open.\r\n");
                        }
                    }
                    break;

                case 8:
                    if(ch->Position > POS_SLEEPING)
                    {
                        if(ch->Position < POS_SITTING
                           && (GetRandomPercent() + 30) < abs(ch->MentalState))
                        {
                            do_sleep(ch, "");
                        }
                        else
                        {
                            ch->Echo("You're extremely drowsy.\r\n");
                        }
                    }
                    break;

                case 7:
                    if(ch->Position > POS_RESTING)
                    {
                        ch->Echo("You feel very unmotivated.\r\n");
                    }
                    break;

                case 6:
                    if(ch->Position > POS_RESTING)
                    {
                        ch->Echo("You feel sedated.\r\n");
                    }
                    break;

                case 5:
                    if(ch->Position > POS_RESTING)
                    {
                        ch->Echo("You feel sleepy.\r\n");
                    }
                    break;

                case 4:
                    if(ch->Position > POS_RESTING)
                    {
                        ch->Echo("You feel tired.\r\n");
                    }
                    break;

                case 3:
                    if(ch->Position > POS_RESTING)
                    {
                        ch->Echo("You could use a rest.\r\n");
                    }
                    break;
                }

            CheckReinforcementArrival(ch);
        }
    }
}

/*
 * Update all objs.
 * This function is performance sensitive.
 */
static void ObjectUpdate()
{
    short AT_TEMP = 0;

    auto copyOfObjectList = Objects->Entities();

    for(auto obj : copyOfObjectList)
    {
        if(IsObjectExtracted(obj))
        {
            continue;
        }

        std::shared_ptr<Character> rch = NULL;
        const char *message = NULL;

        SetCurrentGlobalObject(obj);

        if(obj->CarriedBy)
        {
            ObjProgRandomTrigger(obj);
        }
        else if(obj->InRoom && obj->InRoom->Area->NumberOfPlayers > 0)
        {
            ObjProgRandomTrigger(obj);
        }

        if(IsObjectExtracted(obj))
        {
            continue;
        }

        if(obj->ItemType == ITEM_WEAPON && obj->CarriedBy
           && (obj->WearLoc == WEAR_WIELD || obj->WearLoc == WEAR_DUAL_WIELD)
           && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_BLASTER
           && obj->Value[OVAL_WEAPON_CHARGE] > 0
           && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_BOWCASTER
           && obj->Value[OVAL_WEAPON_TYPE] != WEAPON_FORCE_PIKE)
        {
            obj->Value[OVAL_WEAPON_CHARGE]--;

            if(obj->Value[OVAL_WEAPON_CHARGE] <= 0)
            {
                if(obj->Value[OVAL_WEAPON_TYPE] == WEAPON_LIGHTSABER)
                {
                    Act(AT_PLAIN, "$p fizzles and dies.", obj->CarriedBy, obj, NULL, ActTarget::Char);
                    Act(AT_PLAIN, "$n's lightsaber fizzles and dies.", obj->CarriedBy, NULL, NULL, ActTarget::Room);
                }
                else if(obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE)
                {
                    Act(AT_PLAIN, "$p stops vibrating.", obj->CarriedBy, obj, NULL, ActTarget::Char);
                }
            }
        }

        if(obj->ItemType == ITEM_PIPE)
        {
            if(IsBitSet(obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT))
            {
                if(--obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] <= 0)
                {
                    obj->Value[OVAL_PIPE_TOBACCO_AMOUNT] = 0;
                    RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT);
                }
                else if(IsBitSet(obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT))
                {
                    RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT);
                }
                else
                {
                    if(IsBitSet(obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT))
                    {
                        RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT);
                        RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT);
                    }
                    else
                    {
                        SetBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_GOINGOUT);
                    }
                }

                if(!IsBitSet(obj->Value[OVAL_PIPE_FLAGS], PIPE_LIT))
                {
                    SetBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_FULLOFASH);
                }
            }
            else
            {
                RemoveBit(obj->Value[OVAL_PIPE_FLAGS], PIPE_HOT);
            }
        }

        /* Corpse decay (npc corpses decay at 8 times the rate of pc corpses) - Narn */
        if(obj->ItemType == ITEM_CORPSE_PC || obj->ItemType == ITEM_CORPSE_NPC
           || obj->ItemType == ITEM_DROID_CORPSE)
        {
            short timerfrac = umax(1, obj->Timer - 1);

            if(obj->ItemType == ITEM_CORPSE_PC)
            {
                timerfrac = (int)(obj->Timer / 8 + 1);
            }

            if(obj->Timer > 0 && obj->Value[OVAL_CORPSE_DECAY] > timerfrac)
            {
                char buf[MAX_STRING_LENGTH];
                std::string name;
                std::string bufptr;

                bufptr = OneArgument(obj->ShortDescr, name);
                bufptr = OneArgument(bufptr, name);
                bufptr = OneArgument(bufptr, name);

                SeparateOneObjectFromGroup(obj);
                obj->Value[OVAL_CORPSE_DECAY] = timerfrac;

                if(obj->ItemType == ITEM_DROID_CORPSE)
                {
                    sprintf(buf, d_corpse_descs[umin(timerfrac - 1, 4)],
                            bufptr.c_str());
                }
                else
                {
                    sprintf(buf, corpse_descs[umin(timerfrac - 1, 4)],
                            Capitalize(bufptr).c_str());
                }

                obj->Description = buf;
            }
        }

        /* don't let inventory decay */
        if(obj->Flags.test(Flag::Obj::Inventory))
        {
            continue;
        }

        if(obj->ItemType == ITEM_GRENADE && obj->CarriedBy)
        {
            auto wield = GetEquipmentOnCharacter(obj->CarriedBy, WEAR_HOLD);

            if(wield == obj)
            {
                continue;
            }
        }

        if(obj->Timer > 0 && obj->Timer < 5 && obj->ItemType == ITEM_ARMOR)
        {
            if(obj->CarriedBy)
            {
                Act(AT_TEMP, "$p is almost dead.", obj->CarriedBy, obj, NULL, ActTarget::Char);
            }
        }

        if((obj->Timer <= 0 || --obj->Timer > 0))
        {
            if(obj->InRoom
               && obj->InRoom->Sector == SectorType::Air
               && obj->WearFlags.test(Flag::Wear::Take))
            {
                const auto &xit = Find(obj->InRoom->Exits(),
                                       [](auto ex)
                                       {
                                           return ex->Direction == DIR_DOWN;
                                       });

                if(xit == nullptr)
                {
                    continue;
                }

                auto new_room = xit->ToRoom;

                if(!obj->InRoom->Characters().empty())
                {
                    rch = obj->InRoom->Characters().front();
                    Act(AT_ACTION, "$p falls away.", rch, obj, NULL, ActTarget::Room);
                    Act(AT_ACTION, "$p falls away.", rch, obj, NULL, ActTarget::Char);
                }

                ObjectFromRoom(obj);
                ObjectToRoom(obj, new_room);

                if(!obj->InRoom->Characters().empty())
                {
                    rch = obj->InRoom->Characters().front();
                    Act(AT_ACTION, "$p floats by.", rch, obj, NULL, ActTarget::Room);
                    Act(AT_ACTION, "$p floats by.", rch, obj, NULL, ActTarget::Char);
                }
            }

            continue;
        }

        /* if we get this far, object's timer has expired. */

        AT_TEMP = AT_PLAIN;

        switch(obj->ItemType)
        {
        default:
            message = "$p has depleted itself.";
            AT_TEMP = AT_PLAIN;
            break;

        case ITEM_GRENADE:
            Explode(obj);
            return;
            break;

        case ITEM_PORTAL:
            message = "$p winks out of existence.";
            RemovePortal(obj);
            obj->ItemType = ITEM_TRASH;          /* so ExtractObject        */
            AT_TEMP = AT_MAGIC;                   /* doesn't RemovePortal */
            break;

        case ITEM_FOUNTAIN:
            message = "$p dries up.";
            AT_TEMP = AT_BLUE;
            break;

        case ITEM_CORPSE_NPC:
            message = "$p decays into dust and blows away.";
            AT_TEMP = AT_OBJECT;
            break;

        case ITEM_DROID_CORPSE:
            message = "$p rusts away into oblivion.";
            AT_TEMP = AT_OBJECT;
            break;

        case ITEM_CORPSE_PC:
            message = "$p decays into dust and is blown away...";
            AT_TEMP = AT_MAGIC;
            break;

        case ITEM_FOOD:
            message = "$p is devoured by a swarm of maggots.";
            AT_TEMP = AT_HUNGRY;
            break;

        case ITEM_BLOOD:
            message = "$p slowly seeps into the ground.";
            AT_TEMP = AT_BLOOD;
            break;

        case ITEM_BLOODSTAIN:
            message = "$p dries up into flakes and blows away.";
            AT_TEMP = AT_BLOOD;
            break;

        case ITEM_SCRAPS:
            message = "$p crumbles and decays into nothing.";
            AT_TEMP = AT_OBJECT;
            break;

        case ITEM_FIRE:
            if(obj->InRoom)
                --obj->InRoom->Light;

            message = "$p burns out.";
            AT_TEMP = AT_FIRE;
        }

        if(obj->CarriedBy)
        {
            Act(AT_TEMP, message, obj->CarriedBy, obj, NULL, ActTarget::Char);
        }
        else if(obj->InRoom
                && !obj->InRoom->Characters().empty()
                && !obj->Flags.test(Flag::Obj::Burried))
        {
            rch = obj->InRoom->Characters().front();
            Act(AT_TEMP, message, rch, obj, NULL, ActTarget::Room);
            Act(AT_TEMP, message, rch, obj, NULL, ActTarget::Char);
        }

        if(obj->Serial == cur_obj)
            global_objcode = rOBJ_EXPIRED;

        ExtractObject(obj);
    }
}

/*
 * Function to check important stuff happening to a player
 * This function should take about 5% of mud cpu time
 */
static void CharacterCheck()
{
    static int cnt = 0;

    cnt = (cnt + 1) % 2;

    for(std::shared_ptr<Character> ch = FirstCharacter, ch_next = nullptr; ch; ch = ch_next)
    {
        int retcode = rNONE;

        SetCurrentGlobalCharacter(ch);
        ch_next = ch->Next;
        CharacterFallIfNoFloor(ch, 0);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        if(IsNpc(ch))
        {
            if(cnt != 0)
            {
                continue;
            }

            /* running mobs       -Thoric */
            if(ch->Flags.test(Flag::Mob::Running))
            {
                if(!ch->Flags.test(Flag::Mob::Sentinel)
                   && !IsFighting(ch) && ch->HHF.Hunting)
                {
                    SetWaitState(ch, 2 * PULSE_VIOLENCE);
                    HuntVictim(ch);
                    continue;
                }

                if(ch->SpecFuns[0])
                {
                    if(ch->SpecFuns[0](ch))
                    {
                        continue;
                    }

                    if(CharacterDiedRecently(ch))
                    {
                        continue;
                    }
                }

                if(ch->SpecFuns[1])
                {
                    if(ch->SpecFuns[1](ch))
                    {
                        continue;
                    }

                    if(CharacterDiedRecently(ch))
                    {
                        continue;
                    }
                }

                DirectionType door = (DirectionType)NumberBits(4);
                std::shared_ptr<Exit> pexit = GetExit(ch->InRoom, door);

                if(!ch->Flags.test(Flag::Mob::Sentinel)
                   && !ch->Flags.test(Flag::Mob::Prototype)
                   && door < DIR_SOMEWHERE
                   && pexit != nullptr
                   && pexit->ToRoom
                   && !pexit->Flags.test(Flag::Exit::Closed)
                   && !pexit->ToRoom->Flags.test(Flag::Room::NoMob)
                   && (!ch->Flags.test(Flag::Mob::StayArea)
                       || pexit->ToRoom->Area == ch->InRoom->Area))
                {
                    retcode = MoveCharacter(ch, pexit);

                    if(CharacterDiedRecently(ch))
                    {
                        continue;
                    }

                    if(retcode != rNONE
                       || ch->Flags.test(Flag::Mob::Sentinel)
                       || ch->Position < POS_STANDING)
                    {
                        continue;
                    }
                }
            }

            continue;
        }
        else
        {
            if(ch->Mount
               && ch->InRoom != ch->Mount->InRoom)
            {
                ch->Mount->Flags.reset(Flag::Mob::Mounted);
                ch->Mount = nullptr;
                ch->Position = POS_STANDING;
                ch->Echo("No longer upon your mount, you fall to the ground...\r\nOUCH!\r\n");
            }

            if((ch->InRoom && ch->InRoom->Sector == SectorType::Underwater)
               || (ch->InRoom && ch->InRoom->Sector == SectorType::Oceanfloor))
            {
                if(!IsAffectedBy(ch, Flag::Affect::AquaBreath))
                {
                    if(GetTrustLevel(ch) < LEVEL_IMMORTAL)
                    {
                        int dam = GetRandomNumberFromRange(ch->HitPoints.Max / 50,
                                                           ch->HitPoints.Max / 30);
                        dam = umax(1, dam);

                        if(ch->HitPoints.Current <= 0)
                        {
                            dam = umin(10, dam);
                        }

                        if(NumberBits(3) == 0)
                        {
                            ch->Echo("You cough and choke as you try to breathe water!\r\n");
                        }

                        InflictDamage(ch, ch, dam, TYPE_UNDEFINED);
                    }
                }
            }

            if(CharacterDiedRecently(ch))
            {
                continue;
            }

            if(ch->InRoom
               && (ch->InRoom->Sector == SectorType::WaterNotSwimmable
                   || ch->InRoom->Sector == SectorType::WaterSwimmable))
            {
                if(!IsAffectedBy(ch, Flag::Affect::Flying)
                   && !IsAffectedBy(ch, Flag::Affect::Floating)
                   && !IsAffectedBy(ch, Flag::Affect::AquaBreath)
                   && !ch->Mount)
                {
                    if(!IsImmortal(ch))
                    {
                        if(ch->Fatigue.Current > 0)
                        {
                            ch->Fatigue.Current--;
                        }
                        else
                        {
                            int dam = GetRandomNumberFromRange(ch->HitPoints.Max / 50,
                                                               ch->HitPoints.Max / 30);
                            dam = umax(1, dam);

                            if(ch->HitPoints.Current <= 0)
                            {
                                dam = umin(10, dam);
                            }

                            if(NumberBits(3) == 0)
                            {
                                ch->Echo("Struggling with exhaustion, you choke on a mouthful of water.\r\n");
                            }

                            InflictDamage(ch, ch, dam, TYPE_UNDEFINED);
                        }
                    }
                }
            }
        }
    }
}

static bool WeaponCanBackstab(std::shared_ptr<Object> obj)
{
    return obj->Value[OVAL_WEAPON_TYPE] == WEAPON_FORCE_PIKE
        || obj->Value[OVAL_WEAPON_TYPE] == WEAPON_VIBRO_BLADE;
}

static bool PerformBackstab(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    auto obj = GetEquipmentOnCharacter(ch, WEAR_WIELD);

    if(!ch->Mount
       && obj != nullptr
       && WeaponCanBackstab(obj)
       && !IsFighting(victim)
       && victim->HitPoints.Current >= victim->HitPoints.Max)
    {
        SetWaitState(ch, SkillTable[gsn_backstab]->Beats);

        if(!IsAwake(victim)
           || GetRandomPercent() + 5 < ch->TopLevel())
        {
            global_retcode = HitMultipleTimes(ch, victim, gsn_backstab);
            return true;
        }
        else
        {
            global_retcode = InflictDamage(ch, victim, 0, gsn_backstab);
            return true;
        }
    }

    return true;
}

/*
 * Aggress.
 *
 * for each descriptor
 *     for each mob in room
 *         aggress on some random PC
 *
 * This function should take 5% to 10% of ALL mud cpu time.
 */
static void AggroUpdate()
{
    for(std::shared_ptr<Character> ch = FirstCharacter, wch_next; ch; ch = wch_next)
    {
        wch_next = ch->Next;

        if(!IsNpc(ch)
           || IsFighting(ch)
           || IsAffectedBy(ch, Flag::Affect::Charm)
           || !IsAwake(ch)
           || ch->Flags.test(Flag::Mob::Wimpy)
           || !ch->Flags.test(Flag::Mob::Aggressive)
           || ch->Flags.test(Flag::Mob::Mounted)
           || ch->InRoom->Flags.test(Flag::Room::Safe))
        {
            continue;
        }

        std::list<std::shared_ptr<Character> > charactersInRoom(RandomizeOrder(ch->InRoom->Characters()));

        for(std::shared_ptr<Character> wch : charactersInRoom)
        {
            if(IsHating(ch, wch))
            {
                FoundPrey(ch, wch);
                continue;
            }

            if(CharacterDiedRecently(wch)
               || wch->TopLevel() >= LEVEL_IMMORTAL
               || !wch->InRoom
               || !CanSeeCharacter(ch, wch))
            {
                continue;
            }

            if(wch->Flags.test(Flag::Mob::Aggressive))
            {
                continue;
            }

            std::shared_ptr<Character> victim = wch;

            if(HasTimer(victim, TimerType::RecentFight))
            {
                continue;
            }

            if(IsNpc(ch) && ch->AttackFlags.test(Flag::Attack::Backstab))
            {
                bool backstabPerformed = PerformBackstab(ch, victim);

                if(backstabPerformed)
                {
                    continue;
                }
            }

            global_retcode = HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
        }
    }
}

/*
 * drunk randoms        - Tricops
 * (Made part of mobile_update  -Thoric)
 */
static void PerformRandomDrunkBehavior(std::shared_ptr<Character> ch)
{
    std::shared_ptr<Character> rvch = nullptr;
    short drunk = 0;
    PositionType position = POS_DEAD;

    if(!ch)
    {
        return;
    }

    if(IsNpc(ch) || !ch->PCData || ch->PCData->Condition[COND_DRUNK] <= 0)
    {
        return;
    }

    if(GetRandomPercent() < 30)
    {
        return;
    }

    drunk = ch->PCData->Condition[COND_DRUNK];
    position = ch->Position;
    ch->Position = POS_STANDING;

    if(GetRandomPercent() < (2 * drunk / 20))
    {
        CheckSocial(ch, "burp", "");
    }
    else if(GetRandomPercent() < (2 * drunk / 20))
    {
        CheckSocial(ch, "hiccup", "");
    }
    else if(GetRandomPercent() < (2 * drunk / 20))
    {
        CheckSocial(ch, "drool", "");
    }
    else if(GetRandomPercent() < (2 * drunk / 20))
    {
        CheckSocial(ch, "fart", "");
    }
    else if(drunk > (10 + (GetCurrentConstitution(ch) / 5))
            && GetRandomPercent() < (2 * drunk / 18))
    {
        for(std::shared_ptr<Character> vch : ch->InRoom->Characters())
        {
            if(GetRandomPercent() < 10)
            {
                rvch = vch;
            }
        }

        std::string name = rvch != nullptr ? rvch->Name : "";
        CheckSocial(ch, "puke", name);
    }

    ch->Position = position;
}

static void SufferHallucinations(std::shared_ptr<Character> ch)
{
    if(ch->MentalState >= 30
       && NumberBits(5 - (ch->MentalState >= 50) - (ch->MentalState >= 75)) == 0)
    {
        std::string t;

        switch(GetRandomNumberFromRange(1, umin(20, (ch->MentalState + 5) / 5)))
        {
        default:
        case 1:
            t = "You feel very restless... you can't sit still.\r\n";
            break;

        case 2:
            t = "You're tingling all over.\r\n";
            break;

        case 3:
            t = "Your skin is crawling.\r\n";
            break;

        case 4:
            t = "You suddenly feel that something is terribly wrong.\r\n";
            break;

        case 5:
            t = "Those damn little jawas keep laughing at you!\r\n";
            break;

        case 6:
            t = "You can hear your mother crying...\r\n";
            break;

        case 7:
            t = "Have you been here before, or not? You're not sure...\r\n";
            break;

        case 8:
            t = "Painful childhood memories flash through your mind.\r\n";
            break;

        case 9:
            t = "You hear someone call your name in the distance...\r\n";
            break;

        case 10:
            t = "Your head is pulsating... you can't think straight.\r\n";
            break;

        case 11:
            t = "The ground... seems to be squirming...\r\n";
            break;

        case 12:
            t = "You're not quite sure what is real anymore.\r\n";
            break;

        case 13:
            t = "It's all a dream... or is it?\r\n";
            break;

        case 14:
            t = "They're coming to get you... coming to take you away...\r\n";
            break;

        case 15:
            t = "You begin to feel all powerful!\r\n";
            break;

        case 16:
            t = "You're light as air... the heavens are yours for the taking.\r\n";
            break;

        case 17:
            t = "Your whole life flashes by... and your future...\r\n";
            break;

        case 18:
            t = "You are everywhere and everything... you know all and are all!\r\n";
            break;

        case 19:
            t = "You feel immortal!\r\n";
            break;

        case 20:
            t = "Ahh... the power of a Supreme Entity... what to do...\r\n";
            break;
        }

        ch->Echo(t);
    }
}

static void TeleportUpdate()
{
    auto teleports = Teleports;
    
    for(auto teleport : teleports)
    {
        if(--teleport->TeleportTimer <= 0)
        {
            if(!teleport->FromRoom->Characters().empty())
            {
                Teleport(teleport->FromRoom->Characters().front(),
                         teleport->FromRoom->TeleVnum,
                         TELE_TRANSALL);
            }

            Teleports.remove(teleport);
        }
    }
}

static void StartTiming(timeval &start_time)
{
    if(!timechar.expired())
    {
        auto ch = timechar.lock();
        SetCharacterColor(AT_PLAIN, ch);
        ch->Echo("Starting update timer.\r\n");
        gettimeofday(&start_time, nullptr);
    }
}

static void StopTiming(timeval &start_time)
{
    if(!timechar.expired())
    {
        auto ch = timechar.lock();
        timeval etime;
        gettimeofday(&etime, NULL);
        SetCharacterColor(AT_PLAIN, ch);
        ch->Echo("Update timing complete.\r\n");
        SubtractTimes(&etime, &start_time);
        ch->Echo("Timing took %ld.%06ld seconds.\r\n",
                       etime.tv_sec, etime.tv_usec);
        timechar.reset();
    }
}

/*
 * Handle all kinds of updates.
 * Called once per pulse from game loop.
 * Random times to defeat tick-timing clients and players.
 */
void UpdateHandler()
{
    static int pulse_taxes;
    static int pulse_area;
    static int pulse_mobile;
    static int pulse_violence;
    static int pulse_point;
    static int pulse_second;
    static int pulse_space;
    static int pulse_ship;
    static int pulse_recharge;
    static int pulse_StartArena = PULSE_ARENA;
    static int pulse_arena = PULSE_ARENA;
    timeval start_time;

    StartTiming(start_time);

    if(--pulse_area <= 0)
    {
        pulse_area = GetRandomNumberFromRange(PULSE_AREA / 2, 3 * PULSE_AREA / 2);
        AreaUpdate();
    }

    if(--pulse_taxes <= 0)
    {
        pulse_taxes = PULSE_TAXES;
        TaxUpdate();
        ApplyBankInterest();
        PaySalaries();
    }

    if(--pulse_mobile <= 0)
    {
        pulse_mobile = PULSE_MOBILE;
        MobileUpdate();
        UpdateDruggedPlayers();
    }

    if(--pulse_space <= 0)
    {
        pulse_space = PULSE_SPACE;
        ShipUpdate();
        UpdateSpaceCombat();
        ShuttleUpdate();
    }

    if(--pulse_recharge <= 0)
    {
        pulse_recharge = PULSE_SPACE / 3;
        RechargeShips();
    }

    if(--pulse_ship <= 0)
    {
        pulse_ship = PULSE_SPACE / 10;
        SpaceobjectUpdate();
        for_each(std::begin(Missiles), std::end(Missiles), UpdateMissile);
        UpdateShipMovement();
    }

    if(--pulse_violence <= 0)
    {
        pulse_violence = PULSE_VIOLENCE;
        ViolenceUpdate();
    }

    if(--pulse_point <= 0)
    {
        pulse_point = GetRandomNumberFromRange(PULSE_TICK * 0.75, PULSE_TICK * 1.25);

        WeatherUpdate();
        CharacterUpdate();
        PlayerCharacterUpdate();
        ObjectUpdate();
        ClearVirtualRooms();
    }

    if(--pulse_second <= 0)
    {
        pulse_second = PULSE_PER_SECOND;
        CharacterCheck();
        RebootCheck(0);
    }

    if(!OngoingAuction->Item.expired() && --OngoingAuction->Pulse <= 0)
    {
        OngoingAuction->Pulse = PULSE_AUCTION;
        AuctionUpdate();
    }

    if(arena.InStartArena || arena.PeopleChallenged)
    {
        if(--pulse_StartArena <= 0)
        {
            pulse_StartArena = PULSE_ARENA;
            StartArena();
        }
    }

    if(arena.PeopleIsInArena)
    {
        if(--pulse_arena <= 0
           || CharactersInArena() == 1)
        {
            pulse_arena = PULSE_ARENA;
            UpdateArena();
        }
    }

    TeleportUpdate();
    MobActUpdate();
    AggroUpdate();
    ObjectActUpdate();
    RoomActUpdate();
    DispatchScripts();
    CleanObjectQueue();            /* dispose of extracted objects */
    CleanCharacterQueue();           /* dispose of dead mobs/quitting chars */

    StopTiming(start_time);
}

void RemovePortal(std::shared_ptr<Object> portal)
{
    auto fromRoom = portal->InRoom;
    std::shared_ptr<Character> ch = NULL;
    std::shared_ptr<Exit> pexit;

    const auto &exitIter = Find(fromRoom->Exits(),
                                [](auto ex)
                                {
                                    return ex->Flags.test(Flag::Exit::Portal);
                                });

    if(exitIter != nullptr)
    {
        pexit = exitIter;
    }
    else
    {
        Log->Bug("RemovePortal: portal not found in room %ld!", fromRoom->Vnum);
        return;
    }

    if(pexit->Direction != DIR_PORTAL)
    {
        Log->Bug("RemovePortal: exit in dir %d != DIR_PORTAL", pexit->Direction);
    }

    const auto toRoom = pexit->ToRoom;

    if(toRoom == nullptr)
    {
        Log->Bug("RemovePortal: toRoom is NULL");
    }

    ExtractExit(fromRoom, pexit);

    if(toRoom && !toRoom->Characters().empty())
    {
        ch = toRoom->Characters().front();
        Act(AT_PLAIN, "A magical portal above winks from existence.", ch, NULL, NULL, ActTarget::Room);
    }
}

void RebootCheck(time_t reset)
{
    static const char *const tmsg[] =
    { "SYSTEM: Reboot in 10 seconds.",
      "SYSTEM: Reboot in 30 seconds.",
      "SYSTEM: Reboot in 1 minute.",
      "SYSTEM: Reboot in 2 minutes.",
      "SYSTEM: Reboot in 3 minutes.",
      "SYSTEM: Reboot in 4 minutes.",
      "SYSTEM: Reboot in 5 minutes.",
      "SYSTEM: Reboot in 10 minutes.",
    };
    static const int times[] = { 10, 30, 60, 120, 180, 240, 300, 600 };
    static int trun = 0;
    static bool init = false;
    int timesize = umin(sizeof(times) / sizeof(*times), sizeof(tmsg) / sizeof(*tmsg));
    char buf[MAX_STRING_LENGTH];

    if(!init || reset >= current_time)
    {
        for(trun = timesize - 1; trun >= 0; trun--)
        {
            if(reset >= current_time + times[trun])
            {
                break;
            }
        }

        init = true;
        return;
    }

    if((current_time % 1800) == 0)
    {
        sprintf(buf, "%.24s: %d players", ctime(&current_time), num_descriptors);
        AppendToFile(USAGE_FILE, buf);
    }

    if(new_boot_time_t - boot_time < 60 * 60 * 18
       && !set_boot_time->Manual)
    {
        return;
    }

    if(new_boot_time_t <= current_time)
    {
        std::shared_ptr<Character> vch = NULL;
        auto auctionItem = OngoingAuction->Item.lock();

        if(auctionItem != nullptr)
        {
            sprintf(buf, "Sale of %s has been stopped by mud.",
                    auctionItem->ShortDescr.c_str());
            TalkAuction(buf);
            ObjectToCharacter(auctionItem, OngoingAuction->Seller);
            OngoingAuction->Item.reset();

            if(OngoingAuction->Buyer && OngoingAuction->Buyer != OngoingAuction->Seller)
            {
                OngoingAuction->Buyer->Gold += OngoingAuction->Bet;
                OngoingAuction->Buyer->Echo("Your money has been returned.\r\n");
            }
        }

        EchoToAll(AT_YELLOW, "You are forced from these realms by a strong "
                  "presence\r\nas life here is reconstructed.", ECHOTAR_ALL);

        for(vch = FirstCharacter; vch; vch = vch->Next)
        {
            if(!IsNpc(vch))
            {
                PlayerCharacters->Save(vch);
            }
        }

        Ships->Save();

        mud_down = true;
        return;
    }

    if(trun != -1 && new_boot_time_t - current_time <= times[trun])
    {
        EchoToAll(AT_YELLOW, tmsg[trun], ECHOTAR_ALL);
        --trun;
        return;
    }
}

/* the auction update*/
static void AuctionUpdate()
{
    int tax = 0;
    int pay = 0;
    char buf[MAX_STRING_LENGTH];
    enum
    {
        GoingOnce = 1, GoingTwice = 2, Sold = 3
    };

    switch(++OngoingAuction->Going) /* increase the going state */
    {
    case GoingOnce:
    case GoingTwice:
        if(OngoingAuction->Bet > OngoingAuction->Starting)
        {
            auto auctionItem = OngoingAuction->Item.lock();
            sprintf(buf, "%s: going %s for %d.", auctionItem->ShortDescr.c_str(),
                    ((OngoingAuction->Going == GoingOnce) ? "once" : "twice"), OngoingAuction->Bet);
        }
        else
        {
            auto auctionItem = OngoingAuction->Item.lock();
            sprintf(buf, "%s: going %s (bid not received yet).", auctionItem->ShortDescr.c_str(),
                    ((OngoingAuction->Going == GoingOnce) ? "once" : "twice"));
        }

        TalkAuction(buf);
        break;

    case Sold:
        if(!OngoingAuction->Buyer && OngoingAuction->Bet)
        {
            Log->Bug("Auction code reached SOLD, with NULL buyer, but %d gold bid", OngoingAuction->Bet);
            OngoingAuction->Bet = 0;
        }

        if(OngoingAuction->Bet > 0 && OngoingAuction->Buyer != OngoingAuction->Seller)
        {
            auto auctionItem = OngoingAuction->Item.lock();
            sprintf(buf, "%s sold to %s for %d.",
                    auctionItem->ShortDescr.c_str(),
                    IsNpc(OngoingAuction->Buyer) ? OngoingAuction->Buyer->ShortDescr.c_str() : OngoingAuction->Buyer->Name.c_str(),
                    OngoingAuction->Bet);
            TalkAuction(buf);

            Act(AT_ACTION, "The auctioneer materializes before you, and hands you $p.",
                OngoingAuction->Buyer, auctionItem, NULL, ActTarget::Char);
            Act(AT_ACTION, "The auctioneer materializes before $n, and hands $m $p.",
                OngoingAuction->Buyer, auctionItem, NULL, ActTarget::Room);

            if((OngoingAuction->Buyer->CarryWeight
                + GetObjectWeight(auctionItem))
            > GetCarryCapacityWeight(OngoingAuction->Buyer))
            {
                Act(AT_PLAIN, "$p is too heavy for you to carry with your current inventory.", OngoingAuction->Buyer, auctionItem, NULL, ActTarget::Char);
                Act(AT_PLAIN, "$n is carrying too much to also carry $p, and $e drops it.", OngoingAuction->Buyer, auctionItem, NULL, ActTarget::Room);
                ObjectToRoom(auctionItem, OngoingAuction->Buyer->InRoom);
            }
            else
            {
                ObjectToCharacter(auctionItem, OngoingAuction->Buyer);
            }

            pay = (int)OngoingAuction->Bet * 0.9;
            tax = (int)OngoingAuction->Bet * 0.1;
            BoostEconomy(OngoingAuction->Seller->InRoom->Area, tax);
            OngoingAuction->Seller->Gold += pay; /* give him the money, tax 10 % */
            OngoingAuction->Buyer->Echo("The auctioneer pays you %d gold, charging an auction fee of %d.\r\n",
                                        pay, tax);
            OngoingAuction->Item.reset(); /* reset item */

            if(SysData.SaveFlags.test(Flag::AutoSave::Auction))
            {
                PlayerCharacters->Save(OngoingAuction->Buyer);
                PlayerCharacters->Save(OngoingAuction->Seller);
            }
        }
        else /* not sold */
        {
            auto auctionItem = OngoingAuction->Item.lock();
            sprintf(buf, "No bids received for %s - object has been removed from auction\r\n.",
                    auctionItem->ShortDescr.c_str());
            TalkAuction(buf);
            Act(AT_ACTION, "The auctioneer appears before you to return $p to you.",
                OngoingAuction->Seller, auctionItem, NULL, ActTarget::Char);
            Act(AT_ACTION, "The auctioneer appears before $n to return $p to $m.",
                OngoingAuction->Seller, auctionItem, NULL, ActTarget::Room);

            if((OngoingAuction->Seller->CarryWeight
                + GetObjectWeight(auctionItem))
    > GetCarryCapacityWeight(OngoingAuction->Seller))
            {
                Act(AT_PLAIN, "You drop $p as it is just too much to carry"
                    " with everything else you're carrying.", OngoingAuction->Seller,
                    auctionItem, NULL, ActTarget::Char);
                Act(AT_PLAIN, "$n drops $p as it is too much extra weight"
                    " for $m with everything else.", OngoingAuction->Seller,
                    auctionItem, NULL, ActTarget::Room);
                ObjectToRoom(auctionItem, OngoingAuction->Seller->InRoom);
            }
            else
            {
                ObjectToCharacter(auctionItem, OngoingAuction->Seller);
            }

            tax = (int)auctionItem->Cost * 0.05;
            BoostEconomy(OngoingAuction->Seller->InRoom->Area, tax);
            OngoingAuction->Seller->Echo("The auctioneer charges you an auction fee of %d.\r\n", tax);

            if((OngoingAuction->Seller->Gold - tax) < 0)
            {
                OngoingAuction->Seller->Gold = 0;
            }
            else
            {
                OngoingAuction->Seller->Gold -= tax;
            }

            if(SysData.SaveFlags.test(Flag::AutoSave::Auction))
            {
                PlayerCharacters->Save(OngoingAuction->Seller);
            }
        }

        OngoingAuction->Item.reset();
    }
}
