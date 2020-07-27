/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 *--------------------------------------------------------------------------*
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 *--------------------------------------------------------------------------*
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * -------------------------------------------------------------------------*
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 *--------------------------------------------------------------------------*
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#include <functional>
#include <numeric>
#include <cassert>
#include <cstring>
#include <cctype>
#include <cerrno>
#include <utility/algorithms.hpp>
#include <utility/random.hpp>
#include "mud.hpp"
#include "ship.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "skill.hpp"
#include "bounty.hpp"
#include "planet.hpp"
#include "area.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "room.hpp"
#include "object.hpp"
#include "protoobject.hpp"
#include "protomob.hpp"
#include "descriptor.hpp"
#include "systemdata.hpp"
#include "exit.hpp"
#include "home.hpp"
#include "repos/shiprepository.hpp"
#include "repos/descriptorrepository.hpp"
#include "repos/playerrepository.hpp"
#include "repos/arearepository.hpp"
#include "repos/homerepository.hpp"
#include "act.hpp"
#include "timer.hpp"

extern std::shared_ptr<Character> gch_prev;

class Fight
{
public:
    Fight(const std::shared_ptr<Character> &who);

    std::shared_ptr<Character> Who;
    long Xp = 0;
    short Duration = 0;
};

Fight::Fight(const std::shared_ptr<Character> &who)
    : Who(who)
{

}

/*
 * Local functions.
 */
static void ApplyWantedFlags(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
static void UpdateKillStats(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
static void SendDamageMessages(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dam, int dt);
static bool IsWieldingPoisonedWeapon(std::shared_ptr<Character> ch);
static void GainGroupXP(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
static int CountGroupMembersInRoom(std::shared_ptr<Character> ch);
static void CheckObjectAlignmentZapping(std::shared_ptr<Character> ch);
static int ComputeNewAlignment(std::shared_ptr<Character> gch, std::shared_ptr<Character> victim);
static int GetObjectHitrollBonus(std::shared_ptr<Object> obj);
static bool SprintForCover(std::shared_ptr<Character> ch);
static int GetWeaponProficiencyBonus(std::shared_ptr<Character> ch, std::shared_ptr<Object> wield, int *gsn_ptr);
static short GetOffensiveShieldLevelModifier(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim);
static bool AttackIsBowcaster(int dt, const std::shared_ptr<Object> &wield);
static bool AttackIsLightsaber(int dt, const std::shared_ptr<Object> &wield);
static bool AttackIsForcePike(int dt, const std::shared_ptr<Object> &wield);
static bool AttackIsVibroBlade(int dt, const std::shared_ptr<Object> &wield);
static bool AttackIsBlaster(int dt, const std::shared_ptr<Object> &wield);

static bool dual_flip = false;

/*
 * Check to see if weapon is poisoned.
 */
static bool IsWieldingPoisonedWeapon(std::shared_ptr<Character> ch)
{
    auto obj = GetEquipmentOnCharacter(ch, WEAR_WIELD);

    return obj != nullptr && obj->Flags.test(Flag::Obj::Poisoned);
}

int NumFighting(const std::shared_ptr<Character> &ch)
{
    return ch->NumFighting;
}

bool IsFighting(const std::shared_ptr<Character> &ch)
{
    return ch->Fighting != nullptr;
}

std::shared_ptr<Character> WhoFighting(const std::shared_ptr<Character> &ch)
{
    if(IsFighting(ch))
    {
        return ch->Fighting->Who;
    }
    else
    {
        return nullptr;
    }
}

/*
 * hunting, hating and fearing code                             -Thoric
 */
bool IsHunting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    return ch->HHF.Hunting && ch->HHF.Hunting->Who == victim;
}

bool IsHating(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    return ch->HHF.Hating && ch->HHF.Hating->Who == victim;
}

bool IsFearing(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    return ch->HHF.Fearing && ch->HHF.Fearing->Who == victim;
}

void StopHunting(std::shared_ptr<Character> ch)
{
    ch->HHF.Hunting.reset();
}

void StopHating(std::shared_ptr<Character> ch)
{
    ch->HHF.Hating.reset();
}

void StopFearing(std::shared_ptr<Character> ch)
{
    ch->HHF.Fearing.reset();
}

void StartHunting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(ch->HHF.Hunting)
        StopHunting(ch);

    ch->HHF.Hunting = std::make_unique<HuntHateFear>();
    ch->HHF.Hunting->Name = victim->Name;
    ch->HHF.Hunting->Who = victim;
}

void StartHating(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(ch->HHF.Hating)
        StopHating(ch);

    ch->HHF.Hating = std::make_unique<HuntHateFear>();
    ch->HHF.Hating->Name = victim->Name;
    ch->HHF.Hating->Who = victim;
}

void StartFearing(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(ch->HHF.Fearing)
        StopFearing(ch);

    ch->HHF.Fearing = std::make_unique<HuntHateFear>();
    ch->HHF.Fearing->Name = victim->Name;
    ch->HHF.Fearing->Who = victim;
}

static void RemoveExpiredAffects(std::shared_ptr<Character> ch)
{
    auto affects = ch->Affects();

    for(auto affectIter = std::begin(affects); affectIter != std::end(affects); ++affectIter)
    {
        const std::shared_ptr<Affect> paf = *affectIter;

        if(paf->Duration > 0)
        {
            paf->Duration--;
        }
        else if(paf->Duration < 0)
        {
            // Intentionally empty
        }
        else
        {
            std::shared_ptr<Affect> paf_next;
            auto nextIter = affectIter;
            ++nextIter;

            if(nextIter != std::end(affects))
            {
                paf_next = *nextIter;
            }

            if(paf_next == nullptr
               || paf_next->Type != paf->Type
               || paf_next->Duration > 0)
            {
                auto skill = GetSkill(paf->Type);

                if(paf->Type > 0 && skill != nullptr && !skill->Messages.WearOff.empty())
                {
                    SetCharacterColor(AT_WEAROFF, ch);
                    ch->Echo("%s\r\n", skill->Messages.WearOff.c_str());
                }
            }

            if(paf->Type == gsn_possess)
            {
                ch->Desc->Char = ch->Desc->Original;
                ch->Desc->Original = nullptr;
                ch->Desc->Char->Desc = ch->Desc;
                ch->Desc->Char->Switched = nullptr;
                ch->Desc = nullptr;
            }

            RemoveAffect(ch, paf);
        }
    }
}

/*
 * Control the fights going on.
 * Called periodically by UpdateHandler.
 * Many hours spent fixing bugs in here by Thoric, as noted by residual
 * debugging checks.  If you never get any of these error messages again
 * in your logs... then you can comment out some of the checks without
 * worry.
 */
void ViolenceUpdate()
{
    for(auto ch = LastCharacter; ch; ch = gch_prev)
    {
        SetCurrentGlobalCharacter(ch);

        gch_prev = ch->Previous;

        /*
         * See if we got a pointer to someone who recently died...
         * if so, either the pointer is bad... or it's a player who
         * "died", and is back at the healer...
         * Since he/she's in the char_list, it's likely to be the later...
         * and should not already be in another fight already
         */
        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        /*
         * Experience gained during battle deceases as battle drags on
         */
        if(IsFighting(ch))
        {
            if((++ch->Fighting->Duration % 24) == 0)
            {
                ch->Fighting->Xp = ((ch->Fighting->Xp * 9) / 10);
            }
        }

        // TODO: This function REALLY doesn't belong here, but moving
        //       it may have side effects that must be investigated first.
        DispatchExpiredCommandCallbackTimers(ch);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        RemoveExpiredAffects(ch);

        std::shared_ptr<Character> victim = WhoFighting(ch);

        if(victim == nullptr || IsAffectedBy(ch, Flag::Affect::Paralysis))
        {
            continue;
        }

        ch_ret retcode = rNONE;

        if(ch->InRoom->Flags.test(Flag::Room::Safe))
        {
            Log->Info("ViolenceUpdate: %s fighting %s in a SAFE room.",
                      ch->Name.c_str(), victim->Name.c_str());
            StopFighting(ch, true);
        }
        else if(IsAwake(ch) && ch->InRoom == victim->InRoom)
        {
            retcode = HitMultipleTimes(ch, victim, TYPE_UNDEFINED);
        }
        else
        {
            StopFighting(ch, false);
        }

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        victim = WhoFighting(ch);

        if(retcode == rCHAR_DIED || victim == nullptr)
        {
            continue;
        }

        if(IsNpc(ch))
        {
            do_wear(ch, "blaster");
            do_wear(ch, "all");
        }

        /*
         *  Mob triggers
         */
        RoomProgFightTrigger(ch);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        MobProgHitPercentTrigger(ch, victim);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        MobProgFightTrigger(ch, victim);

        if(CharacterDiedRecently(ch))
        {
            continue;
        }

        /*
         * Fun for the whole family!
         */
        const auto characterList = ch->InRoom->Characters();

        for(auto rch : characterList)
        {
            if(IsAwake(rch) && !IsFighting(rch))
            {
                /*
                 * PC's auto-assist others in their group.
                 */
                if(!IsNpc(ch) || IsAffectedBy(ch, Flag::Affect::Charm))
                {
                    if((!IsNpc(rch) || IsAffectedBy(rch, Flag::Affect::Charm))
                       && IsInSameGroup(ch, rch))
                    {
                        HitMultipleTimes(rch, victim, TYPE_UNDEFINED);
                    }

                    continue;
                }

                /*
                 * NPCs assist NPCs of same type or 12.5% chance regardless.
                 */
                if(IsNpc(rch) && !IsAffectedBy(rch, Flag::Affect::Charm)
                   && !rch->Flags.test(Flag::Mob::NoAssist))
                {
                    if(CharacterDiedRecently(ch))
                    {
                        break;
                    }

                    if(rch->Prototype == ch->Prototype
                       || NumberBits(3) == 0)
                    {
                        std::shared_ptr<Character> target = nullptr;
                        int number = 0;

                        for(std::shared_ptr<Character> vch : ch->InRoom->Characters())
                        {
                            if(CanSeeCharacter(rch, vch)
                               && IsInSameGroup(vch, victim)
                               && GetRandomNumberFromRange(0, number) == 0)
                            {
                                target = vch;
                                number++;
                            }
                        }

                        if(target != nullptr)
                        {
                            HitMultipleTimes(rch, target, TYPE_UNDEFINED);
                        }
                    }
                }
            }
        }
    }
}

static ch_ret PerformNthAttack(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dt, int gsn,
                               std::function<int()> getHitChance)
{
    int hit_chance = getHitChance();

    if(GetRandomPercent() < hit_chance)
    {
        LearnFromSuccess(ch, gsn);
        ch_ret retcode = HitOnce(ch, victim, dt);

        if(retcode != rNONE || WhoFighting(ch) != victim)
        {
            return retcode;
        }
    }
    else
    {
        LearnFromFailure(ch, gsn);
    }

    return rNONE;
}

static ch_ret Perform2ndAttack(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dual_bonus, int dt)
{
    return PerformNthAttack(ch, victim, dt, gsn_second_attack,
                            [ch, dual_bonus]()
                            {
                                return IsNpc(ch) ? ch->TopLevel
                                    : (int)((GetSkillLevel(ch, gsn_second_attack) + dual_bonus) / 1.5);
                            });
}

static ch_ret Perform3rdAttack(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dual_bonus, int dt)
{
    return PerformNthAttack(ch, victim, dt, gsn_third_attack,
                            [ch, dual_bonus]()
                            {
                                return IsNpc(ch) ? ch->TopLevel
                                    : (int)((GetSkillLevel(ch, gsn_third_attack) + (dual_bonus * 1.5)) / 2);
                            });
}

static ch_ret Perform4thAttack(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dual_bonus, int dt)
{
    return PerformNthAttack(ch, victim, dt, gsn_fourth_attack,
                            [ch, dual_bonus]()
                            {
                                return IsNpc(ch) ? ch->TopLevel
                                    : (int)((GetSkillLevel(ch, gsn_fourth_attack) + (dual_bonus * 1.5)) / 2);
                            });
}

static ch_ret Perform5thAttack(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dual_bonus, int dt)
{
    return PerformNthAttack(ch, victim, dt, gsn_fifth_attack,
                            [ch, dual_bonus]()
                            {
                                return IsNpc(ch) ? ch->TopLevel
                                    : (int)((GetSkillLevel(ch, gsn_fifth_attack) + (dual_bonus * 1.5)) / 2);
                            });
}

/*
 * Do one group of attacks.
 */
ch_ret HitMultipleTimes(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dt)
{
    /* add timer if player is attacking another player */
    if(!IsNpc(ch) && !IsNpc(victim))
    {
        AddTimer(ch, TimerType::RecentFight, 20);
    }

    if(!IsNpc(ch) && ch->Flags.test(Flag::Plr::Nice) && !IsNpc(victim))
    {
        return rNONE;
    }

    // First attack
    ch_ret retcode = HitOnce(ch, victim, dt);

    if(retcode != rNONE)
    {
        return retcode;
    }

    if(WhoFighting(ch) != victim)
    {
        return rNONE;
    }

    // Don't do more attacks if this is a backstab or a circle.
    if(dt == gsn_backstab
       || dt == gsn_circle)
    {
        return rNONE;
    }

    // Berserk extra attack
    /* Very high chance of hitting compared to chance of going berserk */
    /* 40% or higher is always hit.. don't learn anything here though. */
    /* -- Altrag */
    int hit_chance = IsNpc(ch) ? 100 : (GetSkillLevel(ch, gsn_berserk) * 5 / 2);

    if(IsAffectedBy(ch, Flag::Affect::Berserk) && GetRandomPercent() < hit_chance)
    {
        retcode = HitOnce(ch, victim, dt);

        if(retcode != rNONE
           || WhoFighting(ch) != victim)
        {
            return retcode;
        }
    }

    // Dual wield
    int dual_bonus = 0;

    if(GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD))
    {
        dual_bonus = IsNpc(ch) ? (GetAbilityLevel(ch, AbilityClass::Combat) / 10) : (GetSkillLevel(ch, gsn_dual_wield) / 10);

        retcode = PerformNthAttack(ch, victim, dt, gsn_dual_wield,
                                   [ch]()
                                   {
                                       return GetSkillLevel(ch, gsn_dual_wield);
                                   });

        if(retcode != rNONE || WhoFighting(ch) != victim)
        {
            return retcode;
        }
    }
    else
    {
        dual_bonus = 0;
    }

    if(ch->Fatigue.Current < 10)
    {
        dual_bonus = -20;
    }

    /*
     * NPC predetermined number of (extra) attacks                        -Thoric
     */
    if(IsNpc(ch) && ch->NumberOfAttacks > 0)
    {
        for(int i = 0; i <= ch->NumberOfAttacks; ++i)
        {
            retcode = HitOnce(ch, victim, dt);

            if(retcode != rNONE || WhoFighting(ch) != victim)
            {
                return retcode;
            }
        }

        return retcode;
    }

    // Second attack
    retcode = Perform2ndAttack(ch, victim, dual_bonus, dt);

    if(retcode != rNONE || WhoFighting(ch) != victim)
    {
        return retcode;
    }

    // Third attack
    retcode = Perform3rdAttack(ch, victim, dual_bonus, dt);

    if(retcode != rNONE || WhoFighting(ch) != victim)
    {
        return retcode;
    }

    // Fourth attack
    retcode = Perform4thAttack(ch, victim, dual_bonus, dt);

    if(retcode != rNONE || WhoFighting(ch) != victim)
    {
        return retcode;
    }

    // Fifth attack
    retcode = Perform5thAttack(ch, victim, dual_bonus, dt);

    if(retcode != rNONE || WhoFighting(ch) != victim)
    {
        return retcode;
    }

    retcode = rNONE;

    // Extra 25% chance bonus attack for NPCs.
    hit_chance = IsNpc(ch) ? (int)(ch->TopLevel / 4) : 0;

    if(GetRandomPercent() < hit_chance)
    {
        retcode = HitOnce(ch, victim, dt);
    }

    // Inflict movement cost
    if(retcode == rNONE)
    {
        int move = 0;

        if(!IsAffectedBy(ch, Flag::Affect::Flying)
           && !IsAffectedBy(ch, Flag::Affect::Floating))
        {
            move = GetCarryEncumbrance(ch, MovementLoss[umin(SECT_MAX - 1, ch->InRoom->Sector)]);
        }
        else
        {
            move = GetCarryEncumbrance(ch, 1);
        }

        if(ch->Fatigue.Current != 0)
        {
            ch->Fatigue.Current = umax(0, ch->Fatigue.Current - move);
        }
    }

    return retcode;
}

/*
 * Weapon types, haus
 */
static int GetWeaponProficiencyBonus(std::shared_ptr<Character> ch, std::shared_ptr<Object> wield, int *gsn_ptr)
{
    int bonus = 0;

    *gsn_ptr = -1;

    if(!IsNpc(ch) && wield)
    {
        switch(wield->Value[OVAL_WEAPON_TYPE])
        {
        case WEAPON_LIGHTSABER:
            *gsn_ptr = gsn_lightsabers;
            break;

        case WEAPON_VIBRO_BLADE:
            *gsn_ptr = gsn_vibro_blades;
            break;

        case WEAPON_WHIP:
            *gsn_ptr = gsn_flexible_arms;
            break;

        case WEAPON_CLAW:
            *gsn_ptr = gsn_talonous_arms;
            break;

        case WEAPON_BLASTER:
            *gsn_ptr = gsn_blasters;
            break;

        case WEAPON_BLUDGEON:
            *gsn_ptr = gsn_bludgeons;
            break;

        case WEAPON_BOWCASTER:
            *gsn_ptr = gsn_bowcasters;
            break;

        case WEAPON_FORCE_PIKE:
            *gsn_ptr = gsn_force_pikes;
            break;

        default:
            *gsn_ptr = -1;
            break;
        }

        if(*gsn_ptr != -1)
        {
            bonus = GetSkillLevel(ch, *gsn_ptr);
        }
    }

    if(IsNpc(ch) && wield)
    {
        bonus = GetTrustLevel(ch);
    }

    return bonus;
}

/*
 * Calculate the tohit bonus on the object and return RIS values.
 * -- Altrag
 */
static int GetObjectHitrollBonus(std::shared_ptr<Object> obj)
{
    int tohit = accumulate(std::begin(obj->Prototype->Affects()),
                           std::end(obj->Prototype->Affects()),
                           0,
                           [](int sumSoFar, const auto affect)
                           {
                               if(affect->Location == APPLY_HITROLL)
                               {
                                   sumSoFar += affect->Modifier;
                               }

                               return sumSoFar;
                           });

    tohit += accumulate(std::begin(obj->Affects()),
                        std::end(obj->Affects()),
                        0,
                        [](int sumSoFar, const auto affect)
                        {
                            if(affect->Location == APPLY_HITROLL)
                            {
                                sumSoFar += affect->Modifier;
                            }

                            return sumSoFar;
                        });

    return tohit;
}

/*
 * Offensive shield level modifier
 */
static short GetOffensiveShieldLevelModifier(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(!IsNpc(ch))            /* players get much less effect */
    {
        short lvl = umax(1, (GetAbilityLevel(ch, AbilityClass::Force)));

        if(GetRandomPercent() + (GetAbilityLevel(victim, AbilityClass::Combat) - lvl) < 35)
        {
            return lvl;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        short lvl = ch->TopLevel;

        if(GetRandomPercent() + (GetAbilityLevel(victim, AbilityClass::Combat) - lvl) < 70)
        {
            return lvl;
        }
        else
        {
            return 0;
        }
    }
}

static int GetBackstabDamageMultiplier(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    return 2 + urange(2, GetAbilityLevel(ch, AbilityClass::Hunting) - (GetAbilityLevel(victim, AbilityClass::Combat) / 4), 30) / 8;
}

static int GetCircleDamageMultiplier(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    return 2 + urange(2, GetAbilityLevel(ch, AbilityClass::Hunting) - (GetAbilityLevel(victim, AbilityClass::Combat) / 2), 30) / 40;
}

static int GetEnhancedDamageModifier(std::shared_ptr<Character> ch, int dam)
{
    return (dam * GetSkillLevel(ch, gsn_enhanced_damage)) / 120;
}

static int GetVictimSleepingMultiplier()
{
    return 2;
}

/*
 * Hit one guy once.
 */
ch_ret HitOnce(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dt)
{
    /*
     * Can't beat a dead char!
     * Guard against weird room-leavings.
     */
    if(victim->Position == POS_DEAD || ch->InRoom != victim->InRoom)
    {
        return rVICT_DIED;
    }

    /*
     * Figure out the weapon doing the damage                     -Thoric
     */
    auto wield = GetEquipmentOnCharacter(ch, WEAR_DUAL_WIELD);

    if(wield != nullptr)
    {
        if(!dual_flip)
        {
            dual_flip = true;
            wield = GetEquipmentOnCharacter(ch, WEAR_WIELD);
        }
        else
        {
            dual_flip = false;
        }
    }
    else
    {
        wield = GetEquipmentOnCharacter(ch, WEAR_WIELD);
    }

    int prof_gsn = 0;
    int prof_bonus = GetWeaponProficiencyBonus(ch, wield, &prof_gsn);
    ch_ret retcode = rNONE;

    if(IsFighting(ch)            /* make sure fight is already started */
       && dt == TYPE_UNDEFINED
       && IsNpc(ch)
       && ch->AttackFlags != 0)
    {
        int cnt = 0;
        int attacktype = 0;

        for(;; )
        {
            attacktype = GetRandomNumberFromRange(0, 6);

            if(ch->AttackFlags.test(attacktype))
            {
                break;
            }

            if(cnt++ > 16)
            {
                attacktype = 0;
                break;
            }
        }

        if(attacktype == Flag::Attack::Backstab)
        {
            attacktype = 0;
        }

        if(wield && GetRandomPercent() > 25)
        {
            attacktype = 0;
        }

        switch(attacktype)
        {
        default:
            break;

            /* These used to call empty functions so they were just joined
               together */
        case Flag::Attack::Bite:
        case Flag::Attack::Claws:
        case Flag::Attack::Tail:
        case Flag::Attack::Sting:
            retcode = global_retcode;
            break;

        case Flag::Attack::Punch:
            do_punch(ch, "");
            retcode = global_retcode;
            break;

        case Flag::Attack::Kick:
            do_kick(ch, "");
            retcode = global_retcode;
            break;

        case Flag::Attack::Trip:
            attacktype = 0;
            break;
        }

        if(attacktype)
        {
            return retcode;
        }
    }

    if(dt == TYPE_UNDEFINED)
    {
        dt = TYPE_HIT;

        if(wield && wield->ItemType == ITEM_WEAPON)
        {
            dt += wield->Value[OVAL_WEAPON_TYPE];
        }
    }

    /*
     * Calculate to-hit-armor-class-0 versus armor.
     */
    int thac0_00 = 20;
    int thac0_32 = 10;
    int thac0 = Interpolate(GetAbilityLevel(ch, AbilityClass::Combat), thac0_00, thac0_32) - GetHitRoll(ch);
    int victim_ac = (int)(GetArmorClass(victim) / 10);

    /* if you can't see what's coming... */
    if(wield && !CanSeeObject(victim, wield))
    {
        victim_ac += 1;
    }

    if(!CanSeeCharacter(ch, victim))
    {
        victim_ac -= 4;
    }

    if(ch->Race == RACE_DEFEL)
    {
        victim_ac += 2;
    }

    if(!IsAwake(victim))
    {
        victim_ac += 5;
    }

    /* Weapon proficiency bonus */
    victim_ac += prof_bonus / 20;

    /*
     * The moment of excitement!
     */
    int diceroll = GetRandomNumberFromRange(1, 20);

    if(diceroll == 1
       || (diceroll < 20 && diceroll < thac0 - victim_ac))
    {
        /* Miss. */
        if(prof_gsn != -1)
        {
            LearnFromFailure(ch, prof_gsn);
        }

        InflictDamage(ch, victim, 0, dt);
        return rNONE;
    }

    int dam = 0;

    /*
     * Hit.
     * Calc damage.
     */
    if(!wield)       /* dice formula fixed by Thoric */
    {
        dam = GetRandomNumberFromRange(ch->BareNumDie, ch->BareSizeDie * ch->BareNumDie);
    }
    else
    {
        dam = GetRandomNumberFromRange(wield->Value[OVAL_WEAPON_NUM_DAM_DIE],
                                       wield->Value[OVAL_WEAPON_SIZE_DAM_DIE]);
    }

    /*
     * Bonuses.
     */
    dam += GetDamageRoll(ch);

    if(prof_bonus)
    {
        dam *= 1 + prof_bonus / 100;
    }

    if(!IsNpc(ch) && GetSkillLevel(ch, gsn_enhanced_damage) > 0)
    {
        dam += GetEnhancedDamageModifier(ch, dam);
        LearnFromSuccess(ch, gsn_enhanced_damage);
    }

    if(!IsAwake(victim))
    {
        dam *= GetVictimSleepingMultiplier();
    }

    if(dt == gsn_backstab)
    {
        dam *= GetBackstabDamageMultiplier(ch, victim);
    }

    if(dt == gsn_circle)
    {
        dam *= GetCircleDamageMultiplier(ch, victim);
    }

    int plusris = 0;

    if(wield)
    {
        if(wield->Flags.test(Flag::Obj::Magic))
        {
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Magic);
        }
        else
        {
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::NonMagic);
        }

        /*
         * Handle PLUS1 - PLUS6 ris bits vs. weapon hitroll       -Thoric
         */
        plusris = GetObjectHitrollBonus(wield);
    }
    else
    {
        dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::NonMagic);
    }

    /* check for RIS_PLUSx                                        -Thoric */
    if(dam != 0)
    {
        int res = -1;
        int imm = -1;
        int sus = -1;

        if(plusris != 0)
        {
            plusris = (1 << Flag::Ris::Plus1) << umin(plusris, 7);
        }

        /* find high ris */
        for(size_t i = Flag::Ris::Plus1; i <= Flag::Ris::Plus6; ++i)
        {
            if(victim->Immune.test(i))
            {
                imm = i;
            }

            if(victim->Resistant.test(i))
            {
                res = i;
            }

            if(victim->Susceptible.test(i))
            {
                sus = i;
            }
        }

        int mod = 10;

        if(imm >= plusris)
        {
            mod -= 10;
        }

        if(res >= plusris)
        {
            mod -= 2;
        }

        if(sus <= plusris)
        {
            mod += 2;
        }

        /* check if immune */
        if(mod <= 0)
        {
            dam = -1;
        }

        if(mod != 10)
        {
            dam = (dam * mod) / 10;
        }
    }

    /* race modifier */

    /*
     * check to see if weapon is charged
     */

    if(AttackIsBlaster(dt, wield))
    {
        if(wield->Value[OVAL_WEAPON_CHARGE] < 1)
        {
            Act(AT_YELLOW, "$n points their blaster at you but nothing happens.",
                ch, NULL, victim, ActTarget::Vict);
            Act(AT_YELLOW, "*CLICK* ... your blaster needs a new ammunition cell!",
                ch, NULL, victim, ActTarget::Char);

            if(IsNpc(ch))
            {
                do_remove(ch, wield->Name);
            }

            return rNONE;
        }
        else if(wield->BlasterSetting == BLASTER_FULL && wield->Value[OVAL_WEAPON_CHARGE] >= 5)
        {
            dam *= 1.5;
            wield->Value[OVAL_WEAPON_CHARGE] -= 5;
        }
        else if(wield->BlasterSetting == BLASTER_HIGH && wield->Value[OVAL_WEAPON_CHARGE] >= 4)
        {
            dam *= 1.25;
            wield->Value[OVAL_WEAPON_CHARGE] -= 4;
        }
        else if(wield->BlasterSetting == BLASTER_NORMAL && wield->Value[OVAL_WEAPON_CHARGE] >= 3)
        {
            wield->Value[OVAL_WEAPON_CHARGE] -= 3;
        }
        else if(wield->BlasterSetting == BLASTER_STUN && wield->Value[OVAL_WEAPON_CHARGE] >= 5)
        {
            dam /= 10;
            wield->Value[OVAL_WEAPON_CHARGE] -= 3;
            int hit_chance = ModifySavingThrowBasedOnResistance(victim, GetAbilityLevel(ch, AbilityClass::Combat), Flag::Ris::Paralysis);
            bool fail = false;

            if(hit_chance == 1000)
            {
                fail = true;
            }
            else
            {
                fail = SaveVsParalyze(hit_chance, victim);
            }

            if(victim->WasStunned > 0)
            {
                fail = true;
                victim->WasStunned--;
            }

            hit_chance = 100 - GetCurrentConstitution(victim) - GetAbilityLevel(victim, AbilityClass::Combat) / 2;
            /* harder for player to stun another player */
            if(!IsNpc(ch) && !IsNpc(victim))
            {
                hit_chance -= SysData.StunModPlrVsPlr;
            }
            else
            {
                hit_chance -= SysData.StunRegular;
            }

            hit_chance = urange(5, hit_chance, 95);

            if(!fail && GetRandomPercent() < hit_chance)
            {
                SetWaitState(victim, PULSE_VIOLENCE);
                Act(AT_BLUE, "Blue rings of energy from $N's blaster knock you down leaving you stunned!", victim, nullptr, ch, ActTarget::Char);
                Act(AT_BLUE, "Blue rings of energy from your blaster strike $N, leaving $M stunned!", ch, nullptr, victim, ActTarget::Char);
                Act(AT_BLUE, "Blue rings of energy from $n's blaster hit $N, leaving $M stunned!", ch, nullptr, victim, ActTarget::NotVict);
                StopFighting(victim, true);

                if(!IsAffectedBy(victim, Flag::Affect::Paralysis))
                {
                    auto af = std::make_shared<Affect>();
                    af->Type = gsn_stun;
                    af->Location = APPLY_AC;
                    af->Modifier = 20;
                    af->Duration = 7;
                    af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Paralysis });
                    AffectToCharacter(victim, af);
                    UpdatePosition(victim);

                    if(IsNpc(victim))
                    {
                        StartHating(victim, ch);
                        StartHunting(victim, ch);
                        victim->WasStunned = 10;
                    }
                }
            }
            else
            {
                Act(AT_BLUE, "Blue rings of energy from $N's blaster hit you but have little effect", victim, NULL, ch, ActTarget::Char);
                Act(AT_BLUE, "Blue rings of energy from your blaster hit $N, but nothing seems to happen!", ch, NULL, victim, ActTarget::Char);
                Act(AT_BLUE, "Blue rings of energy from $n's blaster hit $N, but nothing seems to happen!", ch, NULL, victim, ActTarget::NotVict);
            }
        }
        else if(wield->BlasterSetting == BLASTER_HALF && wield->Value[OVAL_WEAPON_CHARGE] >= 2)
        {
            dam *= 0.75;
            wield->Value[OVAL_WEAPON_CHARGE] -= 2;
        }
        else
        {
            dam *= 0.5;
            wield->Value[OVAL_WEAPON_CHARGE] -= 1;
        }
    }
    else if(AttackIsVibroBlade(dt, wield))
    {
        if(wield->Value[OVAL_WEAPON_CHARGE] < 1)
        {
            Act(AT_YELLOW, "Your vibro-blade needs recharging...", ch, nullptr, victim, ActTarget::Char);
            dam /= 3;
        }
    }
    else if(AttackIsForcePike(dt, wield))
    {
        if(wield->Value[OVAL_WEAPON_CHARGE] < 1)
        {
            Act(AT_YELLOW, "Your force-pike needs recharging...", ch, nullptr, victim, ActTarget::Char);
            dam /= 2;
        }
        else
        {
            wield->Value[OVAL_WEAPON_CHARGE]--;
        }
    }
    else if(AttackIsLightsaber(dt, wield))
    {
        if(wield->Value[OVAL_WEAPON_CHARGE] < 1)
        {
            Act(AT_YELLOW, "$n waves a dead hand grip around in the air.", ch, nullptr, victim, ActTarget::Vict);
            Act(AT_YELLOW, "You need to recharge your lightsaber ... it seems to be lacking a blade.", ch, nullptr, victim, ActTarget::Char);

            if(IsNpc(ch))
            {
                do_remove(ch, wield->Name);
            }

            return rNONE;
        }
    }
    else if(AttackIsBowcaster(dt, wield))
    {
        if(wield->Value[OVAL_WEAPON_CHARGE] < 1)
        {
            Act(AT_YELLOW, "$n points their bowcaster at you but nothing happens.", ch, nullptr, victim, ActTarget::Vict);
            Act(AT_YELLOW, "*CLICK* ... your bowcaster needs a new bolt cartridge!", ch, nullptr, victim, ActTarget::Char);

            if(IsNpc(ch))
            {
                do_remove(ch, wield->Name);
            }

            return rNONE;
        }
        else
        {
            wield->Value[OVAL_WEAPON_CHARGE]--;
        }
    }

    if(dam <= 0)
    {
        dam = 1;
    }

    if(prof_gsn != -1)
    {
        if(dam > 0)
        {
            LearnFromSuccess(ch, prof_gsn);
        }
        else
        {
            LearnFromFailure(ch, prof_gsn);
        }
    }

    /* immune to damage */
    if(dam == -1)
    {
        if(dt >= 0 && dt < TopSN)
        {
            std::shared_ptr<Skill> skill = SkillTable[dt];
            bool found = false;

            if(!skill->Messages.VictimImmune.ToCaster.empty())
            {
                Act(AT_HIT, skill->Messages.VictimImmune.ToCaster, ch, NULL, victim, ActTarget::Char);
                found = true;
            }

            if(!skill->Messages.VictimImmune.ToVictim.empty())
            {
                Act(AT_HITME, skill->Messages.VictimImmune.ToVictim, ch, NULL, victim, ActTarget::Vict);
                found = true;
            }

            if(!skill->Messages.VictimImmune.ToRoom.empty())
            {
                Act(AT_ACTION, skill->Messages.VictimImmune.ToRoom, ch, NULL, victim, ActTarget::NotVict);
                found = true;
            }

            if(found)
            {
                return rNONE;
            }
        }

        dam = 0;
    }

    retcode = InflictDamage(ch, victim, dam, dt);

    if(retcode != rNONE)
    {
        return retcode;
    }

    if(CharacterDiedRecently(ch))
    {
        return rCHAR_DIED;
    }

    if(CharacterDiedRecently(victim))
    {
        return rVICT_DIED;
    }

    retcode = rNONE;

    if(dam == 0)
    {
        return retcode;
    }

    /* weapon spells      -Thoric */
    if(wield != nullptr
       && !victim->Immune.test(Flag::Ris::Magic)
       && !victim->InRoom->Flags.test(Flag::Room::NoMagic))
    {
        for(auto aff : wield->Prototype->Affects())
        {
            if(aff->Location == APPLY_WEAPONSPELL
               && IS_VALID_SN(aff->Modifier)
               && SkillTable[aff->Modifier]->SpellFunction)
            {
                retcode = SkillTable[aff->Modifier]->SpellFunction(aff->Modifier, (wield->Level + 3) / 3, ch, victim);
            }
        }

        if(retcode != rNONE
           || CharacterDiedRecently(ch)
           || CharacterDiedRecently(victim))
        {
            return retcode;
        }

        for(const auto &aff : wield->Affects())
        {
            if(aff->Location == APPLY_WEAPONSPELL
               && IS_VALID_SN(aff->Modifier)
               && SkillTable[aff->Modifier]->SpellFunction)
            {
                retcode = SkillTable[aff->Modifier]->SpellFunction(aff->Modifier, (wield->Level + 3) / 3, ch, victim);
            }
        }

        if(retcode != rNONE
           || CharacterDiedRecently(ch)
           || CharacterDiedRecently(victim))
        {
            return retcode;
        }
    }

    /*
     * magic shields that retaliate                               -Thoric
     */
    if(IsAffectedBy(victim, Flag::Affect::Fireshield)
       && !IsAffectedBy(ch, Flag::Affect::Fireshield))
    {
        retcode = spell_fireball(gsn_fireball, GetOffensiveShieldLevelModifier(victim, ch), victim, ch);
    }

    if(retcode != rNONE
       || CharacterDiedRecently(ch)
       || CharacterDiedRecently(victim))
    {
        return retcode;
    }

    if(IsAffectedBy(victim, Flag::Affect::Shockshield)
       && !IsAffectedBy(ch, Flag::Affect::Shockshield))
    {
        retcode = spell_lightning_bolt(gsn_lightning_bolt, GetOffensiveShieldLevelModifier(victim, ch), victim, ch);
    }

    if(retcode != rNONE
       || CharacterDiedRecently(ch)
       || CharacterDiedRecently(victim))
    {
        return retcode;
    }

    /*
     *   folks with blasters move and snipe instead of getting neatin up in one spot.
     */
    if(IsNpc(victim))
    {
        auto wielding = GetEquipmentOnCharacter(victim, WEAR_WIELD);

        if(wielding != nullptr
           && wielding->Value[OVAL_WEAPON_TYPE] == WEAPON_BLASTER
           && SprintForCover(victim) == true)
        {
            StartHating(victim, ch);
            StartHunting(victim, ch);
        }
    }

    return retcode;
}

static bool AttackIsBowcaster(int dt, const std::shared_ptr<Object> &wield)
{
    return dt == (TYPE_HIT + WEAPON_BOWCASTER) && wield != nullptr && wield->ItemType == ITEM_WEAPON;
}

static bool AttackIsLightsaber(int dt, const std::shared_ptr<Object> &wield)
{
    return dt == (TYPE_HIT + WEAPON_LIGHTSABER)
        && wield != nullptr
        && wield->ItemType == ITEM_WEAPON;
}

static bool AttackIsForcePike(int dt, const std::shared_ptr<Object> &wield)
{
    return dt == (TYPE_HIT + WEAPON_FORCE_PIKE)
        && wield != nullptr
        && wield->ItemType == ITEM_WEAPON;
}

static bool AttackIsVibroBlade(int dt, const std::shared_ptr<Object> &wield)
{
    return dt == (TYPE_HIT + WEAPON_VIBRO_BLADE)
        && wield != nullptr
        && wield->ItemType == ITEM_WEAPON;
}

static bool AttackIsBlaster(int dt, const std::shared_ptr<Object> &wield)
{
    return dt == (TYPE_HIT + WEAPON_BLASTER) && wield && wield->ItemType == ITEM_WEAPON;
}

/*
 * Calculate damage based on resistances, immunities and suceptibilities
 *                                      -Thoric
 */
short ModifyDamageBasedOnResistance(std::shared_ptr<Character> ch, short dam, int ris)
{
    short modifier = 10;

    if(ch->Immune.test(ris))
        modifier -= 10;

    if(ch->Resistant.test(ris))
        modifier -= 2;

    if(ch->Susceptible.test(ris))
        modifier += 2;

    if(modifier <= 0)
        return -1;

    if(modifier == 10)
        return dam;

    return (dam * modifier) / 10;
}

static void WimpOut(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dam)
{
    if(IsNpc(victim) && dam > 0)
    {
        if((victim->Flags.test(Flag::Mob::Wimpy) && NumberBits(1) == 0
            && victim->HitPoints.Current < victim->HitPoints.Max / 2)
           || (IsAffectedBy(victim, Flag::Affect::Charm) && victim->Master
               && victim->Master->InRoom != victim->InRoom))
        {
            StartFearing(victim, ch);
            StopHunting(victim);
            do_flee(victim, "");
        }
    }

    if(!IsNpc(victim)
       && victim->HitPoints.Current > 0
       && victim->HitPoints.Current <= victim->Wimpy
       && victim->Wait == 0)
    {
        do_flee(victim, "");
    }
    else if(!IsNpc(victim) && victim->Flags.test(Flag::Plr::Flee))
    {
        do_flee(victim, "");
    }
}

/*
 * Inflict damage from a hit.
 */
ch_ret InflictDamage(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dam, int dt)
{
    if(!ch)
    {
        Log->Bug("%s: null ch!", __FUNCTION__);
        return rERROR;
    }

    if(!victim)
    {
        Log->Bug("%s: null victim!", __FUNCTION__);
        return rVICT_DIED;
    }

    if(victim->Position == POS_DEAD)
    {
        return rVICT_DIED;
    }

    /*
     * Check damage types for RIS                         -Thoric
     */
    if(dam && dt != TYPE_UNDEFINED)
    {
        if(IS_FIRE(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Fire);
        else if(IS_COLD(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Cold);
        else if(IS_ACID(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Acid);
        else if(IS_ELECTRICITY(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Electricity);
        else if(IS_ENERGY(dt) || dt == (TYPE_HIT + 6))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Energy);
        else if(IS_DRAIN(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Drain);
        else if(dt == gsn_poison || IS_POISON(dt))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Poison);
        else if(dt == (TYPE_HIT + 7) || dt == (TYPE_HIT + 8))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Blunt);
        else if(dt == (TYPE_HIT + 2) || dt == (TYPE_HIT + 11)
                || dt == (TYPE_HIT + 10))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Pierce);
        else if(dt == (TYPE_HIT + 1) || dt == (TYPE_HIT + 3)
                || dt == (TYPE_HIT + 4) || dt == (TYPE_HIT + 5))
            dam = ModifyDamageBasedOnResistance(victim, dam, Flag::Ris::Slash);

        if(dam == -1)
        {
            if(dt >= 0 && dt < TopSN)
            {
                bool found = false;
                std::shared_ptr<Skill> skill = SkillTable[dt];

                if(!skill->Messages.VictimImmune.ToCaster.empty())
                {
                    Act(AT_HIT, skill->Messages.VictimImmune.ToCaster, ch, NULL, victim, ActTarget::Char);
                    found = true;
                }

                if(!skill->Messages.VictimImmune.ToVictim.empty())
                {
                    Act(AT_HITME, skill->Messages.VictimImmune.ToVictim, ch, NULL, victim, ActTarget::Vict);
                    found = true;
                }

                if(!skill->Messages.VictimImmune.ToRoom.empty())
                {
                    Act(AT_ACTION, skill->Messages.VictimImmune.ToRoom, ch, NULL, victim, ActTarget::NotVict);
                    found = true;
                }

                if(found)
                {
                    return rNONE;
                }
            }

            dam = 0;
        }
    }

    if(dam && IsNpc(victim) && ch != victim)
    {
        if(!victim->Flags.test(Flag::Mob::Sentinel))
        {
            if(victim->HHF.Hunting)
            {
                if(victim->HHF.Hunting->Who != ch)
                {
                    victim->HHF.Hunting->Name = ch->Name;
                    victim->HHF.Hunting->Who = ch;
                }
            }
            else
                StartHunting(victim, ch);
        }

        if(victim->HHF.Hating)
        {
            if(victim->HHF.Hating->Who != ch)
            {
                victim->HHF.Hating->Name = ch->Name;
                victim->HHF.Hating->Who = ch;
            }
        }
        else
            StartHating(victim, ch);
    }

    if(victim != ch)
    {
        /*
         * Certain attacks are forbidden.
         * Most other attacks are returned.
         */
        if(IsSafe(ch, victim))
            return rNONE;


        if(victim->Position > POS_STUNNED)
        {
            if(!IsFighting(victim))
                StartFighting(victim, ch);

            if(IsFighting(victim))
                victim->Position = POS_FIGHTING;
        }

        if(victim->Position > POS_STUNNED)
        {
            if(!IsFighting(ch))
                StartFighting(ch, victim);

            /*
             * If victim is charmed, ch might attack victim's master.
             */
            if(IsNpc(ch)
               && IsNpc(victim)
               && IsAffectedBy(victim, Flag::Affect::Charm)
               && victim->Master
               && victim->Master->InRoom == ch->InRoom
               && NumberBits(3) == 0)
            {
                StopFighting(ch, false);
                ch_ret retcode = HitMultipleTimes(ch, victim->Master, TYPE_UNDEFINED);
                return retcode;
            }
        }

        /*
         * More charm stuff.
         */
        if(victim->Master == ch)
        {
            StopFollowing(victim);
        }

        /*
         * Inviso attacks ... not.
         */
        if(IsAffectedBy(ch, Flag::Affect::Invisible))
        {
            StripAffect(ch, gsn_invis);
            StripAffect(ch, gsn_mass_invis);
            ch->AffectedBy.reset(Flag::Affect::Invisible);
            Act(AT_MAGIC, "$n fades into existence.", ch, nullptr, nullptr, ActTarget::Room);
        }

        /* Take away Hide */
        if(IsAffectedBy(ch, Flag::Affect::Hide) && ch->Race != RACE_DEFEL)
        {
            ch->AffectedBy.reset(Flag::Affect::Hide);
        }

        /*
         * Damage modifiers.
         */
        if(IsAffectedBy(victim, Flag::Affect::Sanctuary))
        {
            dam /= 2;
        }

        if(IsAffectedBy(victim, Flag::Affect::Protect) && IsEvil(ch))
        {
            dam -= (int)(dam / 4);
        }

        if(dam < 0)
        {
            dam = 0;
        }

        /*
         * Check for disarm, trip, parry, and dodge.
         */
        if(dt >= TYPE_HIT)
        {
            if(IsNpc(ch)
               && ch->AttackFlags.test(Flag::Defense::Disarm)
               && GetRandomPercent() < GetAbilityLevel(ch, AbilityClass::Combat) / 2)
            {
                Disarm(ch, victim);
            }

            if(IsNpc(ch)
               && ch->AttackFlags.test(Flag::Attack::Trip)
               && GetRandomPercent() < GetAbilityLevel(ch, AbilityClass::Combat))
            {
                Trip(ch, victim);
            }

            if(CheckParry(ch, victim))
            {
                return rNONE;
            }

            if(CheckDodge(ch, victim))
            {
                return rNONE;
            }
        }

        /*
         * Check control panel settings and modify damage
         */
        short dampmod = 0;

        if(IsNpc(ch))
        {
            if(IsNpc(victim))
            {
                dampmod = SysData.DamageMobVsMob;
            }
            else
            {
                dampmod = SysData.DamageMobVsPlr;
            }
        }
        else
        {
            if(IsNpc(victim))
            {
                dampmod = SysData.DamagePlrVsMob;
            }
            else
            {
                dampmod = SysData.DamagePlrVsPlr;
            }
        }

        if(dampmod > 0)
        {
            dam = (dam * dampmod) / 100;
        }

        SendDamageMessages(ch, victim, dam, dt);
    }


    /*
     * Code to handle equipment getting damaged, and also support  -Thoric
     * bonuses/penalties for having or not having equipment where hit
     */
    if(dam > 10 && dt != TYPE_UNDEFINED)
    {
        /* get a random body eq part */
        WearLocation dameq = (WearLocation)GetRandomNumberFromRange(WEAR_LIGHT, WEAR_EYES);
        auto damobj = GetEquipmentOnCharacter(victim, dameq);

        if(damobj)
        {
            if(dam > GetObjectResistance(damobj))
            {
                SetCurrentGlobalObject(damobj);
                DamageObject(damobj);
            }

            dam -= 5;  /* add a bonus for having something to block the blow */
        }
        else
        {
            dam += 5;  /* add penalty for bare skin! */
        }
    }

    /*
     * Hurt the victim.
     * Inform the victim of his new state.
     */

    victim->HitPoints.Current -= dam;

    /*
     * Get experience based on % of damage done                   -Thoric
     */
    if(dam && ch != victim
       && !IsNpc(ch) && IsFighting(ch) && ch->Fighting->Xp)
    {
        long xp_gain = (long)(ComputeXP(ch, victim) * 0.1 * dam) / victim->HitPoints.Max;
        GainXP(ch, AbilityClass::Combat, xp_gain);
    }

    if(!IsNpc(victim)
       && (victim->TopLevel >= LEVEL_IMMORTAL
           || IsInArena(victim))
       && victim->HitPoints.Current < 1)
    {
        victim->HitPoints.Current = 1;

        if(IsInArena(victim))
        {
            char buf[MAX_STRING_LENGTH];
            CharacterFromRoom(victim);
            CharacterToRoom(victim, GetRoom(victim->ReTran));
            do_look(victim, "auto");
            Act(AT_YELLOW, "$n falls from the sky.", victim, NULL, NULL, ActTarget::Room);
            victim->HitPoints.Current = victim->HitPoints.Max;
            victim->Mana.Current = victim->Mana.Max;
            victim->Fatigue.Current = victim->Fatigue.Max;
            sprintf(buf, "%s is out of the fight.", victim->Name.c_str());
            ToChannel(buf, CHANNEL_ARENA, "&RArena&W", 5);
            StopFighting(victim, true);
        }
    }

    if(IsNpc(victim) && victim->Flags.test(Flag::Mob::Immortal))
    {
        victim->HitPoints.Current = victim->HitPoints.Max;
    }

    /* Make sure newbies dont die */

    if(!IsNpc(victim) && !IsAuthed(victim) && victim->HitPoints.Current < 1)
    {
        victim->HitPoints.Current = 1;
    }

    if(dam > 0 && dt > TYPE_HIT
       && !IsAffectedBy(victim, Flag::Affect::Poison)
       && IsWieldingPoisonedWeapon(ch)
       && !victim->Immune.test(Flag::Ris::Poison)
       && !SaveVsPoisonDeath(GetAbilityLevel(ch, AbilityClass::Combat), victim))
    {
        std::shared_ptr<Affect> af = std::make_shared<Affect>();

        af->Type = gsn_poison;
        af->Duration = 20;
        af->Location = APPLY_STR;
        af->Modifier = -2;
        af->AffectedBy = CreateBitSet<Flag::MAX>({ Flag::Affect::Poison });
        JoinAffect(victim, af);
        ch->MentalState = urange(20, ch->MentalState + 2, 100);
    }

    if(!IsNpc(victim)
       && GetTrustLevel(victim) >= LEVEL_IMMORTAL
       && GetTrustLevel(ch) >= LEVEL_IMMORTAL
       && victim->HitPoints.Current < 1)
    {
        victim->HitPoints.Current = 1;
    }

    UpdatePosition(victim);

    switch(victim->Position)
    {
    case POS_MORTAL:
        Act(AT_DYING, "$n is mortally wounded, and will die soon, if not aided.",
            victim, nullptr, nullptr, ActTarget::Room);
        victim->Echo("&RYou are mortally wounded, and will die soon, if not aided.\r\n");
        break;

    case POS_INCAP:
        Act(AT_DYING, "$n is incapacitated and will slowly die, if not aided.",
            victim, nullptr, nullptr, ActTarget::Room);
        victim->Echo("&RYou are incapacitated and will slowly die, if not aided.\r\n");
        break;

    case POS_STUNNED:
        if(!IsAffectedBy(victim, Flag::Affect::Paralysis))
        {
            Act(AT_ACTION, "$n is stunned, but will probably recover.",
                victim, nullptr, nullptr, ActTarget::Room);
            victim->Echo("&RYou are stunned, but will probably recover.\r\n");
        }
        break;

    case POS_DEAD:
        if(dt >= 0 && dt < TopSN)
        {
            std::shared_ptr<Skill> skill = SkillTable[dt];

            if(!skill->Messages.VictimDeath.ToCaster.empty())
            {
                Act(AT_DEAD, skill->Messages.VictimDeath.ToCaster, ch, NULL, victim, ActTarget::Char);
            }

            if(!skill->Messages.VictimDeath.ToVictim.empty())
            {
                Act(AT_DEAD, skill->Messages.VictimDeath.ToVictim, ch, NULL, victim, ActTarget::Vict);
            }

            if(!skill->Messages.VictimDeath.ToRoom.empty())
            {
                Act(AT_DEAD, skill->Messages.VictimDeath.ToRoom, ch, NULL, victim, ActTarget::NotVict);
            }
        }

        if(IsNpc(victim) && victim->Flags.test(Flag::Mob::NoKill))
        {
            Act(AT_YELLOW, "$n flees for $s life... barely escaping certain death!",
                victim, 0, 0, ActTarget::Room);
        }
        else if(IsDroid(victim))
        {
            Act(AT_DEAD, "$n EXPLODES into many small pieces!", victim, 0, 0, ActTarget::Room);
        }
        else
        {
            Act(AT_DEAD, "$n is DEAD!", victim, 0, 0, ActTarget::Room);
        }

        victim->Echo("&WYou have been KILLED!\r\n");
        break;

    default:
        if(dam > victim->HitPoints.Max / 4)
        {
            Act(AT_HURT, "That really did HURT!", victim, 0, 0, ActTarget::Char);

            if(NumberBits(3) == 0)
            {
                WorsenMentalState(ch, 1);
            }
        }

        if(victim->HitPoints.Current < victim->HitPoints.Max / 4)
        {
            Act(AT_DANGER, "You wish that your wounds would stop BLEEDING so much!",
                victim, 0, 0, ActTarget::Char);

            if(NumberBits(2) == 0)
            {
                WorsenMentalState(ch, 1);
            }
        }
        break;
    }

    /*
     * Sleep spells and extremely wounded folks.
     */
    if(!IsAwake(victim)                /* lets make NPC's not slaughter PC's */
       && !IsAffectedBy(victim, Flag::Affect::Paralysis))
    {
        if(IsFighting(victim)
           && victim->Fighting->Who->HHF.Hunting
           && victim->Fighting->Who->HHF.Hunting->Who == victim)
        {
            StopHunting(victim->Fighting->Who);
        }

        if(IsFighting(victim)
           && victim->Fighting->Who->HHF.Hating
           && victim->Fighting->Who->HHF.Hating->Who == victim)
        {
            StopHating(victim->Fighting->Who);
        }

        StopFighting(victim, true);
    }

    if(victim->HitPoints.Current <= 0 && !IsNpc(victim))
    {
        StopFighting(victim, true);
        const auto wearLocsToUnequip = { WEAR_DUAL_WIELD, WEAR_WIELD, WEAR_HOLD, WEAR_MISSILE_WIELD, WEAR_LIGHT };

        for(const auto wearLoc : wearLocsToUnequip)
        {
            auto equippedObject = GetEquipmentOnCharacter(victim, wearLoc);

            if(equippedObject != nullptr)
            {
                UnequipCharacter(victim, equippedObject);
            }
        }

        if(SysData.DropOnDefeat)
        {
            for(auto i = std::begin(victim->Objects()), i_next = std::end(victim->Objects());
                i != std::end(victim->Objects());
                i = i_next)
            {
                auto obj = *i;
                i_next = ++i;

                if(obj->WearLoc == WEAR_NONE)
                {
                    if(obj->Prototype->mprog.progtypes & DROP_PROG && obj->Count > 1)
                    {
                        SeparateOneObjectFromGroup(obj);
                        ObjectFromCharacter(obj);

                        if(i_next == std::end(victim->Objects()))
                        {
                            i_next = std::begin(victim->Objects());
                        }
                    }
                    else
                    {
                        ObjectFromCharacter(obj);
                    }

                    Act(AT_ACTION, "$n drops $p.", victim, obj, nullptr, ActTarget::Room);
                    Act(AT_ACTION, "You drop $p.", victim, obj, nullptr, ActTarget::Char);
                    obj = ObjectToRoom(obj, victim->InRoom);
                }
            }
        }

        if(IsNpc(ch) && !IsNpc(victim))
        {
            long xp_to_lose = umax(GetAbilityXP(victim, AbilityClass::Combat) - GetRequiredXpForLevel(GetAbilityLevel(ch, AbilityClass::Combat)), 0);
            long xp_actually_lost = LoseXP(victim, AbilityClass::Combat, xp_to_lose);

            victim->Echo("You lose %ld experience.\r\n", xp_actually_lost);
        }

        AddTimer(victim, TimerType::RecentFight, 100);
    }

    /*
     * Payoff for killing things.
     */
    if(victim->Position == POS_DEAD)
    {
        GainGroupXP(ch, victim);

        if(!IsNpc(victim))
        {
            auto logBuf = FormatString("%s killed by %s at %ld",
                                       victim->Name.c_str(),
                                       (IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str()),
                                       victim->InRoom->Vnum);
            Log->Info("%s", logBuf.c_str());
            ToChannel(logBuf, CHANNEL_MONITOR, "Monitor", LEVEL_IMMORTAL);

        }
        else if(!IsNpc(ch))              /* keep track of mob vnum killed */
        {
            AddKill(ch, victim);
        }

        ApplyWantedFlags(ch, victim);
        UpdateKillStats(ch, victim);

        if(!IsNpc(ch) && ch->PCData->ClanInfo.Clan)
        {
            UpdateClanMember(ch);
        }

        if(!IsNpc(victim) && victim->PCData->ClanInfo.Clan)
        {
            UpdateClanMember(victim);
        }

        bool loot = false;

        if(victim->InRoom != ch->InRoom
           || !IsNpc(victim)
           || !victim->Flags.test(Flag::Mob::NoKill))
        {
            loot = CanLootVictim(ch, victim);
        }
        else
        {
            loot = false;
        }

        SetCurrentGlobalCharacter(victim);
        RawKill(ch, victim);
        victim = nullptr;

        if(!IsNpc(ch) && loot)
        {
            /* Autogold by Scryn 8/12 */
            if(ch->Flags.test(Flag::Plr::Autocred))
            {
                int init_gold = ch->Gold;
                do_get(ch, "credits corpse");
                int new_gold = ch->Gold;
                int gold_diff = (new_gold - init_gold);

                if(gold_diff > 0)
                {
                    do_split(ch, std::to_string(gold_diff));
                }
            }

            if(ch->Flags.test(Flag::Plr::Autoloot))
            {
                do_get(ch, "all corpse");
            }
            else
            {
                do_look(ch, "in corpse");
            }

            if(ch->Flags.test(Flag::Plr::Autosac))
            {
                do_junk(ch, "corpse");
            }
        }

        if(IsNpc(ch) && loot)
        {
            do_get(ch, "credits corpse");
            do_get(ch, "all corpse");

            if(ch->InRoom && ch->InRoom->Area)
            {
                BoostEconomy(ch->InRoom->Area, ch->Gold / 5);
                ch->Gold /= 5;
            }
        }

        if(!loot && victim && IsNpc(victim)
           && victim->InRoom && victim->InRoom->Area)
        {
            BoostEconomy(victim->InRoom->Area, victim->Gold);
        }

        if(SysData.SaveFlags.test(Flag::AutoSave::Kill))
        {
            PlayerCharacters->Save(ch);
        }

        return rVICT_DIED;
    }

    if(victim == ch)
    {
        return rNONE;
    }

    /*
     * Take care of link dead people.
     */
    if(!IsNpc(victim) && !victim->Desc && !victim->Switched
       && GetRandomNumberFromRange(0, victim->Wait) == 0)
    {
        for(size_t i = 0; i < 5; ++i)
        {
            do_flee(victim, "");
        }

        do_hail(victim, "");
        do_quit(victim, "");
        return rNONE;
    }

    WimpOut(ch, victim, dam);

    return rNONE;
}

bool IsSafe(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(victim == nullptr
       || WhoFighting(ch) == ch
       || GetTrustLevel(ch) > LEVEL_AVATAR
       || (IsNpc(ch) || IsNpc(victim)))
    {
        return false;
    }
    else if(victim->InRoom->Flags.test(Flag::Room::Safe))
    {
        SetCharacterColor(AT_MAGIC, ch);
        ch->Echo("You'll have to do that elsewhere.\r\n");
        return true;
    }
    else
    {
        return false;
    }
}

/*
 * just verify that a corpse looting is legal
 */
bool CanLootVictim(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    /* pc's can now loot .. why not .. death is pretty final */
    if(!IsNpc(ch))
        return true;

    /* non-charmed mobs can loot anything */
    if(IsNpc(ch) && !ch->Master)
        return true;

    return false;
}

static void ApplyWantedFlags(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(IsAffectedBy(ch, Flag::Affect::Charm))
    {
        if(!ch->Master)
        {
            Log->Bug("%s: %s bad AFF_CHARM",
                     __FUNCTION__, IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str());
            StripAffect(ch, gsn_charm_person);
            ch->AffectedBy.reset(Flag::Affect::Charm);
            return;
        }

        if(ch->Master)
        {
            ApplyWantedFlags(ch->Master, victim);
        }
    }

    if(IsNpc(victim) && !IsNpc(ch))
    {
        for(size_t x = 0; x < Flag::MAX; x++)
        {
            if(victim->VipFlags.test(x))
            {
                ch->PCData->WantedOn.set(x);
                ch->Echo("&YYou are now wanted on %s.&w\r\n", WantedFlags[x]);
            }
        }
    }
}

static void UpdateKillStats(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(IsAffectedBy(ch, Flag::Affect::Charm))
    {
        if(!ch->Master)
        {
            Log->Bug("%s: %s bad AFF_CHARM",
                     __FUNCTION__, IsNpc(ch) ? ch->ShortDescr.c_str() : ch->Name.c_str());
            StripAffect(ch, gsn_charm_person);
            ch->AffectedBy.reset(Flag::Affect::Charm);
            return;
        }

        if(ch->Master)
        {
            UpdateKillStats(ch->Master, victim);
        }
    }

    if(!IsNpc(ch) && IsNpc(victim))
    {
        if(ch->PCData->ClanInfo.Clan)
        {
            ch->PCData->ClanInfo.Clan->MobKills++;
        }

        ch->PCData->MKills++;
        ch->InRoom->Area->MKills++;
    }
    else if(!IsNpc(ch) && !IsNpc(victim))
    {
        if(IsClanned(ch))
        {
            ch->PCData->ClanInfo.Clan->PlayerKills++;
        }

        if(IsClanned(victim))
        {
            victim->PCData->ClanInfo.Clan->PlayerDeaths++;
        }

        ch->PCData->PKills++;
        UpdatePosition(victim);
    }
    else if(IsNpc(ch) && !IsNpc(victim))
    {
        victim->InRoom->Area->MDeaths++;
    }
}

/*
 * Set position of a victim.
 */
void UpdatePosition(std::shared_ptr<Character> victim)
{
    assert(victim != nullptr);

    if(victim->HitPoints.Current > 0)
    {
        if(victim->Position <= POS_STUNNED)
        {
            victim->Position = POS_STANDING;
        }

        if(IsAffectedBy(victim, Flag::Affect::Paralysis))
        {
            victim->Position = POS_STUNNED;
        }

        return;
    }

    if(!SysData.PermaDeath)
    {
        if(!IsNpc(victim) && victim->HitPoints.Current <= -500)
        {
            victim->HitPoints.Current = -250;
        }
    }

    if(IsNpc(victim) || victim->HitPoints.Current <= -500)
    {
        if(victim->Mount)
        {
            Act(AT_ACTION, "$n falls from $N.", victim, NULL, victim->Mount, ActTarget::Room);
            victim->Mount->Flags.reset(Flag::Mob::Mounted);
            victim->Mount = nullptr;
        }

        victim->Position = POS_DEAD;
        return;
    }

    if(victim->HitPoints.Current <= -400)
    {
        victim->Position = POS_MORTAL;
    }
    else if(victim->HitPoints.Current <= -200)
    {
        victim->Position = POS_INCAP;
    }
    else
    {
        victim->Position = POS_STUNNED;
    }

    if(victim->Position > POS_STUNNED
       && IsAffectedBy(victim, Flag::Affect::Paralysis))
    {
        victim->Position = POS_STUNNED;
    }

    if(victim->Mount)
    {
        Act(AT_ACTION, "$n falls unconscious from $N.", victim, NULL, victim->Mount, ActTarget::Room);
        victim->Mount->Flags.reset(Flag::Mob::Mounted);
        victim->Mount = nullptr;
    }
}

/*
 * Start fights.
 */
void StartFighting(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(IsFighting(ch))
    {
        Log->Bug("%s: %s -> %s (already fighting %s)",
                 __FUNCTION__, ch->Name.c_str(), victim->Name.c_str(),
                 ch->Fighting->Who->Name.c_str());
        return;
    }

    if(IsAffectedBy(ch, Flag::Affect::Sleep))
    {
        StripAffect(ch, gsn_sleep);
    }

    /* Limit attackers -Thoric */
    if(NumFighting(victim) > MAX_NUMBER_OF_FIGHTERS)
    {
        ch->Echo("There are too many people fighting for you to join in.\r\n");
        return;
    }

    ch->Fighting = std::make_shared<Fight>(victim);
    ch->Fighting->Xp = ComputeXP(ch, victim);

    ch->NumFighting = 1;
    ch->Position = POS_FIGHTING;
    victim->NumFighting++;

    if(victim->Switched && IsAffectedBy(victim->Switched, Flag::Affect::Possess))
    {
        victim->Switched->Echo("You are disturbed!\r\n");
        do_return(victim->Switched, "");
    }
}

void FreeFight(std::shared_ptr<Character> ch)
{
    if(ch == nullptr)
    {
        Log->Bug("Free_fight: null ch!");
        return;
    }

    if(IsFighting(ch))
    {
        if(!CharacterDiedRecently(ch->Fighting->Who))
        {
            --ch->Fighting->Who->NumFighting;
        }
    }

    ch->Fighting.reset();

    if(ch->Mount)
    {
        ch->Position = POS_MOUNTED;
    }
    else
    {
        ch->Position = POS_STANDING;
    }

    /* Berserk wears off after combat. -- Altrag */
    if(IsAffectedBy(ch, Flag::Affect::Berserk))
    {
        StripAffect(ch, gsn_berserk);
        SetCharacterColor(AT_WEAROFF, ch);
        ch->Echo("%s\r\n", SkillTable[gsn_berserk]->Messages.WearOff.c_str());
    }
}

/*
 * Stop fights.
 */
void StopFighting(std::shared_ptr<Character> ch, bool fBoth)
{
    FreeFight(ch);
    UpdatePosition(ch);

    if(!fBoth)   /* major short cut here by Thoric */
    {
        return;
    }

    for(auto fch = FirstCharacter; fch; fch = fch->Next)
    {
        if(WhoFighting(fch) == ch)
        {
            FreeFight(fch);
            UpdatePosition(fch);
        }
    }
}

static bool RemoveShipOwner(std::shared_ptr<Ship> ship, const std::shared_ptr<Character> &victim)
{
    if(!StrCmp(ship->Owner, victim->Name))
    {
        ship->Owner.erase();
        ship->Pilot.erase();
        ship->CoPilot.erase();

        Ships->Save(ship);
    }

    return true;
}

class RemoveResident
{
public:
    RemoveResident(const std::string &name)
        : _resident(name)
    {

    }

    void operator()(const std::shared_ptr<Home> home) const
    {
        if(StrCmp(home->Owner(), _resident) == 0)
        {
            Homes->Delete(home);
        }
        else
        {
            home->RemoveResident(_resident);
            Homes->Save(home);
        }
    }

private:
    std::string _resident;
};

void RawKill(std::shared_ptr<Character> killer, std::shared_ptr<Character> victim)
{
    std::shared_ptr<Character> victmp = nullptr;

    if(!victim)
    {
        Log->Bug("RawKill: null victim!");
        return;
    }

    std::string arg = victim->Name;

    StopFighting(victim, true);

    if(killer && !IsNpc(killer) && !IsNpc(victim))
        ClaimBounty(killer, victim);

    /* Take care of polymorphed chars */
    if(IsNpc(victim) && victim->Flags.test(Flag::Mob::Polymorphed))
    {
        CharacterFromRoom(victim->Desc->Original);
        CharacterToRoom(victim->Desc->Original, victim->InRoom);
        victmp = victim->Desc->Original;
        do_revert(victim, "");
        RawKill(killer, victmp);
        return;
    }

    if(victim->InRoom && IsNpc(victim) && victim->VipFlags != 0 && victim->InRoom->Area && victim->InRoom->Area->Planet)
    {
        victim->InRoom->Area->Planet->Population--;
        victim->InRoom->Area->Planet->Population = umax(victim->InRoom->Area->Planet->Population, 0);
        victim->InRoom->Area->Planet->PopularSupport -= (float)(1 + 1 / (victim->InRoom->Area->Planet->Population + 1));

        if(victim->InRoom->Area->Planet->PopularSupport < -100)
            victim->InRoom->Area->Planet->PopularSupport = -100;
    }

    if(!IsNpc(victim) || !victim->Flags.test(Flag::Mob::NoKill))
        MobProgDeathTrigger(killer, victim);

    if(CharacterDiedRecently(victim))
        return;

    if(!IsNpc(victim) || !victim->Flags.test(Flag::Mob::NoKill))
        RoomProgDeathTrigger(killer, victim);

    if(CharacterDiedRecently(victim))
        return;

    if(!IsNpc(victim)
       || (!victim->Flags.test(Flag::Mob::NoKill) && !victim->Flags.test(Flag::Mob::NoCorpse)))
    {
        MakeCorpse(victim);
    }
    else
    {
        auto carriedByVictim = Reverse(victim->Objects());

        for(auto obj : carriedByVictim)
        {
            ObjectFromCharacter(obj);
            ExtractObject(obj);
        }
    }

    if(IsNpc(victim))
    {
        victim->Prototype->Killed++;
        ExtractCharacter(victim, true);
        return;
    }

    SetCharacterColor(AT_DIEMSG, victim);
    do_help(victim, "_DIEMSG_");

    if(SysData.PermaDeath)
    {
        ForEachShip(RemoveShipOwner, victim);
        ForEach(Homes->FindHomesForResident(victim->Name), RemoveResident(victim->Name));
        
        if(victim->PCData && victim->PCData->ClanInfo.Clan)
        {
            RemoveClanMember(victim);
            
            if(!StrCmp(victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Leader))
            {
                if(!victim->PCData->ClanInfo.Clan->Leadership.Number1.empty())
                {
                    victim->PCData->ClanInfo.Clan->Leadership.Leader = victim->PCData->ClanInfo.Clan->Leadership.Number1;
                    victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
                }
                else if(!victim->PCData->ClanInfo.Clan->Leadership.Number2.empty())
                {
                    victim->PCData->ClanInfo.Clan->Leadership.Leader = victim->PCData->ClanInfo.Clan->Leadership.Number2;
                    victim->PCData->ClanInfo.Clan->Leadership.Number2.erase();
                }
                else
                {
                    victim->PCData->ClanInfo.Clan->Leadership.Leader.erase();
                }
            }

            if(!StrCmp(victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Number1))
            {
                if(!victim->PCData->ClanInfo.Clan->Leadership.Number2.empty())
                {
                    victim->PCData->ClanInfo.Clan->Leadership.Number1 = victim->PCData->ClanInfo.Clan->Leadership.Number2;
                    victim->PCData->ClanInfo.Clan->Leadership.Number2.erase();
                }
                else
                {
                    victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
                }
            }

            if(!StrCmp(victim->Name, victim->PCData->ClanInfo.Clan->Leadership.Number2))
            {
                victim->PCData->ClanInfo.Clan->Leadership.Number1.erase();
            }
        }

        if(!victim)
        {
            /* Make sure they aren't halfway logged in. */
            auto d = Find(Descriptors->Entities(),
                          [&victim](const auto descriptor)
                          {
                              return (victim = descriptor->Char) && !IsNpc(victim);
                          });

            if(d != nullptr)
            {
                CloseDescriptor(d, true);
            }
        }
        else
        {
            quitting_char = victim;
            PlayerCharacters->Save(victim);
            saving_char.reset();
            ExtractCharacter(victim, true);
        }

        PlayerCharacters->RestoreClone(victim);
    }
    else
    {
        auto cloningCylinder = GetRoom(ROOM_VNUM_CLONING_CYLINDER);

        if(!cloningCylinder)
        {
            cloningCylinder = GetRoom(ROOM_VNUM_LIMBO);
        }

        CharacterFromRoom(victim);
        CharacterToRoom(victim, cloningCylinder);
        ResetPlayerOnDeath(victim);
        victim->Position = POS_SLEEPING;
    }
}

static void CheckObjectAlignmentZapping(std::shared_ptr<Character> ch)
{
    auto carriedObjects = ch->Objects();

    for(auto obj : carriedObjects)
    {
        if(obj->WearLoc == WEAR_NONE)
        {
            continue;
        }

        if((obj->Flags.test(Flag::Obj::AntiEvil) && IsEvil(ch))
           || (obj->Flags.test(Flag::Obj::AntiGood) && IsGood(ch))
           || (obj->Flags.test(Flag::Obj::AntiNeutral) && IsNeutral(ch)))
        {
            Act(AT_MAGIC, "You are zapped by $p.", ch, obj, NULL, ActTarget::Char);
            Act(AT_MAGIC, "$n is zapped by $p.", ch, obj, NULL, ActTarget::Room);

            ObjectFromCharacter(obj);
            obj = ObjectToRoom(obj, ch->InRoom);
            ObjProgZapTrigger(ch, obj);  /* mudprogs */

            if(CharacterDiedRecently(ch))
            {
                return;
            }
        }
    }
}

static int CountGroupMembersInRoom(std::shared_ptr<Character> ch)
{
    return Count(ch->InRoom->Characters(),
                 [ch](auto character)
                 {
                     return IsInSameGroup(character, ch);
                 });
}

static void GainGroupXP(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    /*
     * Monsters don't get kill xp's or alignment changes.
     * Dying of mortal wounds or poison doesn't give xp to anyone!
     */
    if(IsNpc(ch) || victim == ch)
    {
        return;
    }

    int members = CountGroupMembersInRoom(ch);

    if(members == 0)
    {
        Log->Bug("%s: zero members.", __FUNCTION__);
        members = 1;
    }

    std::shared_ptr<Character> lch = ch->Leader ? ch->Leader : ch;

    for(std::shared_ptr<Character> gch : ch->InRoom->Characters())
    {
        if(!IsInSameGroup(gch, ch))
        {
            continue;
        }

        long xp = ComputeXP(gch, victim) / members;

        gch->Alignment = ComputeNewAlignment(gch, victim);

        if(!IsNpc(gch) && IsNpc(victim) && gch->PCData && gch->PCData->ClanInfo.Clan
           && !StrCmp(gch->PCData->ClanInfo.Clan->Name, victim->MobClan))
        {
            xp = 0;
            gch->Echo("You receive no experience for killing your organizations resources.\r\n");
        }
        else
        {
            gch->Echo("You receive %ld combat experience.\r\n", xp);
        }

        GainXP(gch, AbilityClass::Combat, xp);

        if(lch == gch && members > 1)
        {
            xp = urange(members, xp * members, (GetRequiredXpForLevel(GetAbilityLevel(gch, AbilityClass::Leadership) + 1) - GetRequiredXpForLevel(GetAbilityLevel(gch, AbilityClass::Leadership)) / 10));
            gch->Echo("You get %ld leadership experience for leading your group to victory.\r\n", xp);
            GainXP(gch, AbilityClass::Leadership, xp);
        }

        CheckObjectAlignmentZapping(ch);
    }
}


static int ComputeNewAlignment(std::shared_ptr<Character> gch, std::shared_ptr<Character> victim)
{
    return urange(-1000,
                  (int)(gch->Alignment - victim->Alignment / 5),
                  1000);
}

/*
 * Calculate how much XP gch should gain for killing victim
 * Lots of redesigning for new exp system by Thoric
 */
long ComputeXP(std::shared_ptr<Character> gch, std::shared_ptr<Character> victim)
{
    long xp = (GetXPWorth(victim)
               * urange(1, (GetAbilityLevel(victim, AbilityClass::Combat) - GetAbilityLevel(gch, AbilityClass::Combat)) + 10, 20)) / 10;
    int align = gch->Alignment - victim->Alignment;

    /* bonus for attacking opposite alignment */
    if(align > 990 || align < -990)
    {
        xp = (xp * 5) >> 2;
    }
    /* penalty for good attacking same alignment */
    else if(gch->Alignment > 300 && align < 250)
    {
        xp = (xp * 3) >> 2;
    }

    xp = GetRandomNumberFromRange((xp * 3) >> 2, (xp * 5) >> 2);

    /* reduce exp for killing the same mob repeatedly             -Thoric */
    if(!IsNpc(gch) && IsNpc(victim))
    {
        int times = TimesKilled(gch, victim);

        if(times >= 5)
        {
            xp = 0;
        }
        else if(times)
        {
            xp = (xp * (5 - times)) / 5;
        }
    }

    /* new xp cap for swreality */

    return urange(1, xp, (GetRequiredXpForLevel(GetAbilityLevel(gch, AbilityClass::Combat) + 1) - GetRequiredXpForLevel(GetAbilityLevel(gch, AbilityClass::Combat))));
}

/*
 * Revamped by Thoric to be more realistic
 */
static void SendDamageMessages(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, int dam, int dt)
{
    char buf1[256], buf2[256], buf3[256];
    const char *vs = nullptr;
    const char *vp = nullptr;
    const char *attack = nullptr;
    char punct = '\0';
    short dampc = 0;
    std::shared_ptr<Skill> skill;
    bool gcflag = false;
    bool gvflag = false;

    if(dam)
    {
        dampc = ((dam * 1000) / victim->HitPoints.Max) +
            (50 - ((victim->HitPoints.Current * 50) / victim->HitPoints.Max));
    }

    if(dam == 0)
    {
        vs = "miss";
        vp = "misses";
    }
    else if(dampc <= 5)
    {
        vs = "barely scratch";
        vp = "barely scratches";
    }
    else if(dampc <= 10)
    {
        vs = "scratch";
        vp = "scratches";
    }
    else if(dampc <= 20)
    {
        vs = "nick";
        vp = "nicks";
    }
    else if(dampc <= 30)
    {
        vs = "graze";
        vp = "grazes";
    }
    else if(dampc <= 40)
    {
        vs = "bruise";
        vp = "bruises";
    }
    else if(dampc <= 50)
    {
        vs = "hit";
        vp = "hits";
    }
    else if(dampc <= 60)
    {
        vs = "injure";
        vp = "injures";
    }
    else if(dampc <= 75)
    {
        vs = "thrash";
        vp = "thrashes";
    }
    else if(dampc <= 80)
    {
        vs = "wound";
        vp = "wounds";
    }
    else if(dampc <= 90)
    {
        vs = "maul";
        vp = "mauls";
    }
    else if(dampc <= 125)
    {
        vs = "decimate";
        vp = "decimates";
    }
    else if(dampc <= 150)
    {
        vs = "devastate";
        vp = "devastates";
    }
    else if(dampc <= 200)
    {
        vs = "maim";
        vp = "maims";
    }
    else if(dampc <= 300)
    {
        vs = "MUTILATE";
        vp = "MUTILATES";
    }
    else if(dampc <= 400)
    {
        vs = "DISEMBOWEL";
        vp = "DISEMBOWELS";
    }
    else if(dampc <= 500)
    {
        vs = "MASSACRE";
        vp = "MASSACRES";
    }
    else if(dampc <= 600)
    {
        vs = "PULVERIZE";
        vp = "PULVERIZES";
    }
    else if(dampc <= 750)
    {
        vs = "EVISCERATE";
        vp = "EVISCERATES";
    }
    else if(dampc <= 990)
    {
        vs = "* OBLITERATE *";
        vp = "* OBLITERATES *";
    }
    else
    {
        vs = "*** ANNIHILATE ***";
        vp = "*** ANNIHILATES ***";
    }

    punct = (dampc <= 30) ? '.' : '!';

    if(dam == 0
       && !IsNpc(ch) && ch->PCData->Flags.test(Flag::PCData::Gag))
    {
        gcflag = true;
    }

    if(dam == 0
       && !IsNpc(victim) && victim->PCData->Flags.test(Flag::PCData::Gag))
    {
        gvflag = true;
    }

    if(0 <= dt && dt < TopSN)
    {
        skill = SkillTable[dt];
    }

    if(dt == TYPE_HIT || dam == 0)
    {
        sprintf(buf1, "$n %s $N%c", vp, punct);
        sprintf(buf2, "You %s $N%c", vs, punct);
        sprintf(buf3, "$n %s you%c", vp, punct);
    }
    else if(dt > TYPE_HIT && IsWieldingPoisonedWeapon(ch))
    {
        if(dt < TYPE_HIT + (int)GetAttackTableSize())
        {
            attack = GetAttackTypeName(dt - TYPE_HIT);
        }
        else
        {
            Log->Bug("%s: bad dt %d.", __FUNCTION__, dt);
            dt = TYPE_HIT;
            attack = GetAttackTypeName(0);
        }

        sprintf(buf1, "$n's poisoned %s %s $N%c", attack, vp, punct);
        sprintf(buf2, "Your poisoned %s %s $N%c", attack, vp, punct);
        sprintf(buf3, "$n's poisoned %s %s you%c", attack, vp, punct);
    }
    else
    {
        if(skill)
        {
            attack = skill->Messages.NounDamage.c_str();

            if(dam == 0)
            {
                bool found = false;

                if(!skill->Messages.Failure.ToCaster.empty())
                {
                    Act(AT_HIT, skill->Messages.Failure.ToCaster, ch, NULL, victim, ActTarget::Char);
                    found = true;
                }

                if(!skill->Messages.Failure.ToVictim.empty())
                {
                    Act(AT_HITME, skill->Messages.Failure.ToVictim, ch, NULL, victim, ActTarget::Vict);
                    found = true;
                }

                if(!skill->Messages.Failure.ToRoom.empty())
                {
                    Act(AT_ACTION, skill->Messages.Failure.ToRoom, ch, NULL, victim, ActTarget::NotVict);
                    found = true;
                }

                if(found)    /* miss message already sent */
                {
                    return;
                }
            }
            else
            {
                if(!skill->Messages.Success.ToCaster.empty())
                {
                    Act(AT_HIT, skill->Messages.Success.ToCaster, ch, NULL, victim, ActTarget::Char);
                }

                if(!skill->Messages.Success.ToVictim.empty())
                {
                    Act(AT_HITME, skill->Messages.Success.ToVictim, ch, NULL, victim, ActTarget::Vict);
                }

                if(!skill->Messages.Success.ToRoom.empty())
                {
                    Act(AT_ACTION, skill->Messages.Success.ToRoom, ch, NULL, victim, ActTarget::NotVict);
                }
            }
        }
        else if(dt >= TYPE_HIT
                && dt < TYPE_HIT + (int)GetAttackTableSize())
        {
            attack = GetAttackTypeName(dt - TYPE_HIT);
        }
        else
        {
            Log->Bug("%s: bad dt %d.", __FUNCTION__, dt);
            dt = TYPE_HIT;
            attack = GetAttackTypeName(0);
        }

        sprintf(buf1, "$n's %s %s $N%c", attack, vp, punct);
        sprintf(buf2, "Your %s %s $N%c", attack, vp, punct);
        sprintf(buf3, "$n's %s %s you%c", attack, vp, punct);
    }

    if(GetAbilityLevel(ch, AbilityClass::Combat) >= 50)
    {
        char damageAmountMsg[100];
        sprintf(damageAmountMsg, " You do %d points of damage.", dam);
        strcat(buf2, damageAmountMsg);
    }

    Act(AT_ACTION, buf1, ch, NULL, victim, ActTarget::NotVict);

    if(!gcflag)
    {
        Act(AT_HIT, buf2, ch, NULL, victim, ActTarget::Char);
    }

    if(!gvflag)
    {
        Act(AT_HITME, buf3, ch, NULL, victim, ActTarget::Vict);
    }
}

static bool SprintForCover(std::shared_ptr<Character> ch)
{
    if(!WhoFighting(ch))
        return false;

    if(ch->Position < POS_FIGHTING)
        return false;

    for(int attempt = 0; attempt < 10; attempt++)
    {
        auto was_in = ch->InRoom;
        DirectionType door = (DirectionType)GetRandomDoor();
        std::shared_ptr<Exit> pexit = GetExit(was_in, door);

        if(pexit == nullptr
           || !pexit->ToRoom
           || (pexit->Flags.test(Flag::Exit::Closed)
               && !IsAffectedBy(ch, Flag::Affect::PassDoor))
           || (IsNpc(ch)
               && pexit->ToRoom->Flags.test(Flag::Room::NoMob)))
        {
            continue;
        }

        StripAffect(ch, gsn_sneak);
        ch->AffectedBy.reset(Flag::Affect::Sneak);

        if(ch->Mount && IsFighting(ch->Mount))
        {
            StopFighting(ch->Mount, true);
        }

        MoveCharacter(ch, pexit, 0);

        auto now_in = ch->InRoom;

        if(now_in == was_in)
        {
            continue;
        }

        ch->InRoom = was_in;
        Act(AT_FLEE, "$n sprints for cover!", ch, NULL, NULL, ActTarget::Room);
        ch->InRoom = now_in;
        Act(AT_FLEE, "$n spins around and takes aim.", ch, NULL, NULL, ActTarget::Room);

        StopFighting(ch, true);

        return true;
    }

    return false;
}
