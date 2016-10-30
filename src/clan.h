#ifndef _SWRIP_CLAN_H_
#define _SWRIP_CLAN_H_

#include "types.h"

struct Clan
{
  Clan  *Next;             /* next clan in list                    */
  Clan  *Previous;             /* previous clan in list                */
  Clan  *NextGuild;
  Clan  *PreviousGuild;
  Clan  *FirstGuild;
  Clan  *LastGuild;
  Clan  *MainClan;
  char  *Name;           /* Clan name                            */
  char  *Description;    /* A brief description of the clan      */
  int    PlayerKills;         /* Number of pkills on behalf of clan   */
  int    PlayerDeaths;        /* Number of pkills against clan        */
  int    MobKills;         /* Number of mkills on behalf of clan   */
  int    MobDeaths;        /* Number of clan deaths due to mobs    */
  ClanType Type;      /* See clan type defines                */
  vnum_t Board;          /* Vnum of clan board                   */
  vnum_t Storeroom;      /* Vnum of clan's store room            */
  long   Funds;
  int    Spacecraft;
  int    Vehicles;
  vnum_t Jail;
  vnum_t EnlistRoom1;
  vnum_t EnlistRoom2;
  char  *tmpstr;
  time_t FoundationDate;
  
  struct
  {
    char *Leader;         /* Head clan leader                     */
    char *Number1;        /* First officer                        */
    char *Number2;        /* Second officer                       */
  } Leadership;
};

struct SortedClanMemberListEntry
{
  SortedClanMemberListEntry     *Next;
  SortedClanMemberListEntry     *Previous;
  ClanMember *Member;
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
  char          *Name;          /* Clan name */
  ClanMember   *FirstMember;  /* First Member */
  ClanMember   *LastMember;   /* Last Member */
  ClanMemberList   *Next;          /* Next clan */
  ClanMemberList   *Previous;          /* Prev clan */
};

extern Clan *FirstClan;
extern Clan *LastClan;
extern ClanMemberList *FirstClanMemberList;
extern ClanMemberList *LastClanMemberList;

#define GUILD_PRICE 100000

void SaveClanStoreroom( Character *ch, const Clan *clan );
void ShowClanMembers( const Character *ch, const char *clanName, const char *format );
Clan *GetClan( const char *name );
void NewLoadClans( void );
bool NewSaveClan( const Clan *clan, int );
void SaveClan( const Clan *clan );
void UpdateClanMember( const Character *ch );
void RemoveClanMember( const Character *ch );
ClanMemberList *GetMemberList( const Clan *clan );
Clan *AllocateClan( void );
void FreeClan( Clan *clan );
void AddClan( Clan *clan );
void UnlinkClan( Clan *clan );
int CountClanMembers( const Clan *clan );
bool AssignGuildToMainclan( Clan *guild, Clan *mainClan );

#endif /* include guard*/
