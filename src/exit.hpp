#ifndef _SWRIP_EXIT_HPP_
#define _SWRIP_EXIT_HPP_

#include <memory>
#include <bitset>
#include <string>
#include "types.hpp"
#include "constants.hpp"

namespace Flag::Exit {
enum : size_t
{
    IsDoor,
    Closed,
    Locked,
    Secret,
    Swim,
    PickProof,
    Fly,
    Climb,
    Dig,
    _09,
    NoPassdoor,
    Hidden,
    Passage,
    Portal,
    _14,
    _15,
    CanClimb,
    CanEnter,
    CanLeave,
    Auto,
    _20,
    Searchable,
    Bashed,
    BashProof,
    NoMob,
    Window,
    CanLook,
    _27,
    _28,
    _29,
    _30,
    _31
};
}

class Exit
{
public:
    std::shared_ptr<Exit> ReverseExit;         /* Reverse exit pointer         */
    std::shared_ptr<Room> ToRoom;              /* Pointer to destination room  */
    std::string Keyword;                 /* Keywords for exit or door    */
    std::string Description;             /* Description of exit          */
    vnum_t Vnum = INVALID_VNUM;          /* Vnum of room exit leads to   */
    vnum_t ReverseVnum = INVALID_VNUM;   /* Vnum of room in opposite dir */
    std::bitset<Flag::MAX> Flags;        /* door states & other flags    */
    vnum_t Key = INVALID_VNUM;           /* Key vnum                     */
    DirectionType Direction = 0;         /* Physical "direction"         */
    short Distance = 0;                  /* how far to the next room     */
};

template<typename T>
bool CAN_GO(T thing, DirectionType door)
{
    return GetExit(thing->InRoom, door)
           && GetExit(thing->InRoom, door)->ToRoom != nullptr
           && !GetExit(thing->InRoom, door)->Flags.test(Flag::Exit::Closed);
}

#endif 
