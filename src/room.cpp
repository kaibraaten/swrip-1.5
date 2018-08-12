#include "room.hpp"
#include "ship.hpp"

struct Room::Impl
{
  std::list<Ship*> Ships;
};

Room::Room()
  : pImpl(new Impl())
{

}

Room::~Room()
{
  delete pImpl;
}

void Room::Add(Ship *ship)
{
  pImpl->Ships.push_back(ship);
  ship->InRoom = this;
}

void Room::Remove(Ship *ship)
{
  pImpl->Ships.remove(ship);
  ship->InRoom = nullptr;
}

const std::list<Ship*> &Room::Ships() const
{
  return pImpl->Ships;
}
