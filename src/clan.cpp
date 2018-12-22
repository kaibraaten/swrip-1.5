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

#include <cctype>
#include <cstring>
#include <ctime>
#include <cassert>
#include <utility/algorithms.hpp>
#include "mud.hpp"
#include "character.hpp"
#include "clan.hpp"
#include "pcdata.hpp"
#include "log.hpp"
#include "repos/clanrepository.hpp"

//////////////////////////////////////////////////////////////
struct Clan::Impl
{
  std::list<std::shared_ptr<Clan>> Subclans;
  std::list<std::shared_ptr<ClanMember>> Members;
};

//////////////////////////////////////////////////////////////
Clan::Clan()
  : pImpl(std::make_unique<Impl>())
{

}

Clan::~Clan()
{

}

void Clan::Add(const std::shared_ptr<Clan> &guild)
{
  pImpl->Subclans.push_back(guild);

  guild->Type = CLAN_GUILD;
  guild->MainClan = GetClan(this->Name);
}

void Clan::Remove(const std::shared_ptr<Clan> &guild)
{
  pImpl->Subclans.remove(guild);
  guild->MainClan = nullptr;
}

const std::list<std::shared_ptr<Clan>> &Clan::Subclans() const
{
  return pImpl->Subclans;
}

void Clan::Add(const std::shared_ptr<ClanMember> &member)
{
  pImpl->Members.push_back(member);
}

void Clan::Remove(const std::shared_ptr<ClanMember> &member)
{
  pImpl->Members.remove(member);
}

const std::list<std::shared_ptr<ClanMember>> &Clan::Members() const
{
  return pImpl->Members;
}

//////////////////////////////////////////////////////////////

/*
 * Get pointer to clan structure from clan name.
 */
std::shared_ptr<Clan> GetClan( const std::string &name )
{
  return Clans->Find([name](const auto &clan)
                     {
                       return StrCmp(clan->Name, name) == 0;
                     });
}

void AssignGuildToMainclan(const std::shared_ptr<Clan> &guild)
{
  std::shared_ptr<Clan> mainClan = GetClan( guild->MainClanName );
  AssignGuildToMainclan( guild, mainClan );
}

void AssignGuildToMainclan(const std::shared_ptr<Clan> &guild,
                           const std::shared_ptr<Clan> &mainClan )
{
  if ( mainClan )
    {
      mainClan->Add(guild);
    }
}

static int MoreKillsThan(const std::shared_ptr<ClanMember> &lhv,
                         const std::shared_ptr<ClanMember> &rhv)
{
  return lhv->Kills > rhv->Kills ? -1 : lhv->Kills < rhv->Kills ? 1 : 0;
}

static int MoreDeathsThan(const std::shared_ptr<ClanMember> &lhv,
                          const std::shared_ptr<ClanMember> &rhv)
{
  return lhv->Deaths > rhv->Deaths ? -1 : lhv->Deaths < rhv->Deaths ? 1 : 0;
}

static int LessName(const std::shared_ptr<ClanMember> &lhv,
                    const std::shared_ptr<ClanMember> &rhv)
{
  return StrCmp(lhv->Name, rhv->Name);
}

void ShowClanMembers(const Character *ch, const std::shared_ptr<Clan> &clan,
                     const std::string &format )
{
  int members = 0;

  assert(clan != nullptr);

  ch->Echo( "\r\nMembers of %s\r\n", clan->Name.c_str() );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Leader: %s\r\n", clan->Leadership.Leader.c_str() );
  ch->Echo( "Number1: %s\r\n", clan->Leadership.Number1.c_str() );
  ch->Echo( "Number2: %s\r\n", clan->Leadership.Number2.c_str() );
  ch->Echo( "Spacecraft: %d  Vehicles: %d\r\n", clan->Spacecraft, clan->Vehicles );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Lvl  Name            Class                 Kills    Deaths              Joined\r\n\r\n" );

  if( !format.empty() )
    {
      if( !StrCmp( format, "kills" )
          || !StrCmp( format, "deaths" )
          || !StrCmp( format, "alpha" ))
        {
          std::list<std::shared_ptr<ClanMember>> sortedList;

          for( const auto &member : clan->Members() )
            {
              if( StrCmp( member->Name, clan->Leadership.Leader ) != 0
                  && StrCmp( member->Name, clan->Leadership.Number1 ) != 0
                  && StrCmp( member->Name, clan->Leadership.Number2 ) != 0 )
                {
                  sortedList.push_back(member);
                }
            }

          if( !StrCmp( format, "kills" ))
            {
              sortedList.sort(MoreKillsThan);
            }
          else if( !StrCmp( format, "deaths" ))
            {
              sortedList.sort(MoreDeathsThan);
            }
          else if( !StrCmp( format, "alpha" ))
            {
              sortedList.sort(LessName);
            }

          for(const auto &member : sortedList)
            {
              members++;
              ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                        member->Level,
                        Capitalize(member->Name).c_str(),
                        AbilityName[member->Ability],
                        member->Kills,
                        member->Deaths,
                        FormatDate( &member->Since ).c_str() );
	    }
        }
      else
        {
          for(const auto &member : clan->Members())
            {
              if( !StringPrefix( format, member->Name ) )
                {
                  members++;
                  ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                            member->Level,
                            Capitalize(member->Name ).c_str(),
                            AbilityName[member->Ability],
                            member->Kills,
                            member->Deaths,
                            FormatDate( &member->Since ).c_str() );
                }
            }
        }
    }
  else
    {
      for(const auto &member : clan->Members())
	{
	  members++;
	  ch->Echo( "%3d  %-15s %-17s %9d %9d %19s\r\n",
                    member->Level,
                    Capitalize(member->Name).c_str(),
                    AbilityName[member->Ability],
                    member->Kills,
                    member->Deaths,
                    FormatDate( &member->Since ).c_str() );
	}
    }

  ch->Echo( "------------------------------------------------------------------------------\r\n" );
  ch->Echo( "Total Members: %d\r\n", members );
  ch->Echo( "------------------------------------------------------------------------------\r\n" );
}

void RemoveClanMember( const Character *ch )
{
  if( !ch->PCData )
    {
      return;
    }

  std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

  if(clan != nullptr)
    {
      std::string name = ch->Name;
      std::shared_ptr<ClanMember> member = Find(clan->Members(),
                                                [name](const auto m)
                                                {
                                                  return StrCmp(m->Name, name) == 0;
                                                });
      
      if( member != nullptr )
	{
          clan->Remove(member);
	  Clans->Save( ch->PCData->ClanInfo.Clan );
	}
    }
}

void UpdateClanMember( const Character *ch )
{
  if( IsNpc( ch ) || IsImmortal(ch) || !IsClanned( ch ) )
    {
      return;
    }

  std::shared_ptr<Clan> clan = ch->PCData->ClanInfo.Clan;

  if( clan != nullptr )
    {
      std::string name = ch->Name;
      std::shared_ptr<ClanMember> member = Find(clan->Members(),
                                                [name](const auto m)
                                                {
                                                  return StrCmp(m->Name, name) == 0;
                                                });

      if( member == nullptr )
	{
          member = std::make_shared<ClanMember>();
	  member->Name = ch->Name;
	  member->Since = current_time;

          clan->Add(member);
	}

      member->Kills = ch->PCData->PKills;
      member->Deaths = ch->PCData->Clones;
      member->Ability = ch->Ability.Main;
      member->Level = ch->TopLevel;
      member->LastActivity = current_time;
      
      Clans->Save( ch->PCData->ClanInfo.Clan );
    }
}

std::shared_ptr<Clan> AllocateClan()
{
  return std::make_shared<Clan>();
}

bool IsBountyHuntersGuild(const std::string &clanName)
{
  return !StrCmp(clanName, "the hunters guild")
    || !StrCmp(clanName, "the bounty hunters guild")
    || !StrCmp(clanName, "the assassins guild");
}
