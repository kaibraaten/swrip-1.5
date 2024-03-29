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

#include "character.hpp"
#include "mud.hpp"
#include "clan.hpp"
#include "bounty.hpp"
#include "pcdata.hpp"
#include "repos/bountyrepository.hpp"

std::shared_ptr<Bounty> GetBounty(const std::string &name)
{
    return Bounties->Find([name](const auto &bounty)
                          {
                              return StrCmp(name, bounty->Target) == 0;
                          });
}

void AddBounty(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim, long amount)
{
    auto bounty = GetBounty(victim->Name);

    if(bounty == nullptr)
    {
        bounty = std::make_shared<Bounty>();
        Bounties->Add(bounty);

        bounty->Target = victim->Name;
        bounty->Poster = ch->Name;
    }

    bounty->Reward = bounty->Reward + amount;
    Bounties->Save();

    victim->Echo("&RSomeone has added %ld credits to the bounty on you!\r\n", amount);
    std::string buf = FormatString("&R%s has added %ld credits to the bounty on %s.\r\n",
                                   ch->Name.c_str(), amount, victim->Name.c_str());
    ch->Echo(buf);

    for(auto echoTo = LastCharacter; echoTo; echoTo = echoTo->Previous)
    {
        if(((IsClanned(ch) && IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name))
            || IsImmortal(echoTo))
           && echoTo != ch)
        {
            echoTo->Echo(buf);
        }
    }
}

void RemoveBounty(std::shared_ptr<Bounty> bounty)
{
    Bounties->Remove(bounty);
    Bounties->Save();
}

void ClaimBounty(std::shared_ptr<Character> ch, std::shared_ptr<Character> victim)
{
    if(IsNpc(victim))
    {
        return;
    }

    auto bounty = GetBounty(victim->Name);

    if(ch == victim)
    {
        if(bounty != nullptr)
            RemoveBounty(bounty);

        return;
    }

    if(bounty != nullptr
       && (!IsClanned(ch)
           || !IsBountyHuntersGuild(ch->PCData->ClanInfo.Clan->Name)))
    {
        RemoveBounty(bounty);
        bounty = nullptr;
    }

    if(bounty == nullptr)
    {
        if(victim->Flags.test(Flag::Plr::Killer) && !IsNpc(ch))
        {
            auto ability = AbilityClass::Hunting;
            long xp = urange(1, ComputeXP(ch, victim), (GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, ability))));
            GainXP(ch, ability, xp);
            SetCharacterColor(AT_BLOOD, ch);
            ch->Echo("You receive %ld %s experience for executing a wanted killer.\r\n",
                     xp, AbilityName[(int)ability]);
        }
        else if(!IsNpc(ch))
        {
            ch->Flags.set(Flag::Plr::Killer);
            ch->Echo("You are now wanted for the murder of %s.\r\n", victim->Name.c_str());
        }
    }
    else
    {
        ch->Gold += bounty->Reward;
        auto ability = AbilityClass::Hunting;
        long xp = urange(1, bounty->Reward + ComputeXP(ch, victim), (GetRequiredXpForLevel(GetAbilityLevel(ch, ability) + 1) - GetRequiredXpForLevel(GetAbilityLevel(ch, ability))));
        GainXP(ch, ability, xp);

        SetCharacterColor(AT_BLOOD, ch);
        ch->Echo("You receive %ld %s experience and %ld credits,\r\n from the bounty on %s.\r\n",
                 xp,
                 AbilityName[(int)ability],
                 bounty->Reward,
                 bounty->Target.c_str());

        std::string buf = FormatString("The disintegration bounty on %s has been claimed!", victim->Name.c_str());
        EchoToAll(AT_RED, buf, 0);

        if(!victim->Flags.test(Flag::Plr::Killer))
        {
            ch->Flags.set(Flag::Plr::Killer);
        }

        RemoveBounty(bounty);
    }
}
