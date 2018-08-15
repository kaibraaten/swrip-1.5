#include "room.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"

struct Room::Impl
{
  std::list<Ship*> Ships;
  std::list<Shuttle*> Shuttles;
  std::list<Exit*> Exits;
  std::list<Character*> Characters;
  std::list<Object*> Objects;
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
                      if(x1->Direction == x2->Direction)
                        {
                          return StrCmp(x1->Keyword, x2->Keyword) < 0;
                        }
                      else
                        {
                          return x1->Direction <= x2->Direction;
                        }
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

void Room::Add(Character *character)
{
  pImpl->Characters.push_back(character);
  character->InRoom = this;
}

void Room::Remove(Character *character)
{
  pImpl->Characters.remove(character);
  character->InRoom = nullptr;
}

const std::list<Character*> &Room::Characters() const
{
  return pImpl->Characters;
}

void Room::Add(Object *object)
{
  pImpl->Objects.push_back(object);
  object->InRoom = this;
}

void Room::Remove(Object *object)
{
  pImpl->Objects.remove(object);
  object->InRoom = nullptr;
}

const std::list<Object*> &Room::Objects() const
{
  return pImpl->Objects;
}
