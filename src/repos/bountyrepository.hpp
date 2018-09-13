#ifndef _SWRIP_BOUNTYREPOSITORY_HPP_
#define _SWRIP_BOUNTYREPOSITORY_HPP_

#include <utility/repository.hpp>
#include "types.hpp"

class BountyRepository : public Ceris::Repository<Bounty*>
{
public:
  virtual void Load() = 0;
  virtual void Save() const = 0;
};

extern BountyRepository *Bounties;
BountyRepository *NewBountyRepository();

#endif
