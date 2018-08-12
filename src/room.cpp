#include "room.hpp"
#include "ship.hpp"
#include "shuttle.hpp"

struct Room::Impl
{
  std::list<Ship*> Ships;
  std::list<Shuttle*> Shuttles;
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

void Room::Add(Shuttle *shuttle)
{
  pImpl->Shuttles.push_back(shuttle);
  shuttle->InRoom = this;
}

void Room::Remove(Shuttle *shuttle)
{
  pImpl->Shuttles.remove(shuttle);
  shuttle->InRoom = nullptr;
}

const std::list<Shuttle*> &Room::Shuttles() const
{
  return pImpl->Shuttles;
}
