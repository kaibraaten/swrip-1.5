#include "room.hpp"
#include "ship.hpp"
#include "shuttle.hpp"
#include "mud.hpp"
#include "character.hpp"
#include "object.hpp"
#include "exit.hpp"

struct Room::Impl
{
  std::list<std::shared_ptr<Ship>> Ships;
  std::list<std::shared_ptr<Shuttle>> Shuttles;
  std::list<std::shared_ptr<Exit>> Exits;
  std::list<Character*> Characters;
  std::list<std::shared_ptr<Object>> Objects;
  std::list<std::shared_ptr<ExtraDescription>> ExtraDescriptions;
};

Room::Room()
  : pImpl(std::make_unique<Impl>())
{

}

Room::~Room()
{

}

void Room::Add(std::shared_ptr<Ship> ship)
{
  pImpl->Ships.push_back(ship);
}

void Room::Remove(std::shared_ptr<Ship> ship)
{
  pImpl->Ships.remove(ship);
}

const std::list<std::shared_ptr<Ship>> &Room::Ships() const
{
  return pImpl->Ships;
}

void Room::Add(std::shared_ptr<Shuttle> shuttle)
{
  pImpl->Shuttles.push_back(shuttle);
}

void Room::Remove(std::shared_ptr<Shuttle> shuttle)
{
  pImpl->Shuttles.remove(shuttle);
}

const std::list<std::shared_ptr<Shuttle>> &Room::Shuttles() const
{
  return pImpl->Shuttles;
}

void Room::Add(std::shared_ptr<Exit> xit)
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

void Room::Remove(std::shared_ptr<Exit> xit)
{
  pImpl->Exits.remove(xit);
}

const std::list<std::shared_ptr<Exit> > &Room::Exits() const
{
  return pImpl->Exits;
}

void Room::Add(Character *character)
{
  pImpl->Characters.push_back(character);
}

void Room::Remove(Character *character)
{
  pImpl->Characters.remove(character);
}

const std::list<Character*> &Room::Characters() const
{
  return pImpl->Characters;
}

void Room::Add(std::shared_ptr<Object> object)
{
  pImpl->Objects.push_back(object);
}

void Room::Remove(std::shared_ptr<Object> object)
{
  pImpl->Objects.remove(object);
}

const std::list<std::shared_ptr<Object>> &Room::Objects() const
{
  return pImpl->Objects;
}

void Room::Add(std::shared_ptr<ExtraDescription> extraDescription)
{
  pImpl->ExtraDescriptions.push_back(extraDescription);
}

void Room::Remove(std::shared_ptr<ExtraDescription> extraDescription)
{
  pImpl->ExtraDescriptions.remove(extraDescription);
}

const std::list<std::shared_ptr<ExtraDescription>> &Room::ExtraDescriptions() const
{
  return pImpl->ExtraDescriptions;
}
