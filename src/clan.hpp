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
  Clan  *MainClan = nullptr;
  char  *Name = nullptr;           /* Clan name                            */
  char  *Description = nullptr;    /* A brief description of the clan      */
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
  char  *tmpstr = nullptr;
  time_t FoundationDate = 0;
  
  struct
  {
    char *Leader = nullptr;         /* Head clan leader                     */
    char *Number1 = nullptr;        /* First officer                        */
    char *Number2 = nullptr;        /* Second officer                       */
  } Leadership;

  std::list<Clan*> Subclans;
};

struct ClanMember
{
  char         *Name;  /* Name of member */
  time_t        Since; /* Member since */
  int           Ability; /* class of member */
  int           Level;  /* level of member */
  int           Deaths; /* Pdeaths for clans, mdeaths for guilds/orders */
  int           Kills;  /* Pkills for clans, mkills for guilds/orders */
  time_t        LastActivity;
  ClanMember  *Next;  /* Next member */
  ClanMember  *Previous;  /* Prev member */
};

struct ClanMemberList
{
  char          *Name = nullptr;          /* Clan name */
  ClanMember   *FirstMember = nullptr;  /* First Member */
  ClanMember   *LastMember = nullptr;   /* Last Member */
  ClanMemberList   *Next = nullptr;          /* Next clan */
  ClanMemberList   *Previous = nullptr;          /* Prev clan */
};

extern ClanRepository *Clans;
extern ClanMemberList *FirstClanMemberList;
extern ClanMemberList *LastClanMemberList;

#define GUILD_PRICE 100000

void SaveClanStoreroom( Character *ch, const Clan *clan );
void ShowClanMembers( const Character *ch, const char *clanName, const char *format );
Clan *GetClan( const char *name );
void UpdateClanMember( const Character *ch );
void RemoveClanMember( const Character *ch );
ClanMemberList *GetMemberList( const Clan *clan );
Clan *AllocateClan( void );
void FreeClan( Clan *clan );
size_t CountClanMembers( const Clan *clan );
void AssignGuildToMainclan(Clan *guild);
void AssignGuildToMainclan( Clan *guild, Clan *mainClan );
const char *GetClanFilename( const Clan *clan );
bool IsBountyHuntersGuild(const char *clanName);
ClanRepository *NewClanRepository();

#endif /* include guard*/
