#ifndef _SWRIP_CLAN_H_
#define _SWRIP_CLAN_H_

#include "types.h"

struct Clan
{
  Clan *next;             /* next clan in list                    */
  Clan *prev;             /* previous clan in list                */
  Clan *next_subclan;
  Clan *prev_subclan;
  Clan *first_subclan;
  Clan *last_subclan;
  Clan *mainclan;
  char      *filename;       /* Clan filename                        */
  char      *Name;           /* Clan name                            */
  char      *description;    /* A brief description of the clan      */
  int        pkills;         /* Number of pkills on behalf of clan   */
  int        pdeaths;        /* Number of pkills against clan        */
  int        mkills;         /* Number of mkills on behalf of clan   */
  int        mdeaths;        /* Number of clan deaths due to mobs    */
  short      clan_type;      /* See clan type defines                */
  short      members;        /* Number of clan members               */
  vnum_t     board;          /* Vnum of clan board                   */
  vnum_t     storeroom;      /* Vnum of clan's store room            */
  long       funds;
  int        spacecraft;
  int        vehicles;
  vnum_t     jail;
  vnum_t     enlistroom1;
  vnum_t     enlistroom2;
  char      *tmpstr;

  struct
  {
    char *leader;         /* Head clan leader                     */
    char *number1;        /* First officer                        */
    char *number2;        /* Second officer                       */
  } leadership;
};

struct SortedClanMemberListEntry
{
  SortedClanMemberListEntry     *next;
  SortedClanMemberListEntry     *prev;
  ClanMember *member;
};

struct ClanMember
{
  char         *name;  /* Name of member */
  char         *since; /* Member since */
  int           mclass; /* class of member */
  int           level;  /* level of member */
  int           deaths; /* Pdeaths for clans, mdeaths for guilds/orders */
  int           kills;  /* Pkills for clans, mkills for guilds/orders */
  ClanMember  *next;  /* Next member */
  ClanMember  *prev;  /* Prev member */
};

struct ClanMemberList
{
  char          *name;          /* Clan name */
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
void SaveClanMemberList( const ClanMemberList *members_list );
void ShowClanMembers( const Character *ch, const char *clanName, const char *format );
void WriteClanList( void );
Clan *GetClan( const char *name );
void LoadClans( void );
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

#endif /* include guard*/
