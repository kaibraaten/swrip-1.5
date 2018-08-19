#ifndef _SWRIP_AREA_HPP_
#define _SWRIP_AREA_HPP_

#include <string>
#include "types.hpp"
#include "constants.hpp"

class Area
{
public:
  Area *Next = nullptr;
  Area *Previous = nullptr;
  Area *NextSort = nullptr;
  Area *PreviousSort = nullptr;
  Reset *FirstReset = nullptr;
  Reset *LastReset = nullptr;
  class Planet *Planet = nullptr;
  Area *NextOnPlanet = nullptr;
  Area *PreviousOnPlanet = nullptr;
  char *Name = nullptr;
  char *Filename = nullptr;
  int Flags = 0;
  short Status = 0;
  short Age = 0;
  short NumberOfPlayers = 0;
  short ResetFrequency = 0;

  struct
  {
    struct
    {
      vnum_t First = INVALID_VNUM;
      vnum_t Last = INVALID_VNUM;
    } Room, Mob, Object;
  } VnumRanges;

  struct
  {
    struct
    {
      int Low = 0;
      int High = 0;
    } Soft, Hard;
  } LevelRanges;

  char *Author = nullptr;
  char *ResetMessage = nullptr;
  Reset *LastMobReset = nullptr;
  Reset *LastObjectReset = nullptr;
  short MaxPlayers = 0;
  int MKills = 0;
  int MDeaths = 0;
  int PKills = 0;
  int PDeaths = 0;
  int GoldLooted = 0;
  int IllegalPk = 0;
  int HighEconomy = 0;
  int LowEconomy = 0;
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
void LoadAreaFile( Area *tarea, const std::string &filename );
void SortArea( Area *pArea, bool proto );
Area *GetArea( const std::string &nameOrFile );
void AreaUpdate( void );
void CloseArea( Area *pArea );
void FreeArea( Area *are );
void AssignAreaTo( Character *ch );
void FoldArea( Area *tarea, const std::string &filename, bool install );
void CleanResets( Area *tarea );

#endif
