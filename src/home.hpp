#ifndef _SWRIP_HOME_HPP_
#define _SWRIP_HOME_HPP_

#include <memory>
#include <string>
#include <list>
#include <bitset>
#include "types.hpp"
#include "constants.hpp"

namespace Flag
{
    namespace Resident
    {
        enum : size_t
        {
            IsOwner,
                CanDrop,
                CanGet,
                _03,
                _04,
                _05,
                _06,
                _07,
                _08,
                _09,
                _10,
                _11,
                _12,
                _13,
                _14,
                _15,
                _16,
                _17,
                _18,
                _19,
                _20,
                _21,
                _22,
                _23,
                _24,
                _25,
                _26,
                _27,
                _28,
                _29,
                _30,
                _31
        };
    }
}

struct Resident
{
    void GiveAllPermissions();
    std::string Name;
    std::bitset<Flag::MAX> Flags;
};

class Home
{
public:
    Home(vnum_t room);
    virtual ~Home();
    std::string Owner() const;
    vnum_t Vnum() const;
    std::string RoomName() const;
    void RoomName(const std::string &name);
    std::string Description() const;
    void Description(const std::string &desc);
    void Add(std::shared_ptr<Resident> resident);
    void RemoveResident(const std::string &name);
    std::list<std::shared_ptr<Resident>> Residents() const;
    bool IsResident(const std::string &name) const;
    std::bitset<Flag::MAX> ExtraRoomFlags;
    
private:
    struct Impl;
    std::unique_ptr<Impl> pImpl;
};

// Return true if this character owns a home.
// Return false if not, even if the character
// is non-owning resident in one or more homes.
bool OwnsHome(const std::string &name);

#endif
