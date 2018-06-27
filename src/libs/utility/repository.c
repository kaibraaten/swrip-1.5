#include <stdlib.h>
#include <assert.h>
#include "repository.h"
#include "repositorybase.h"

struct Repository
{
  struct RepositoryBase Base;
};

Repository *NewRepository(EntityLoader loadFunc, EntitySaver saveFunc)
{
  Repository *repo = (Repository*)calloc(1, sizeof(Repository));
  InitRepositoryBase(&repo->Base, loadFunc, saveFunc);

  return repo;
}

void AddEntity(Repository *self, void *entity)
{
  assert(self->Base.AddEntity != NULL);
  self->Base.AddEntity(&self->Base, entity);
}

void RemoveEntity(Repository *self, void *entity)
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

const LinkList *GetEntities(const Repository *self)
{
  assert(self->Base.GetEntities != NULL);
  return self->Base.GetEntities(&self->Base);
}

void SaveEntities(const Repository *self)
{
  assert(self->Base.SaveEntities != NULL);
  self->Base.SaveEntities((const Repository*)&self->Base);
}

void LoadEntities(Repository *self)
{
  assert(self->Base.LoadEntities != NULL);
  self->Base.LoadEntities((Repository*)&self->Base);
}
