#include "pcdata.hpp"
#include "mud.hpp"
#include "board.hpp"
#include "alias.hpp"

struct PCData::Impl
{
  std::list<Alias*> Aliases;
  std::list<std::shared_ptr<class Note>> Comments;
};

PCData::PCData()
  : pImpl(std::make_unique<Impl>())
{
  Condition.fill(0);
  Condition[COND_THIRST]  = 48;
  Condition[COND_FULL]    = 48;
  Condition[COND_BLOODTHIRST] = 10;

  Learned.fill(0);

  Addiction.fill(0);
  DrugLevel.fill(0);
}

PCData::~PCData()
{
  for(Alias *alias : Aliases())
    {
      FreeAlias(alias);
    }
}

const std::list<Alias*> &PCData::Aliases() const
{
  return pImpl->Aliases;
}

void PCData::Add(Alias *alias)
{
  pImpl->Aliases.push_back(alias);
}

void PCData::Remove(Alias *alias)
{
  pImpl->Aliases.remove(alias);
}

const std::list<std::shared_ptr<Note>> &PCData::Comments() const
{
  return pImpl->Comments;
}

void PCData::Add(std::shared_ptr<class Note> comment)
{
  pImpl->Comments.push_back(comment);
}

void PCData::Remove(std::shared_ptr<class Note> comment)
{
  pImpl->Comments.remove(comment);
}
