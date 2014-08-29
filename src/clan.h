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

#endif /* include guard*/
