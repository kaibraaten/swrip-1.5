#include <unordered_set>
#include <bitset>
#include <cassert>
#include <utility/algorithms.hpp>
#include "home.hpp"
#include "constants.hpp"
#include "room.hpp"

void Resident::GiveAllPermissions()
{
    Flags.set();
}

struct Home::Impl
{
    Impl(vnum_t room)
        : Room(room)
    {
        
    }
    
    vnum_t Room = INVALID_VNUM;
    std::unordered_set<std::shared_ptr<Resident>> Residents;
    std::string RoomName;
    std::string Description;
};

Home::Home(vnum_t room)
    : pImpl(std::make_unique<Impl>(room))
{
    ExtraRoomFlags.set(Flag::Room::Hotel);
}

Home::~Home()
{

}

std::string Home::Owner() const
{
    for(const auto &resident : pImpl->Residents)
    {
        if(resident->Flags.test(Flag::Resident::IsOwner))
        {
            return resident->Name;
        }
    }

    return "";
}

vnum_t Home::Vnum() const
{
    return pImpl->Room;
}

void Home::Add(std::shared_ptr<Resident> resident)
{
    pImpl->Residents.insert(resident);
}

void Home::RemoveResident(const std::string &name)
{
    for(const auto &resident : pImpl->Residents)
    {
        if(StrCmp(resident->Name, name) == 0)
        {
            pImpl->Residents.erase(resident);
            return;
        }
    }
}

std::string Home::RoomName() const
{
    return pImpl->RoomName;
}

void Home::RoomName(const std::string &name)
{
    pImpl->RoomName = name;
}

std::string Home::Description() const
{
    return pImpl->Description;
}

void Home::Description(const std::string &desc)
{
    pImpl->Description = desc;
}

std::list<std::shared_ptr<Resident>> Home::Residents() const
{
    std::list<std::shared_ptr<Resident>> residents;

    for(const auto &resident : pImpl->Residents)
    {
        residents.push_back(resident);
    }

    return residents;
}

bool Home::IsResident(const std::string &name) const
{
    return Find(pImpl->Residents,
                [name](const auto &r)
                {
                    return StrCmp(r->Name, name) == 0;
                }) != nullptr;
}

//////////////////////////////////////////////////////////
// Code related to homes, but not part of Home class.
#include "repos/homerepository.hpp"

bool OwnsHome(const std::string &name)
{
    for(auto home : Homes->FindHomesForResident(name))
    {
        if(StrCmp(home->Owner(), name) == 0)
        {
            return true;
        }
    }

    return false;
}
