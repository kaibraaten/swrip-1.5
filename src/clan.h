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
  char      *name;           /* Clan name                            */
  char      *description;    /* A brief description of the clan      */
  int        pkills;         /* Number of pkills on behalf of clan   */
  int        pdeaths;        /* Number of pkills against clan        */
  int        mkills;         /* Number of mkills on behalf of clan   */
  int        mdeaths;        /* Number of clan deaths due to mobs    */
  short      clan_type;      /* See clan type defines                */
  short      members;        /* Number of clan members               */
  vnum_t     board;          /* Vnum of clan board                   */
  vnum_t     storeroom;      /* Vnum of clan's store room            */
  vnum_t     guard1;         /* Vnum of clan guard type 1            */
  vnum_t     guard2;         /* Vnum of clan guard type 2            */
  vnum_t     patrol1;        /* vnum of patrol */
  vnum_t     patrol2;  /* vnum of patrol */
  vnum_t     trooper1; /* vnum of reinforcements */
  vnum_t     trooper2; /* vnum of elite troopers */
  long       funds;
  int        spacecraft;
  int        vehicles;
  int        jail;
  int        enlistroom1;
  int        enlistroom2;
  char      *tmpstr;

  struct
  {
    char *leader;         /* Head clan leader                     */
    char *number1;        /* First officer                        */
    char *number2;        /* Second officer                       */
  } leadership;
};

struct membersort_data
{
  MS_DATA     *next;
  MS_DATA     *prev;
  MEMBER_DATA *member;
};

struct member_data
{
  char         *name;  /* Name of member */
  char         *since; /* Member since */
  int           mclass; /* class of member */
  int           level;  /* level of member */
  int           deaths; /* Pdeaths for clans, mdeaths for guilds/orders */
  int           kills;  /* Pkills for clans, mkills for guilds/orders */
  MEMBER_DATA  *next;  /* Next member */
  MEMBER_DATA  *prev;  /* Prev member */
};

struct member_list
{
  char          *name;          /* Clan name */
  MEMBER_DATA   *first_member;  /* First Member */
  MEMBER_DATA   *last_member;   /* Last Member */
  MEMBER_LIST   *next;          /* Next clan */
  MEMBER_LIST   *prev;          /* Prev clan */
};

extern Clan *first_clan;
extern Clan *last_clan;
extern MEMBER_LIST *first_member_list;
extern MEMBER_LIST *last_member_list;

void SaveClanStoreroom( Character *ch, const Clan *clan );
void SaveClanMemberList( const MEMBER_LIST *members_list );
void ShowClanMembers( const Character *ch, const char *clanName, const char *format );
void WriteClanList( void );
Clan *GetClan( const char *name );
void LoadClans( void );
void SaveClan( const Clan *clan );
void UpdateClanMember( const Character *ch );
void RemoveClanMember( const Character *ch );

#endif /* include guard*/
