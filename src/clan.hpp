#ifndef _SWRIP_CLAN_HPP_
#define _SWRIP_CLAN_HPP_

#include <list>
#include <utility/repository.hpp>
#include "types.hpp"

class ClanRepository : public Ceris::Repository<Clan*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
  virtual void Save(const Clan*) const = 0;
};

class Clan
{
public:
  Clan();
  virtual ~Clan();
  
  const std::list<Clan*> &Subclans() const;
  void Add(Clan *clan);
  void Remove(Clan *clan);

  const std::list<ClanMember*> &Members() const;
  void Add(ClanMember *member);
  void Remove(ClanMember *member);

  Clan  *MainClan = nullptr;
  std::string Name;           /* Clan name                            */
  std::string Description;    /* A brief description of the clan      */
  int    PlayerKills = 0;         /* Number of pkills on behalf of clan   */
  int    PlayerDeaths = 0;        /* Number of pkills against clan        */
  int    MobKills = 0;         /* Number of mkills on behalf of clan   */
  int    MobDeaths = 0;        /* Number of clan deaths due to mobs    */
  ClanType Type = CLAN_GUILD;      /* See clan type defines                */
  vnum_t Board = INVALID_VNUM;          /* Vnum of clan board                   */
  vnum_t Storeroom = INVALID_VNUM;      /* Vnum of clan's store room            */
  long   Funds = 0;
  int    Spacecraft = 0;
  int    Vehicles = 0;
  vnum_t Jail = INVALID_VNUM;
  vnum_t EnlistRoom1 = INVALID_VNUM;
  vnum_t EnlistRoom2 = INVALID_VNUM;
  std::string tmpstr;
  time_t FoundationDate = 0;
  
  struct
  {
    std::string Leader;         /* Head clan leader                     */
    std::string Number1;        /* First officer                        */
    std::string Number2;        /* Second officer                       */
  } Leadership;

private:
  struct Impl;
  Impl *pImpl = nullptr;
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

extern ClanRepository *Clans;

#define GUILD_PRICE 100000

void SaveClanStoreroom( Character *ch, const Clan *clan );
void ShowClanMembers( const Character *ch, const Clan *clan, const std::string &format = "");
Clan *GetClan( const std::string &name );
void UpdateClanMember( const Character *ch );
void RemoveClanMember( const Character *ch );
Clan *AllocateClan( void );
void FreeClan( Clan *clan );
void AssignGuildToMainclan(Clan *guild);
void AssignGuildToMainclan( Clan *guild, Clan *mainClan );
std::string GetClanFilename( const Clan *clan );
bool IsBountyHuntersGuild(const std::string &clanName);
ClanRepository *NewClanRepository();

#endif /* include guard*/
