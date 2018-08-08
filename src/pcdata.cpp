#include <utility/linkedlist.hpp>
#include "pcdata.hpp"
#include "mud.hpp"

PCData::PCData()
  : Comments(AllocateList())
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
  for(Alias *alias : Aliases)
    {
      FreeAlias(alias);
    }
}

