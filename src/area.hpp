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
                Changed,
                Prototype
        };
    }
}

namespace AreaStatus
{
    constexpr auto Deleted = BV00;
    constexpr auto Loaded = BV01;
};

class Area
{
public:
    std::shared_ptr<Reset> FirstReset;
    std::shared_ptr<Reset> LastReset;
    std::shared_ptr<Reset> LastMobReset;
    std::shared_ptr<Reset> LastObjectReset;
    std::shared_ptr<class Planet> Planet;
    std::shared_ptr<Area> NextOnPlanet;
    std::shared_ptr<Area> PreviousOnPlanet;
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

void FixAreaExits(std::shared_ptr<Area> tarea);
std::shared_ptr<Area> GetArea(const std::string &nameOrFile);
void AreaUpdate();
void CloseArea(std::shared_ptr<Area> pArea);
void FreeArea(std::shared_ptr<Area> are);
void AssignAreaTo(Character *ch);
void CleanResets(std::shared_ptr<Area> tarea);

#endif
