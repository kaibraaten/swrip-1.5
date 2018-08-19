#include <utility/linkedlist.hpp>
#include "pcdata.hpp"
#include "mud.hpp"

struct PCData::Impl
{
  std::list<Alias*> Aliases;
};

PCData::PCData()
  : Comments(AllocateList()),
    pImpl(new Impl())
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
