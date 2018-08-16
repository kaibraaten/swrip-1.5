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
  std::list<ExtraDescription*> ExtraDescriptions;
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

void Room::Add(ExtraDescription *extraDescription)
{
  pImpl->ExtraDescriptions.push_back(extraDescription);
}

void Room::Remove(ExtraDescription *extraDescription)
{
  pImpl->ExtraDescriptions.remove(extraDescription);
}

const std::list<ExtraDescription*> &Room::ExtraDescriptions() const
{
  return pImpl->ExtraDescriptions;
}

/////////////////////////////////////////////////////////
struct Room::MProg::Impl
{
  std::list<MPROG_ACT_LIST*> ActLists;
  std::list<MPROG_DATA*> MudProgs;
};

////////////////////////////////////////////////////////
Room::MProg::MProg()
  : pImpl(new Impl())
{

}

Room::MProg::~MProg()
{
  delete pImpl;
}

const std::list<MPROG_ACT_LIST*> &Room::MProg::ActLists() const
{
  return pImpl->ActLists;
}

void Room::MProg::Add(MPROG_ACT_LIST *mal)
{
  pImpl->ActLists.push_back(mal);
}

void Room::MProg::Remove(MPROG_ACT_LIST *mal)
{
  pImpl->ActLists.remove(mal);
}

const std::list<MPROG_DATA*> &Room::MProg::MudProgs() const
{
  return pImpl->MudProgs;
}

void Room::MProg::Add(MPROG_DATA *prog)
{
  pImpl->MudProgs.push_back(prog);
}

void Room::MProg::Remove(MPROG_DATA *prog)
{
  pImpl->MudProgs.remove(prog);
}

void Room::MProg::InsertBefore(size_t pos, MPROG_DATA *prog)
{
  size_t counter = 0;
  
  for(auto i = std::begin(pImpl->MudProgs); i != std::end(pImpl->MudProgs); ++i)
    {
      if(++counter == pos)
        {
          pImpl->MudProgs.insert(i, prog);
        }
    }
}
