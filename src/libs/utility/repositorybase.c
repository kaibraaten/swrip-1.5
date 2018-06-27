#include <stdlib.h>
#include "repositorybase.h"

struct RepositoryBasePrivateData
{
  LinkList *Entities;
};

static void DefaultAddEntity(struct RepositoryBase *self, void *entity);
static void DefaultRemoveEntity(struct RepositoryBase *self, void *entity);
static const LinkList *DefaultGetEntities(const struct RepositoryBase *self);

void InitRepositoryBase(struct RepositoryBase *self,
                        EntityLoader loadFunc,
                        EntitySaver saveFunc)
{
  self->_data = (struct RepositoryBasePrivateData*)calloc(1, sizeof(struct RepositoryBasePrivateData));
  self->_data->Entities = AllocateLinkList();
  self->AddEntity = DefaultAddEntity;
  self->RemoveEntity = DefaultRemoveEntity;
  self->GetEntities = DefaultGetEntities;
  self->LoadEntities = loadFunc;
  self->SaveEntities = saveFunc;
}

static void DefaultAddEntity(struct RepositoryBase *self, void *entity)
{
  AddToBack(self->_data->Entities, entity);
}

static void DefaultRemoveEntity(struct RepositoryBase *self, void *entity)
{
  RemoveFromList(self->_data->Entities, entity);
}

static const LinkList *DefaultGetEntities(const struct RepositoryBase *self)
{
  return self->_data->Entities;
}
