#include <cassert>
#include "playerrepository.hpp"
#include "character.hpp"

PlayerRepository *PlayerCharacters = nullptr;

class InMemoryPlayerRepository : public PlayerRepository
{
public:
  void Load() override;
  void Save() const override;
  void Save(const Character *pc) const override;

protected:
  void OnAdded(Character* &entity) override;
  void OnRemoved(Character* &entity) override;
};

void InMemoryPlayerRepository::Load()
{

}

void InMemoryPlayerRepository::Save() const
{

}

void InMemoryPlayerRepository::Save(const Character *pc) const
{

}

void InMemoryPlayerRepository::OnAdded(Character* &entity)
{
  assert(!IsNpc(entity));
}

void InMemoryPlayerRepository::OnRemoved(Character* &entity)
{

}

////////////////////////
PlayerRepository *NewPlayerRepository()
{
  return new InMemoryPlayerRepository();
}

