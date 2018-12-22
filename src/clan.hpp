#ifndef _SWRIP_CLAN_HPP_
#define _SWRIP_CLAN_HPP_

#include <memory>
#include <list>
#include "types.hpp"
#include "constants.hpp"

class Clan
{
public:
  Clan();
  virtual ~Clan();
  
  const std::list<std::shared_ptr<Clan>> &Subclans() const;
  void Add(const std::shared_ptr<Clan> &clan);
  void Remove(const std::shared_ptr<Clan> &clan);

  const std::list<std::shared_ptr<ClanMember>> &Members() const;
  void Add(const std::shared_ptr<ClanMember> &member);
  void Remove(const std::shared_ptr<ClanMember> &member);

  std::shared_ptr<Clan> MainClan;
  std::string Name;           /* Clan name                            */
  std::string Description;    /* A brief description of the clan      */
  int PlayerKills = 0;         /* Number of pkills on behalf of clan   */
  int PlayerDeaths = 0;        /* Number of pkills against clan        */
  int MobKills = 0;         /* Number of mkills on behalf of clan   */
  int MobDeaths = 0;        /* Number of clan deaths due to mobs    */
  ClanType Type = CLAN_GUILD;      /* See clan type defines                */
  vnum_t Board = INVALID_VNUM;          /* Vnum of clan board                   */
  vnum_t Storeroom = INVALID_VNUM;      /* Vnum of clan's store room            */
  long Funds = 0;
  int Spacecraft = 0;
  int Vehicles = 0;
  vnum_t Jail = INVALID_VNUM;
  vnum_t EnlistRoom1 = INVALID_VNUM;
  vnum_t EnlistRoom2 = INVALID_VNUM;
  std::string MainClanName;
  time_t FoundationDate = 0;
  
  struct
  {
    std::string Leader;         /* Head clan leader                     */
    std::string Number1;        /* First officer                        */
    std::string Number2;        /* Second officer                       */
  } Leadership;

private:
  struct Impl;
  std::unique_ptr<Impl> pImpl;
};

class ClanMember
{
public:
  std::string Name;  /* Name of member */
  time_t Since = 0; /* Member since */
  int Ability = 0; /* class of member */
  int Level = 0;  /* level of member */
  int Deaths = 0; /* Pdeaths for clans, mdeaths for guilds/orders */
  int Kills = 0;  /* Pkills for clans, mkills for guilds/orders */
  time_t LastActivity = 0;
};

#define GUILD_PRICE 100000

void SaveClanStoreroom( Character *ch, const std::shared_ptr<Clan> &clan );
void ShowClanMembers( const Character *ch, const std::shared_ptr<Clan> &clan,
                      const std::string &format = "");
std::shared_ptr<Clan> GetClan( const std::string &name );
void UpdateClanMember( const Character *ch );
void RemoveClanMember( const Character *ch );
std::shared_ptr<Clan> AllocateClan();
void FreeClan( const std::shared_ptr<Clan> &clan );
void AssignGuildToMainclan(const std::shared_ptr<Clan> &guild);
void AssignGuildToMainclan(const std::shared_ptr<Clan> &guild,
                           const std::shared_ptr<Clan> &mainClan );
bool IsBountyHuntersGuild(const std::string &clanName);

#endif /* include guard*/
