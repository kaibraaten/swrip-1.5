#ifndef _SWRIP_BOUNTYREPOSITORY_HPP_
#define _SWRIP_BOUNTYREPOSITORY_HPP_

#include <memory>
#include <utility/repository.hpp>
#include "types.hpp"

class Bounty;

class BountyRepository : public Ceris::Repository<std::shared_ptr<Bounty>>
{
public:
    virtual void Load() = 0;
    virtual void Save() const = 0;
};

inline std::shared_ptr<BountyRepository> Bounties;
std::shared_ptr<BountyRepository> NewBountyRepository();

#endif
