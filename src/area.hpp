#ifndef _SWRIP_AREA_HPP_
#define _SWRIP_AREA_HPP_

#include "types.hpp"

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

extern Area *FirstArea;
extern Area *LastArea;
extern Area *FirstBuild;
extern Area *LastBuild;
extern Area *FirstASort;
extern Area *LastASort;
extern Area *FirstBSort;
extern Area *LastBSort;

void FixAreaExits( Area *tarea );
void LoadAreaFile( Area *tarea, const char *filename );
void SortArea( Area *pArea, bool proto );
Area *GetArea( const char *nameOrFile );
void AreaUpdate( void );
void CloseArea( Area *pArea );
void FreeArea( Area *are );
void AssignAreaTo( Character *ch );
void FoldArea( Area *tarea, char *filename, bool install );
void CleanResets( Area *tarea );

#endif
