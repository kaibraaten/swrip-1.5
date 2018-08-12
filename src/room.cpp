#include "room.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "mud.hpp"

struct Room::Impl
{
  std::list<Ship*> Ships;
  std::list<Shuttle*> Shuttles;
  std::list<Exit*> Exits;
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

void Room::Add(Exit *xit)
{
  pImpl->Exits.push_back(xit);
  pImpl->Exits.sort([](const auto x1, const auto x2)
                    {
                      return x1->Direction <= x2->Direction;
                    });
}

void Room::Remove(Exit *xit)
{
  pImpl->Exits.remove(xit);
}

const std::list<Exit*> &Room::Exits() const
{
  return pImpl->Exits;
}
