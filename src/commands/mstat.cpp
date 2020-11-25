#include <cstring>
#include <ctime>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "pcdata.hpp"
#include "room.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "area.hpp"

void do_mstat(std::shared_ptr<Character> ch, std::string arg)
{
    SetCharacterColor(AT_PLAIN, ch);

    if(arg.empty())
    {
        ch->Echo("Mstat whom?\r\n");
        return;
    }

    auto victim = GetCharacterAnywhere(ch, arg);

    if(victim == nullptr)
    {
        ch->Echo("They aren't here.\r\n");
        return;
    }

    if(((GetTrustLevel(ch) < LEVEL_GREATER)
        && !IsNpc(victim))
       || ((GetTrustLevel(ch) < GetTrustLevel(victim))
           && !IsNpc(victim)))
    {
        SetCharacterColor(AT_IMMORT, ch);
        ch->Echo("Their godly glow prevents you from getting a good look.\r\n");
        return;
    }

    ch->Echo("Name: %s     Organization: %s\r\n",
             victim->Name.c_str(),
             (IsNpc(victim) || !victim->PCData->ClanInfo.Clan) ? "(none)"
             : victim->PCData->ClanInfo.Clan->Name.c_str());

    if(GetTrustLevel(ch) >= LEVEL_GREATER && !IsNpc(victim) && victim->Desc)
        ch->Echo("Host: %s   Descriptor: %d   Trust: %d   AuthedBy: %s\r\n",
                 victim->Desc->Remote.Hostname.c_str(), victim->Desc->Socket,
                 victim->Trust, !victim->PCData->AuthedBy.empty()
                 ? victim->PCData->AuthedBy.c_str() : "(unknown)");

    if(!IsNpc(victim) && victim->PCData->ReleaseDate != 0)
        ch->Echo("Helled until %24.24s by %s.\r\n",
                 ctime(&victim->PCData->ReleaseDate),
                 victim->PCData->HelledBy.c_str());

    if(IsNpc(victim))
    {
        auto area = GetAreaOf(victim->Prototype);        
        ch->Echo("Vnum: %ld (%s)  ",
                 victim->Prototype->Vnum,
                 area->Filename.c_str());

        if(!victim->Prototype->Tag().empty())
        {
            ch->Echo("Tag: %s", victim->Prototype->Tag().c_str());
        }
    }

    ch->Echo("Sex: %s   Room: %ld   Count: %d  Killed: %d\r\n",
             SexNames[victim->Sex],
             victim->InRoom == NULL ? INVALID_VNUM : victim->InRoom->Vnum,
             IsNpc(victim) ? victim->Prototype->Count : 1,
             IsNpc(victim) ? victim->Prototype->Killed
             : victim->PCData->MDeaths + victim->PCData->PDeaths
    );

    ch->Echo("Str: %d  Int: %d  Wis: %d  Dex: %d  Con: %d  Cha: %d  Lck: %d  Frc: %d\r\n",
             GetCurrentStrength(victim),
             GetCurrentIntelligence(victim),
             GetCurrentWisdom(victim),
             GetCurrentDexterity(victim),
             GetCurrentConstitution(victim),
             GetCurrentCharisma(victim),
             GetCurrentLuck(victim),
             GetCurrentForce(victim));

    ch->Echo("Hps: %d/%d  Force: %d/%d   Move: %d/%d\r\n",
             victim->HitPoints.Current, victim->HitPoints.Max,
             victim->Mana.Current, victim->Mana.Max,
             victim->Fatigue.Current, victim->Fatigue.Max);

    if(!IsNpc(victim))
    {
        for(int ability = 0; ability < (int)AbilityClass::Max; ability++)
        {
            ch->Echo("%-15s   Level: %-3d   Max: %-3d   Exp: %-10ld   Next: %-10ld\r\n",
                     AbilityName[ability], GetAbilityLevel(victim, AbilityClass(ability)),
                     GetMaxAbilityLevel(victim, AbilityClass(ability)),
                     GetAbilityXP(victim, AbilityClass(ability)),
                     GetRequiredXpForLevel(GetAbilityLevel(victim, AbilityClass(ability)) + 1));
        }
    }

    ch->Echo("Top Level: %d     Race: %d  Align: %d  AC: %d  Credits: %d\r\n",
             victim->TopLevel(), victim->Race, victim->Alignment,
             GetArmorClass(victim), victim->Gold);

    if(victim->Race < MAX_NPC_RACE && victim->Race >= 0)
    {
        ch->Echo("Race: %s\r\n", NpcRace[victim->Race]);
    }

    ch->Echo("Hitroll: %d   Damroll: %d   Position: %d   Wimpy: %d \r\n",
             GetHitRoll(victim), GetDamageRoll(victim),
             victim->Position, victim->Wimpy);
    ch->Echo("Fighting: %s    Master: %s    Leader: %s\r\n",
             IsFighting(victim) ? WhoFighting(victim)->Name.c_str() : "(none)",
             victim->Master ? victim->Master->Name.c_str() : "(none)",
             victim->Leader ? victim->Leader->Name.c_str() : "(none)");

    if(!IsNpc(victim))
    {
        ch->Echo("Thirst: %d   Full: %d   Drunk: %d\r\n",
                 victim->PCData->Condition[COND_THIRST],
                 victim->PCData->Condition[COND_FULL],
                 victim->PCData->Condition[COND_DRUNK]);
    }
    else
    {
        ch->Echo("Hit dice: %dd%d+%d.  Damage dice: %dd%d+%d.\r\n",
                 victim->Prototype->HitNoDice,
                 victim->Prototype->HitSizeDice,
                 victim->Prototype->HitPlus,
                 victim->Prototype->DamNoDice,
                 victim->Prototype->DamSizeDice,
                 victim->Prototype->DamPlus);
    }

    ch->Echo("MentalState: %d   EmotionalState: %d\r\n",
             victim->MentalState, victim->EmotionalState);
    ch->Echo("Saving throws: %d %d %d %d %d.\r\n",
             victim->Saving.PoisonDeath,
             victim->Saving.Wand,
             victim->Saving.ParaPetri,
             victim->Saving.Breath,
             victim->Saving.SpellStaff);
    ch->Echo("Carry figures: items (%d/%d)  weight (%d/%d)   Numattacks: %d\r\n",
             victim->CarryNumber, GetCarryCapacityNumber(victim),
             victim->CarryWeight, GetCarryCapacityWeight(victim), victim->NumberOfAttacks);

    if(IsNpc(victim))
    {
        ch->Echo("Mob flags: %s\r\n", FlagString(victim->Flags, MobFlags).c_str());
        ch->Echo("VIP flags: %s\r\n", FlagString(victim->VipFlags, WantedFlags).c_str());
    }
    else
    {
        ch->Echo("Years: %d   Seconds Played: %d   Idle Timer: %d\r\n",
                 GetAge(victim), (int)victim->PCData->Played, victim->IdleTimer);
        ch->Echo("Player flags: %s\r\n",
                 FlagString(victim->Flags, PlayerFlags).c_str());
        ch->Echo("Pcflags: %s\r\n",
                 FlagString(victim->PCData->Flags, PcFlags).c_str());
        ch->Echo("Wanted flags: %s\r\n",
                 FlagString(victim->PCData->WantedOn, WantedFlags).c_str());
    }

    ch->Echo("Affected by: %s\r\n",
             FlagString(victim->AffectedBy, AffectFlags).c_str());
    ch->Echo("Speaks: %d   Speaking: %d\r\n",
             victim->Speaks, victim->Speaking);
    ch->Echo("Languages: ");

    for(int x = 0; LanguageArray[x] != LANG_UNKNOWN; x++)
    {
        if(CharacterKnowsLanguage(victim, LanguageArray[x], victim)
           || (IsNpc(victim) && victim->Speaks == 0))
        {
            if(IsBitSet(LanguageArray[x], victim->Speaking)
               || (IsNpc(victim) && !victim->Speaking))
            {
                SetCharacterColor(AT_RED, ch);
            }

            ch->Echo("%s ", LanguageNames[x]);
            SetCharacterColor(AT_PLAIN, ch);
        }
        else if(IsBitSet(LanguageArray[x], victim->Speaking)
                || (IsNpc(victim) && !victim->Speaking))
        {
            SetCharacterColor(AT_PINK, ch);
            ch->Echo("%s ", LanguageNames[x]);
            SetCharacterColor(AT_PLAIN, ch);
        }
    }

    ch->Echo("\r\n");

    if(!IsNpc(victim) && !victim->PCData->Bestowments.empty())
    {
        ch->Echo("Bestowments: %s\r\n", victim->PCData->Bestowments.c_str());
    }

    ch->Echo("Short description: %s\r\nLong  description: %s",
             victim->ShortDescr.c_str(),
             !victim->LongDescr.empty() ? victim->LongDescr.c_str() : "(none)\r\n");

    if(IsNpc(victim) && (victim->spec_fun || victim->spec_2))
    {
        ch->Echo("Mobile has spec fun: %s %s\r\n",
                 LookupSpecial(victim->spec_fun).c_str(),
                 victim->spec_2 ? LookupSpecial(victim->spec_2).c_str() : "");
    }

    ch->Echo("Resistant  : %s\r\n",
             FlagString(victim->Resistant, RisFlags).c_str());
    ch->Echo("Immune     : %s\r\n",
             FlagString(victim->Immune, RisFlags).c_str());
    ch->Echo("Susceptible: %s\r\n",
             FlagString(victim->Susceptible, RisFlags).c_str());
    ch->Echo("Attacks    : %s\r\n",
             FlagString(victim->AttackFlags, AttackFlags).c_str());
    ch->Echo("Defenses   : %s\r\n",
             FlagString(victim->DefenseFlags, DefenseFlags).c_str());

    for(auto paf : victim->Affects())
    {
        auto skill = GetSkill(paf->Type);

        if(skill != nullptr)
        {
            ch->Echo("%s: '%s' modifies %s by %d for %d rounds with bits %s.\r\n",
                     SkillTypeName[skill->Type],
                     skill->Name.c_str(),
                     GetAffectLocationName(paf->Location),
                     paf->Modifier,
                     paf->Duration,
                     FlagString(paf->AffectedBy, AffectFlags).c_str()
            );
        }
    }
}
