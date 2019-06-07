/****************************************************************************
 *                   Star Wars: Rise in Power MUD Codebase                  *
 * ------------------------------------------------------------------------ *
 * SWRiP Code Additions and changes from the SWReality and Smaug Code       *
 * copyright (c) 2001 by Mark Miller (Darrik Vequir)                        *
 * ------------------------------------------------------------------------ *
 * Star Wars Reality Code Additions and changes from the Smaug Code         *
 * copyright (c) 1997 by Sean Cooper                                        *
 * ------------------------------------------------------------------------ *
 * Starwars and Starwars Names copyright(c) Lucas Film Ltd.                 *
 * ------------------------------------------------------------------------ *
 * SMAUG 1.0 (C) 1994, 1995, 1996 by Derek Snider                           *
 * SMAUG code team: Thoric, Altrag, Blodkai, Narn, Haus,                    *
 * Scryn, Rennard, Swordbearer, Gorog, Grishnakh and Tricops                *
 * ------------------------------------------------------------------------ *
 * Merc 2.1 Diku Mud improvments copyright (C) 1992, 1993 by Michael        *
 * Chastain, Michael Quan, and Mitchell Tse.                                *
 * ------------------------------------------------------------------------ *
 * Original Diku Mud copyright (C) 1990, 1991 by Sebastian Hammer,          *
 * Michael Seifert, Hans Henrik Staerfeldt, Tom Madsen, and Katja Nyboe.    *
 ****************************************************************************/

#ifndef _SWRIP_SHUTTLE_HPP_
#define _SWRIP_SHUTTLE_HPP_

#include <memory>
#include <list>
#include <vector>
#include <string>
#include "types.hpp"
#include "constants.hpp"

class ShuttleStop
{
public:
    std::string Name; /* Name of the Stop, ie 'Coruscant' or 'Monument Plaza' */
    vnum_t RoomVnum = INVALID_VNUM;
};

enum _ShuttleState
{
    SHUTTLE_STATE_LANDING,
    SHUTTLE_STATE_LANDED,
    SHUTTLE_STATE_TAKINGOFF,
    SHUTTLE_STATE_INSPACE,
    SHUTTLE_STATE_HYPERSPACE_LAUNCH,
    SHUTTLE_STATE_HYPERSPACE_END
};

/* ShuttleClass */
enum
{
    SHUTTLE_TURBOCAR, /* Pretty much the same as shuttle EDIT:: Changes messages to be appropriate to ground - Greven*/
    SHUTTLE_SPACE, /* Has some message about taking off and landing */
    SHUTTLE_HYPERSPACE
};

using ShuttleClass = int;

class Shuttle
{
public:
    Shuttle();
    virtual ~Shuttle();

    void Add(std::shared_ptr<ShuttleStop> stop);
    void Remove(std::shared_ptr<ShuttleStop> stop);
    const std::vector<std::shared_ptr<ShuttleStop>> &Stops() const;

    Room *InRoom = nullptr;

    std::shared_ptr<ShuttleStop> CurrentStop() const;
    int CurrentNumber = -1;

    int State = SHUTTLE_STATE_LANDED;

    ShuttleClass Type = SHUTTLE_TURBOCAR;

    std::string Name;

    /* Delay Between Stops */
    int Delay = 2;
    /* Actual time for delay.. */
    int CurrentDelay = 2;

    /* For echoing any messages */
    struct
    {
        vnum_t First = ROOM_VNUM_LIMBO;
        vnum_t Last = ROOM_VNUM_LIMBO;
        vnum_t Entrance = ROOM_VNUM_LIMBO;
    } Rooms;

private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

#ifndef MSL
#define MSL MAX_STRING_LENGTH
#endif

#ifndef MIL
#define MIL MAX_INPUT_LENGTH
#endif

/* Function prototypes */

void ShuttleUpdate();
std::shared_ptr<Shuttle> NewShuttle(const std::string &name);
bool ExtractShuttle(std::shared_ptr<Shuttle> shuttle);
bool InsertShuttle(std::shared_ptr<Shuttle> shuttle, Room *room);
void ShowShuttlesToCharacter(const std::list<std::shared_ptr<Shuttle>> &shuttles, const Character *ch);
std::shared_ptr<Shuttle> GetShuttleInRoom(const Room *room, const std::string &name);
std::shared_ptr<Shuttle> GetShuttleFromEntrance(vnum_t vnum);
std::shared_ptr<ShuttleStop> AllocateShuttleStop();

#endif
