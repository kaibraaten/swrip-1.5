#ifndef _SWRIP_CLAN_H_
#define _SWRIP_CLAN_H_

#include <eris/ceris.h>
#include "types.h"

extern CerisList *ClanList;

struct Clan
{
  CerisList *SubClans;
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
  int        board;          /* Vnum of clan board                   */
  int        storeroom;      /* Vnum of clan's store room            */
  int        guard1;         /* Vnum of clan guard type 1            */
  int        guard2;         /* Vnum of clan guard type 2            */
  int        patrol1;        /* vnum of patrol */
  int        patrol2;  /* vnum of patrol */
  int        trooper1; /* vnum of reinforcements */
  int        trooper2; /* vnum of elite troopers */
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

Clan *GetClan( const char *name );
void WriteClanList( void );
void SaveClan( const Clan *clan );
void LoadClans( void );
bool HasSubClans( const Clan *clan );

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

void ShowMembers( const CHAR_DATA *ch, const char *argument, const char *format );
void RemoveMember( const CHAR_DATA *ch );
void SaveMemberList( const MEMBER_LIST *members_list );
bool LoadMemberList( const char *filename );
void UpdateMember( const CHAR_DATA *ch );

#endif /* include guard */
