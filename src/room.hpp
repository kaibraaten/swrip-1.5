#ifndef _SWRIP_ROOM_HPP_
#define _SWRIP_ROOM_HPP_

#include <memory>
#include <list>
#include <string>
#include <bitset>
#include "types.hpp"
#include "constants.hpp"
#include "mprog.hpp"

namespace Flag
{
    namespace Room
    {
        enum : size_t
        {
            Dark,
            Reserved, /* BV01 now reserved for track  BV01  and hunt */
            NoMob,
            Indoors,
            CanLand,
            CanFly,
            NoDrive,
            NoMagic,
            Bank,
            Private,
            Safe,
            _11,
            PetShop,
            Arena,
            Donation,
            NoDropAll,
            Silence,
            LogSpeech,
            NoDrop,
            ClanStoreroom,
            PlayerHome,
            _21,
            Teleport,
            Hotel,
            NoFloor,
            Refinery,
            Factory,
            Recruit,
            PlayerShop,
            Spacecraft,
            Prototype,
            Auction
        };
    }
}

class Room
{
public:
    Room();
    virtual ~Room();

    void Add(std::shared_ptr<Ship> ship);
    void Remove(std::shared_ptr<Ship> ship);
    const std::list<std::shared_ptr<Ship>> &Ships() const;

    void Add(std::shared_ptr<Shuttle> shuttle);
    void Remove(std::shared_ptr<Shuttle> shuttle);
    const std::list<std::shared_ptr<Shuttle>> &Shuttles() const;

    void Add(std::shared_ptr<Exit> xit);
    void Remove(std::shared_ptr<Exit> xit);
    const std::list<std::shared_ptr<Exit>> &Exits() const;

    void Add(std::shared_ptr<Character> character);
    void Remove(std::shared_ptr<Character> character);
    const std::list<std::shared_ptr<Character>> &Characters() const;

    void Add(std::shared_ptr<Object> object);
    void Remove(std::shared_ptr<Object> object);
    const std::list<std::shared_ptr<Object>> &Objects() const;

    void Add(std::shared_ptr<ExtraDescription> extraDescription);
    void Remove(std::shared_ptr<ExtraDescription> extraDescription);
    const std::list<std::shared_ptr<ExtraDescription>> &ExtraDescriptions() const;

    std::shared_ptr<Room> Next;
    std::shared_ptr<Room> NextSort;
    std::shared_ptr<class Area> Area;
    std::string Name;
    std::string Description;
    vnum_t Vnum = INVALID_VNUM;
    std::bitset<Flag::MAX> Flags;
    int Light = 0;
    SectorType Sector = 0;
    vnum_t TeleVnum = INVALID_VNUM;
    int TeleDelay = 0;
    int Tunnel = 0;              /* max people that will fit */

    MProg mprog;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#endif
