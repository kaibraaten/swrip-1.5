#ifndef _SWRIP_AREA_HPP_
#define _SWRIP_AREA_HPP_

#include <memory>
#include <bitset>
#include <string>
#include "types.hpp"
#include "constants.hpp"

namespace Flag
{
  namespace Area
  {
    enum : size_t
      {
       NoPkill,
       _01,
       Changed
      };
  }
}

class Area
{
public:
  Area *Next = nullptr;
  Area *Previous = nullptr;
  Area *NextSort = nullptr;
  Area *PreviousSort = nullptr;
  Reset *FirstReset = nullptr;
  Reset *LastReset = nullptr;
  std::shared_ptr<class Planet> Planet;
  Area *NextOnPlanet = nullptr;
  Area *PreviousOnPlanet = nullptr;
  std::string Name;
  std::string Filename;
  std::bitset<Flag::MAX> Flags;
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

  std::string Author;
  std::string ResetMessage;
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
