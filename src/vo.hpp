#ifndef _SWRIP_VO_HPP_
#define _SWRIP_VO_HPP_

#include <memory>
#include "types.hpp"

struct Vo
{
    Vo() = default;

    Vo(nullptr_t)
    {

    }

    Vo(std::shared_ptr<Character> ch)
        : Ch(ch)
    {

    }

    Vo(std::shared_ptr<Object> obj)
        : Obj(obj)
    {

    }

    Vo(std::shared_ptr<class Room> room)
        : Room(room)
    {

    }

    Vo(std::shared_ptr<Character> ch, std::shared_ptr<Object> obj)
        : Ch(ch), Obj(obj)
    {

    }

    Vo(int *i)
        : IntPtr(i)
    {

    }

    bool IsNull() const
    {
        return Ch == nullptr
            && Obj == nullptr
            && Room == nullptr
            && IntPtr == nullptr;
    }

    std::shared_ptr<Character> Ch;
    std::shared_ptr<Object> Obj;
    std::shared_ptr<class Room> Room;
    int *IntPtr = nullptr;
};

#endif