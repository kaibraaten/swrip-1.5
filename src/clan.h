#ifndef _SWRIP_CLAN_H_
#define _SWRIP_CLAN_H_

#include <eris/ceris.h>
#include "types.h"

extern CerisList *ClanList;

struct clan_data
{
  CerisList *SubClans;
  CLAN_DATA *mainclan;
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

CLAN_DATA *get_clan( const char *name );
void write_clan_list( void );
void save_clan( const CLAN_DATA *clan );
void load_clans( void );
void show_members( const CHAR_DATA *ch, const char *argument, const char *format );
void remove_member( const CHAR_DATA *ch );
void save_member_list( const MEMBER_LIST *members_list );
bool load_member_list( const char *filename );
void update_member( const CHAR_DATA *ch );

bool has_subclans( const CLAN_DATA *clan );

#endif /* include guard */
