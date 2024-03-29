#ifndef _SWRIP_VO_HPP_
#define _SWRIP_VO_HPP_

#include <memory>
#include "types.hpp"

class Object;
class Room;

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

    Vo(const std::string &txt)
        : Txt(txt)
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

    Vo(long i)
        : Integer(i)
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
    std::string Txt;
    long Integer = 0;
    int *IntPtr = nullptr;
};

#endif
