#ifndef _SWRIP_AREA_H_
#define _SWRIP_AREA_H_

#include "types.h"

struct Area
{
  Area *Next;
  Area *Previous;
  Area *NextSort;
  Area *PreviousSort;
  Reset *FirstReset;
  Reset *LastReset;
  struct Planet *Planet;
  Area *NextOnPlanet;
  Area *PreviousOnPlanet;
  char *Name;
  char *Filename;
  int Flags;
  short Status;
  short Age;
  short NumberOfPlayers;
  short ResetFrequency;

  struct
  {
    struct
    {
      vnum_t First;
      vnum_t Last;
    } Room, Mob, Object;
  } VnumRanges;

  struct
  {
    struct
    {
      int Low;
      int High;
    } Soft, Hard;
  } LevelRanges;

  char *Author;
  char *ResetMessage;
  Reset *LastMobReset;
  Reset *LastObjectReset;
  short MaxPlayers;
  int MKills;
  int MDeaths;
  int PKills;
  int PDeaths;
  int GoldLooted;
  int IllegalPk;
  int HighEconomy;
  int LowEconomy;
};

extern Area *first_area;
extern Area *last_area;
extern Area *first_build;
extern Area *last_build;
extern Area *first_asort;
extern Area *last_asort;
extern Area *first_bsort;
extern Area *last_bsort;

#endif
