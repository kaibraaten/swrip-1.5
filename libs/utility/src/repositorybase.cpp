#include <cstdlib>
#include "repositorybase.hpp"

struct RepositoryBasePrivateData
{
    List *Entities;
};

static void DefaultAddEntity(RepositoryBase *self, void *entity);
static void DefaultRemoveEntity(RepositoryBase *self, void *entity);
static const List *DefaultGetEntities(const RepositoryBase *self);

void InitRepositoryBase(RepositoryBase *self,
                        EntityLoader loadFunc,
                        EntitySaver saveFunc)
{
    self->_data = (RepositoryBasePrivateData *)calloc(1, sizeof(struct RepositoryBasePrivateData));
    self->_data->Entities = AllocateList();
    self->AddEntity = DefaultAddEntity;
    self->RemoveEntity = DefaultRemoveEntity;
    self->GetEntities = DefaultGetEntities;
    self->LoadEntities = loadFunc;
    self->SaveEntities = saveFunc;
}

static void DefaultAddEntity(RepositoryBase *self, void *entity)
{
    AddToList(self->_data->Entities, entity);
}

static void DefaultRemoveEntity(RepositoryBase *self, void *entity)
{
    RemoveFromList(self->_data->Entities, entity);
}

static const List *DefaultGetEntities(const RepositoryBase *self)
{
    return self->_data->Entities;
}
