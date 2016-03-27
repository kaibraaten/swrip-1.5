#ifndef _SWRIP_CLAN_H_
#define _SWRIP_CLAN_H_

#include "types.h"

struct Clan
{
  Clan  *next;             /* next clan in list                    */
  Clan  *prev;             /* previous clan in list                */
  Clan  *next_subclan;
  Clan  *prev_subclan;
  Clan  *first_subclan;
  Clan  *last_subclan;
  Clan  *MainClan;
  char  *Name;           /* Clan name                            */
  char  *Description;    /* A brief description of the clan      */
  int    PlayerKills;         /* Number of pkills on behalf of clan   */
  int    PlayerDeaths;        /* Number of pkills against clan        */
  int    MobKills;         /* Number of mkills on behalf of clan   */
  int    MobDeaths;        /* Number of clan deaths due to mobs    */
  short  Type;      /* See clan type defines                */
  vnum_t Board;          /* Vnum of clan board                   */
  vnum_t Storeroom;      /* Vnum of clan's store room            */
  long   Funds;
  int    Spacecraft;
  int    Vehicles;
  vnum_t Jail;
  vnum_t EnlistRoom1;
  vnum_t EnlistRoom2;
  char  *tmpstr;

  struct
  {
    char *Leader;         /* Head clan leader                     */
    char *Number1;        /* First officer                        */
    char *Number2;        /* Second officer                       */
  } Leadership;
};

struct SortedClanMemberListEntry
{
  SortedClanMemberListEntry     *next;
  SortedClanMemberListEntry     *prev;
  ClanMember *Member;
};

struct ClanMember
{
  char         *Name;  /* Name of member */
  char         *Since; /* Member since */
  int           Ability; /* class of member */
  int           Level;  /* level of member */
  int           Deaths; /* Pdeaths for clans, mdeaths for guilds/orders */
  int           Kills;  /* Pkills for clans, mkills for guilds/orders */
  ClanMember  *next;  /* Next member */
  ClanMember  *prev;  /* Prev member */
};

struct ClanMemberList
{
  char          *Name;          /* Clan name */
  ClanMember   *first_member;  /* First Member */
  ClanMember   *last_member;   /* Last Member */
  ClanMemberList   *next;          /* Next clan */
  ClanMemberList   *prev;          /* Prev clan */
};

extern Clan *first_clan;
extern Clan *last_clan;
extern ClanMemberList *first_ClanMemberList;
extern ClanMemberList *last_ClanMemberList;

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
const char *GetClanFilename( const Clan *clan );
int CountClanMembers( const Clan *clan );

#endif /* include guard*/
