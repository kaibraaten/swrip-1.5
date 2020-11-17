#include <cstdlib>
#include <cassert>
#include "oldrepository.hpp"
#include "repositorybase.hpp"

struct OldRepository
{
    RepositoryBase Base;
};

OldRepository *NewRepository(EntityLoader loadFunc, EntitySaver saveFunc)
{
    OldRepository *repo = (OldRepository *)calloc(1, sizeof(OldRepository));
    InitRepositoryBase(&repo->Base, loadFunc, saveFunc);

    return repo;
}

void AddEntity(OldRepository *self, void *entity)
{
    assert(self->Base.AddEntity != nullptr);
    self->Base.AddEntity(&self->Base, entity);
}

void RemoveEntity(OldRepository *self, void *entity)
{
#ifndef NDEBUG
    size_t countBeforeRemove = ListSize(GetEntities(self));
    assert(self->Base.RemoveEntity != nullptr);
#endif

    self->Base.RemoveEntity(&self->Base, entity);

#ifndef NDEBUG
    size_t countAfterRemove = ListSize(GetEntities(self));
    assert(countAfterRemove == countBeforeRemove - 1);
#endif
}

const List *GetEntities(const OldRepository *self)
{
    assert(self->Base.GetEntities != nullptr);
    return self->Base.GetEntities(&self->Base);
}

void SaveEntities(const OldRepository *self)
{
    assert(self->Base.SaveEntities != nullptr);
    self->Base.SaveEntities((const OldRepository *)&self->Base);
}

void LoadEntities(OldRepository *self)
{
    assert(self->Base.LoadEntities != nullptr);
    self->Base.LoadEntities((OldRepository *)&self->Base);
}
