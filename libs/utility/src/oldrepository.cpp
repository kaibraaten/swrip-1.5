#include <cstdlib>
#include <cassert>
#include "oldrepository.hpp"
#include "repositorybase.hpp"

struct OldRepository
{
  struct RepositoryBase Base;
};

OldRepository *NewRepository(EntityLoader loadFunc, EntitySaver saveFunc)
{
  OldRepository *repo = (OldRepository*)calloc(1, sizeof(OldRepository));
  InitRepositoryBase(&repo->Base, loadFunc, saveFunc);

  return repo;
}

void AddEntity(OldRepository *self, void *entity)
{
  assert(self->Base.AddEntity != NULL);
  self->Base.AddEntity(&self->Base, entity);
}

void RemoveEntity(OldRepository *self, void *entity)
{
#ifndef NDEBUG
  size_t countBeforeRemove = ListSize(GetEntities(self));
  size_t countAfterRemove = 0;
  assert(self->Base.RemoveEntity != NULL);
#endif

  self->Base.RemoveEntity(&self->Base, entity);

#ifndef NDEBUG
  countAfterRemove = ListSize(GetEntities(self));
  assert(countAfterRemove == countBeforeRemove - 1);
#endif
}

const List *GetEntities(const OldRepository *self)
{
  assert(self->Base.GetEntities != NULL);
  return self->Base.GetEntities(&self->Base);
}

void SaveEntities(const OldRepository *self)
{
  assert(self->Base.SaveEntities != NULL);
  self->Base.SaveEntities((const OldRepository*)&self->Base);
}

void LoadEntities(OldRepository *self)
{
  assert(self->Base.LoadEntities != NULL);
  self->Base.LoadEntities((OldRepository*)&self->Base);
}
